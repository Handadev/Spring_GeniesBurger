<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${pghdl.prev }">
					<li><a
						href="/coupon/list?pageIndex=${pghdl.firstPageIndex-1 }&countPerPage=${pghdl.cpgvo.countPerPage}&range=${pghdl.cpgvo.range}&keyword=${pghdl.cpgvo.keyword}">
							Prev</a></li>
				</c:if>
				<c:forEach begin="${pghdl.firstPageIndex }"
					end="${pghdl.lastPageIndex }" var="i">
					<li class="${pghdl.cpgvo.pageIndex == i ? 'active' : '' }"><a
						href="/coupon/list?pageIndex=${i }&countPerPage=${pghdl.cpgvo.countPerPage}&range=${pghdl.cpgvo.range}&keyword=${pghdl.cpgvo.keyword}">
							${i }</a></li>
				</c:forEach>
				<c:if test="${pghdl.next }">
					<li><a
						href="/coupon/list?pageIndex=${pghdl.lastPageIndex+1 }&countPerPage=${pghdl.cpgvo.countPerPage}&range=${pghdl.cpgvo.range}&keyword=${pghdl.cpgvo.keyword}">
							Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>