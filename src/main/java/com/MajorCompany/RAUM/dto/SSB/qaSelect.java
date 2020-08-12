package com.MajorCompany.RAUM.dto.SSB;

public class qaSelect {

	private String category;
	private String title;
	private String date;
	private String status;
	private String seq;
	
	public qaSelect() {
		// TODO Auto-generated constructor stub
	}

	public qaSelect(String category, String title, String date, String status, String seq) {
		super();
		this.category = category;
		this.title = title;
		this.date = date;
		this.status = status;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

}
