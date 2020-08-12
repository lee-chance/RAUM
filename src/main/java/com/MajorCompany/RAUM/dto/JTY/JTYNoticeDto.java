package com.MajorCompany.RAUM.dto.JTY;

import java.sql.Timestamp;

public class JTYNoticeDto {
	public int seq, User_seq; 
	public String title, content;
	Timestamp write_date;
	
	public JTYNoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public JTYNoticeDto(int seq, int user_seq, String title, String content, Timestamp write_date) {
		super();
		this.seq = seq;
		User_seq = user_seq;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUser_seq() {
		return User_seq;
	}

	public void setUser_seq(int user_seq) {
		User_seq = user_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	
}//---------
