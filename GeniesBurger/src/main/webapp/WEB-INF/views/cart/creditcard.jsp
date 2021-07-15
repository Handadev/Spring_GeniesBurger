<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
span {
	font-size: 50px;
	font-weight: bold;
	line-height: 70px;
}
.img {
	width: 400px;
	margin: 0px 50px;
}
div {
	text-align: center;
}
.input {
	color: red;
}
p {
	font-size: 25px;
}
</style>
<div class="container p-3 my-3 border">
	<span class="input">신용카드를</span><br>
	<span class="creditcard">투입구에 꽂아주세요</span><br><br>
	<p>결제 오류 시 마그네틱을 아래로 향하게 긁어주세요</p>
	<br><br>
	<a href="complete"><img src="/resources/images/insert_card2.png" class="img"></a>
	<br><br><br><br><br><br><br>
</div>

<jsp:include page="../common/footer.jsp" />