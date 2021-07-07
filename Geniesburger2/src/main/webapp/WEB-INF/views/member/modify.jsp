<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<h2>Member Modify</h2>
<c:choose>
	<c:when test="${ses.email eq mvo.email }">
		<form action="/member/modify" method="post">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email" value="${mvo.email }" readonly>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd" value="${mvo.pwd }">
			</div>
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" id="name" placeholder="Enter name" name="name"
					value="${mvo.name }">
			</div>
			<div class="form-group">
				<label for="mobile">Mobile:</label> <input type="text"
					class="form-control" id="mobile" placeholder="Enter mobile"
					name="mobile" value="${mvo.mobile }">
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					class="form-control" id="address" placeholder="Enter address"
					name="address" value="${mvo.address }">
			</div>
			<div class="form-group">
				<label for="birthday">Birth day:</label> <input type="date"
					class="form-control" id="birthday" placeholder="Enter birth day"
					name="birthday" value="${mvo.birthday }">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="button" class="btn btn-danger float-right" id="delBtn">Withdrawal</button>
		</form>
		<form action="/member/remove" method="post" id="delForm">
			<input type="hidden" value="${mvo.mno }" id="mno" name="mno">
		</form>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인이 필요한 페이지 입니다!");
			location.replace("/member/login");
		</script>
	</c:otherwise>
</c:choose>
<script>
	document.getElementById("delBtn").addEventListener("click", removeMember);

	function removeMember() {
		if (confirm("정말 탈퇴하시겠습니까?")) { //확인
			document.getElementById("delForm").submit();
		} else { //취소
			return;
		}
	};
</script>

<jsp:include page="../common/footer.jsp" />