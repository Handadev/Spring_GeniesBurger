package com.myweb.domain;

public class StockVO {
	private int sno;
	private String sname;
	private int stock_qty;
	private String shelf_life;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getStock_qty() {
		return stock_qty;
	}
	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}
	public String getShelf_life() {
		return shelf_life;
	}
	public void setShelf_life(String shelf_life) {
		this.shelf_life = shelf_life;
	}
	
	@Override
	public String toString() {
		return "StockVO [sno=" + sno + ", sname=" + sname + ", stock_qty=" + stock_qty + ", shelf_life="
				+ shelf_life + "]";
	}
	
}
