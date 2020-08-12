package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.LCS.DTOAddress;
import com.MajorCompany.RAUM.dto.LCS.DTOCart;
import com.MajorCompany.RAUM.dto.LCS.DTOPayment;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct2;
import com.MajorCompany.RAUM.dto.LCS.DTOProductDetail;

public interface LCSDao {
	
	public String test(String email); //중복확인 하기 위해 입력한 이메일
	
	public int findId(String userName, String phone); // 아이디찾기
	
	public int findPw(String email, String userName, String phone); // 비밀번호찾기
	
	public ArrayList<DTOCart> listCart(String seq); // 장바구니 리스트 불러오기
	
	public ArrayList<DTOProduct> getProductInfo(String seq); // 장바귄에 표시할 상품 정보

	public DTOPayment rentThis(String sequence); // 바로결제용 DTO불러오기

	public ArrayList<DTOAddress> getAddressDto(String seq); // 유저 주소록 불러오기

	public void addItem(String pName, String pPrice, String pImage); // 상품등록

	public void addImage(String pImage); // 상품 이미지 등록

	public void addStocks(int pSize, String pQty); // 상품 재고 추가

	public void addInformation(String pContent); // 상품 정보 추가

	public void deleteFromCart(String sequence); // 장바구니 삭제

	public ArrayList<DTOProduct2> getProductList(); // 전체 상품리스트 불러오기

	public DTOProductDetail getProductDetail(String pSeq); // 상품정보상세보기

	public void addCart(DTOCart cartDto); // 장바구니 추가

	public void addRent(String user_seq); // 대여리스트 추가

	public DTOPayment rent(String user_seq); // 상품정보 -> 바로결제

	public String getRentSeq(String seq); // 렌트 시퀀스 가져오기
	
}
