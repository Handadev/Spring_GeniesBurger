<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Genie's Burger</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="shortcut icon" href="/resources/icons/favicon.png">

</head>
<!-- Start header / nav  -->
<body class="goto-here">
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/" id="logo">
			<img src="/resources/icons/logo.png" style="width:70px; height:70px;"/>
			<span id="logo-text" style="margin-left:20px">지니스버거</span>
			</a>
		</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto" style="margin-right:100px">
					<li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
					<!-- <li class="nav-item active"><a href="/member/login" class="nav-link">Login</a></li> -->
					<li class="nav-item dropdown"><c:choose>
							<c:when test="${ses.email ne null && ses.email ne '' }">
								<li class="nav-item"><a href="/member/logout"
									class="nav-link">logout</a></li>
							</c:when>
							<c:otherwise>
								<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">login</a>
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="/member/login">Login</a>
									<a class="dropdown-item" href="/member/register">Register</a>
								</div>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<c:choose>
								<c:when test="${ses.email eq 'admin@admin.com' }">
									<a class="dropdown-item" href="/product/register">상품추가</a>
								</c:when>
							</c:choose>
							<a class="dropdown-item" href="/product/list">상품리스트</a>
							<a class="dropdown-item" href="product-single.html">Single Product</a> 
							<a class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
					<li class="nav-item"><a href="/review/list" class="nav-link">Review</a></li>
          <li class="nav-item"><a href="/coupon/list" class="nav-link">Coupon</a></li>
					<c:choose>
						<c:when test="${ses.email eq 'admin@admin.com' }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle"
								href="#" id="dropdown04"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">ADMIN</a>
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="/member/detail?mno=${ses.mno }">
									my page</a> 
									<a class="dropdown-item" href="/member/list">admin page</a>
									<a class="dropdown-item" href="/cart/purchaseList">purchase page</a>
								</div>
						</c:when>
						<c:when test="${ses.email ne null && ses.email ne '' }">
							<li class="nav-item"><a
								href="/member/detail?mno=${ses.mno }" class="nav-link">my
									page</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
	</nav>
	<div>
		<div class="container-fluid" id="navBtn">
			<div class="row">
				<div class="col">
				<a href="/cart/purchaseListMember?mno=${ses.mno }" id="navOrder">
				<strong>딜리버리 주문 내역</strong>
				</a>
				</div>
				<div class="col">
					<a href="/cart/cart" id="navCart">
					<strong>장바구니</strong>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- END header / nav -->