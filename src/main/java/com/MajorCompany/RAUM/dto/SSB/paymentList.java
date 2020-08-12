package com.MajorCompany.RAUM.dto.SSB;

public class paymentList {
	
	private String payment;
	private String seq;
	private String orderdate;
	private String name;
	private String image;
	private String size;
	private String qty;
	private String price;
	private String checked;
	private String status;
	
	public paymentList() {
		// TODO Auto-generated constructor stub
	}

	public paymentList(String payment, String seq, String orderdate, String name, String image, String size, String qty,
			String price, String checked, String status) {
		super();
		this.payment = payment;
		this.seq = seq;
		this.orderdate = orderdate;
		this.name = name;
		this.image = image;
		this.size = size;
		this.qty = qty;
		this.price = price;
		this.checked = checked;
		this.status = status;
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

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
