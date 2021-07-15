<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
div {
	text-align: center;
}
.order {
	font-size: 50px;
}
.orderNum {
	font-size: 30px;
	color: red;
}
#ranNum {
	font-size: 200px;
	color: red;
	line-height: 200px;
}
.receipt {
	font-size: 30px;
}
.img {
	width: 500px;
}
#mno {
	display: none;
}
</style>

<div class="container p-3 my-3 border">
	<span class="order">주문이 완료되었습니다!</span><br><br>
	<span class="orderNum">주문번호</span><br>
	<span id="ranNum"></span><br><br>
	<span class="receipt">신용카드를 뽑은 후</span><br>
	<span class="receipt">출력된 영수증을 받아가세요!</span><br><br><br>
	<span id="mno">${ses.mno }</span>	
	<img src="/resources/images/complete.png" class="img" id="img">
	<br><br><br><br><br><br><br>
</div>

<script>
let ranNum = Math.floor((Math.random() * 900)+100)
$("#ranNum").text(ranNum);

$("#img").click(function() {
	let mno_val = $("#mno").text();
	console.log(mno_val);
	if (mno_val == '') {
		alert("세션이 만료되었습니다. 다시 로그인해주세요!");
		location.replace("/member/login");
	} else {
		$.ajax({
			url: "/cart/mno/",
			type: "post",
			data:{mno:mno_val}
		}).done(function(result) {
			alert("이용해주셔서 감사합니다~");
			location.replace("/");
		}).fail(function(err) {
			alert("오류가 발생했습니다");
		});
	}
});
</script>

<jsp:include page="../common/footer.jsp" />