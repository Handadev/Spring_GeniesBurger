<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
	<div class="container">
		<h2>Product Modify</h2>
		<form action="/coupon/modify" method="post" id="modifyForm">
			<input type="hidden" name="cpno" value="${cpvo.cpno }">
			<div class="form-group">
				<label for="cpname">Coupon Name:</label> <input type="text"
					class="form-control" value="${cpvo.cpname }" id="cpname" name="cpname">
			</div>
			<%-- <div class="form-group">
				<label for="enddate">Coupon 만료 날짜:</label> <input type="date"
					class="form-control" id="enddate" name="enddate"
					value="${cpvo.enddate }">
			</div> --%>
			<div class="form-group">
				<label for="discount">Discount:</label> <input type="text"
					class="form-control" value="${cpvo.discount }" id="discount" name="discount">
			</div>
	
			<button type="button" class="btn btn-primary" id="couponSbmBtn">Submit</button>
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
				document.getElementById("modifyForm").submit();
				alert("쿠폰이 정상적으로 수정되었습니다.");
			}
		});
		</script>
<jsp:include page="../adminCommon/footer.jsp" />
