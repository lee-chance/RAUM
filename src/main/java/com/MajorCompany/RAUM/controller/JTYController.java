package com.MajorCompany.RAUM.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.JTYDao;
import com.MajorCompany.RAUM.dto.JTY.JTYDto;


@Controller
public class JTYController {
	
	@Autowired
	private SqlSession sqlSession;

	//UserID/Signup/SignupAgreement
	
	//회원가입- 개인정보 동의
	@RequestMapping("/SignupAgreement.do")
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
}
