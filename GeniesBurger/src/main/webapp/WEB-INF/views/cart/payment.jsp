<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../payCommon/header_01.jsp" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-size: 22px;
}
.box {
	box-shadow: 1px 1px 1px 1px;
	border: none;
	height: 400px;
	width: 850px;
	margin: auto;
}
.box2 {
	box-shadow: 1px 1px 1px 1px;
	border: none;
	height: 250px;
	width: 850px;
	margin: auto;
}
.menu_wrap {
	float: left;
	width: 50%;
	height: 200px;
	padding: 10px;
}
.img_wrap {
	padding-top: 15px;
	height: 200px;
	text-align: right;
	padding-right: 70px;
}
.img {
	width: 260px;
	height: 180px;
}
.sum_wrap {
	float: left;
	width: 50%;
	padding: 10px;
	height: 120px;
}
.sum_wrap02 {
	padding: 10px;
	padding-right: 90px;
	height: 120px;
	text-align: right;
}
.total_pay {
	float: left;
	width: 50%;
	height: 180px;
	padding: 10px;
}
.total_pay02 {
	padding-top: 10px;
	height: 180px;
	padding-right: 90px;
	text-align: right;
}
.title {
	font-size: 1.8em;
	font-weight: bold;
}
.redfont {
	padding-top: 55px;
	color: red;
	font-weight: bold;
}
.redfont2 {
	color: red;
}
div.whole {
	width: 880px;
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
	height: 150px;
	line-height: 50px;
	vertical-align: middle;
	background-color: black;
	color: white;
}
a {
	color: white;
	font-size: 40px;
}
#sum {
	padding-bottom: 20px;
	font-size: 1.8em;
	font-weight: bold;
}
.modal {
	min-width: 100%;
	min-height: 100%;
}
.modal-title {
	margin: auto;
}
.modal-body {
	text-align: center;
}
.modal-img {
	margin: 10px;
}
</style>

	<c:set var="total" value="0" />
	<c:forEach items="${list }" var="cvo">
<div class="container p-3 my-3 box">
		<div class="menu_wrap">
			<p class="title">${cvo.title }</p>
			
			<p class="redfont"><fmt:formatNumber value="${cvo.price }" pattern="#,###"/>원</p>

		</div>
		<div class="img_wrap">
			<img class="img"
				src="/upload/${cvo.savedir }/${cvo.puuid}_${cvo.fname}"
				alt="display none" alt="display none">
		</div>
		<hr>
		<div class="sum_wrap">
			<p>수량</p>
			<p>금액</p>
		</div>
		<c:set var="dc" value="1000" />
 		<div class="sum_wrap02">
			<p>${cvo.quantity }개</p>
			<c:set var="num2" value="${num2+1 }" />
			<p class="redfont2" id="A${num2 }" pattern="#,###">${cvo.price * cvo.quantity }원</p>
			<c:set var="num" value="${num+1 }" />
			<p class="redfont2" id="${num }">${cvo.price * cvo.quantity }</p>
		</div>
		<c:set var="total" value="${total + (cvo.price * cvo.quantity)}" />
</div>
	</c:forEach>
<div class="container p-3 my-3 box2">
	<div class="total_pay">
		<p>주문금액</p>
		<p>할인금액</p>
		<hr>
		<p id="sum">총 결제금액</p>
	</div>
	<div class="total_pay02">
	
		<p id="total"><fmt:formatNumber value="${total }" pattern="#,###"/>원</p>
		<p id="dc">0원</p>
		<hr>
		<p id="price"><fmt:formatNumber value="${total }" pattern="#,###"/>원</p>
	</div>
</div>
<div class="container whole">
	<div class="left"><a href="/">취소</a></div>
	<div class="right"><a href="/cart/method" id="paymentBtn">결제</a></div>

	<div class="container coupon" class="btn btn-primary" data-toggle="modal" data-target="#couponModal" style="cursor: pointer;">
	쿠폰사용하기</div>

</div>

<!-- Coupon Modal -->
<div class="modal fade" id="couponModal">
   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
      
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">쿠폰을 선택해주세요.</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="height: 400px;">
      <img src="/resources/icons/coupon2.png" style="width:300px; height:200px;" class="modal-img" />
      	<p class="mt-1">
      		<select name="coupon" id="coupon" style="width:300px;">
				<option value="">쿠폰 선택</option>
        			<c:forEach items="${myCpList }" var="cp">
        				<option value="${cp.discount }" value2="${cp.cplno }">${cp.cpname } (${cp.discount }% 할인)</option>
        			</c:forEach>
      	   </select>
      	 </p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button class="btn-sm btn-primary" type="button" id="selectCp">선택</button>
        <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
var arr = [];
var arr2 = [];
var arrString = '';
for(let i = 1; i <= ${num}; i++) {
	let c = $("#"+ i).text(); // 할인 전 금액
	arr2.push(c);
	console.log(arr2);
}
$("#useCp").on("click", function() {
	arr = []; // 쿠폰을 재선택할 때 배열 비워줌
	arrString = '';
	for(let i = 1; i <= ${num2 }; i++) {
		let d = $("#A"+ i).text(); // 할인 전 금액
		let e = d.substr(0, d.length-1); 
		console.log(d);
		$("#"+ i).html(e);
	}
});

$("#selectCp").on("click", function() {
	for(let i = 1; i <= ${num}; i++) {
		let couponVal = $("#coupon option:selected").attr("value");
		let c = $("#"+ i).text(); // 할인 전 금액
		arr2.push(c);
		console.log("***할인전 금액 : " + c);
		let a = Math.floor(c * (couponVal*(0.01))); // 할인 금액
		let b = c - a; // 할인된 금액
		$("#"+ i).html(b);
		console.log("***할인된 금액 : " + b);
		arr.push(b);
	}
	
	console.log(arr); // 할인된 금액 배열
	arrString = arr;
	console.log("***arrString : " + arrString);
	
	localStorage.setItem('price', arr);
	
	let couponVal = $("#coupon option:selected").attr("value"); // %값 
	let total = $("#total").text();
	let totalPrice = total.substr(0, total.length-1);
	let dcPrice = Math.floor(totalPrice * (couponVal*(0.01)));
	let price = totalPrice - dcPrice;
	console.log(couponVal);
	$("#dc").val(couponVal);
	$("#dc").html(dcPrice + "원");
	$("#price").html(price +"원");
	$("#couponModal").modal("hide");
});

console.log(arr2);

function coupon_cancel(cplno){
	$.ajax({
		url: "/coupon/" + cplno,
		type: "delete"
	}).done(function(result) {
		alert("쿠폰 사용 성공!");
	}).fail(function(err) {
		alert("쿠폰 사용 실패...");
		location.reload();
	});
 }
	$(document).on("click", "#paymentBtn", function() {
	let couponVal = $("#coupon option:selected").attr("value2");
	console.log("cplno : " + couponVal);
	
	if(arr.length <= 0) {
		console.log("arr2 보냄")
		localStorage.setItem('price', arr2);
	}
	if(couponVal != null) {
		coupon_cancel(couponVal);
	}
 });
</script>

<jsp:include page="../payCommon/payFooter.jsp" />

