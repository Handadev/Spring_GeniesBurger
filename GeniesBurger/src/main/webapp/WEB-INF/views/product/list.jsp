<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<style>
.pcontainer {
	padding-top : 50px;
	padding-bottom : 50px;
}
</style>
<div class="container-fluid border pcontainer">
	<div class="container col-sm-9">
	<h2>상품 목록</h2>
	<table class="table">
	<thead>
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>가격</th>
			<th>판매량</th>
			<th>판매중여부</th>
			<th>등록일</th>
			<th>수정일</th>
			<th>기능</th>
		</tr>
	</thead>
	<c:choose>
		<c:when test="${product_list.size() ne 0 }">
			<tbody>
				<c:forEach items="${product_list }" var="pvo">
					<tr>
						<td>${pvo.pno }</td>
						<td><a href="/product/detail?pno=${pvo.pno }">${pvo.title }</a></td>
						<td>${pvo.price }</td>
						<td>${pvo.sales }</td>
						<td>
						<c:choose>
							<c:when test="${pvo.cansale eq 0}">
								<span>판매중</span>
							</c:when>
							<c:otherwise>
								<span>일시품절</span>
							</c:otherwise>
						</c:choose>
						</td>
						<td>${pvo.regdate }</td>
						<td>${pvo.moddate }</td>
						<td><a href="/product/modify?pno=${pvo.pno }" class="btn btn-warning">상품수정</a>
						<button type="button" class="btn btn-danger del-btn">상품삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
			
				</tr>
			</tfoot>
		</c:when>
		<c:otherwise>
			<tbody>
				<tr>
					<th colspan="8" class="text-center">
						<h2>등록된 상품이 없습니다! 상품을 등록하세요</h2>
						<a href="/product/register" class="btn btn-primary">상품등록</a>
					</th>
				</tr>
			</tbody>
		</c:otherwise>
	</c:choose>
	</div>
</div>

</table>
<form action="/product/remove" method="post" id="rmForm">
<input type="hidden" name="pno">
</form>
<script>
	$(document).on("click", ".del-btn", function (e) {
		e.preventDefault();
		let pno_num = $(this).closest("tr").find("td").eq(0).text();
		$("input[name=pno]").val(pno_num);
		$("#rmForm").submit();
	});
</script>

<jsp:include page="../common/footer.jsp" />