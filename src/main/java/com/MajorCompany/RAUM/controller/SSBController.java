package com.MajorCompany.RAUM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.SSBDao;
import com.MajorCompany.RAUM.dto.SSB.NoticeDto;
import com.MajorCompany.RAUM.dto.SSB.NoticeQDto;
import com.MajorCompany.RAUM.dto.SSB.UserDto;

@Controller
public class SSBController {

	@Autowired
	private SqlSession sqlSession;

	//////////////////////////////
	//						    //
	//		  로그인/회원가입		//
	//						    //
	//////////////////////////////
	@RequestMapping("/login.do") // 1대1문의 작성
	public String login() {
		
		return ("ViewPage/Login");
	}
	
	@RequestMapping("/actionLogin.do")
	public String actionLogin(HttpServletRequest request, Model model) {
		String returnPage = null;
		
		String userId = request.getParameter("id");
		String password = request.getParameter("password");

		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		String strPassword = dao.query(userId, password); 

		int result = -1; // 관리자 2, 고객 1, 비번틀림 0, 아이디없음 -1
		
		if (strPassword.equals(password) && userId.equals("test")) {
			result = 2; // 관리자
		} else if (strPassword.equals(password) && !userId.equals("test")) {
			result = 1; // 고객
		} else if (!strPassword.equals(password)) { // 비번 틀림
			result = 0;
		}
		
		UserDto userInfo = dao.getNickname(userId);
		
		if(result == 1 || result == 2) {
			HttpSession session = request.getSession();
			session.setAttribute("EMAIL", userId);
			session.setAttribute("NICKNAME", userInfo.getNickname());
			session.setAttribute("USER_SEQ", userInfo.getSeq());
		}

		switch (result) {
		case -1 : // No ID
			request.setAttribute("LOGIN_ERROR", -1);
			returnPage = "ViewPage/Login";
			break;
		case 0 : // Wrong PW
			request.setAttribute("LOGIN_ERROR", 0);
			returnPage = "ViewPage/Login";
			break;
		case 1 : // Login as customer
			returnPage = "redirect:home.do";
			break;
		case 2 : // Login as Admin
			returnPage = "redirect:admin.do";
			break;
		}
		
//		return returnPage;
		return "redirect:customerService.do";
	}
	
	
	//////////////////////////////
	//						    //
	//			 고객센터		    //
	//						    //
	//////////////////////////////
	
	@RequestMapping("/customerService.do") // 고객센터
	public String customerService(Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		model.addAttribute("qna_limit", dao.qnaListLimit());
		
		return ("CustomerService/Frame");
	}
	
	@RequestMapping("/noticeList.do") // 공지사항
	public String noticeList(Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		model.addAttribute("list", dao.NoticeList());
		
		return ("CustomerService/Notice");
	}
	
	@RequestMapping("/qna.do") // 자주 하는 질문
	public String qna(Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		model.addAttribute("qna", dao.qnaList());
		
		return ("CustomerService/QnA");
	}
	
	@RequestMapping("/writeCounseling.do") // 1대1문의 작성
	public String writeCounseling() {
		
		return ("CustomerService/WriteCounseling");
	}
	
	@RequestMapping("/writeCounselingAction.do") // 1대1 문의 작성 액션 
	public String writeCounselingAction(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int User_seq = Integer.parseInt(session.getAttribute("USER_SEQ").toString());
		
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		
		dao.QAWrite(User_seq, Integer.parseInt(request.getParameter("category")), request.getParameter("title"), request.getParameter("content"));
		
		// ----------------------
		// 마이페이지로 수정해야 됨 !!!!
		return ("redirect:customerService.do"); 
		// ---------------------- 
	}

	@RequestMapping("/content_view.do") // 공지사항 클릭 액션
	public String contentView(HttpServletRequest request, Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		NoticeDto noticeDto = dao.NoticeContent(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("content_view", noticeDto);
		
		return ("ViewPage/noticeContent");
	}
	
	@RequestMapping("/qna_content_view.do") // QnA 클릭 액션
	public String qnaContentView(HttpServletRequest request, Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		NoticeQDto noticeQDto = dao.QnaContent(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("qna_content_view", noticeQDto);
		
		return ("ViewPage/qnaContent");
	}
	
	
}
