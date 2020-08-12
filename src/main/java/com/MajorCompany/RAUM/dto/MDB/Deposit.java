package com.MajorCompany.RAUM.dto.MDB;

public class Deposit {
	
	public String Payment_seq, account, accountName, deposit;
	
	public Deposit() {
		// TODO Auto-generated constructor stub
	}

	public Deposit(String account, String accountName) {
		super();
		this.account = account;
		this.accountName = accountName;
	}

	public String getPayment_seq() {
		return Payment_seq;
	}

	public void setPayment_seq(String payment_seq) {
		Payment_seq = payment_seq;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	
	

}
