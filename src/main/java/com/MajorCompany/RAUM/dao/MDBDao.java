package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.MajorCompany.RAUM.dto.MDB.AdminProduct;
import com.MajorCompany.RAUM.dto.MDB.AdminUserList;
import com.MajorCompany.RAUM.dto.MDB.Checkout;
import com.MajorCompany.RAUM.dto.MDB.CompletePayment;
import com.MajorCompany.RAUM.dto.MDB.Product;

public interface MDBDao {
	
	public void Paymentwrite(String User_seq, String Rent_seq, @Param("dto") Checkout checkout);
	public CompletePayment contentView2(String seq);		//결제완료창 불러오기
	public Product contentView(String seq);		//상품 정보 가져오기
	public ArrayList<AdminUserList> getUserList();		//관리자 유저 리스트
	public ArrayList<AdminProduct> getProductList();	//관리자 상품목록
	
}
