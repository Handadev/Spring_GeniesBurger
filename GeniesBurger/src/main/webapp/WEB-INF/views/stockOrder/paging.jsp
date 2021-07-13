<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul style="list-style-type: none; ">
				<c:if test="${spghdl.prev }">
					<li style="float: left; "><a
						href="/stockOrder/list?pageIndex=${spghdl.firstPageIndex-1 }&countPerPage=${spghdl.cpgvo.countPerPage}&range=${spghdl.cpgvo.range}&keyword=${spghdl.cpgvo.keyword}"
						style="margin-left: 10px; ">
							&#60;</a></li>
				</c:if>
				<c:forEach begin="${spghdl.firstPageIndex }"
					end="${spghdl.lastPageIndex }" var="i">
					<li style="float: left; " class="${spghdl.cpgvo.pageIndex == i ? 'active' : '' }" ><a
						href="/stockOrder/list?pageIndex=${i }&countPerPage=${spghdl.cpgvo.countPerPage}&range=${spghdl.cpgvo.range}&keyword=${spghdl.cpgvo.keyword}"
						style="margin-left: 10px; ">
							${i }</a></li>
				</c:forEach>
				<c:if test="${spghdl.next }">
					<li style="float: left; "><a
						href="/stockOrder/list?pageIndex=${spghdl.lastPageIndex+1 }&countPerPage=${spghdl.cpgvo.countPerPage}&range=${spghdl.cpgvo.range}&keyword=${spghdl.cpgvo.keyword}"
						style="margin-left: 10px; ">
							&#62;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>