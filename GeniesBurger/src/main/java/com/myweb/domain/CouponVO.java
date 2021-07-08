package com.myweb.domain;

public class CouponVO {
	private int cpno;
	private String cpname;
	private String enddate; // 쿠폰 유효 날짜
	private int discount;
	
	public int getCpno() {
		return cpno;
	}
	public void setCpno(int cpno) {
		this.cpno = cpno;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "CouponVO [cpno=" + cpno + ", cpname=" + cpname + ", enddate=" + enddate + ", discount=" + discount
				+ "]";
	}
}
