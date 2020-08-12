package com.MajorCompany.RAUM.dto.LCS;

public class DTOAddress {
	private String seq;
	private String addressName;
	private String name;
	private String address1;
	private String address2;
	private String address3;
	private String phone1;
	private String phone2;
	private String phone3;
	
	public DTOAddress() {
		// TODO Auto-generated constructor stub
	}

	public DTOAddress(String seq, String addressName, String name, String address1, String address2, String address3,
			String phone1, String phone2, String phone3) {
		super();
		this.seq = seq;
		this.addressName = addressName;
		this.name = name;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

}
