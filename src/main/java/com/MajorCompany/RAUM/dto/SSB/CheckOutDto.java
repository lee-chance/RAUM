package com.MajorCompany.RAUM.dto.SSB;

public class CheckOutDto {
	private int seq;
	private String startDate, endDate, name, paymentMethod, productName, status;
	
	public CheckOutDto() {
		// TODO Auto-generated constructor stub
	}

	public CheckOutDto(int seq, String startDate, String endDate, String name, String paymentMethod, String productName,
			String status) {
		super();
		this.seq = seq;
		this.startDate = startDate;
		this.endDate = endDate;
		this.name = name;
		this.paymentMethod = paymentMethod;
		this.productName = productName;
		this.status = status;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
