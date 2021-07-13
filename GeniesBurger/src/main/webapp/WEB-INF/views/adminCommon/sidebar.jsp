<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<aside class="left-sidebar" data-sidebarbg="skin6">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar" data-sidebarbg="skin6">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="index.html" aria-expanded="false"><i data-feather="home"
						class="feather-icon"></i><span class="hide-menu">Dashboard</span></a></li>
				<li class="list-divider"></li>
				<li class="nav-small-cap"><span class="hide-menu">매출 /
						재고 관리</span></li>

				<li class="sidebar-item"><a class="sidebar-link"
					href="ticket-list.html" aria-expanded="false"><i
						data-feather="tag" class="feather-icon"></i><span
						class="hide-menu">매출 상세 확인</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stockOrder/list" aria-expanded="false"><i
						data-feather="message-square" class="feather-icon"></i><span
						class="hide-menu">주문 목록</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="app-calendar.html" aria-expanded="false"><i
						data-feather="calendar" class="feather-icon"></i><span
						class="hide-menu">재고 현황</span></a></li>

				<li class="list-divider"></li>
				<li class="nav-small-cap"><span class="hide-menu">메뉴 관리</span></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="ui-cards.html" aria-expanded="false"><i
						data-feather="sidebar" class="feather-icon"></i><span
						class="hide-menu">메뉴 품절</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="ui-cards.html" aria-expanded="false"><i
						data-feather="sidebar" class="feather-icon"></i><span
						class="hide-menu">메뉴 수정</span></a></li>
				<li class="list-divider"></li>
				<li class="nav-small-cap"><span class="hide-menu">쿠폰관리</span></li>

				<li class="sidebar-item"><a class="sidebar-link sidebar-link"

					href="/coupon/register" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">쿠폰 등록</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/coupon/list" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">등록된 쿠폰 리스트</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/coupon/issue" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">쿠폰 발급</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/coupon/issueList" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">발급된 쿠폰 리스트</span></a></li>
				<li class="list-divider"></li>
				<li class="nav-small-cap"><span class="hide-menu">회원관리</span></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="docs/docs.html" aria-expanded="false"><i
						data-feather="edit-3" class="feather-icon"></i><span
						class="hide-menu">Documentation</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="authentication-login1.html" aria-expanded="false"><i
						data-feather="log-out" class="feather-icon"></i><span
						class="hide-menu">Logout</span></a></li>
			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">

	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-7 align-self-center">
				<h3
					class="page-title text-truncate text-dark font-weight-medium mb-1">Good
					Morning Jason!</h3>
				<div class="d-flex align-items-center">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb m-0 p-0">
							<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
							</li>
						</ol>
					</nav>
				</div>
			</div>
			<div class="col-5 align-self-center">
				<div class="customize-input float-right">
					<select
						class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
						<option selected>Aug 19</option>
						<option value="1">July 19</option>
						<option value="2">Jun 19</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->