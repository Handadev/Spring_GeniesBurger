<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
.title {
	padding: 50px 320px 20px 0px;
	}
.img {
	float: right;
	width: 260px;
	height: 170px;
	}
span {
	position: relative;
	font-size: 30px;
	color: black;
	font-weight: bold;
	}
.menu_wrap {
	width: 920px;
	height: 170px;
	}
.redFont {
	color: red;
	}
	#sum {
	font-size:50px;
	}
</style>

<div class="container p-3 my-3 border">
	<div class="menu_wrap">
		<span class="title">${cvo.title }</span><br>
		<span class="redFont">${cvo.price }원</span>
		<img class="img" src="/upload/${cvo.savedir }/${cvo.puuid}_${cvo.fname}" alt="display none">
	</div>
	<div class="sum_wrap">
		<br><br><br><span>수량</span><span style="float: right;">${cvo.quantity }</span><br>
		<c:set var="sum" value="${sum + (cvo.price * cvo.quantity)}" />
		<c:set var="dc" value="1000" />
		<span>합계금액</span><span class="redFont" style="float: right;">${sum }</span>
	</div>
</div>

<div class="container p-3 my-3 border">
	<span>주문금액</span><span style="float: right;">${sum }</span><br>
	<span>할인금액</span><span style="float: right;">${dc }</span><br>
	<span id="sum">총 결제금액</span><span class="redFont" id="sum" style="float: right;">${sum-dc }</span>
</div>
<div class="container p-3 my-3 border">
	<a href="/" class="btn btn-warning">취소</a>
	<a href="/cart/method" class="btn btn-danger">결제</a>
</div>

<jsp:include page="../common/footer.jsp" />