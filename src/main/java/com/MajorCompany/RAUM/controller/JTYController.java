package com.MajorCompany.RAUM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.JTYDao;
import com.MajorCompany.RAUM.dto.JTY.JTYDto;
import com.MajorCompany.RAUM.dto.JTY.JTYFAQDto;
import com.MajorCompany.RAUM.dto.JTY.JTYNoticeDto;


@Controller
public class JTYController {
	
	@Autowired
	private SqlSession sqlSession;

	//UserID/Signup/SignupAgreement
	
	//회원가입- 개인정보 동의
	@RequestMapping("/signup.do")
	public String SignupAgreement() {
		return ("ViewPage/Signup");
	}
	//회원가입- 회원가입 양식
	@RequestMapping("/SignupForm.do")
	public String SignupForm() { //Model이 jsp에 값을 준다.
		
		return ("ViewPage/Signup2");

	}
	//회원가입- 이메일 중복 검색 화면
	@RequestMapping("/EmailchkForm.do")
	public String EmailchkForm() {
		return ("UserID/Signup/EmailchkForm");
	}
	//회원가입- 이메일 중복 검사 화면
	@RequestMapping("/EmailChk.do")
	public String EmailChk (HttpServletRequest request) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		String email = request.getParameter("email");
		System.out.println("request.email");
		String found = dao.checkEmailDao(email);
		String checkMsg =null;
		String useEmail = null;
		System.out.println("useEmail");
		JTYDto dto;
		System.out.println("JTYDto");
		if(found == null || found.equals("")) {
			
			checkMsg = "사용 가능한 이메일 입니다.";
		    useEmail = "사용하기";
		    dto = new JTYDto(email, checkMsg, useEmail);
		}else {
			checkMsg = "이미 사용중인 이메일 입니다.";
		    useEmail = "사용하기";
		    dto = new JTYDto(null, checkMsg, useEmail);
		}
		request.setAttribute("check_email", dto);
		
		return ("UserID/Signup/EmailChk");
	}
	
	//회원가입- 완료화면
	@RequestMapping("/SignupDone.do")
	public String SignupDone(HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		String phone = request.getParameter("ph1") + "-" + request.getParameter("ph2") + "-" + request.getParameter("ph3");
		String birthday = request.getParameter("birth1") + "-" + request.getParameter("birth2") + "-" + request.getParameter("birth3");
		String address = request.getParameter("sample6_postcode") + "_" + request.getParameter("sample6_address") + "_" + request.getParameter("sample6_detailAddress");
		dao.inserLoginDao(request.getParameter("email"), request.getParameter("password"));
		dao.insertUserDao(request.getParameter("nickname"), phone, birthday);
		dao.insertAddressDao(address);
		dao.checkEmailDao(request.getParameter("email"));
		
		return("ViewPage/SignupSuccess");
	}
	
	
		//////////////////////////////
		//						    //
		//		 관리자- 공지사항 		//
		//						    //
		//////////////////////////////

	//관리자- 공지사항 초기화면
//	@RequestMapping("/admin.do")
//	public String admin (Model model) {
//		return ("ViewPage/UserList");
//	}
	//관리자-	 공지사항 리스트
	@RequestMapping("/write_notice.do") //공지사항 초기화면
	public String wirte_notice (Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		model.addAttribute("list", dao.NoticeListContent());
		return ("ViewPage/NoticeList");
	}
	
	//관리자- 공지사항 글 입력 jsp 이동
	@RequestMapping("/notice_write_view.do")
	public String write_view (HttpServletRequest request) {
		return ("ViewPage/NoticeListWrite");
	}
	
	//관리자- 공지사항 글 입력
	@RequestMapping("/notice_write.do")
	public String noticeWrite (HttpServletRequest request) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		dao.noticeWriteDao(seq, request.getParameter("title"), request.getParameter("content"));
		return "redirect:write_notice.do";
	}
	//관리자- 공지사항 수정페이지
	@RequestMapping("/notice_content_view.do")
	public String notice_content_view (HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		JTYNoticeDto contentDto = dao.noticeDao(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("notice_content_view", contentDto);
		return ("ViewPage/NoticeListUpdate");
	}


	//관리자- 공지사항 글 수정 메소드
	@RequestMapping("/notice_update.do")
	public String notice_update (HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		dao.updateNoticeDao(request.getParameter("title"), request.getParameter("content"), Integer.parseInt(request.getParameter("seq")));
		return ("redirect:write_notice.do");
	}
	
	////관리자- 공지사항 글 삭제
	@RequestMapping("/notice_delete.do")
	public String delete (HttpServletRequest request) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		dao.deleteDao(Integer.parseInt(request.getParameter("seq")));
		return ("redirect:write_notice.do");
	}
	
		//////////////////////////////
		//						    //
		//		 관리자- FAQ	 		//
		//						    //
		//////////////////////////////
	
	
	//관리자FAQ- 초기화면
	@RequestMapping("/write_FAQ.do")
	public String FAQ_List (Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		model.addAttribute("qna", dao.FAQListContent());
		return ("ViewPage/FAQList");
	}
	//관리자FAQ- 작성 화면
	@RequestMapping("/FAQ_write_view.do")
	public String FAQ_writeView () {
		return ("/ViewPage/FAQListWrite");
	}
	//관리자FAQ- 작성 메소드
	@RequestMapping("/FAQ_write.do")
	public String FAQ_write (HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		dao.noticeQDao(request.getParameter("title"), request.getParameter("content"), request.getParameter("type"));
		return ("redirect:write_FAQ.do");
	}
	//관리자FAQ- 수정 화면
	@RequestMapping("/FAQ_content_view.do")
	public String FAQload (HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		JTYFAQDto FAQDao = dao.faqloaddao(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("FAQ_content_view", FAQDao);
		return ("ViewPage/FAQListUpdate");
	}	
	//관리자FAQ- 수정 메소드
	@RequestMapping("/FAQ_update.do")
	public String UpdateFAQ (HttpServletRequest request, Model model) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		dao.updateFAQDao(request.getParameter("title"), request.getParameter("content"),request.getParameter("type") ,Integer.parseInt(request.getParameter("seq")));
		return ("redirect:write_FAQ.do");
	}
	//관리자FAQ- 글 삭제 메소드
	@RequestMapping("/FAQ_delete.do")
	public String DeleteFAQ(HttpServletRequest request) {
		JTYDao dao = sqlSession.getMapper(JTYDao.class);
		dao.deleteFAQDao(Integer.parseInt(request.getParameter("seq")));
		return ("redirect:write_FAQ.do");
	
	}
}//-----------
