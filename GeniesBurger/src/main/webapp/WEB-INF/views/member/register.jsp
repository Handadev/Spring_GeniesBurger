<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

  <h2>Member Register</h2>
  <form action="/member/register" method="post" id="registerForm">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
      <button type="button" class="btn btn-success btn-sm" id="checkEmail">중복확인</button>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="form-group">
		<label for="confirmPwd">Confirm Password:</label> <input type="password"
			class="form-control" id="confirmPwd" placeholder="Repeat password">
			<p id="confirmMessage"></p>
	</div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="form-group">
      <label for="mobile">Mobile:</label>
      <input type="text" class="form-control" id="mobile" placeholder="Enter mobile" name="mobile">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
    </div>
    <div class="form-group">
      <label for="birth day">Birth day:</label>
      <input type="date" class="form-control" id="birthday" placeholder="Enter birth day" name="birthday">
    </div>
    <button type="button" class="btn btn-primary" id="submitBtn">Submit</button>
  </form>
  
<script>
	let isAllowed = false;
	let firstPwd = '';
	let secondPwd = '';
	
	$("#email").on("change", function() {
		isAllowed = false;
	});
	
   $(function() {
      $("#checkEmail").on("click", function(e) {
         e.preventDefault();
         let email_val = $("#email").val();
         $.ajax({
            url: "/member/checkEmail",
            type: "post",
            data: {email: email_val}
         }).done(function(result) {
            if(parseInt(result)==0){
               alert("사용 가능한 이메일입니다!");
               isAllowed = true;
               $("#pwd").focus();
            }else{
               $("#email").focus();
               alert("중복되는 이메일입니다!");
            }
         });
      });
   });
   
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
	   firstPwd = $("#pwd").val(); 
       secondPwd = $("#confirmPwd").val();
       
	   $('#registerForm').find('input[type!="hidden"]').each(function(){
	       if(!$(this).val()) {
	    	   isEmpty = true;
	       }
	   });
	   if(isEmpty) {
	       alert('값을 전부 입력하세요!');
	   } else if (!isAllowed) {
		   alert('이메일 중복여부를 확인하세요!');
	   } else if (firstPwd != secondPwd) {
		   alert('비밀번호를 확인하세요!');
	   } else {
		   $("#registerForm").submit();		   
	   }
   });
</script>

<jsp:include page="../common/footer.jsp" />