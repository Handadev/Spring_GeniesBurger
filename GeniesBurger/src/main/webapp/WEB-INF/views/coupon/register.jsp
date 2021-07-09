<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
	<div class="container">
		<h2>쿠폰 등록</h2>
			<form action="/coupon/register" id="registForm" method="post">
			  <div class="form-group">
			    <label for="cpname">쿠폰 이름</label>
			    <input type="text" class="form-control" placeholder="Enter Name" id="cpname" name="cpname">
			  </div>
			  <!-- <div class="form-group">
			    <label for="enddate">쿠폰 유효기간</label>
			    <input type="date" class="form-control" id="enddate" name="enddate">
			  </div> -->
			  <div class="form-group">
			    <label for="discount">할인(%)</label>
			    <input type="text" class="form-control" placeholder="Enter Discount" id="discount" name="discount">
			  </div>
			  <div class="form-group">
				  <button type="button" id="couponSbmBtn" class="btn btn-primary">등록</button>
				  <a href="/coupon/list" class="btn btn-primary float-right">목록으로</a>
			  </div>
			</form>
		</div>
		<script src="/resources/js/jquery.min.js"></script>
		<script>
		$("#couponSbmBtn").on("click", function() {
			var cpname = $("#cpname").val();
			var discount = $("#discount").val();

			if (cpname == "" || cpname == null) {
				alert("쿠폰 이름을 입력해주세요.");
				$("#cpname").focus();
			} else if (discount == "" || discount == null) {
				alert("할인 내용을 입력해주세요.");
				$("#discount").focus();
			} else {
				document.getElementById("registForm").submit();
				alert("쿠폰이 정상적으로 등록되었습니다.");
			}
		});
		</script>
<jsp:include page="../adminCommon/footer.jsp" />