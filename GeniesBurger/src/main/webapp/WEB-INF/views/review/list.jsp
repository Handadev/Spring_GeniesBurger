<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
#addBtn {
	position: fixed;
	top: 5%;
	right: 5%;
	z-index: 1;
}
</style>

<div class="container">
	<a href="/review/register"
		class="row rounded-circle bg-success text-white"
		style="width: 80px; height: 80px;" id="addBtn">
		<div class="col align-self-center text-center"><b style="size:20px">+</b></div>
	</a>
	<div class="col-md-12 ftco-animate">
		<div class="cart-list">
			<table class="table">
				<thead class="thead-primary">
					<tr class="text-center">
						<th>사진</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="rvo">
						<tr class="text-center">
							<td>
							<img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}">
							</td>
							<td>${rvo.rcontent }</td>
						</tr>
					</c:forEach>
					<!-- END TR-->
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />
