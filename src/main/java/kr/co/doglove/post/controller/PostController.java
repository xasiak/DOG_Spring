package kr.co.doglove.post.controller;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.doglove.post.domain.PageInfo;
import kr.co.doglove.post.domain.Post;
import kr.co.doglove.post.domain.PostImg;
import kr.co.doglove.post.domain.Reply;
import kr.co.doglove.post.service.PostService;
import kr.co.doglove.post.service.ReplyService;

@Controller
public class PostController {
	
	@Autowired
	private PostService service;
	
	@Autowired
	private ReplyService rService;
	
	@RequestMapping(value="post/post.do", method=RequestMethod.GET)
	public String showPostDetail(
			@RequestParam("postNo") Integer postNo
			,Model model) {
		try {
			Post post = service.selectOneByNo(postNo);
//			String writer = post.getPostWriter();
//			int idx = writer.indexOf("@");
//			String writerfront = writer.substring(0, idx);	
			if(post != null) {
				Post postView = new Post(postNo, 0);
				int result = service.updateViewCount(postView);
				if(result > 0) {
					List<Reply> replyList = rService.selectReplyList(postNo);
					if(replyList.size() > 0) {
						model.addAttribute("rList", replyList);
					}
//					String writer = post.getPostWriter();
//					int idx = writer.indexOf("@");
//					String writerfront = writer.substring(0, idx);
//					model.addAttribute("writer", writerfront);
					model.addAttribute("post", post);	
					return "post/post";
				}else {
					model.addAttribute("msg", "게시글 조회가 완료되지 않았습니다2.");
					model.addAttribute("error", "게시글 상세 조회 실패");
					model.addAttribute("url", "/post/postlist.do");
					return "common/errorPage";
				}
			} else {
				model.addAttribute("msg", "게시글 조회가 완료되지 않았습니다2.");
				model.addAttribute("error", "게시글 상세 조회 실패");
				model.addAttribute("url", "/post/postlist.do");
				return "common/errorPage";
			}
//			int Hit = post.getViewCount();
//			Hit += 1;
//			Post postView = new Post(postNo, 0);
//			int result = service.updateViewCount(postView);
//			if(result > 0) {
//				Post post = service.selectOneByNo(postNo);
//				String writer = post.getPostWriter();
//				int idx = writer.indexOf("@");
//				String writerfront = writer.substring(0, idx);
//				List<Reply> replyList = rService.selectReplyList(postNo);
//				if(post != null && replyList.size() > 0) {
//					model.addAttribute("rList", replyList);
//					model.addAttribute("writer", writerfront);
//					model.addAttribute("post", post);
//					return "post/post";
//				}else {
//					model.addAttribute("msg", "DATA 조회가 완료되지 않았습니다!.");
//					model.addAttribute("error", "댓글 조회 실패");
//					model.addAttribute("url", "/index.jsp");
//					return "common/errorPage";
//				}
//			}else {
//				model.addAttribute("msg", "조회 증가가 완료되지 않았습니다.");
//				model.addAttribute("error", "조회 증가 실패");
//				model.addAttribute("url", "/index.jsp");
//				return "common/errorPage";
//			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	
	@RequestMapping (value="/post/postlist.do", method=RequestMethod.GET)
	public String showPostList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,Model model) {
		try {
			int totalCount = service.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<Post> pList = service.selectPostList(pInfo);
			if(pList.size() > 0) {
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("pList", pList);
				return "post/postlist";
			}else {
				model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
				model.addAttribute("error", "공지사항 목록 조회 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="/post/insert.do", method=RequestMethod.GET)
	public String showInsertForm(
			HttpSession session
			, Model model) {
		String memberEmail = (String)session.getAttribute("memberEmail");
		if(memberEmail != null){
			return "post/insert";
		}else {
			model.addAttribute("msg", "로그인해주세요");
			model.addAttribute("url", "/post/postlist.jsp");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="/post/update.do", method=RequestMethod.GET)
	public String showPostUpdate(
			@RequestParam("postNo") int postNo
			, Model model) {
			Post post = service.selectOneByNo(postNo);
				model.addAttribute("post", post);
				System.out.println(post.toString());
				return "post/update";
	}

	@RequestMapping(value="/post/insert.do", method=RequestMethod.POST)
	public String insertPost(
			@ModelAttribute Post post
			, @ModelAttribute PostImg postImg
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request  // 파일 경로 가져오기 위해서 추가
			, Model model) {
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// ========== 파일 이름 ==========
				Map<String, Object> nMap = this.saveFile(uploadFile, request);
				String fileName = (String)nMap.get("fileName");
				String fileRename = (String)nMap.get("fileRename");
				String savePath = (String)nMap.get("filePath");
				long fileLength = (long)nMap.get("fileLength");  // infoMap 키 값이랑 맞춰줘야함
				
				// DB에 저장하기 위해 Post에 데이터를 Set하는 부분임.
				post.setPostFileName(fileName);
				post.setPostFileRename(fileRename);
				post.setPostFilePath(savePath);
				post.setPostFileLength(fileLength);
			}
			int result = service.insertPost(post);
			if(result > 0) {
				return "redirect:/post/postlist.do";
			}else {
				model.addAttribute("msg", "공지사항 등록이 완료되지 않았습니다.");
				model.addAttribute("error", "공지사항 등록 실패");
				model.addAttribute("url", "/post/insert.do");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/post/insert.do");
			return "common/errorPage";
		}
		
	}

	@RequestMapping(value="/post/update.do", method=RequestMethod.POST)
		public String updatePost(
				@ModelAttribute Post post
				, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
	//			, RedirectAttributes redirect
				, HttpServletRequest request  // 파일 경로 가져오기 위해서 추가
				, Model model) {
			try {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					// 수정
					// 1. 대체, 2. 삭제 후 등록
					// 기존 업로드 된 파일 존재 여부 체크 후
					String fileName = post.getPostFileRename();
					if(fileName != null) {
						// 있으면 기존 파일 삭제
						this.deleteFile(request, fileName);
					}
					// 없으면 새로 업로드 하려는 파일 저장
					Map<String, Object> infoMap = this.saveFile(uploadFile, request);
					// 변수 차이
					String noticeFileName = (String)infoMap.get("fileName");
					long noticeFileLength = (long)infoMap.get("fileLength");
					post.setPostFileName(noticeFileName);
					post.setPostFileRename((String)infoMap.get("fileRename"));
					post.setPostFilePath((String)infoMap.get("filePath"));
					post.setPostFileLength(noticeFileLength);
				}
				int result = service.updatePost(post);
				if(result > 0) {
					return "redirect:/post/post.do?postNo="+post.getPostNo();
				}else {
					model.addAttribute("msg", "게시물 수정에 실패하였습니다.");
					model.addAttribute("error", "게시물 수정 실패");
					model.addAttribute("url", "/index.jsp");
					return "common/errorPage";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}

	@RequestMapping(value="/post/delete.do", method=RequestMethod.GET)
	public String deletePost(
			@RequestParam("postNo") int postNo
			, HttpServletRequest request  // 파일 경로 가져오기 위해서 추가
			,Model model) {
		try {
//			System.out.println(post.toString());
			Post post = service.selectOneByNo(postNo);
			int result = service.deletePost(postNo);
			if(result > 0) {
				this.deleteFile(request, post.getPostFileRename());
				return "redirect:/post/postlist.do";
			}else {
				model.addAttribute("msg", "게시물 삭제에 실패하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	@RequestMapping(value="/post/search.do", method=RequestMethod.GET)
	public String searchPostList(
			@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = service.getListCount(paramMap);
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Post> searchList = service.searchPostByKeyword(pInfo, paramMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pInfo", pInfo);
			model.addAttribute("sList", searchList);
			return "post/search";
		}else {
			model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
			model.addAttribute("error", "공지사항 제목으로 조회 실패");
			model.addAttribute("url", "/post/postlist.do");
			return "common/errorPage";
		}
	}

	public PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 8;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage + 0.9);
		// Math.ceil((double)totalCount/recordCountPerPage)
		// currentPage값이 1~5일때 startNavi가 1로 고정되도록 구해주는 식
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		// endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최댓값보다 커질 수 있음.
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
		return pi;
	}
	
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception, IOException {
			// 넘겨야 하는 값이 여러개일 때 사용하는 방법
			// 1. VO 클래스를 만드는 방법
			// 2. HashMap을 사용하는 방법
			Map<String, Object> infoMap = new HashMap<String, Object>();
			
			// ========== 파일 이름 ==========
			String fileName = uploadFile.getOriginalFilename();
			// (내가 저장한 후 그 경로를 DB에 저장하도록 준비하는 것)
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 폴더가 없을 경우 자동 생성(내가 업로드할 파일을 저장할 폴더)
			String saveFolder = root + "\\nuploadFiles";
			File folder = new File(saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// ========== 파일 경로 ==========
			// 랜덤 리네임
	//		Random rand = new Random();
	//		String strResult = "N";
	//		for(int i = 0; i < 7; i++) {
	//			int result = rand.nextInt(20)+1;
	//			strResult += result+"";
	//		}
			
			// 날짜 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");	// 나중에 SS랑 비교
			String strResult = sdf.format(new Date(System.currentTimeMillis()));
			
			String ext = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자명 자르기 // .을 포함하지 않고 자름 (+1)
			String fileRename = "N"+strResult+"."+ext;
			String savePath = saveFolder + "\\" + fileRename;
			File file = new File(savePath);
			// ********** 파일 저장 **********
			uploadFile.transferTo(file); 
			
			// ========== 파일 크기 ==========
			long fileLength = uploadFile.getSize();
			// 파일이름, 경로, 크기를 넘겨주기 위해 Map에 정보를 저장한 후 return함
			// 왜 return하는가? DB에 저장하기 위해서 필요한 정보니까!!
			infoMap.put("fileName", fileName);
			infoMap.put("fileRename", fileRename);
			infoMap.put("filePath", savePath);
			infoMap.put("fileLength", fileLength);
			return infoMap;
			
		}

	private void deleteFile(HttpServletRequest request, String fileName) {
		// D:\\springworksapce\\BaeSpringMVC\\src\\main\\webapp\\resources 대체
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilePath = root+"\\nuploadFiles\\"+fileName;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
	}
}
