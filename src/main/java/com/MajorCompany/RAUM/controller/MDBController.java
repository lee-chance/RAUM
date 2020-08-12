package com.MajorCompany.RAUM.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MajorCompany.RAUM.dao.MDBDao;
import com.MajorCompany.RAUM.dto.MDB.AdminQA;
import com.MajorCompany.RAUM.dto.MDB.Checkout;
import com.MajorCompany.RAUM.dto.MDB.CompletePayment;
import com.MajorCompany.RAUM.dto.MDB.Deposit;

@Controller
public class MDBController {
	
	@Autowired
	private SqlSession sqlSession;
	

	//결제페이지 입력하는부분
	@RequestMapping("/write.do")
	public String write(HttpServletRequest request, Model model) {
		
		String receive_method = request.getParameter("suryeong");
		String return_method = request.getParameter("bannab");
		String address = request.getParameter("sample6_postcode") + "_" + request.getParameter("sample6_address") + "_" + request.getParameter("sample6_detailAddress");
		String name = request.getParameter("rname");
		
		
		String accountName1 = request.getParameter("return_bank") + " _ " + request.getParameter("return_bankNumber");
		
		
		String payment_method = request.getParameter("p_method1");
		String optional = request.getParameter("optional");
//		String accountName = request.getParameter("p_name");
		String phone = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
		
		String total_payment = request.getParameter("ppbo_money");
		if(payment_method.equals("카드")) {
			total_payment = request.getParameter("money3");
		} else {
			total_payment = request.getParameter("ppbo_money");
		}
		
		
		
		Checkout checkout = new Checkout(name, address, phone, total_payment, receive_method, return_method, accountName1, payment_method, optional);

		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		HttpSession session = request.getSession();
		dao.Paymentwrite(session.getAttribute("USER_SEQ").toString() ,request.getParameter("Rent_seq"), checkout );
		
		//Deposit입력   
		String accountName = request.getParameter("return_name");
		String account = request.getParameter("return_bankNumber");
		
		
		dao.Deposit(account, accountName);
		dao.PaymentStatus();
		
		return "CheckoutPage/CompletePaymentview";
	}
	
	
	
	
	
	
	
	
	//결제 완료 불러오기
	@RequestMapping("/CompletePayment.do")
	public String CompletePament(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		HttpSession session = request.getSession();
		CompletePayment CompletePayment = dao.contentView2(session.getAttribute("USER_SEQ").toString());
		model.addAttribute("CompletePayment", CompletePayment);
		
		return "CheckoutPage/CompletePayment";
	}
	
	
	
	//관리자페이지
	@RequestMapping("/admin.do")
	public String admin(HttpServletRequest request, Model model) {
//		System.out.println("admin");
		return "redirect:adminUserList.do";
	}
	
	//유저리스트
	@RequestMapping("/adminUserList.do")
	public String mypage(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		model.addAttribute("userList", dao.getUserList());
		
		return "ViewPage/UserList";
	}
	
	
	//상품 리스트
	@RequestMapping("/adminProductList.do")
	public String adminProductList(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		model.addAttribute("productList", dao.getProductList());
		
		return "ViewPage/ProductList";
	}
	
	// 관리자페이지 문의내역 불러오기
	@RequestMapping("/adminQAList.do")
	public String adminQAList(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		model.addAttribute("admin_qna", dao.getQAList());
		
		return "ViewPage/AdminQAList";
	}
	
	//관리자페이지 문의내역 삭제 
	@RequestMapping("/admin_qna_delete.do")
	public String admin_qna_delete(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		dao.QAStatusdelete((request.getParameter("seq")));
		dao.QAdelete(request.getParameter("seq"));

		return "redirect:adminQAList.do";
	}
	
	//관리자페이지 문의내역 불러오기
	@RequestMapping("/admin_qna_content.do")
	public String admin_qna_content(HttpServletRequest request, Model model) {
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		AdminQA adminQA = dao.content(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("admin_qna_content_view", adminQA);

		
		return "ViewPage/AdminQAContent";
	}
	


	//관리자페이지 문의내역 올리기 
	@RequestMapping("/admin_qna_update.do")
	public String admin_qna_update(HttpServletRequest request, Model model) {
		
		System.out.println("admin_qna_update");
		
		MDBDao dao = sqlSession.getMapper(MDBDao.class);
		dao.writeAnswer(Integer.parseInt(request.getParameter("seq")), (request.getParameter("answer")));
		dao.writeAnswerseq(Integer.parseInt(request.getParameter("seq")));

		
		return "redirect:adminQAList.do";
	}
	
	
}
