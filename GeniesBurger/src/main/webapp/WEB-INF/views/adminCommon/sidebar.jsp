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
					href="#" aria-expanded="false"><i data-feather="home"
						class="feather-icon"></i><span class="hide-menu">Dashboard</span></a></li>
				<li class="list-divider"></li>
				<li class="nav-small-cap"><span class="hide-menu">매출 /
						재고 관리</span></li>

				<li class="sidebar-item"><a class="sidebar-link"
					href="sales/sales_detail" aria-expanded="false"><i
						data-feather="tag" class="feather-icon"></i><span
						class="hide-menu">매출 상세 확인</span></a></li>
						
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stockOrder/dateList" aria-expanded="false"><i
						data-feather="message-square" class="feather-icon"></i><span
						class="hide-menu">주문 목록</span></a></li>
        
        <li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stockOrder/register" aria-expanded="false"><i
						data-feather="calendar" class="feather-icon"></i><span
						class="hide-menu">재고 주문</span></a></li>
						
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stock/presentList" aria-expanded="false"><i
						data-feather="calendar" class="feather-icon"></i><span
						class="hide-menu">재고 관리</span></a></li>
						
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stock/stock_regList" aria-expanded="false"><i
						data-feather="calendar" class="feather-icon"></i><span
						class="hide-menu">입고 현황</span></a></li>


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
	