package com.myweb.domain;

public class PurchaseVO {
	private int purno;
	private int mno;
	private int cartno;
	private String regdate;
	
	public PurchaseVO() {}

	public PurchaseVO(int mno, int cartno) {
		this.mno = mno;
		this.cartno = cartno;
	}
	
	public int getPurno() {
		return purno;
	}
	public void setPurno(int purno) {
		this.purno = purno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
