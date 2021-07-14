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
					href="app-chat.html" aria-expanded="false"><i
						data-feather="message-square" class="feather-icon"></i><span
						class="hide-menu">주문 목록</span></a></li>
						
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="/stock/presentList" aria-expanded="false"><i
						data-feather="calendar" class="feather-icon"></i><span
						class="hide-menu">재고 관리</span></a></li>
						
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="" aria-expanded="false"><i
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
					href="authentication-login1.html" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">Login </span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="authentication-register1.html" aria-expanded="false"><i
						data-feather="lock" class="feather-icon"></i><span
						class="hide-menu">Register </span></a></li>

				<li class="sidebar-item"><a class="sidebar-link has-arrow"
					href="javascript:void(0)" aria-expanded="false"><i
						data-feather="feather" class="feather-icon"></i><span
						class="hide-menu">Icons </span></a>
					<ul aria-expanded="false"
						class="collapse first-level base-level-line">
						<li class="sidebar-item"><a href="icon-fontawesome.html"
							class="sidebar-link"><span class="hide-menu">
									Fontawesome Icons </span></a></li>

						<li class="sidebar-item"><a href="icon-simple-lineicon.html"
							class="sidebar-link"><span class="hide-menu"> Simple
									Line Icons </span></a></li>
					</ul></li>

				<li class="sidebar-item"><a class="sidebar-link has-arrow"
					href="javascript:void(0)" aria-expanded="false"><i
						data-feather="crosshair" class="feather-icon"></i><span
						class="hide-menu">Multi level dd</span></a>
					<ul aria-expanded="false"
						class="collapse first-level base-level-line">
						<li class="sidebar-item"><a href="javascript:void(0)"
							class="sidebar-link"><span class="hide-menu"> item 1.1</span></a>
						</li>
						<li class="sidebar-item"><a href="javascript:void(0)"
							class="sidebar-link"><span class="hide-menu"> item 1.2</span></a>
						</li>
						<li class="sidebar-item"><a class="has-arrow sidebar-link"
							href="javascript:void(0)" aria-expanded="false"><span
								class="hide-menu">Menu 1.3</span></a>
							<ul aria-expanded="false"
								class="collapse second-level base-level-line">
								<li class="sidebar-item"><a href="javascript:void(0)"
									class="sidebar-link"><span class="hide-menu"> item
											1.3.1</span></a></li>
								<li class="sidebar-item"><a href="javascript:void(0)"
									class="sidebar-link"><span class="hide-menu"> item
											1.3.2</span></a></li>
								<li class="sidebar-item"><a href="javascript:void(0)"
									class="sidebar-link"><span class="hide-menu"> item
											1.3.3</span></a></li>
								<li class="sidebar-item"><a href="javascript:void(0)"
									class="sidebar-link"><span class="hide-menu"> item
											1.3.4</span></a></li>
							</ul></li>
						<li class="sidebar-item"><a href="javascript:void(0)"
							class="sidebar-link"><span class="hide-menu"> item 1.4</span></a></li>
					</ul></li>
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
	