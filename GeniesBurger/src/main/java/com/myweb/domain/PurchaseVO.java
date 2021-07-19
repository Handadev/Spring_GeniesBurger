package com.myweb.domain;

public class PurchaseVO {
	private int purno;
	private int mno;
	private int cartno;
	private int pno;
	private int price;
	private int quantity;
	private String title;
	private String regdate;

	public PurchaseVO() {
	}

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

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
