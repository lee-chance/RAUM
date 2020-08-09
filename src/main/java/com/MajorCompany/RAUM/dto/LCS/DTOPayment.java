package com.MajorCompany.RAUM.dto.LCS;

public class DTOPayment {
	
	private String nickname;
	private String image;
	private String name;
	private String price;
	private String startDate;
	private String endDate;
	private String qty;
	
	public DTOPayment() {
		// TODO Auto-generated constructor stub
	}
	
	public DTOPayment(String nickname, String image, String name, String price, String startDate, String endDate,
			String qty) {
		super();
		this.nickname = nickname;
		this.image = image;
		this.name = name;
		this.price = price;
		this.startDate = startDate;
		this.endDate = endDate;
		this.qty = qty;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}
	
}
