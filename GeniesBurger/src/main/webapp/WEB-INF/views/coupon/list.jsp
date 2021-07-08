<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/header.jsp" />
	<div class="container">
	<h2 class="float-left">쿠폰 리스트</h2>
		<a href="/coupon/issueList" class="btn btn-primary float-right ml-3">발급 현황</a>
		<a href="/coupon/register" class="btn btn-primary float-right">쿠폰 등록</a>
		<div class="form-group float-left ml-3">
	<form action="/coupon/list" class="form-inline">
		<select class="form-control" name="range">
			<option value="ned" <c:out value="${pghdl.cpgvo.range eq 'ned' ? 'selected' : '' }"/>>
			전체</option>
			<option value="no" <c:out value="${pghdl.cpgvo.range eq 'no' ? 'selected' : '' }"/>>
			번호</option>
			<option value="na" <c:out value="${pghdl.cpgvo.range eq 'na' ? 'selected' : '' }"/>>
			이름</option>
			<option value="e" <c:out value="${pghdl.cpgvo.range eq 'e' ? 'selected' : '' }"/>>
			유효기간</option>
			<option value="d" <c:out value="${pghdl.cpgvo.range eq 'd' ? 'selected' : '' }"/>>
			할인율</option>
		</select>
		<input class="form-control" type="text" placeholder="검색어 입력" name="keyword"
		value='<c:out value="${pghdl.cpgvo.keyword }"/>'>
		<button type="submit" class="btn btn-success ml-3">검색</button>
	</form>
</div>
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>쿠폰 번호</th>
	        <th>쿠폰 이름</th>
	        <th>쿠폰 유효기간</th>
	        <th>할인율(%)</th>
	      </tr>
	    </thead>
	    <c:choose>
	    	<c:when test="${list.size() ne 0 }">
	    		<tbody>
	  		 	 <c:forEach items="${list }" var="cpvo">
	  		 	 <c:set var="enddate" value="${cpvo.enddate }"></c:set>
	    		  <tr>
	     		   <td>${cpvo.cpno }</td>
	     		   <td><a href="/coupon/detail?cpno=${cpvo.cpno }">${cpvo.cpname }</a></td>
	     		   <td>${fn:substring(enddate,-1, 11)}</td>
	     		   <td>${cpvo.discount }%</td>
	    		  </tr>
	    	 	 </c:forEach>
	   		 	</tbody>
	   		 	<tfoot>
    			<tr>
    				<td	colspan="4">
    					<jsp:include page="../common/CpPaging.jsp"/>
    				</td>
    			</tr>
    		</tfoot>
	    	</c:when>
	    	<c:otherwise>
	    		<tbody>
	    			<tr>
	    				<td colspan="4" class="text-center">
	    					<h3>등록된 쿠폰이 없습니다.</h3>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</c:otherwise>
	    </c:choose>
	  </table>
  </div>
<jsp:include page="../common/footer.jsp" />
