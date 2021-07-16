package com.myweb.domain;

public class PurchaseVO {
	private int purno;
	private int mno;
	private int cartno;
	private int pno;
	private String title;
	private int price;
	private int quantity;
	private String regdate;
	private String name;
	
	public PurchaseVO() {}

	public PurchaseVO(int mno, int cartno, int pno, String title, int price, int quantity) {
		this.mno = mno;
		this.cartno = cartno;
		this.pno = pno;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

	
	
	
	
	


	
	
}
