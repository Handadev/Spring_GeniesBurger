package com.myweb.domain;

public class CartVO {
	private int cartno;
	private String title;
	private int price;
	private int quantity;
	private int mno;
	private int pno;
	private String puuid;
	private String savedir;
	private String fname;

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

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPuuid() {
		return puuid;
	}

	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}

	public String getSavedir() {
		return savedir;
	}

	public void setSavedir(String savedir) {
		this.savedir = savedir;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Override
	public String toString() {
		return "CartVO [cartno=" + cartno + ", title=" + title + ", price=" + price + ", quantity=" + quantity
				+ ", mno=" + mno + ", pno=" + pno + ", puuid=" + puuid + ", savedir=" + savedir + ", fname=" + fname
				+ "]";
	}

}
