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
				매출 상세</h3>
			<div class="d-flex align-items-center"></div>
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
		<!-- column -->
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">일 매출</h4>
					<div>
						<canvas id="line-chart1" height="150"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- column -->
		<!-- column -->
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">월 매출</h4>
					<div>
						<canvas id="line-chart2" height="150"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- column -->
		<!-- column -->
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">이 달의 요일 별 매출</h4>
					<div>
						<canvas id="line-chart4" height="200vh" width="500vw"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- column -->
	</div>
	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->

<script src="/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	let dateSlist = new Array();
	<c:forEach items="${dateSalesList}" var="sales">
	dateSlist.push("${sales}");
	</c:forEach>
	
	let weekSalesList = new Array();
	<c:forEach items="${weekSales}" var="week">
	weekSalesList.push("${week}");
	</c:forEach>
	console.log(weekSalesList);
</script>
<script>
	let today = new Date();
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1; // 월
	let date = today.getDate(); // 날짜
	let day = today.getDay(); // 요일

	new Chart(document.getElementById("line-chart1"),
			{
				type : 'line',
				data : {
					labels : [ (date - 6) + '일', (date - 5) + '일', (date - 4) + '일', (date - 3) + '일',
							(date - 2) + '일', (date - 1) + '일', date + '일' ],
					datasets : [ {
						data : [ dateSlist[6], dateSlist[5], dateSlist[4],
								dateSlist[3], dateSlist[2], dateSlist[1],
								dateSlist[0] ],
						label : "일 매출",
						borderColor : "#5f76e8",
						fill : false
					} ]
				},
			});

	new Chart(document.getElementById("line-chart2"), {
		type : 'line',
		data : {
			labels : [ (month - 2) + '월', (month - 1) + '월', month + '월' ],
			datasets : [ {
				data : [ dateSlist[2], dateSlist[1], dateSlist[0] ],
				label : "월 매출",
				borderColor : "#5fdae8",
				fill : false
			} ]
		},
	});
	
	new Chart(document.getElementById("line-chart4"), {
		type : 'pie',
		data : {
			labels : ["일","월","화","수","목","금","토"],
			datasets : [ {
			data : [ weekSalesList[0], weekSalesList[1], weekSalesList[2], weekSalesList[3], weekSalesList[4], weekSalesList[5], weekSalesList[6] ],
						backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(95, 118, 232)', 'rgb(153, 102, 255)'],
					} ]
				},
			});
</script>



<jsp:include page="../adminCommon/footer.jsp" />