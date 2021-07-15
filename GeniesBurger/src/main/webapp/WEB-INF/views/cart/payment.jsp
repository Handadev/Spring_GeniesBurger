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
	}
	#sum {
	font-size:50px;
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
	<div class="container coupon">쿠폰사용하기<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#couponModal">
  		쿠폰 선택
	</button></div>
</div>
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
      	<button class="btn btn-primary" type="button" id="selectCp">선택</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
$("#selectCp").on("click", function() {
	let couponVal = $("#coupon option:selected").attr("value");
	let cplno = $("#cplno").val();
	let sum = $("#summ").text();
	let salePrice = Math.floor(sum * (couponVal*(0.01)));
	let price = sum - salePrice;
	console.log(couponVal);
	$("#dc").val(couponVal);
	$("#dc").html(salePrice);
	$("#price").html(price);
	$("#paymentBtn").data("cplno", cplno);
	$("#couponModal").modal("hide");
});

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
	console.log(couponVal)
	if(couponVal != null) {
		coupon_cancel(couponVal);
	}
 });
</script>
<jsp:include page="../common/footer.jsp" />