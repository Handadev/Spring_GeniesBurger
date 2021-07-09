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
		<div class="col align-self-center text-center"></div>
	</a>
	<div class="col-md-12 ftco-animate">
		<div class="cart-list">
			<table class="table">
				<thead class="thead-primary" style="width:100%;">
					<tr class="text-center">
						<th colspan=2>리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ses.email eq 'admin@admin.com' }">
							<c:forEach items="${list }" var="rvo">
								<tr class="text-center">
									<td class="col-3"><img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}"></td>
									<td class="col-7">${rvo.rcontent }</td>
									<td>${rvo.rno }</td>
								</tr>
								<tr>
									<td colspan=2>사장 댓글</td>
								</tr>
								<tr>
									<td><input type="text" id="adContent" class="form-control-sm adContent"></td>
									<td><button type="button" class="adBtn btn btn-primary">작성</button></td>
								</tr>
								<tr>
								<td id="recomment" colspan=2></td>
								</tr>
							</c:forEach>
						</c:when>
					<c:otherwise>
					<c:forEach items="${clist }" var="advo">
						<c:forEach items="${list }" var="rvo">
						<input type="hidden" class="rnoVal" name="rno" value="${rvo.rno }">
							<tr class="text-center">
								<td><img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}"></td>
								<td></td>
								<td>${rvo.rcontent }</td>
							</tr>
							<tr>
								<td colspan=2>사장 댓글</td>
							</tr>
							<tr>
								<td id="recomment" colspan=2>
									<c:if test="${rvo.rno eq advo.rno }">${advo.adcomment }</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					<!-- END TR-->
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script>
	$(document).on("click",".adBtn", function(){
		let adContent = $("#adContent").val();
		console.log(adContent);
		$("#recomment").html("<td>"+adContent+"</td>");
		
	});
</script>
<jsp:include page="../common/footer.jsp" />
