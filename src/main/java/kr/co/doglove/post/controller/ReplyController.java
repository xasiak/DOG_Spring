package kr.co.doglove.post.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doglove.post.domain.Reply;
import kr.co.doglove.post.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService rService;
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("memberEmail");
			if(replyWriter != null && !replyWriter.equals("")) {
				reply.setReplyWriter(replyWriter);
				int result = rService.insertReply(reply);
				url = "/post/post.do?postNo="+reply.getRefPostNo();
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
					mv.addObject("error", "댓글 등록 실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
			}else {
				mv.addObject("msg", "로그인이 되지 않았습니다.");
				mv.addObject("error", "로그인 정보확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("memberEmail");
			if(replyWriter != null && !replyWriter.equals("")) {
				reply.setReplyWriter(replyWriter);
				url = "/post/post.do?postNo="+reply.getRefPostNo();
				int result = rService.updateReply(reply);
				mv.setViewName("redirect:"+url);
			}else {
				mv.addObject("msg", "로그인이 되지 않았습니다.");
				mv.addObject("error", "로그인 정보확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String memberEmail = (String)session.getAttribute("memberEmail");
			String replyWriter = reply.getReplyWriter();
			System.out.println(reply.toString());
			System.out.println(memberEmail);
			url = "/post/post.do?postNo="+reply.getRefPostNo();
			if(replyWriter != null && replyWriter.equals(memberEmail)) {
				int result = rService.deleteReply(reply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "로그인이 되지 않았습니다.");
					mv.addObject("error", "로그인 정보확인 실패");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/errorPage");
				}
			}else {
				mv.addObject("msg", "자신의 댓글만 삭제할 수 있습니다.");
				mv.addObject("error", "댓글삭제 불가");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}








