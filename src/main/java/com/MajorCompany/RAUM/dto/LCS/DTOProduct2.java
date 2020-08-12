package com.MajorCompany.RAUM.dto.LCS;

public class DTOProduct2 {
	
	private String seq;
	private String name;
	private String price;
	private String image;
	private String category;
	
	public DTOProduct2() {
		// TODO Auto-generated constructor stub
	}

	public DTOProduct2(String seq, String name, String price, String image, String category) {
		super();
		this.seq = seq;
		this.name = name;
		this.price = price;
		this.image = image;
		this.category = category;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
