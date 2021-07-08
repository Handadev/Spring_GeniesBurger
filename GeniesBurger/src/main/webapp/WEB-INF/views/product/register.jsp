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
	<div class="container col-sm-4">
		<h2>상품 등록</h2>
		<form class="" action="/product/register" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="title">Category:</label> <select name="category"
					class="form-control">
					<option value="">상품 품목선택</option>
					<option value="1">버거</option>
					<option value="2">버거 세트</option>
					<option value="3">버거 라지 세트</option>
					<option value="4">올데이할인 버거</option>
					<option value="5">올데이할인 버거 세트</option>
					<option value="6">올데이할인 버거 라지 세트</option>
					<option value="7">사이드</option>
					<option value="8">음료</option>
				</select>
			</div>

			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title">
			</div>

			<div class="form-group">
				<label for="content">Content:</label> <input type="text"
					class="form-control" id="content" placeholder="Enter content"
					name="content">
			</div>

			<div class="form-group">
				<label for="price">Price:</label> <input type="number"
					class="form-control" id="price" placeholder="Enter price"
					name="price">
			</div>

			<div class="form-group">
				<label for="price">Calorie:</label> <input type="number"
					class="form-control" id="price" placeholder="Enter calorie"
					name="calorie">
			</div>


			<div class="form-group">
				<label for="price">Files:</label> <input type="file"
					class="form-control" id="files" name="files" multiple
					style="display: none;">
				<button type="button"
					class="btn btn-outline-info btn-block col-sm-6" id="fileTrigger">사진
					업로드</button>
			</div>
			<div class="form-group">
				<ul class="list-group" id="fileZone"></ul>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).on("click", "#fileTrigger", function() {
		$("#files").click();
	});
	
	let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
	let maxSize = 1048576; //1mb
	function fileValidation(fname, fsize) {
		if (regExp.test(fname)) {
			alert(fname+"는 허용되지 않는 파일형식입니다");
			return false;
		} else if (fsize > maxSize) {
			alert("1mb 파일만 허용됩니다");
			return false;
		} else {
			return true;
		}
	}
	
	/* 실무에서는 유효성 검사까지 해야함 */
	$(document).on("change", "#files", function() {
		$("button[type=submit]").attr("disabled", false);
		let formObj = $("#files");
		let fileObjs = formObj[0].files;
		let fileZone = $("#fileZone");
		fileZone.html("");
		
		for (let fobj of fileObjs) {
			let li = '<li class="list-group-item d-flex justify-content-between align-items-center">';
			if(fileValidation(fobj.name, fobj.size)) {
				li += fobj.name+'<span class="badge badge-success badge-pill">';
			} else {
				li += '<i class="fa fa-times-rectangle" style="font-size:24px;color:red"></i>';
				li += fobj.name+'<span class="badge badge-danger badge-pill">';
				$("button[type=submit]").attr("disabled", true);
			}
				let fileSize = fobj.size / 1024;
				fileSize = parseInt(fileSize);
				li += fileSize.toFixed(2) + 'KB</span></li>';
				fileZone.append(li);
		}
	});
</script>

<jsp:include page="../common/footer.jsp" />