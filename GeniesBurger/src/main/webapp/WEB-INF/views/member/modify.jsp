<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<h2>Member Modify</h2>
<c:choose>
	<c:when test="${ses.email eq mvo.email }">
		<form action="/member/modify" method="post" id="modifyForm">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" placeholder="Enter email"
					name="email" value="${mvo.email }" readonly>
			</div>
			<div class="form-group">
				<label for="pwd">New Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter new password" name="pwd">
			</div>
			<div class="form-group">
				<label for="confirmPwd">Confirm Password:</label> <input type="password"
					class="form-control" id="confirmPwd" placeholder="Repeat password">
					<p id="confirmMessage"></p>
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
			<button type="button" class="btn btn-primary" id="submitBtn">Submit</button>
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
	$("#delBtn").on("click", removeMember);

	function removeMember() {
		if (confirm("정말 탈퇴하시겠습니까?")) { //확인
			$("#delForm").submit();
		} else { //취소
			return;
		}
	};
	
	let firstPwd = '';
	let secondPwd = '';
	
	$("#pwd").keyup(function() {
		  firstPwd = $("#pwd").val(); 
		  secondPwd = $("#confirmPwd").val();
		  if (firstPwd == '' && secondPwd == '') {
			  $("#confirmMessage").text("비밀번호를 입력하세요!").css({"color": "blue", "font-size": "15px"});
		  } else if (firstPwd == secondPwd) {
			  $("#confirmMessage").text("비밀번호가 일치합니다!").css({"color": "green", "font-size": "15px"});
		  } else {
			  $("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({"color": "red", "font-size": "15px"});
		  }
	   });
	   
	   $("#confirmPwd").keyup(function() {
		  firstPwd = $("#pwd").val(); 
		  secondPwd = $("#confirmPwd").val();
		  if (firstPwd == '' && secondPwd == '') {
			  $("#confirmMessage").text("비밀번호를 입력하세요!").css({"color": "blue", "font-size": "15px"});
		  } else if (firstPwd == secondPwd) {
			  $("#confirmMessage").text("비밀번호가 일치합니다!").css({"color": "green", "font-size": "15px"});
		  } else {
			  $("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({"color": "red", "font-size": "15px"});
		  }
	   });
	   
	   $("#submitBtn").click(function() {
		   let isEmpty = false;
		   $('#modifyForm').find('input[type!="hidden"]').each(function(){
		       if(!$(this).val()) {
		    	   isEmpty = true;
		       }
		   });
		   if(isEmpty) {
		       alert('값을 전부 입력하세요!');
		   } else if (firstPwd != secondPwd) {
			   alert('비밀번호를 확인하세요!');
		   }  else {
			   $("#modifyForm").submit();
		   }
	   });	
</script>

<jsp:include page="../common/footer.jsp" />