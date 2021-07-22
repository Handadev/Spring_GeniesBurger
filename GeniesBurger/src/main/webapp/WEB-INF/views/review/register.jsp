<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<div class="container" style="height: 1000px;" >
	<div class="row justify-content-center">
		<form action="/review/register" method="post" enctype="multipart/form-data" id="regForm">
			<input type="hidden" name="pno" value=""> 
			<input type="hidden" name="purno" value=""> <input type="hidden" name="email" value="${ses.email }">
			
			<div class="form-group">
				<textarea class="form-control" id="content" name="rcontent" style="width: 400px; margin-top:30px; resize: none; " placeholder="내용을 입력해주세요" rows="5"></textarea>
			</div>

			<div class="form-group">
				<input type="file" class="form-control" id="files" name="files"	style="display: none;">
				<button type="button" class="btn-sm btn-info btn-block" id="fileTrigger" style="width: 400px;">사진업로드</button>
				<ul class="list-group" id="fileZone"></ul>
			</div>
			<div class="form-group">
			</div>
			<button type="button" class="btn-sm btn-danger" id="subBtn" style="width:400px;">리뷰작성</button>
		</form>
	</div>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script>
$(document).on("click", "#fileTrigger", function() {
	$("#files").click();
});
$(document).on("click","#subBtn", function(){
	let title = $("#title").val();
	let content = $("#content").val();
	if(title==''||content==''){
		alert("내용을 입력하세요~");
	} else{
		let pno = localStorage.getItem('pno');
		let purno = localStorage.getItem('purno');
		$("input[name=pno]").val(pno);
		$("input[name=purno]").val(purno);
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
