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
	font-size: 50px;
}
div.whole {
	text-align: center;
	line-height: 100px;
	vertical-align: middle;
}
div.left {
	width: 50%;
	height: 100px;
	float: left;
	box-sizing: border-box;
	background-image: url("/resources/icons/button5.jpg");
}
div.right {
	width: 50%;
	height: 100px;
	float: right;
	box-sizing: border-box;
	background-image: url("/resources/icons/button4.jpg");
}
div.coupon {
	text-align: center;
	line-height: 100px;
	vertical-align: middle;
	background-color: black;
	color: white;
	font-size: 40px;
}
a {
	color: white;
	font-size: 40px;
}
</style>
<div class="container p-3 my-3 border">
<c:set var="total" value="0"/>
<c:forEach items="${list }" var="cvo">
	<div class="menu_wrap">
		<span class="title">${cvo.title }</span><br>
		<span class="redFont">${cvo.price }원</span>
		<img class="img" src="/upload/${cvo.savedir }/${cvo.puuid}_${cvo.fname}" alt="display none">
	</div>
	<div class="sum_wrap">
		<br><br><br><span>수량</span><span style="float: right;">${cvo.quantity }</span><br>
		<c:set var="dc" value="1000" />
		<span>금액</span><span class="redFont" style="float: right;">${cvo.price * cvo.quantity }</span><br><hr>
		<c:set var= "total" value="${total + (cvo.price * cvo.quantity)}"/>
	</div>
</c:forEach>
</div>
<div class="container p-3 my-3 border">
	<span>주문금액</span><span style="float: right;">${total }</span><br>
	<span>할인금액</span><span style="float: right;">${dc }</span><br>
	<span id="sum">총 결제금액</span><span class="redFont" id="sum" style="float: right;">${total-dc }</span>
</div>
<div class="container whole">
	<div class="left"><a href="/">취소</a></div>
	<div class="right"><a href="/cart/method">결제</a></div>
	<div class="container coupon">쿠폰사용하기</div>
</div>

<jsp:include page="../common/footer.jsp" />