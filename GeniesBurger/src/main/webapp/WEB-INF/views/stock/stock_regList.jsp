<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-7 align-self-center">
			<h3
				class="page-title text-truncate text-dark font-weight-medium mb-1">
				입고 현황</h3>
		</div>
	</div>
</div>
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">입고 내역</h4>
					<div class="d-flex align-items-center">
						<ul class="nav nav-tabs mb-3">
							<li class="nav-item"><a href="#home" data-toggle="tab"
								aria-expanded="false" class="nav-link"> <i
									class="mdi mdi-home-variant d-lg-none d-block mr-1"></i> <span
									class="d-none d-lg-block">Home</span>
							</a></li>
							<li class="nav-item"><a href="#profile" data-toggle="tab"
								aria-expanded="true" class="nav-link active"> <i
									class="mdi mdi-account-circle d-lg-none d-block mr-1"></i> <span
									class="d-none d-lg-block">Profile</span>
							</a></li>
							<li class="nav-item"><a href="#settings" data-toggle="tab"
								aria-expanded="false" class="nav-link"> <i
									class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i> <span
									class="d-none d-lg-block">Settings</span>
							</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane" id="home">
								<p>Food truck quinoa dolor sit amet, consectetuer adipiscing
									elit. Aenean commodo ligula eget dolor. Aenean massa. Cum
									sociis natoque penatibus et magnis dis parturient montes,
									nascetur ridiculus mus. Donec quam felis, ultricies nec,
									pellentesque eu, pretium quis, sem. Nulla consequat massa quis
									enim.</p>
								<p class="mb-0">Donec pede justo, fringilla vel, aliquet
									nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet
									a, venenatis vitae, justo. Nullam dictum felis eu pede mollis
									pretium. Integer tincidunt.Cras dapibus. Vivamus elementum
									semper nisi. Aenean vulputate eleifend tellus. Aenean leo
									ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
							</div>
							<div class="tab-pane show active" id="profile">
								<p>Donec pede justo, fringilla vel, aliquet nec, vulputate
									eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis
									vitae, justo. Nullam dictum felis eu pede mollis pretium.
									Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi.
									Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor
									eu, consequat vitae, eleifend ac, enim.</p>
								<p class="mb-0">Food truck quinoa dolor sit amet,
									consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
									Aenean massa. Cum sociis natoque penatibus et magnis dis
									parturient montes, nascetur ridiculus mus. Donec quam felis,
									ultricies nec, pellentesque eu, pretium quis, sem. Nulla
									consequat massa quis enim.</p>
							</div>
							<div class="tab-pane" id="settings">
								<p>Food truck quinoa dolor sit amet, consectetuer adipiscing
									elit. Aenean commodo ligula eget dolor. Aenean massa. Cum
									sociis natoque penatibus et magnis dis parturient montes,
									nascetur ridiculus mus. Donec quam felis, ultricies nec,
									pellentesque eu, pretium quis, sem. Nulla consequat massa quis
									enim.</p>
								<p class="mb-0">Donec pede justo, fringilla vel, aliquet
									nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet
									a, venenatis vitae, justo. Nullam dictum felis eu pede mollis
									pretium. Integer tincidunt.Cras dapibus. Vivamus elementum
									semper nisi. Aenean vulputate eleifend tellus. Aenean leo
									ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->
<jsp:include page="../adminCommon/footer.jsp" />