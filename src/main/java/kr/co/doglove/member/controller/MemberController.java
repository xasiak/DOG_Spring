package kr.co.doglove.member.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.doglove.member.domain.Member;
import kr.co.doglove.member.service.MemberService;

@Controller
@SessionAttributes("memberEmail")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String showRegisterView() {
		return "member/register";
	}

	@RequestMapping(value="/member/terms.do", method=RequestMethod.GET)
	public String showTermsView() {
		return "member/terms";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String showLoginView() {
		return "member/login";
	}

	@RequestMapping(value="/member/myPage.do", method=RequestMethod.GET)
	public String showUpdateView(
			@RequestParam("member-email") String memberEmail
			, Model model) {
		try {
			Member member = service.selectOneByEmail(memberEmail);
			if(member != null) {
				model.addAttribute("member", member);
				return "member/myPage";
			}else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	

	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public String UpdateMember(
			@RequestParam("member-email") String memberEmail
			, @RequestParam("member-pw") String memberPw
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-phone") String memberPhone
			, RedirectAttributes redirect
			, Model model) {
		try {
			Member member = new Member(memberEmail, memberPw, memberName, memberPhone);
			int result = service.updateMember(member);
			if(result > 0) {
				System.out.println(memberEmail);
				redirect.addAttribute("member-email", memberEmail);
				return "redirect:/member/myPage.do";
			}else {
				model.addAttribute("msg", "정보수정이 완료되지 않았습니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
	@RequestMapping(value = "/member/emailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam("member-email") String memberEmail) {
	    int emailCheckResult = service.EmailCheck(memberEmail);
	    if (emailCheckResult > 0) {
	        return "alreadyTaken";
	    } else {
	        return "available";
	    }
	}

	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public String registerMember(
			@RequestParam("member-email") String memberEmail
			, @RequestParam("member-pw") String memberPw
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-phone") String memberPhone
			, Model model) {
		try {
			Member member = new Member(memberEmail, memberPw, memberName, memberPhone);
			int result = service.registerMember(member);
			if(result > 0) {
				model.addAttribute("msg", "회원가입에 성공하였습니다");
				return "common/serviceSuccess";
			}else {
				model.addAttribute("msg", "회원가입에 실패하였습니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}

	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam("member-email") String memberEmail
			, @RequestParam("member-pw") String memberPw
			, Model model) {
		try {
			Member member = new Member(memberEmail, memberPw);
			Member mOne = service.selectCheckLogin(member);
			if(mOne != null) {
				model.addAttribute("memberEmail",  mOne.getMemberEmail());
				model.addAttribute("msg", "로그인에 성공하였습니다");
				return "redirect:/index.jsp";
			}else {
				model.addAttribute("msg", "존재하지 않는 회원 정보입니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}

	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String memberLogout(
			SessionStatus session
			, Model model) {
		if(session != null) {
			session.setComplete();
			return "redirect:/index.jsp";
		}else {
			model.addAttribute("msg", "로그아웃에 실패하였습니다.");
			return "common/serviceFailed";
		}
	}

	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public String removeMember(
			@RequestParam("memberEmail") String memberEmail
			, Model model) {
		try {
			int result = service.deleteMember(memberEmail);
			if(result > 0 ) {
				return "redirect:/index.jsp";
			}else {
				model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/serviceFailed";
		}
	}
	
}
