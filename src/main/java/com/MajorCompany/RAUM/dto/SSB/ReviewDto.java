package com.MajorCompany.RAUM.dto.SSB;

public class ReviewDto {
	private int seq, views;
	private String nickname, title, content, writeDate, name, image;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(String nickname, int seq, int views, String title, String content, String writeDate, String name, String image) {
		super();
		this.nickname = nickname;
		this.seq = seq;
		this.views = views;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.name = name;
		this.image = image;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
}
