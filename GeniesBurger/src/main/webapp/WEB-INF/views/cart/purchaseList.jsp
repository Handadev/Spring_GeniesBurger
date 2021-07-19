<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col" style="margin-bottom: 10px;">
				<form action="/cart/purchaseList" class="form-inline justify-content-end">
				<p style="font-size:2em; margin-right:450px;">TOTAL PUCHASE PAGE</p>
					<select class="form-control" name="range">
						<option value="en"
							<c:out value="${pghdl.mpgvo.range eq 'en' ? 'selected' : '' }"/>>이메일+이름</option>
						<option value="e"
							<c:out value="${pghdl.mpgvo.range eq 'e' ? 'selected' : '' }"/>>이메일</option>
						<option value="n"
							<c:out value="${pghdl.mpgvo.range eq 'n' ? 'selected' : '' }"/>>이름</option>
						<option value="t"
							<c:out value="${pghdl.mpgvo.range eq 't' ? 'selected' : '' }"/>>상품명</option>
						<option value="p"
							<c:out value="${pghdl.mpgvo.range eq 'p' ? 'selected' : '' }"/>>가격</option>
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
								<th>mno</th>
								<th>name</th>
								<th>title</th>
								<th>price</th>
								<th>quantity</th>
								<th>regdate</th>
								<th>
								<th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${purchaseList }" var="purchaseList">
								<tr class="text-center">
									<td>${purchaseList.purno }</td>
									<td>${purchaseList.mno }</td>
									<td>${purchaseList.name }</td>
									<td>${purchaseList.title }</td>
									<td>${purchaseList.price }</td>
									<td>${purchaseList.quantity }</td>
									<td>${purchaseList.regdate }</td>
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