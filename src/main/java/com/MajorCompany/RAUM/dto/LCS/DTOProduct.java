package com.MajorCompany.RAUM.dto.LCS;

public class DTOProduct {
	
	String product_num;
	String image;
	String name;
	String price;
	
	public DTOProduct() {
		// TODO Auto-generated constructor stub
	}

	public DTOProduct(String product_num, String image, String name, String price) {
		super();
		this.product_num = product_num;
		this.image = image;
		this.name = name;
		this.price = price;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
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

}
