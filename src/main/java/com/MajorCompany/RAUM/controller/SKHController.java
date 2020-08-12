package com.MajorCompany.RAUM.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.SKHDao;
import com.MajorCompany.RAUM.dto.SKH.myReview;
import com.MajorCompany.RAUM.dto.SKH.paymentList;
import com.MajorCompany.RAUM.dto.SKH.qaSelect;
import com.MajorCompany.RAUM.dto.SKH.userlist;

@Controller
public class SKHController {
	
	@Autowired
	private SqlSession sqlSession;
	
// 회원 정보 관리
	@RequestMapping("/userInfo.do")		// 회원 정보 불러오기
	public String userInfo(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		userlist dto = dao.listDao(seq);
		String phone = dto.getPhone();
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(4, 8);
		String phone3 = phone.substring(9, 13);
		String address = dto.getAddress();
		String[] address_array = address.split("_");
		String postcode = address_array[0];
		String partaddress = address_array[1];
		String detailaddress = address_array[2];
		
		model.addAttribute("list", dto);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		model.addAttribute("postcode", postcode);
		model.addAttribute("partaddress", partaddress);
		model.addAttribute("detailaddress", detailaddress);
		return ("ViewPage/UserInfo");
	}
	
	@RequestMapping("/memberInfoManagement2.do") // 회원 정보 수정하는 페이지로 이동하기
	public String userUpdateStart() {
		return ("ViewPage/UpdateUser");
	}
	
	
	@RequestMapping("/memberInfoManagement.do") // 회원 정보 수정하기
	public String userUpdateAction(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		String nickname = request.getParameter("nickname");
		
		String address1 = request.getParameter("postcode1");
		String address2 = request.getParameter("partaddress2");
		String address3 = request.getParameter("detailaddress3");
		
		String address = address1 + "_" + address2 +"_"+ address3;
		
		session.setAttribute("NICKNAME", nickname);
		
		dao.updateUser(phone, nickname, seq);
		dao.updateAddress(address, seq);
		return ("redirect:userInfo.do");
	}
	
	
	@RequestMapping("/orderList.do")		// 회원이 주문한 주문내역 불러오기
	public String orderlilst(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list2", user);
		ArrayList<paymentList> dtos = dao.orderlistDao(seq);
		model.addAttribute("orderList2", dtos);
		
		for(int i = 0; i < dtos.size(); i++) {
			String checked = dtos.get(i).getChecked();
			String status = dtos.get(i).getStatus();
			if(checked.equals("1")) {
				status = dtos.get(i).getStatus();
				status = null;
			} else if (checked.equals("2")) {
				status = "후기작성";
				model.addAttribute("status", status);
			}
		}
		
		return ("MyPage/Mypage");
	}
	
	@RequestMapping("/counSeling.do") 			// 회원의 1:1 상담내역 불러오기
	public String qaSelect1(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list", user);
		ArrayList<qaSelect> dto = dao.qaSelect(seq);
		model.addAttribute("Qnalist", dto);
		
		return ("ViewPage/cs");
	}
	
	@RequestMapping("counSelingDetail.do")		// 회원이 1:1 상담내역에서 선택한 것 관련 상세내역 불러오기
	public String qaDetailStart(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		String seq2 = request.getParameter("seq");
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list2", user);
		ArrayList<qaSelect> dtos = dao.qaDetail(seq2);
		model.addAttribute("list", dtos);
		
		return ("ViewPage/viewCounseling");
	}
	
	@RequestMapping("/myReview.do")		// 회원이 등록한 리뷰 불러오기
	public String myReview1(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list2", user);
		ArrayList<myReview> dtos = dao.reviewSelect(seq);
		model.addAttribute("list", dtos);
		
		return ("ViewPage/myReview");
	}
	
	@RequestMapping("reviewListDetail.do")		// 회원이 등록한 리뷰 중 선택한 리뷰의 상세내역 불러오기
	public String myReviewDetail(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		String seq2 = request.getParameter("seq");
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list2", user);
		ArrayList<myReview> dtos = dao.reviewDetail(seq2);
		model.addAttribute("list", dtos);
		
		return ("ViewPage/ReviewDetail");
	}
	
	@RequestMapping("/memberOut.do")			// 회원 탈퇴 시작 페이지로 이동
	public String memberoutStart(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		userlist user = dao.listDao(seq);
		model.addAttribute("list", user);
		
		return ("ViewPage/memberOut");
	}
	
	@RequestMapping("/memberOutEnd.do")			// 회원 탈퇴 (비밀번호 맞는지 확인 후) 실제로 탈퇴한다고 하면 회원 탈퇴 진행
	public String memberoutEnd(HttpServletRequest request, Model model) {
		SKHDao dao = sqlSession.getMapper(SKHDao.class);
		String seq = request.getParameter("email");

		dao.memberBye(seq);
		
		return ("redirect:userInfo.do");
	}

}
