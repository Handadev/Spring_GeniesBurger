<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp" />
<style>
.form-control {
	width: 80%;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	width: 100%;
}

.product-text {
	padding-top: 30px;
}

#title, #price {
	font-size: 25px;
}

#title, #content {
	color: black;
}

#content {
	font-size: 20px;
}

#price {
	color: red;
}
#indexSearch{
	margin-top:5px;
	margin-right:25px;
}
</style>

<!-- 메뉴 상단이미지 삭제 -->
<section class="ftco-section">
	<div class="container">
		<!-- 상품 분류 선택 -->
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center float-left">
				<strong style="font-size:2em;">메뉴선택</strong>
				<ul class="product-category" style="margin-top:30px;">
					<li>
					<li><a href="/"
						class="total">전체</a></li>
					<li><a href="/?range=category&keyword=1"
						class="burger">버거</a></li>
					<li><a href="/?range=category&keyword=2"
						class="set">버거세트</a></li>
					<li><a href="/?range=category&keyword=4"
						class="allday">올데이킹</a></li>
					<li><a href="/?range=category&keyword=7"
						class="side">사이드</a></li>
					<li><a href="/?range=category&keyword=8"
						class="beverage">음료</a></li>
				</ul>
				<form action="/">
					<input type="hidden" name="range" value="pro"> <input
						class="form-control  float-left" type="text" placeholder="찾으시는 제품명을 입력하세요"
						name="keyword">
					<button type="submit" class="btn btn-danger" id="indexSearch">검색</button>
				</form>
			</div>
		</div>

		<!-- 상품 분류 선택 끝-->
		<!-- 상품 전체 -->
		<div class="row">
			<!-- 상품 프레임 -->
			<c:choose>
				<c:when test="${product_list.size() ne 0 }">
					<c:forEach items="${product_list }" var="pvo">
						<div class="col-md-6 col-lg-3 ftco-animate">
							<div class="product" data-toggle="modal" data-target="#sigle_set_modal" id="product" data-pno="${pvo.pno }" data-category="${pvo.category }">
								<img class="img-fluid"
									src="/resources/images/product-1.jpg" alt="Colorlib Template" />
									<!-- 할인 혹은 new 혹은 best 들어가는 공간  <span class="status">할인/new/best</span> -->
									<div class="overlay"></div> 
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										${pvo.title }
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<!-- <span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span> -->
												<span class="mr-2 price">${pvo.price }</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

			<!-- 상품 프레임 끝 -->
		</div>
		<!-- 상품 전체 끝 -->
		<!-- 상품 페이저 -->
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:if test="${product_paging.prev }">
							<li><a
								href="/?pageIndex=${product_paging.firstPageIndex-1 }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									&lt;</a></li>
						</c:if>
						<c:forEach begin="${product_paging.firstPageIndex }"
							end="${product_paging.lastPageIndex }" var="i">
							<li
								class="${product_paging.pcpgvo.pageIndex == i ? 'active' : '' }">
								<a
								href="/?pageIndex=${i }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									${i }</a>
							</li>
						</c:forEach>
						<c:if test="${product_paging.next }">
							<li><a
								href="/?pageIndex=${product_paging.lastPageIndex+1 }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									&gt;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<!--1번 모달 상품 누르면 단품 / 세트 / L 세트 선택 화면이 나옴 -->
<div class="modal modal-center fade" id="sigle_set_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">메뉴 선택</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="menuZone">
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!--1번 모달 끝 -->


<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	let keyword_val = '<c:out value="${product_paging.pcpgvo.keyword}"/>';
	console.log(keyword_val + " = keyword");
	switch (keyword_val) {
		case "":
			$(".total").addClass("active");
			break;
		case "1":
			$(".burger").addClass("active");
			break;
		case "2":
			$(".set").addClass("active");
			break;
		case "4":
			$(".allday").addClass("active");
			break;
		case "7":
			$(".side").addClass("active");
			break;
		case "8":
			$(".beverage").addClass("active");
			break;
	}
	
	$(document).on("click", ".product", function() {
		let pno_val = $(this).data("pno");
		let category_val = $(this).data("category");
		get_menu(pno_val, category_val);
	});
	function get_menu(pno, category) {
		$.getJSON("/select/"+pno+"/"+category+".json", function(result) {
			console.log(result);
			menu_list(result);
		}).fail(function(err){
			console.log(err);
		});
	}
	function menu_list(list) {
		let menuZone = $("#menuZone");
		menuZone.html("");
		let html = '';
		
		for (let pfdto of list) {
			html += '<div class="row">';
			html += '<div class="col-sm product-text">';
			html += '<span id="title">'+pfdto.title+'</span><br>';
			html += '<span id="content">'+pfdto.content+'</span><br>';
			html += '<span id="price">'+pfdto.price+'</span><br>';
			html += '</div>';
			html += '<div class="col-sm">';
			html += '<img class="img-fluid" src="/upload/'+pfdto.savedir+'/'+pfdto.puuid+'_th_'+pfdto.fname+'"';
			html += 'alt="Colorlib Template" width="250px" />';
			html += '</div></div>';
		}
		 menuZone.append(html); 
	}
	
</script>
	

<jsp:include page="common/footer.jsp" />