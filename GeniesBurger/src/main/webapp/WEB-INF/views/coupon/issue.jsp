<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<div class="container">
	<h2>쿠폰 발급</h2>
	<form action="/coupon/issue" id="issueForm" method="post">
		<select class="form-control" name="cpno" id="coupon">
			<option value="">발급할 쿠폰 선택</option>
			<c:forEach items="${cpList }" var="cpvo">
				<option value="${cpvo.cpno }">${cpvo.cpname }</option>
			</c:forEach>
		</select> <select class="form-control mt-3" name="mno" id="member">
			<option value="">발급할 이메일 선택</option>
			<c:forEach items="${mList }" var="mvo">
				<option value="${mvo.mno }">${mvo.email }</option>
			</c:forEach>
		</select>
		<div class="form-group mt-3">
			<button type="button" id="issueSbmBtn" class="btn btn-primary">발급</button>
			<a href="/coupon/issueList" class="btn btn-primary float-right">목록으로</a>
		</div>
	</form>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script>
	$("#issueSbmBtn").on("click", function() {
		var coupon = $("#coupon option:selected").val();
		var member = $("#member option:selected").val();

		if (coupon == "" || coupon == null) {
			alert("쿠폰을 선택해주세요.");
			$("#coupon").focus();
		} else if (member == "" || member == null) {
			alert("멤버를 선택해주세요.");
			$("#member").focus();
		} else {
			document.getElementById("issueForm").submit();
			alert("쿠폰이 정상적으로 발급되었습니다.");
		}
	});
</script>
<jsp:include page="../common/footer.jsp" />