package com.MajorCompany.RAUM.dto.MDB;

public class AdminQAlist {
	
	public String seq, category, title, nickname, writeTime, status;
	
	public AdminQAlist() {
		// TODO Auto-generated constructor stub
	}

	
	
	



	public AdminQAlist(String seq, String category, String title, String nickname, String writeTime, String status) {
		super();
		this.seq = seq;
		this.category = category;
		this.title = title;
		this.nickname = nickname;
		this.writeTime = writeTime;
		this.status = status;
	}

	


	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	
	
	
	
}
