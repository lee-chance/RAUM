package com.MajorCompany.RAUM.dto.SSB;


public class NoticeDto {
	
	private int seq, User_seq; 
	private String title, content, write_Date;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int seq, int User_seq, String title, String content, String write_Date) {
		super();
		this.seq = seq;
		this.User_seq = User_seq;
		this.title = title;
		this.content = content;
		this.write_Date = write_Date;
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

	public String getWrite_Date() {
		return write_Date;
	}

	public void setWrite_Date(String write_Date) {
		this.write_Date = write_Date;
	}


	
	

}
