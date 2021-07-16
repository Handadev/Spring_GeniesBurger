<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../payCommon/header_02.jsp" />
<style>
span {
	font-size: 50px;
	font-weight: bold;
	line-height: 70px;
}
.img {
	width: 350px;
	margin: 0px 100px;
}
.method {
	color: red;
}
.choose {
	color: black;
}
div {
	text-align: center;
}
</style>

<div class="container p-3 my-3 border">
	<span class="method">결제 수단을</span><br>
	<span class="choose">선택해주세요</span><br><br><br><br>
	<a href="creditcard"><img src="/resources/images/creditcard2.png" class="img"></a>
	<a href="#"><img src="/resources/images/payco.png" class="img"></a>
	<br><br><br><br><br><br><br>
</div>

<jsp:include page="../payCommon/payFooter.jsp" />