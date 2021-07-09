<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
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
									<td>
										<button type="button"
											class="btn btn-outline-light outline btn-lg removeBtn"
											data-mno="${mList.mno }">삭제</button>
									</td>
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
<form action="/member/remove" method="post" id="removeForm">
	<input type="hidden" name="mno">
</form>
<script>
	$(document).on("click", ".removeBtn", function(e) {
		e.preventDefault();
		let mno_val = $(this).data("mno");
		console.log("mno_val : " + mno_val);
		$("input[name=mno]").val(mno_val);
		$("#removeForm").submit();
	});
</script>

<jsp:include page="../common/footer.jsp" />