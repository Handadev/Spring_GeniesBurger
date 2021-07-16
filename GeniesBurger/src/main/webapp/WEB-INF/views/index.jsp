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

#menu-strong {
	font-size: 2em;
	color: black;
}

.product-category {
	margin-top: 20px;
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

.menuselect {
	cursor: pointer;
}

.con_modal_footer {
	height: 60px;
}

.row {
	height: 100%;
}

.footer_btn {
	padding-top: 10px;
	cursor: pointer;
}

#button_text {
	color: white;
	font-size: 25px;
	text-align: center;
}

#indexSearch {
	margin-top: 5px;
	margin-right: 25px;
}

.checkbox.row {
	position: relative;
	margin-bottom: 30px;
}

.checkText {
	font-size: 25px;
}

.checkbox input.checkbox{
    font-size: 1em;
    width: 1.5em; /* 너비 설정 */
    height: 1.5em; /* 높이 설정 */
    vertical-align: middle;
}
.checkbox input.checkbox + label{ /* 라벨 텍스트 크기와 수직 정렬 맞춤 */
    font-size: 1.7em;
    vertical-align: middle;
    cursor: pointer;
}

.check_label {
	position: absolute;
    top: -50%;
    left: 7%;
}

</style>

<!-- 메뉴 상단이미지 삭제 -->
<section class="ftco-section">
	<div class="container">
		<!-- 상품 분류 선택 -->
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center float-left">
				<strong id="menu-strong">메뉴</strong>
				<ul class="product-category">
					<li><a href="/" class="total">전체</a></li>
					<li><a href="/?range=category&keyword=1" class="burger">버거</a></li>
					<li><a href="/?range=category&keyword=2" class="set">버거세트</a></li>
					<li><a href="/?range=category&keyword=4" class="allday">올데이킹</a></li>
					<li><a href="/?range=category&keyword=7" class="side">사이드</a></li>
					<li><a href="/?range=category&keyword=8" class="beverage">음료</a></li>
				</ul>
				<form action="/">
					<input type="hidden" name="range" value="pro"> <input
						class="form-control float-left" type="text"
						placeholder="찾으시는 제품명을 입력하세요" name="keyword">
					<button type="submit" class="btn-lg btn-danger"
						style="margin-right: 100px;">검색</button>
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
							<div class="product" data-toggle="modal"
								data-target="#sigle_set_modal" id="product"
								data-pno="${pvo.pno }" data-category="${pvo.category }">
								<img class="img-fluid" src="/resources/images/product-1.jpg"
									alt="Colorlib Template" />
								<!-- 할인 혹은 new 혹은 best 들어가는 공간  <span class="status">할인/new/best</span> -->
								<div class="overlay"></div>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>${pvo.title }</h3>
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

<!-- 1번 모달 상품 누르면 단품 / 세트 / L 세트 선택 화면이 나옴 -->
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
				<div class="container" id="menuZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- 1번 모달 끝 -->

<!-- 2번 모달 단품 / 세트를 누르면 세트 / 라지세트로 선택하겠냐는 모달창 -->
<div class="modal modal-center fade" id="size_up_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">세트 추천</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container text-center" id="suggestZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="suggestZoneFooter"></div>
		</div>
	</div>
</div>
<!-- 2번 모달 끝 -->

<!-- 3번 모달 추가 재료 선택 -->
<div class="modal modal-center fade" id="add_ingredient_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">재료를 추가해 더 맛있게 즐겨보세요!</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="ingredientZone">
					<div class="checkbox row">
					     <input type="checkbox" name="sname" id="check1" value="1" class="checkbox">
    					<label class="check_label" for="check1">큰체크박스</label>
					</div>
					<div class="checkbox row">
					     <input type="checkbox" name="sname" id="check2" value="2" class="checkbox">
    					<label class="check_label" for="check2">큰체크박스2</label>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="ingredientZoneFooter">
			</div>

		</div>
	</div>
</div>
<!-- 3번 모달 끝 -->

<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	/* 카테고리 누르면 active 버튼 색 변함 */
	let keyword_val = '<c:out value="${product_paging.pcpgvo.keyword}"/>';
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
	/* 처음 선택한 pno */
	let pno_val;
	/* 1 상품 div 누르면 모달 뜨면서 단품 - 세트 - 라지세트 등장 */
	$(document).on("click", ".product", function() {
		pno_val = $(this).data("pno");
		let category_val = $(this).data("category");
		get_menu(pno_val, category_val);
	});
	
	function get_menu(pno, category) {
		console.log("1번모달 선택된 pno : "+pno);
		$.getJSON("/select/"+pno+"/"+category+".json", function(result) {
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
			html += '<div class="row menuselect" data-sel_pno="'+pfdto.pno+'" data-sel_category="'+pfdto.category+'">';
			html += '<div class="col-sm product-text">';
			html += '<span id="title">'+pfdto.title+'</span><br>';
			html += '<span id="content">'+pfdto.content+'</span><br>';
			html += '<span id="price">'+pfdto.price+'</span><br>';
			html += '</div>';
			html += '<div class="col-sm">';
			html += '<img class="img-fluid" src="/upload/'+pfdto.savedir+'/'+pfdto.puuid+'_th_'+pfdto.fname+'"';
			html += 'width="250px" />';
			html += '</div></div>';
		}
		 menuZone.append(html); 
	}
	/* 1 모달 끝 */
	
	
	/* 사이즈 업 모달에서 고른 pno */
	let sel_pno_val;
	/* 2 모달 단품 / 세트를 누르면 세트 / 라지세트로 선택하겠냐는 모달*/
	$(document).on("click", ".menuselect", function() {
		sel_pno_val = $(this).data("sel_pno");
		let category_val = $(this).data("sel_category");
		console.log(category_val);
		$("#sigle_set_modal").modal("hide");
		if (category_val == 1 || category_val == 2 || category_val == 4 || category_val == 5) {
			/* 단품, 세트 사이즈업 */
			console.log("category_val1 = "+category_val);
			want_larger_one(sel_pno_val, category_val);
		} else if (category_val == 3 || category_val == 6){
			/* 라지세트 재료추가 */
			console.log("category_val2 = "+category_val);
			add_extra(sel_pno_val);
		} else {
			/*사이드, 음료 누르면 카트에 추가 - 바로 마지막 단계 */
		}
	});
	
	/* 단품, 세트 골랐을 때 사이즈업 */
	function want_larger_one(pno, category) {
		console.log("2번모달 선택된 pno : "+pno);
		$.getJSON("/wantLarger/"+pno+"/"+category+".json", function(result) {
			display_suggest(result, category);
		}).fail(function(err){
			console.log(err);
		});
	}
	function display_suggest(obj, category) {
		$("#size_up_modal").modal("show");
		let suggestZone = $("#suggestZone");
		let suggestZoneFooter = $("#suggestZoneFooter");
		suggestZone.html("");
		suggestZoneFooter.html("");
		let html = '';
		console.log("obj 잘 뽑힘? = "+obj.category);
		 if (obj.category == 3 || obj.category == 5) {
			html += '<span id="price">700원</span>';
			html += '<span id="title">만 추가하시면<br>';
			html += '사이드와 음료를 라지 사이즈로<br>';
			html += '즐기실 수 있어요!<br>';
			html += '업그레이드 하시겠습니까?</span><br>';
			html += '<img class="img-fluid" src="/upload/'+obj.savedir+'/'+obj.puuid+'_th_'+obj.fname+'"';
			html += 'width="350px" /><br>';
			html += '<span id="title">'+obj.title+'<br>'+obj.content+'</span>';
		} else {
			html += '<span id="price">2500원</span>';
			html += '<span id="title">만 추가하시면<br>';
			html += '사이드와 음료를 추가해 세트로<br>';
			html += '즐기실 수 있어요!<br>';
			html += '업그레이드 하시겠습니까?</span><br>';
			html += '<img class="img-fluid" src="/upload/'+obj.savedir+'/'+obj.puuid+'_th_'+obj.fname+'"';
			html += 'width="350px" /><br>';
			html += '<span id="title">'+obj.title+'<br>'+obj.content+'</span>';
		}
		 
		 let fhtml = '';
		 fhtml += '<div class="row">';
		 fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="add_extra('+sel_pno_val+','+category+')">';
		 fhtml += '<span id="button_text">아니오</span></div>';
		 fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_extra('+obj.pno+','+obj.category+')">';
		 fhtml += '<span id="button_text">업그레이드 하기</span></div>';
		 fhtml += '</div>';
		 
		 suggestZone.append(html);
		 suggestZoneFooter.append(fhtml);
	}
	/* 2 모달 끝 */
	
	
	/* 3 모달 - 추가 재료 add_extra() */
	function add_extra(pno, category) {
		console.log("3번모달 선택된 pno : "+pno);
		$("#size_up_modal").modal("hide");
		
		$.getJSON("/getBurgerStock.json", function(result) {
			console.log(result);
			show_ingredient(result, pno, category);
		}).fail(function(err){
			console.log(err);
		});
	}
	function show_ingredient(list, pno, category){
		$("#add_ingredient_modal").modal("show");
		let ingredientZone = $("#ingredientZone");
		let ingredientZoneFooter = $("#ingredientZoneFooter");
		ingredientZone.html("");
		ingredientZoneFooter.html("");
		html = '';
		
		for (let svo of list) {
			html += '<div class="checkbox row">';
			html += '<input type="checkbox" name="sname" id="'+svo.sname+'" value="'+svo.sname+'" class="checkbox">';
			html += '<label class="check_label" for="'+svo.sname+'">'+svo.sname+'</label></div>';
		}
		
		let fhtml = '';
		fhtml += '<div class="row">';
		fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="select_side('+pno+','+category+')">';
		fhtml += '<span id="button_text">추가안함</span></div>';
		fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="select_side('+pno+','+category+')">';
		fhtml += '<span id="button_text">추가하기</span></div>';
		fhtml += '</div>';
		
		ingredientZone.append(html);
		ingredientZoneFooter.append(fhtml);
	}
	/* 3 모달 끝 */
	
	
	/* 4 모달 사이드메뉴 고르기 */
	function select_side(pno, category) {
		let extraArr = [];
		let mno = '<c:out value="${ses.mno}"/>';
		$("input:checkbox[name=sname]:checked").each(function() {
			let ingredients = $(this).val();
			extraArr.push(ingredients);
		})
		if (extraArr.length != 0 ) {
			$.ajax({
				url : "/addExtra",
				type : "post",
				data : {
					list : extraArr,
					mno : mno,
					pno : pno,
				}
			}).done(function(result) {
				console.log("성공함");
				show_sides(pno, category);
			}).fail(function(err) {
				console.log("실패함");
			});
		}
	}
	function show_sides(pno, category) {
		
	}
	
</script>


<jsp:include page="common/footer.jsp" />