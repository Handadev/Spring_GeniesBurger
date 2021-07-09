<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${cpghdl.prev }">
					<li><a
						href="/coupon/list?pageIndex=${cpghdl.firstPageIndex-1 }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}">
							Prev</a></li>
				</c:if>
				<c:forEach begin="${cpghdl.firstPageIndex }"
					end="${cpghdl.lastPageIndex }" var="i">
					<li class="${cpghdl.cpgvo.pageIndex == i ? 'active' : '' }"><a
						href="/coupon/list?pageIndex=${i }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}">
							${i }</a></li>
				</c:forEach>
				<c:if test="${cpghdl.next }">
					<li><a
						href="/coupon/list?pageIndex=${cpghdl.lastPageIndex+1 }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}">
							Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>