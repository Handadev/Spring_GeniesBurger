<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/header.jsp" />
	<div class="container">
	<h2 class="float-left">발급된 쿠폰 리스트</h2>
		<a href="/coupon/list" class="btn btn-primary float-right ml-3">쿠폰 목록</a>
		<a href="/coupon/issue" class="btn btn-primary float-right">쿠폰 발급</a>
	  <table class="table table-hover">
	    <thead>
	      <tr>
	      	<th>발급 번호</th>
	        <th>쿠폰 번호</th>
	        <th>쿠폰 이름</th>
	        <th>멤버 번호</th>
	        <th>이메일</th>
	        <th>발급 취소</th>
	      </tr>
	    </thead>
	    <c:choose>
	    	<c:when test="${issueList.size() ne 0 }">
	    		<tbody>
	  		 	 <c:forEach items="${issueList }" var="cplvo">
	    		  <tr>
	     		   <td>${cplvo.cplno }</td>
	     		   <td>${cplvo.cpno }</td>
	     		   <td>${cplvo.cpname }</td>
	     		   <td>${cplvo.mno }</td>
	     		   <td>${cplvo.email }</td>
	     		   <td>
	     		   <button type="button" id="cancelBtn" data-cplno="${cplvo.cplno }" class="btn btn-primary">취소</button>
	     		   <%-- <form action="/coupon/cancel" id="cancelForm" method="post">
							<input type="hidden" name="cplno" value="${cplvo.cplno }">
						</form> 
						<script src="/resources/js/jquery.min.js"></script>
						<script>
							$("#cancelBtn").on("click", function() {
								$("#cancelForm").submit();
							});
						</script> --%>
	     		   </td>
	    		  </tr>
	    		  </c:forEach>
	   		 	</tbody>
	    	</c:when>
	    	<c:otherwise>
	    		<tbody>
	    			<tr>
	    				<td colspan="5" class="text-center">
	    					<h3>발급한 쿠폰이 없습니다.</h3>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</c:otherwise>
	    </c:choose>
	  </table>
  </div>
  <script src="/resources/js/jquery.min.js"></script>
  <script>
 	 function coupon_cancel(cplno){
		$.ajax({
			url: "/coupon/" + cplno,
			type: "delete"
		}).done(function(result) {
			alert("발급 취소 성공!");
			location.reload();
		}).fail(function(err) {
			alert("발급 취소 실패...");
			 console.log(err);
		});
	 }
 	 $(document).on("click", "#cancelBtn", function() {
		let cplno_val = $(this).data("cplno"); 
		console.log(cplno_val)
		coupon_cancel(cplno_val);
	 });
  </script>
<jsp:include page="../common/footer.jsp" />
