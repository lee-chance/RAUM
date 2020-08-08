package com.MajorCompany.RAUM.dto.MDB;

public class Product {
	
	public String seq, qty, price, startDate, endDate, rentDay;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String seq, String qty, String price, String startDate, String endDate, String rentDay) {
		super();
		this.seq = seq;
		this.qty = qty;
		this.price = price;
		this.startDate = startDate;
		this.endDate = endDate;
		this.rentDay = rentDay;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
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

	public String getRentDay() {
		return rentDay;
	}

	public void setRentDay(String rentDay) {
		this.rentDay = rentDay;
	}

	

	
	
	
	
	
}
