package com.MajorCompany.RAUM.dto.MDB;

public class AdminProduct {
	
	
	public String seq, image, name, price, uploadDate;
	
	public AdminProduct() {
		// TODO Auto-generated constructor stub
	}

	

	public AdminProduct(String seq, String image, String name, String price, String uploadDate) {
		super();
		this.seq = seq;
		this.image = image;
		this.name = name;
		this.price = price;
		this.uploadDate = uploadDate;
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

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	

}
