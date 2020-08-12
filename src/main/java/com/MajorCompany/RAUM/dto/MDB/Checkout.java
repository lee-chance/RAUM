package com.MajorCompany.RAUM.dto.MDB;

public class Checkout {
	
	public String name, address, phone, payment, receiveMethod, returnMethod, accountName, paymentMethod, optional;
	
	
	public Checkout() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	



	public Checkout(String name, String address, String phone, String payment, String receiveMethod,
			String returnMethod, String accountName, String paymentMethod, String optional) {
		super();
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.payment = payment;
		this.receiveMethod = receiveMethod;
		this.returnMethod = returnMethod;
		this.accountName = accountName;
		this.paymentMethod = paymentMethod;
		this.optional = optional;
	}








	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getOptional() {
		return optional;
	}

	public void setOptional(String optional) {
		this.optional = optional;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
}
