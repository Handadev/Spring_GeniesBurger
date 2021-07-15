<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col" style="margin-bottom: 10px;">
				<form action="/member/list" class="form-inline justify-content-end">
				<p style="font-size:2em; margin-right:450px;">TOTAL PUCHASE PAGE</p>
					<select class="form-control" name="range">
						<option value="en"
							<c:out value="${pghdl.mpgvo.range eq 'en' ? 'selected' : '' }"/>>Email+Name</option>
						<option value="e"
							<c:out value="${pghdl.mpgvo.range eq 'e' ? 'selected' : '' }"/>>Email</option>
						<option value="n"
							<c:out value="${pghdl.mpgvo.range eq 'n' ? 'selected' : '' }"/>>Name</option>
						<option value="m"
							<c:out value="${pghdl.mpgvo.range eq 'm' ? 'selected' : '' }"/>>Mobile</option>
						<option value="a"
							<c:out value="${pghdl.mpgvo.range eq 'a' ? 'selected' : '' }"/>>Address</option>
					</select>&nbsp;&nbsp;<input class="form-control" type="text"
						placeholder="검색어 입력" name="keyword"
						value="${pghdl.mpgvo.keyword }"> &nbsp;&nbsp;
					<button type="submit" class="btn-sm btn-danger detailBtn">검색</button>
				</form>
			</div>
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>Number</th>
								<th>Email</th>
								<th>Name</th>
								<th>Mobile</th>
								<th>Address</th>
								<th>Birthday</th>
								<th>Point</th>
								<th>
								<th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mList }" var="mList">
								<tr class="text-center">
									<td>${mList.mno }</td>
									<td>${mList.email }</td>
									<td>${mList.name }</td>
									<td>${mList.mobile }</td>
									<td>${mList.address }</td>
									<td>${mList.birthday }</td>
									<td>${mList.point }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
					</table>
				</div>
				<jsp:include page="paging.jsp" />
			</div>
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />