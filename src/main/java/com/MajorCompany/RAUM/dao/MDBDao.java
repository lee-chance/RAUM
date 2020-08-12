package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.MajorCompany.RAUM.dto.LCS.DTOPayment;
import com.MajorCompany.RAUM.dto.MDB.AdminProduct;
import com.MajorCompany.RAUM.dto.MDB.AdminQA;
import com.MajorCompany.RAUM.dto.MDB.AdminQAlist;
import com.MajorCompany.RAUM.dto.MDB.AdminUserList;
import com.MajorCompany.RAUM.dto.MDB.Checkout;
import com.MajorCompany.RAUM.dto.MDB.CompletePayment;

public interface MDBDao {
	
	public void Paymentwrite(String User_seq, String Rent_seq, @Param("dto") Checkout checkout);
	public void Deposit( String account, String accountName);
	public void PaymentStatus();
	public CompletePayment contentView2(String seq);		//결제완료창 불러오기
	public DTOPayment contentView(String seq);		//상품 정보 가져오기
	
	
	
	public ArrayList<AdminUserList> getUserList();		//관리자 유저 리스트
	public ArrayList<AdminProduct> getProductList();	//관리자 상품목록
	public ArrayList<AdminQAlist> getQAList();	//관리자 QA목록 리스트
	public void QAStatusdelete(String seq);	//관리자 QAStatus 목록 삭제
	public void QAdelete(String seq);	//QA테이블의 목록삭제
	public AdminQA content(int seq); 	//QA답변 불러오기
	public void writeAnswer(int seq, String answer);	//QA등록
	public void writeAnswerseq(int seq);	//QA등록
	
}
