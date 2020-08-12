package com.MajorCompany.RAUM.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.MajorCompany.RAUM.dao.FTP;
import com.MajorCompany.RAUM.dao.LCSDao;
import com.MajorCompany.RAUM.dto.LCS.DTOAddress;
import com.MajorCompany.RAUM.dto.LCS.DTOCart;
import com.MajorCompany.RAUM.dto.LCS.DTOPayment;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct2;
import com.MajorCompany.RAUM.dto.LCS.DTOProductDetail;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class LCSController {
	
	ArrayList<DTOCart> cartDtos;
	ArrayList<DTOPayment> paymentDtos;
	ArrayList<DTOAddress> addressDto;
	DTOCart cartDto;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("EMAIL") != null) {
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

		if (result == 1)
			returnView = "redirect:login.do";
		else
			returnView = "ViewPage/FindId";

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

		if (result == 1)
			returnView = "redirect:login.do";
		else
			returnView = "ViewPage/Findpw";

		return returnView;
	}

	@RequestMapping("/cart.do")
	public String cart(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();

		cartDtos = dao.listCart(seq);
		ArrayList<DTOProduct> dtosProduct = dao.getProductInfo(seq);
		request.setAttribute("cartList", cartDtos);
		request.setAttribute("productInfo", dtosProduct);

		return "ViewPage/Cart";
	}

	@RequestMapping("/deleteFromCart.do")
	public String deleteFromCart(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);

		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();

		String sequences = request.getParameter("sequences");
		String[] sequence = sequences.split(",");

		for (int i = 0; i < sequence.length; i++) {
			dao.deleteFromCart(cartDtos.get(Integer.parseInt(sequence[i])-1).getSeq());
		}

		return "deleteCart";
	}

	@RequestMapping("/cartToOrder.do")
	public String cartToOrder(HttpServletRequest request) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		String checkedLists = request.getParameter("checkedLists");
		
		paymentDtos = new ArrayList<DTOPayment>();
		String[] checkedList = checkedLists.split(",");
		for(int i = 0; i < checkedList.length; i++) {
			paymentDtos.add(dao.rentThis(cartDtos.get(Integer.parseInt(checkedList[i])-1).getSeq()));
		}
		
		request.setAttribute("Product", paymentDtos);
		
		return "redirect:checkout.do";
	}

	@RequestMapping("/rentThis.do")
	public String rentThis(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		String sequence = request.getParameter("sequence");
		
		paymentDtos = new ArrayList<DTOPayment>();
		paymentDtos.add(dao.rentThis(sequence));
		addressDto = dao.getAddressDto(seq);
//		request.setAttribute("SEQ", sequence);

		return "redirect:checkout.do";
	}
	
	@RequestMapping("/checkout.do")
	public String list(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		HttpSession session = request.getSession();
		String seq = session.getAttribute("USER_SEQ").toString();
		
		dao.addRent(seq);
		request.setAttribute("Product", paymentDtos);
		request.setAttribute("Address", addressDto);
		request.setAttribute("rentSeq", dao.getRentSeq(seq));
		return "CheckoutPage/Payment";
	}
	
	@RequestMapping("/addProduct.do")
	public String addProduct() {
		return "ViewPage/AddProduct";
	}
	
	@RequestMapping("/actionAddProduct.do")
	public String actionAddProduct(MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		MultipartFile mf = mtfRequest.getFile("productImage");

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/image/";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈
		// System.out.println("originFileName : " + originFileName);
		// System.out.println("fileSize : " + fileSize);

		String saveFile = root_path + attach_path + originFileName;
		// System.out.println(safeFile);

		// System.out.println("safeFile : " + safeFile);
		try {
			mf.transferTo(new File(saveFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String pCategory = request.getParameter("category");
		String pName = request.getParameter("productName");
		String pPrice = request.getParameter("productPrice");
		String pContent = request.getParameter("productInformation");
//		File pImageFile = request.getFile("productImage");
//		String pImage = null;
		
		ArrayList<String> pStocks = new ArrayList<String>();
		for(int i=230; i<=300; i+=5) {
			pStocks.add(request.getParameter("productStock"+i));
		}
		
		FTP mFTP = new FTP();
//		pImage = mFTP.getImageName(pName, pPrice, pImageFile); // ftp이미지 등록후 이름 불러오기
		dao.addItem(pCategory, pName, pPrice); // 상품등록
		dao.addImage(originFileName); // 이미지추가
		dao.addInformation(pContent); // 정보추가
		int pSize = 230;
		for (int i = 0; i < pStocks.size(); i++) {
			pSize =+ 5;
			dao.addStocks(pSize, pStocks.get(i)); // 상품재고추가
		}
		
		return "ViewPage/AddProduct";
	}
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/actionAddProduct.do")
//	public String actionAddProduct(HttpServletRequest request, Model model) {
//		LCSDao dao = sqlSession.getMapper(LCSDao.class);
//		
//		String root_path = request.getSession().getServletContext().getRealPath("/");
//		String attach_path = "resources/image/";
//		String savePath = root_path + attach_path;
//
//		
//		int sizeLimit = 10 * 1024 * 1024;
//		
//		MultipartRequest multi = null;
//		
//		try {
//			multi = new MultipartRequest(request, savePath, sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
//		String pCategory = multi.getParameter("category");
//		String pName = multi.getParameter("productName");
//		String pPrice = multi.getParameter("productPrice");
//		String pContent = "testtestesetset";
//		File pImageFile = multi.getFile("productImage");
//		String pImage = null;
//		
//		ArrayList<String> pStocks = new ArrayList<String>();
//		for(int i=230; i<=300; i+=5) {
//			pStocks.add(multi.getParameter("productStock"+i));
//		}
//		
//		FTP mFTP = new FTP();
//		pImage = mFTP.getImageName(pName, pPrice, pImageFile); // ftp이미지 등록후 이름 불러오기
//		dao.addItem(pCategory, pName, pPrice); // 상품등록
//		dao.addImage(pImage); // 이미지추가
//		dao.addInformation(pContent); // 정보추가
//		int pSize = 230;
//		for (int i = 0; i < pStocks.size(); i++) {
//			pSize =+ 5;
//			dao.addStocks(pSize, pStocks.get(i)); // 상품재고추가
//		}
//		
//		return "ViewPage/AddProduct";
//	}
	
	@RequestMapping("/MainProductList.do")
	public String MainProductList(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		
		ArrayList<DTOProduct2> dto = dao.getProductList();
		request.setAttribute("productList", dto);
		
		return "ViewPage/MainProductList";
	}
	
	@RequestMapping("/MainProductDetail.do")
	public String MainProductDetail(HttpServletRequest request, Model model) {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		String pSeq = request.getParameter("pSeq");

		DTOProductDetail dto = dao.getProductDetail(pSeq);
		request.setAttribute("productDetail", dto);
		return "ViewPage/MainProductDetail";
	}
	
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "redirect:orderList.do";
	}
	
	@RequestMapping("/cartOrCheckout")
	public String cartOrCheckout(HttpServletRequest request) {
		String returnView = null;
		String coc = request.getParameter("coc");
		
		HttpSession session = request.getSession();
		String user_seq = session.getAttribute("USER_SEQ").toString();
		String product_seq = request.getParameter("product_num");
		String size = request.getParameter("size");
		String qty = request.getParameter("qty");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		String rentDay = request.getParameter("rental_days");
		cartDto = new DTOCart(user_seq, product_seq, size, qty, startDate, endDate, rentDay);

		if(coc.equals("장바구니")){
		//장바구니
		returnView = "redirect:addCart.do";
		} else{
		//바로결제
		returnView = "redirect:rentalAction.do";
		}
		
		return returnView;
	}
	
	@RequestMapping("/addCart.do")
	public String addCart() {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		
		dao.addCart(cartDto);
		
		return "redirect:cart.do";
	}
	
	@RequestMapping("/rentalAction.do")
	public String rentalAction() {
		LCSDao dao = sqlSession.getMapper(LCSDao.class);
		
		dao.addCart(cartDto);

		paymentDtos = new ArrayList<DTOPayment>();
		paymentDtos.add(dao.rent(cartDto.getUser_seq()));
		addressDto = dao.getAddressDto(cartDto.getUser_seq());
		
		return "redirect:checkout.do";
	}
	
	@RequestMapping("/errors")
	public String errors() {
		return "error";
	}
	
}
