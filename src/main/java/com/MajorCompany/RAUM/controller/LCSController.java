package com.MajorCompany.RAUM.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.LCSDao;
import com.MajorCompany.RAUM.dto.LCS.DTOAddress;
import com.MajorCompany.RAUM.dto.LCS.DTOCart;
import com.MajorCompany.RAUM.dto.LCS.DTOPayment;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct;
import com.MajorCompany.RAUM.dto.LCS.DTOUser;

@Controller
public class LCSController {
	
//	HttpServletRequest request, Model model
//	LCSDao dao = sqlSession.getMapper(LCSDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("EMAIL") != null) {
			session.invalidate();
		}
		return "redirect:home.do";
	}
	
//	@RequestMapping("/check.do") // 이메일 중복체크
//	public String check(HttpServletRequest request) {
//		LCSDao dao = sqlSession.getMapper(LCSDao.class);
//		
//		String email = request.getParameter("email");
//		String found = dao.test(email);
//		DTOUser dto;
//		if(found == null || found.equals("")) {
//			dto = new DTOUser(email, "사용 가능한 이메일 입니다.", "사용하기");
//		} else {
//			dto = new DTOUser(null, "이미 사용중인 이메일 입니다.", "사용하기");
//		}
//		request.setAttribute("check_email", dto);
//		
//		return "LoginForm/emailCheckPro";
//	}
	
	@RequestMapping("/findId.do") // 아이디찾기
	public String findId(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		String returnView = null;
		
		String userName = request.getParameter("name");
		String phone1 = request.getParameter("tel1");
		String phone2 = request.getParameter("tel2");
		String phone3 = request.getParameter("tel3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		int result = dao.findId(userName, phone);

		if(result == 1) returnView = "redirect:login.do";
		else returnView = "ViewPage/FindId";
		
		return returnView;
	}
	
	@RequestMapping("/findPw.do") // 비밀번호찾기
	public String findPw(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		String returnView = null;
		
		String email = request.getParameter("email");
		String userName = request.getParameter("name");
		String phone1 = request.getParameter("tel1");
		String phone2 = request.getParameter("tel2");
		String phone3 = request.getParameter("tel3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		int result = dao.findPw(email, userName, phone);

		if(result == 1) returnView = "redirect:login.do";
		else returnView = "ViewPage/Findpw";
		
		return returnView;
	}

	@RequestMapping("/cart.do")
	public String cart(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		ArrayList<DTOCart> dtos = dao.listCart(seq);
		ArrayList<DTOProduct> dtosProduct = dao.getProductInfo(seq);
		request.setAttribute("cartList", dtos);		
		request.setAttribute("productInfo", dtosProduct);
		
		return "ViewPage/Cart";
	}

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/deleteFromCart.do")
	public String deleteFromCart(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		String sequences = request.getParameter("sequences");
		String[] sequence = sequences.split(",");
		
		for(int i = 0; i < sequence.length; i++) {
			dao.deleteFromCart(sequence[i], seq);
		}
		
		return "deleteCart";
	}

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/rentThis.do")
	public String rentThis(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		String sequence = request.getParameter("sequence");
		
		DTOPayment dto = dao.rentThis(sequence);
		DTOAddress addressDto = dao.getAddressDto(seq);
		request.setAttribute("Payment", dto);
		request.setAttribute("Address", addressDto);
		request.setAttribute("SEQ", sequence);
		
		return "redirect:checkout.do";
	}
	
}
