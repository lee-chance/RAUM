package com.MajorCompany.RAUM.dto.LCS;

public class DTOCart {
	
	private String seq, User_seq, Product_seq, size, qty, startDate, endDate, rentDay;
	
	public DTOCart() {
		// TODO Auto-generated constructor stub
	}

	public DTOCart(String seq, String user_seq, String product_seq, String size, String qty, String startDate,
			String endDate, String rentDay) {
		super();
		this.seq = seq;
		User_seq = user_seq;
		Product_seq = product_seq;
		this.size = size;
		this.qty = qty;
		this.startDate = startDate;
		this.endDate = endDate;
		this.rentDay = rentDay;
	}

	public DTOCart(String user_seq, String product_seq, String size, String qty, String startDate, String endDate,
			String rentDay) {
		super();
		User_seq = user_seq;
		Product_seq = product_seq;
		this.size = size;
		this.qty = qty;
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

	public String getUser_seq() {
		return User_seq;
	}

	public void setUser_seq(String user_seq) {
		User_seq = user_seq;
	}

	public String getProduct_seq() {
		return Product_seq;
	}

	public void setProduct_seq(String product_seq) {
		Product_seq = product_seq;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
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
