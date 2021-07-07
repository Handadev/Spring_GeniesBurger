<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp" />
	
	<!-- 메뉴 상단 이미지 -->
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_1.jpg')">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
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
          <div class="col-md-10 mb-5 text-center">
            <ul class="product-category">
              <li><a href="#" class="active">와퍼</a></li>
              <li><a href="#">와퍼세트</a></li>
              <li><a href="#">올데이킹</a></li>
              <li><a href="#">사이드</a></li>
              <li><a href="#">음료</a></li>
            </ul>
          </div>
        </div>
        <!-- 상품 분류 선택 끝-->
        <!-- 상품 전체 -->
        <div class="row">
        <!-- 상품 프레임 -->
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="product">
              <a href="#" class="img-prod"
                ><img class="img-fluid" src="/resources/images/product-1.jpg" alt="Colorlib Template" />
                <span class="status">30%</span>
                <div class="overlay"></div>
              </a>
              <div class="text py-3 pb-4 px-3 text-center">
                <h3><a href="#">Bell Pepper</a></h3>
                <div class="d-flex">
                  <div class="pricing">
                    <p class="price">
                      <span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 상품 프레임 끝 -->
        </div>
        <!-- 상품 전체 끝 -->
        <!-- 상품 페이저 -->
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

<jsp:include page="common/footer.jsp" />