<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<style>
   #email, #pwd{
      border:none;
   }
</style>

<div class="container">
   <h2>WHERE TASTE IS KING</h2>
   <h2>어서오세요! 지니스버거 입니다.</h2>
   <form action="/member/login" method="post">
      <div class="form-group">
         <input type="email" class="form-control" placeholder="아이디(이메일)" id="email" name="email" value="tester1@tester.com"> 
         <input type="password" class="form-control" placeholder="비밀번호" id="pwd" name="pwd" value="1111">
      </div>
         <button type="submit" class="btn btn-danger" style="border-radius: 5px;">로그인</button>
         <button type="submit" class="btn btn-black" style="border-radius: 5px;">회원가입</button>
   </form>
</div>

<jsp:include page="../common/footer.jsp" />