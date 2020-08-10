package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.SSB.NoticeDto;
import com.MajorCompany.RAUM.dto.SSB.NoticeQDto;
import com.MajorCompany.RAUM.dto.SSB.ProductDto;
import com.MajorCompany.RAUM.dto.SSB.ReviewDto;
import com.MajorCompany.RAUM.dto.SSB.UserDto;

public interface SSBDao {
	
	// 로그인 
	public String query(String userId, String password); // 로그인
	public UserDto getNickname(String email); // 닉네임 찾기
	
	// 고객센터 
	public ArrayList<NoticeQDto> qnaListLimit(); //고객센터 메인 화면 
	public ArrayList<NoticeDto> NoticeList(); //공지사항 리스트
	public ArrayList<NoticeQDto> qnaList(); //FAQ 리스트
	public NoticeDto NoticeContent(int seq); //공지사항 내용
	public NoticeQDto QnaContent(int seq); //FAQ 내용
	public void QAWrite(int USER_SEQ, int QACATEGORY_SEQ, String TITLE, String CONTENT); //사용자 QA 작성 
	public int QALastRow(); //작성한 QA의 seq 가져오기 
	public void QAStatusWrite(int QA_SEQ, int QASTATUSREF_SEQ); //QAStatus 작성 
	
	// 리뷰
	public ArrayList<ReviewDto> ReviewList(); //리뷰 리스트 
	public ReviewDto ReviewContent(int seq); //리뷰 내용
	public void UpdateViews(int seq); //리뷰 조회수 업데이트
	public ProductDto productInfo(int seq); //리뷰 작성할 때 상품 정보 가져오기 
	public void  WriteReview(int USER_SEQ, int PAYMENT_SEQ, String TITLE, String CONTENT); //리뷰 작성
	public int ReviewLastRow(); //작성한 Review의 seq 가져오기 
	public void InsertReviewViews(int REVIEW_SEQ, int VIEWS);
	public void InsertReviewImage(int REVIEW_SEQ, String IMAGE);
	
	


}
