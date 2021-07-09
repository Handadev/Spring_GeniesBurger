<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp" />
<style>
.form-control {
	width : 80%;
}
</style>

<!-- 메뉴 상단 이미지 -->
<div class="hero-wrap hero-bread"
	style="background-image: url('/resources/images/bg_1.jpg')">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
				</p>
				<h1 class="mb-0 bread">Products</h1>
			</div>
		</div>
	</div>
</div>
<!-- 메뉴 상단 이미지 끝 -->

<section class="ftco-section">
	<div class="container">
		<!-- 상품 분류 선택 -->
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center float-left">
				<ul class="product-category">
					<li><a href="/" class="${product_paging.pcpgvo.range == '' ? 'active' : '' } total">전체</a></li>
					<li><a href="/?range=category&keyword=1" class="${product_paging.pcpgvo.keyword == 1 ? 'active' : '' }">버거</a></li>
					<li><a href="/?range=category&keyword=2" class="${product_paging.pcpgvo.keyword == 2 ? 'active' : '' }">버거세트</a></li>
					<li><a href="/?range=category&keyword=4" class="${product_paging.pcpgvo.keyword == 4 ? 'active' : '' }">올데이킹</a></li>
					<li><a href="/?range=category&keyword=7" class="${product_paging.pcpgvo.keyword == 7 ? 'active' : '' }">사이드</a></li>
					<li><a href="/?range=category&keyword=8" class="${product_paging.pcpgvo.keyword == 8 ? 'active' : '' }">음료</a></li>
				</ul>
				<form action="/">
					<input type="hidden" name="range" value="pro">
					<input class="form-control" type="text" placeholder="찾으시는 제품명을 입력하세요"
					name="keyword" >
					<button type="submit" class="btn btn-success float-right">검색</button>
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
							<div class="product">
								<a href="#" class="img-prod"><img class="img-fluid"
									src="/resources/images/product-1.jpg" alt="Colorlib Template" />
									<!-- 할인 혹은 new 혹은 best 들어가는 공간  <span class="status">할인/new/best</span> -->
									<div class="overlay"></div> </a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="#">${pvo.title }</a>
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
							<li class="${product_paging.pcpgvo.pageIndex == i ? 'active' : '' }">
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
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	let range_val = '<c:out value="${product_paging.pcpgvo.range}"/>';
	if (!range_val) {
		$(".total").addClass("active");
	}
	

</script>

<jsp:include page="common/footer.jsp" />