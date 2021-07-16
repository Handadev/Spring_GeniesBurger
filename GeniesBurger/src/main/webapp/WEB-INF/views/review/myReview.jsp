<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
img{
	border-radius: 10px;
	margin-right: 20px;
}
.card{
	padding: 20px 20px 20px 20px;
	background-color: #f5f5f5;
	margin-bottom: 40px;
	border-radius: 10px;
	
}
#adComment {
	background-color: white;
	border-radius: 10px;
	height: 100px;
}

#modalBtn:focus {
	border: none;
	outline: none;
}

#modalBtn {
	position: fixed;
	bottom: 5%;
	right: 5%;
	z-index: 1;
	width: 80px;
	height: 80px;
	background-image: url("/resources/images/review-1.png");
	background-size: auto;
	background-position: center center;
}
</style>
<div class="container">
	<div>리뷰!</div>
	<button type="button" id="modalBtn" class="btn rounded-circle" data-toggle="modal" data-target="#myModal"></button>
<!-- 모달 영역!! -->
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered ">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">리뷰 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="container h-100">
					<div class="modal-body row justify-content-center">
						<form action="/review/register" method="post" enctype="multipart/form-data" id="regForm">
							<input type="hidden" name="email" id="email" value="${ses.email }">
							<input type="hidden" name="pno" value="1">
							<div class="form-group">
								<input type="text" class="form-control" id="content" name="rcontent" style="width: 200pt" placeholder="리뷰 내용을 작성 해주세요.">
							</div>
							
							<div class="form-group">
								<input type="file" class="form-control" id="files" name="files"	style="display: none;">
								<button type="button" class="btn btn-outline-info btn-block" id="fileTrigger" style="width: 200pt">사진업로드</button>
							</div>

							<div class="form-group">
								<ul class="list-group" id="fileZone"></ul>
							</div>
							
						</form>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="subBtn">리뷰작성</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 모달 영역!! -->
	<c:forEach items="${list }" var="rvo">
		<div class="card shadow radius">
			<div class="media">
				<a class="align-self-center" href="#">
				<c:if test="${rvo.rftype eq 1 }">
					<img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}">
				</c:if>
				</a>
				<div class="media-body">
					<h4 class="media-heading">${rvo.email }</h4>
					<div id="adComment">&nbsp;&nbsp; ${rvo.rcontent }</div>
						<span>${rvo.rdate } </span>
					<c:if test="${rvo.clist.size() > 0}">
						<c:forEach items="${rvo.clist }" var="cvo">
							<div id="adComment">&nbsp;&nbsp;<b>점장님 댓글!</b>
							<br>
							<br>
							&nbsp;&nbsp;${cvo.adcomment }
							</div>
							<span><i class="glyphicon glyphicon-calendar"></i>${cvo.addate }</span>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	<jsp:include page="myReviewFooter.jsp"></jsp:include>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script>
$(document).on("click", "#fileTrigger", function() {
	$("#files").click();
});

$(document).on("click","#subBtn", function(){
	let email = $("#email").val();
	console.log(email);
	let title = $("#title").val();
	let content = $("#content").val();
	if(email==''){
		alert("로그인을 해주세요");
		if(title=='') {
			alert("내용을 입력해주세요");
		}
	} else{
		$("#regForm").submit();
	}
});

let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
let maxSize = 1048576; // 1MB

function fileValidation(fname, fsize){
	if(regExp.test(fname)){
		alert(fname + "는 허용되지 않는 파일 형식입니다!");
		return false;
	}else if(fsize > maxSize){
		alert("1MB 이하의 파일만 허용됩니다!");
		return false;
	}else{
		return true;
	}
	
}
$(document).on("change", "#files", function() {
	$("button[type=submit]").attr("disabled", false);
	let formObj = $("#files");
	let fileObjs = formObj[0].files;
	let fileZone = $("#fileZone");
	fileZone.html("");
	
	for (let fobj of fileObjs) {
		let li = '<li class="list-group-item d-flex justify-content-between align-items-center">';
		if(fileValidation(fobj.name, fobj.size)){
			// 정상출력
			li += fobj.name + '<span class="badge badge-success badge-pill">';
		}else{
			// 경고출력 후 서브밋 버튼 비활성화
			li += '<i class="fa fa-times-rectangle" style="font-size:24px;color:red"></i>';
			li += fobj.name + '<span class="badge badge-danger badge-pill">';
			$("button[type=submit]").attr("disabled", true);
		}
		li += fobj.size +' Byte</span></li>';
		fileZone.append(li);
	}
});
</script>
<jsp:include page="../common/footer.jsp" />
