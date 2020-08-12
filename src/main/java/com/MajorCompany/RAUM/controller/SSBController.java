package com.MajorCompany.RAUM.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.MajorCompany.RAUM.dao.SKHDao;
import com.MajorCompany.RAUM.dao.SSBDao;
import com.MajorCompany.RAUM.dto.SSB.CheckOutInfoDto;
import com.MajorCompany.RAUM.dto.SSB.NoticeDto;
import com.MajorCompany.RAUM.dto.SSB.NoticeQDto;
import com.MajorCompany.RAUM.dto.SSB.ProductDto;
import com.MajorCompany.RAUM.dto.SSB.ReviewDto;
import com.MajorCompany.RAUM.dto.SSB.UserDto;
import com.MajorCompany.RAUM.dto.SSB.paymentList;
import com.MajorCompany.RAUM.dto.SSB.userlist;

@Controller
public class SSBController {

	@Autowired
	private SqlSession sqlSession;

	//////////////////////////////
	// //
	// 로그인/회원가입 //
	// //
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

		if (result == 1 || result == 2) {
			HttpSession session = request.getSession();
			session.setAttribute("EMAIL", userId);
			session.setAttribute("NICKNAME", userInfo.getNickname());
			session.setAttribute("USER_SEQ", userInfo.getSeq());
		}

		switch (result) {
		case -1: // No ID
			request.setAttribute("LOGIN_ERROR", -1);
			returnPage = "ViewPage/Login";
			break;
		case 0: // Wrong PW
			request.setAttribute("LOGIN_ERROR", 0);
			returnPage = "ViewPage/Login";
			break;
		case 1: // Login as customer
			returnPage = "redirect:home.do";
			break;
		case 2: // Login as Admin
			returnPage = "redirect:admin.do";
			break;
		}

		return returnPage;
	}

	//////////////////////////////
	// //
	// 고객센터 //
	// //
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
		dao.QAWrite(User_seq, Integer.parseInt(request.getParameter("category")), request.getParameter("title"),
				request.getParameter("content")); // QA 작성

		int QA_seq = dao.QALastRow(); // QA의 마지막 행 가져오기
		dao.QAStatusWrite(QA_seq, 1);

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

	//////////////////////////////
	// //
	// 리뷰 //
	// //
	//////////////////////////////

	@RequestMapping("/reviewList.do") // 고객센터
	public String reviewList(Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		model.addAttribute("reviewList", dao.ReviewList());

		return ("ViewPage/ReviewList");
	}

	@RequestMapping("/review_content_view.do") // 리뷰 클릭 액션
	public String reviewContent(HttpServletRequest request, Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		dao.UpdateViews(Integer.parseInt(request.getParameter("seq")));

		ReviewDto reviewDto = dao.ReviewContent(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("review_content_view", reviewDto);

		return ("ViewPage/ReviewContent");
	}

	@RequestMapping("/review_write.do") // 리뷰 작성할때 상품정보 가져오기
	public String productInfo(HttpServletRequest request, Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);

		ProductDto productDto = dao.productInfo(Integer.parseInt(request.getParameter("seq")));
//		ProductDto productDto = dao.productInfo(1);
		model.addAttribute("review_write", productDto);

		return ("ViewPage/writeReview");
	}

	@RequestMapping("/writeReview.do")
	public String requestupload1(MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {

		// 파일 업로드
		// String src = mtfRequest.getParameter("src");
		// System.out.println("src value : " + src);
		MultipartFile mf = mtfRequest.getFile("file");

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/image/";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈
		// System.out.println("originFileName : " + originFileName);
		// System.out.println("fileSize : " + fileSize);

		String safeFile = root_path + attach_path + originFileName;
		// System.out.println(safeFile);

		// System.out.println("safeFile : " + safeFile);
		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		SSBDao dao = sqlSession.getMapper(SSBDao.class);

		HttpSession session = request.getSession();
		int User_seq = Integer.parseInt(session.getAttribute("USER_SEQ").toString());
		
		dao.WriteReview(User_seq, Integer.parseInt(request.getParameter("seq")), request.getParameter("title"), request.getParameter("content")); // Insert
																												// Review

		int Review_seq = dao.ReviewLastRow(); // Review의 마지막 행 가져오기

		dao.InsertReviewViews(Review_seq, 0); // Insert ReviewViews
		dao.InsertReviewImage(Review_seq, originFileName); // Insert ReviewImage

		return "redirect:reviewList.do";
	}

	//////////////////////////////
	//						    //
	//			 관리자		    //
	//						    //
	//////////////////////////////

	@RequestMapping("/adminCheckoutList.do") // 관리자페이지 결제리스트불러오기
	public String adminCheckoutList(Model model) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		model.addAttribute("checkoutList", dao.AdminCehckOutList());

		return ("ViewPage/CheckoutList");
	}

	@RequestMapping("/adminCheckoutInfo.do") // 관리자페이지 결제상세정보
	public String adminCheckoutInfo(Model model, HttpServletRequest request) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);

		CheckOutInfoDto checkOutInfoDto = dao.AdminCehckOutInfo(Integer.parseInt(request.getParameter("seq")));
		model.addAttribute("CHECKOUT_DATA", checkOutInfoDto);

		return ("ViewPage/CheckoutInfo");
	}

	@RequestMapping("/statusAction.do") // 관리자페이지 결제상태변경액션
	public String statusAction(Model model, HttpServletRequest request) {
		SSBDao dao = sqlSession.getMapper(SSBDao.class);

		int paymentstatusref_seq = Integer.parseInt(request.getParameter("status"));
		int payment_seq = Integer.parseInt(request.getParameter("seq"));

		dao.UpdateCheckOutStatus(paymentstatusref_seq, payment_seq);

		return ("redirect:adminCheckoutList.do");
	}

	//////////////////////////////////
	//						    	//
	//			 마이페이지		    //
	//						   		//
	//////////////////////////////////

//	@RequestMapping("/orderList.do")
//	public String orderlilst(HttpServletRequest request, Model model) {
//		SKHDao dao = sqlSession.getMapper(SKHDao.class);
//		HttpSession session = request.getSession();
//		String seq = session.getAttribute("USER_SEQ").toString();
//
//		userlist user = dao.listDao(seq);
//		model.addAttribute("list2", user);
//		ArrayList<paymentList> dtos = dao.orderlistDao(seq);
//		model.addAttribute("orderList2", dtos);
//
//		for (int i = 0; i < dtos.size(); i++) {
//			String checked = dtos.get(i).getChecked();
//			String status = dtos.get(i).getStatus();
//			if (checked.equals("1")) {
//				status = dtos.get(i).getStatus();
//				status = null;
//			} else if (checked.equals("2")) {
//				status = "후기작성";
//				model.addAttribute("status", status);
//			}
//		}
//
//		return ("MyPage/Mypage");
//	}
	
	@RequestMapping("/searchProductList.do")
	public String SearchProductList(HttpServletRequest request) {
		String page = "";
		SSBDao dao = sqlSession.getMapper(SSBDao.class);
		
		String search = request.getParameter("search");
		
		if(dao.searchProduct(search).size() == 0) {
			page = "ViewPage/NotFoundProduct";
		} else {
			request.setAttribute("searchProductList", dao.searchProduct(search));
			page = "ViewPage/SearchProductList";
		}
		
		
		return (page);
	}

}
