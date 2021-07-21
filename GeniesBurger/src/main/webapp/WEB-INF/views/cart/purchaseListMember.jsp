<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col" style="margin-bottom: 10px;">
				<form action="/cart/purchaseListMember?mno=${ses.mno }" class="form-inline justify-content-end">
				<p style="font-size:2em; margin-right:450px;">나의 주문목록</p>
					<select class="form-control" name="range">
						<option value="en"
							<c:out value="${pghdlM.mpgvo.range eq 'en' ? 'selected' : '' }"/>>이메일+이름</option>
						<option value="e"
							<c:out value="${pghdlM.mpgvo.range eq 'e' ? 'selected' : '' }"/>>이메일</option>
						<option value="n"
							<c:out value="${pghdlM.mpgvo.range eq 'n' ? 'selected' : '' }"/>>이름</option>
						<option value="t"
							<c:out value="${pghdlM.mpgvo.range eq 't' ? 'selected' : '' }"/>>상품명</option>
						<option value="p"
							<c:out value="${pghdlM.mpgvo.range eq 'p' ? 'selected' : '' }"/>>가격</option>
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
								<th>name</th>
								<th>title</th>
								<th>price</th>
								<th>quantity</th>
								<th>regdate</th>
								<th>리뷰</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${purchaseListMember }" var="purchaseListMember">
								<input type="hidden" value="${purchaseListMember.pno }">
								<input type="hidden" value="${purchaseListMember.purno }">
								<tr class="text-center">
									<td>${purchaseListMember.name }</td>
									<td>${purchaseListMember.title }</td>
									<td>${purchaseListMember.price }</td>
									<td>${purchaseListMember.quantity }</td>
									<td>${purchaseListMember.regdate }</td>
									<c:choose>
										<c:when test="${purchaseListMember.rlist.size() == 0} ">
											<td><button type="button" class="revBtn btn btn-success">리뷰작성</button></td>
										</c:when>
										<c:otherwise>
											<td>리뷰 작성 완료</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
					</table>
				</div>
				<jsp:include page="pagingMember.jsp" />
			</div>
		</div>
	</div>
</section>

<script>
$(document).on("click",".revBtn",function(){
	let pno = $(this).closest("tr").prev("input").prev("input").val();
	let purno = $(this).closest("tr").prev("input").val();
	localStorage.setItem("pno", pno);
	localStorage.setItem("purno", purno);
	location.href="/review/register";
});
</script>

<jsp:include page="../common/footer.jsp" />