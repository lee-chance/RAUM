package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.SSB.NoticeDto;
import com.MajorCompany.RAUM.dto.SSB.NoticeQDto;
import com.MajorCompany.RAUM.dto.SSB.UserDto;

public interface SSBDao {

	public ArrayList<NoticeQDto> qnaListLimit(); //고객센터 메인 화면 
	public ArrayList<NoticeDto> NoticeList(); //공지사항 리스트
	public ArrayList<NoticeQDto> qnaList(); //FAQ 리스트
	public NoticeDto NoticeContent(int seq); //공지사항 내용
	public NoticeQDto QnaContent(int seq); //FAQ 내용
	public void QAWrite(int USER_SEQ, int QACATEGORY_SEQ, String TITLE, String CONTENT);
	
	public String query(String userId, String password); // 로그인
	public UserDto getNickname(String email); // 닉네임 찾기
	
}
