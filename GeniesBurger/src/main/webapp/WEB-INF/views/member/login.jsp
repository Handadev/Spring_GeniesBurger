<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
#email, #pwd {
   margin: auto;
   border: none;
   border-bottom: 1px solid #e31212;
   width: 40%;
   margin-top: 20px;
   background-image: url(/resources/icons/line.png);
   background-repeat: no-repeat;
   background-size: cover;
}

.container-login {
   margin-top: 30px;
   text-align: center;
}

p {
   color: black;
}
</style>

<div class="container container-login">
   <p style="color: #e31212; font-size: 3em">WHERE TASTE IS KING</p>
   <p style="font-size: 2em">어서오세요! 지니스버거 입니다.</p>
   <form action="/member/login" method="post">
      <div class="form-group">
         <input type="email" class="form-control" placeholder="아이디(이메일)"
            id="email" name="email" value="tester1@tester.com"> <input
            type="password" class="form-control" placeholder="비밀번호" id="pwd"
            name="pwd" value="1111">
      </div>
      <button type="submit" class="btn-lg btn-danger">로그인</button>
      <!-- <button type="button" class="btn-lg btn-black">회원가입</button> -->
      <a href="/member/register">
         <button type="button" class="btn-lg btn-info">회원가입</button>
      </a>
   </form>
</div>

<jsp:include page="../common/footer.jsp" />