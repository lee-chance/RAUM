package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.JTY.JTYDto;
import com.MajorCompany.RAUM.dto.JTY.JTYFAQDto;
import com.MajorCompany.RAUM.dto.JTY.JTYNoticeDto;

public interface JTYDao {
	
	//회원가입
	public ArrayList<JTYDto> getUserList();
	public void inserLoginDao(String email, String password);//Login 이메일,패스워드 입력
	public void insertUserDao(String nickname, String phone, String birthday); //User 테이블 입력
	public void insertAddressDao(String address);//Address 테이블 입력
	public String checkEmailDao(String email); //이메일 중복 값 찾기
	
	
	//관리자 공지사항
	public ArrayList<JTYNoticeDto> NoticeListContent(); // 관리자 공지사항 리스트 
	public void noticeWriteDao(String User_seq, String title, String content); // 관리자 공지사항 글쓰기
	public JTYNoticeDto noticeDao (int seq); //수정 해당 글 불러오기
	public void updateNoticeDao(String title, String content, int seq); // 수정 메소드
	public void deleteDao(int seq ); //삭제 메소드
	
	//관리자 FAQ
	public ArrayList<JTYFAQDto> FAQListContent(); // FAQ 리스트
	public void noticeQDao( String title, String content, String type); // 입력
	public JTYFAQDto faqloaddao (int seq); // 수정 해당 글 불러오기
	public void updateFAQDao (String title, String content,String type, int seq); //수정 메소드
	public void deleteFAQDao(int seq); //삭제 메소드
	
	
	
	
	
	
	
	
}//---------
