package com.MajorCompany.RAUM.dto.SSB;

public class ProductDto {
	
	private int seq;
	private String image, name, size;

	public ProductDto() {
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int seq, String image, String name, String size) {
		super();
		this.seq = seq;
		this.image = image;
		this.name = name;
		this.size = size;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
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

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	
}
