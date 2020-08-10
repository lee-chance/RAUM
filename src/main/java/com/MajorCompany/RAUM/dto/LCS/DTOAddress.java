package com.MajorCompany.RAUM.dto.LCS;

public class DTOAddress {
	
	private String addressName;
	private String address;
	private String name;
	private String phone;
	
	public DTOAddress() {
		// TODO Auto-generated constructor stub
	}

	public DTOAddress(String addressName, String address, String name, String phone) {
		super();
		this.addressName = addressName;
		this.address = address;
		this.name = name;
		this.phone = phone;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

}
