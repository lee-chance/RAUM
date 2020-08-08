package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.LCS.DTOCart;
import com.MajorCompany.RAUM.dto.LCS.DTOProduct;

public interface LCSDao {
	
	public String test(String email); //중복확인 하기 위해 입력한 이메일
	
	public int findId(String userName, String phone); // 아이디찾기
	
	public int findPw(String email, String userName, String phone); // 비밀번호찾기
	
	public ArrayList<DTOCart> listCart(String seq); // 장바구니 리스트 불러오기
	
	public ArrayList<DTOProduct> getProductInfo(String seq); // 장바귄에 표시할 상품 정보

}
