package com.MajorCompany.RAUM.dto.LCS;

public class DTOProductDetail {
	
	private String seq;
	private String image;
	private String name;
	private String price;
	private String category;
	private String information;
	
	public DTOProductDetail() {
		// TODO Auto-generated constructor stub
	}

	public DTOProductDetail(String seq, String image, String name, String price, String category, String information) {
		super();
		this.seq = seq;
		this.image = image;
		this.name = name;
		this.price = price;
		this.category = category;
		this.information = information;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

}
