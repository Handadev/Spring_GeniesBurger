<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<a href="/review/register" class="row rounded-circle bg-success text-white" style="width: 80px; height: 80px;" id="addBtn">
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
				<c:forEach items="${list }" var="rvo">
					<input type="hidden" class="rnoVal" id="rno" value="${rvo.rno }">
						<tr class="text-center">
							<td><img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}"></td>
							<td>${rvo.rcontent }</td>
						</tr>
						<c:if test="${ses.email == 'admin@admin.com' && rvo.clist.size() == 0}">
							<tr id="adTr">
								<td><input type="text" id="adComment"></td>
								<td><button type="button" id="adBtn" class="adBtn btn btn-success">작성</button></td>
							</tr>
						</c:if>
						<c:if test="${rvo.clist.size() > 0}">
						<tr>
							<td>
								<ul>
								<c:forEach items="${rvo.clist }" var="cvo">
									<li>${cvo.adcomment }</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<button type="button" class="upBtn btn btn-warning">수정</button>
							</td>
						</tr>
						</c:if>
				</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script>

	$(document).on("click",".adBtn", function(){
		let rno = $(this).closest("tr").prev("tr").prev("input").val();
		let adComment = $(this).closest("tr").find("input").val();
		console.log(rno);
		console.log(adComment);
	 	$.ajax({
			url: "/review/addAdComment",
			type: "post",
			data: {rno:rno,adComment:adComment}
		}).done(function(result){
			if(result == 1){
				alert("댓글이  입력되었습니다.");
				location.reload();
			} else{
				alert("댓글 입력이 실패 하였습니다.")
			}
		});
	});
	
	$(document).on("click",".upBtn",function(){
		let comment = $(this).closest("tr").find("li").text();
		$(this).closest("tr").find("td").eq("0").html("<input type='text' value='"+comment+"'>");
		$(this).closest("tr").find("td").eq("1").html("<button type='button' class='clearUp btn btn-success'>수정완료</button>")
	});
	
	$(document).on("click",".clearUp",function(){
		let rno = $(this).closest("tr").prev("tr").prev("input").val();
		let adComment = $(this).closest("tr").find("input").val();
		$.ajax({
			url : "/review/acUpdate",
			type : "post",
			data : {rno:rno,adComment:adComment}
		}).done(function(result){
			if(result=="1"){
				alert("수정완료 ㅎㅎ ");
				location.reload();
			} else {
				alert("수정 실패 ㅜㅠㅜ");
			}
		});
		});
</script>
<jsp:include page="../common/footer.jsp" />
