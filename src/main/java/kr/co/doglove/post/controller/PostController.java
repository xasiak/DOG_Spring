package kr.co.doglove.post.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import kr.co.doglove.post.service.PostService;

@Controller
public class PostController {
	
	@Autowired
	private PostService service;
	
	@RequestMapping(value="post/post.do", method=RequestMethod.GET)
	public String showPostDetail(
			@RequestParam("postNo") int postNo
			,Model model) {
		try {
			Post post = service.selectOneByNo(postNo);
			if(post != null) {
				model.addAttribute("post", post);
				return "post/post";
			}else {
				model.addAttribute("msg", "데이터가 존재하지 않습니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
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
	
	@RequestMapping(value="/post/insert.do", method=RequestMethod.GET)
	public String showInsertForm() {
		return "post/insert";
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
	
	@RequestMapping(value="/post/delete.do", method=RequestMethod.GET)
	public String deletePost(@RequestParam("postNo") int postNo
			,Model model) {
		try {
			int result = service.deletePost(postNo);
			if(result > 0) {
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
	
	@RequestMapping(value="/post/insert.do", method=RequestMethod.POST)
	public String insertPost(
			@ModelAttribute Post post
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request  // 파일 경로 가져오기 위해서 추가
			, Model model) {
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
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
				String savePath = saveFolder + "\\" + fileName;
				File file = new File(savePath);
				// ********** 파일 저장 **********
				uploadFile.transferTo(file);
				
				// ========== 파일 크기 ==========
				long fileLength = uploadFile.getSize();
				
				// DB에 저장하기 위해 Post에 데이터를 Set하는 부분임.
				post.setPostFileName(fileName);
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

	@RequestMapping(value="/post/update.do", method=RequestMethod.GET)
	public String updatePostView(@RequestParam("postNo") int postNo
			, Model model) {
		try {
			Post post = service.selectOneByNo(postNo);
			if(post != null) {
				model.addAttribute("post", post);
				System.out.println(post.toString());
				return "post/update";
			}else {
				model.addAttribute("msg", "데이터 조회에 실패하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="/post/update.do", method=RequestMethod.POST)
	public String updatePost(
			@RequestParam("postNo") int postNo
			, @ModelAttribute Post post
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, RedirectAttributes redirect
			, HttpServletRequest request  // 파일 경로 가져오기 위해서 추가
			, Model model) {
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
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
				String savePath = saveFolder + "\\" + fileName;
				File file = new File(savePath);
				// ********** 파일 저장 **********
				uploadFile.transferTo(file);
				
				// ========== 파일 크기 ==========
				long fileLength = uploadFile.getSize();
				
				// DB에 저장하기 위해 Post에 데이터를 Set하는 부분임.
				post.setPostFileName(fileName);
				post.setPostFilePath(savePath);
				post.setPostFileLength(fileLength);
			}
			int result = service.updatePost(post);
			if(result > 0) {
				redirect.addAttribute("postNo", postNo);
				return "redirect:/post/post.do";
			}else {
				model.addAttribute("msg", "게시물 수정에 실패하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
