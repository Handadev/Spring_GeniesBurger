<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
	<div class="container">
	<h2 class="float-left">재고 주문 내역</h2>
		<a href="/stockOrder/register" class="btn btn-primary float-right">주문하기</a>
	<div class="form-group float-left ml-3">
		<form action="/stockOrder/list" class="form-inline">
			<select class="form-control" name="range">
				<option value="all" <c:out value="${spghdl.cpgvo.range eq 'nd' ? 'selected' : '' }"/>>
				전체</option>
				<option value="no" <c:out value="${spghdl.cpgvo.range eq 'no' ? 'selected' : '' }"/>>
				주문 번호</option>
				<option value="na" <c:out value="${spghdl.cpgvo.range eq 'na' ? 'selected' : '' }"/>>
				재고명</option>
				<option value="q" <c:out value="${spghdl.cpgvo.range eq 'q' ? 'selected' : '' }"/>>
				주문 수량</option>
				<option value="d" <c:out value="${spghdl.cpgvo.range eq 'd' ? 'selected' : '' }"/>>
				주문일</option>
			</select>
			<input class="form-control" type="text" placeholder="검색어 입력" name="keyword"
			value='<c:out value="${spghdl.cpgvo.keyword }"/>'>
			<button type="submit" class="btn btn-success ml-3">검색</button>
		</form>
	</div> 
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>주문 번호</th>
	        <th>재고명</th>
	        <th>주문 수량</th>
	        <th>주문일</th>
	      </tr>
	    </thead>
	    <c:choose>
	    	<c:when test="${list.size() ne 0 }">
	    		<tbody>
	  		 	 <c:forEach items="${list }" var="sovo">
	    		  <tr>
	     		   <td>${sovo.ono }</td>
	     		   <td>${sovo.sname }</td>
	     		   <td>${sovo.order_qty }</td>
	     		   <td>${sovo.order_date }</td>
	    		  </tr>
	    	 	 </c:forEach>
	   		 	</tbody>
	   		 	<tfoot>
    			<tr>
    				<td	colspan="4">
    					<jsp:include page="paging.jsp"/>
    				</td>
    			</tr>
    		</tfoot>
	    	</c:when>
	    	<c:otherwise>
	    		<tbody>
	    			<tr>
	    				<td colspan="4" class="text-center">
	    					<h3>주문된 재고가 없습니다.</h3>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</c:otherwise>
	    </c:choose>
	  </table>
  </div>
<jsp:include page="../adminCommon/footer.jsp" />
