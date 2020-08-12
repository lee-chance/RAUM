package com.MajorCompany.RAUM.dto.SKH;

public class myReview {
	
	private String seq;
	private String title;
	private String writedate;
	private String views;
	private String nickname;
	private String content;
	
	public myReview() {
		// TODO Auto-generated constructor stub
	}

	public myReview(String seq, String title, String writedate, String views, String nickname, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.writedate = writedate;
		this.views = views;
		this.nickname = nickname;
		this.content = content;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
