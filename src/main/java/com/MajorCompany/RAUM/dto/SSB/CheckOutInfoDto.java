package com.MajorCompany.RAUM.dto.SSB;

public class CheckOutInfoDto {

	private int seq, statusSeq;
	private String image, productName, startDate, endDate, status, paymentMethod, paymentName, optional, receiveMethod, returnMethod, address, paymentAccountName, depositAccountName, account;

	public CheckOutInfoDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CheckOutInfoDto(int seq, int statusSeq, String image, String productName, String startDate, String endDate,
			String status, String paymentMethod, String paymentName, String optional, String receiveMethod,
			String returnMethod, String address, String paymentAccountName, String depositAccountName, String account) {
		super();
		this.seq = seq;
		this.statusSeq = statusSeq;
		this.image = image;
		this.productName = productName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.paymentName = paymentName;
		this.optional = optional;
		this.receiveMethod = receiveMethod;
		this.returnMethod = returnMethod;
		this.address = address;
		this.paymentAccountName = paymentAccountName;
		this.depositAccountName = depositAccountName;
		this.account = account;
	}


	public int getStatusSeq() {
		return statusSeq;
	}

	public void setStatusSeq(int statusSeq) {
		this.statusSeq = statusSeq;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public String getOptional() {
		return optional;
	}

	public void setOptional(String optional) {
		this.optional = optional;
	}

	public String getReceiveMethod() {
		return receiveMethod;
	}

	public void setReceiveMethod(String receiveMethod) {
		this.receiveMethod = receiveMethod;
	}

	public String getReturnMethod() {
		return returnMethod;
	}

	public void setReturnMethod(String returnMethod) {
		this.returnMethod = returnMethod;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentAccountName() {
		return paymentAccountName;
	}

	public void setPaymentAccountName(String paymentAccountName) {
		this.paymentAccountName = paymentAccountName;
	}

	public String getDepositAccountName() {
		return depositAccountName;
	}

	public void setDepositAccountName(String depositAccountName) {
		this.depositAccountName = depositAccountName;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	
	
	
}
