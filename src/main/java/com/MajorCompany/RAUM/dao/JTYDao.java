package com.MajorCompany.RAUM.dao;

import java.util.ArrayList;

import com.MajorCompany.RAUM.dto.JTY.JTYDto;

public interface JTYDao {
	
	public ArrayList<JTYDto> getUserList();
	public void inserLoginDao(String email, String password);//Login 이메일,패스워드 입력
	public void insertUserDao(String nickname, String phone, String birthday); //User 테이블 입력
	public void insertAddressDao(String address);//Address 테이블 입력
	public String checkEmailDao(String email); //이메일 중복 값 찾기
	

}
