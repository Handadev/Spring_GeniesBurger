<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<div class="container p-3 my-3 border" style="text-align: center;">
	<h1>결제화면이지롱</h1><br>
	
	<h1>${cvo.title }</h1>
	<h1>${cvo.price }원</h1>
	<h1>수량 : ${cvo.quantity }</h1>
	<c:set var="sum" value="${sum + (cvo.price * cvo.quantity)}" />
	<c:set var="dc" value="1000" />
	<h1>합계금액 : ${sum }</h1><br><br>
	
	<h1>주문금액 : ${sum }</h1>
	<h1>할인금액 : ${dc }</h1>
	<h1>총 결제금액 : ${sum-dc }</h1>

	<button class="btn btn-warning">취소</button>
	<button class="btn btn-danger">결제</button>
	<p>결제버튼을 누르면 결제수단으로 넘어감</p>
</div>

<jsp:include page="../common/footer.jsp" />