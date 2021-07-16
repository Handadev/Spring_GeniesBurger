package com.myweb.domain;


public class AddExtraVO {
	private int aeno;
	private int mno;
	private int pno;
	private int price;
	private String sname;
	
	public AddExtraVO() {
	}
	
	// stock에서 price 처리되기 전까지 쓰는 생성자
	public AddExtraVO(int mno, int pno, String sname) {
		this.mno = mno;
		this.pno = pno;
		this.sname = sname;
	}

	public AddExtraVO(int mno, int pno, int price, String sname) {
		this.mno = mno;
		this.pno = pno;
		this.price = price;
		this.sname = sname;
	}

	public int getAeno() {
		return aeno;
	}
	public void setAeno(int aeno) {
		this.aeno = aeno;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
}
