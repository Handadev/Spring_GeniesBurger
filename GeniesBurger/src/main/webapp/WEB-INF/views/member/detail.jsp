<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<div class="container p-3 my-3 border" style="text-align: center;">
  <h1><b>${ses.name }님!</b> 반갑습니다</h1>
  <p><a href="/member/modify?mno=${ses.mno }">정보변경 ></a></p>
  <h3>나의 쿠폰 : 0장</h3>
<h3>나의 스탬프 : 0장</h3>
</div>

<jsp:include page="../common/footer.jsp" />