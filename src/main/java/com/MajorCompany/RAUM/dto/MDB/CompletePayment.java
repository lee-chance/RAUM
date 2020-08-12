package com.MajorCompany.RAUM.dto.MDB;

public class CompletePayment {
	
	public String seq, email, name, phone, Rent_seq, payment, orderDate;
	
	public CompletePayment() {
		// TODO Auto-generated constructor stub
	}

	
	public CompletePayment(String seq, String email, String name, String phone, String rent_seq, String totalPrice,
			String orderDate) {
		super();
		this.seq = seq;
		this.email = email;
		this.name = name;
		this.phone = phone;
		Rent_seq = rent_seq;
		this.payment = totalPrice;
		this.orderDate = orderDate;
	}



	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRent_seq() {
		return Rent_seq;
	}

	public void setRent_seq(String rent_seq) {
		Rent_seq = rent_seq;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	

}
