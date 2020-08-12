package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.SKH.myReview;
import com.MajorCompany.RAUM.dto.SKH.paymentList;
import com.MajorCompany.RAUM.dto.SKH.qaSelect;
import com.MajorCompany.RAUM.dto.SKH.userlist;

public interface SKHDao {
	
	public userlist listDao(String seq); // 회원 정보 출력
	
	public ArrayList<paymentList> orderlistDao(String seq); // 주문 내역 출력
	
	public void updateUser(String phone, String nickname, String seq); // 회원 정보 수정
	public void updateAddress(String address, String seq); // 회원 주소 수정
	
	public ArrayList<qaSelect> qaSelect(String seq); // 문의 내역 출력
	public ArrayList<qaSelect> qaDetail(String seq); // 문의 내역 상세 내용 출력
	
	public ArrayList<myReview> reviewSelect(String seq); // 리뷰 출력
	public ArrayList<myReview> reviewDetail(String seq); // 리뷰 상세 내역 출력
	
	public void memberBye(String seq);			// 파라미터로 가져온 email값으로 login의 status값을 '0'으로 변환
}
