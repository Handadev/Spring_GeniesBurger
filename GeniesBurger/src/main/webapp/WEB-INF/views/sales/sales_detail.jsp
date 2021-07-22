<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />

<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">
<div class="card-group">
		<div class="card border-right">
			<div class="card-body">
				<div class="d-flex d-lg-flex d-md-block align-items-center">
					<div>
						<h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium" id="yesterday">
							0
						</h2>
						<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">어제 매출</h6>
					</div>
					<div class="ml-auto mt-md-3 mt-lg-0">
						<span class="opacity-7 text-muted"><span style="font-size: 1.5em; ">￦</span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-right">
			<div class="card-body">
				<div class="d-flex d-lg-flex d-md-block align-items-center">
					<div>
						<div class="d-inline-flex align-items-center">
							<h2 class="text-dark mb-1 font-weight-medium" id="today">0</h2>
							<span class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none" id="increase">+18.33%</span>
						</div>
						<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">오늘 매출</h6>
					</div>
					<div class="ml-auto mt-md-3 mt-lg-0">
						<span class="opacity-7 text-muted"><span style="font-size: 1.5em; ">￦</span></span>
					</div>
				</div>
			</div>
		</div>
	</div>
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
               <h4 class="card-title">연도별 매출</h4>
               <div>
                  <canvas id="line-chart3" height="150"></canvas>
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
    <!-- column -->
      <div class="col-lg-6">
         <div class="card">
            <div class="card-body">
               <h4 class="card-title">이번 달 메뉴별 판매량 Top5</h4>
					    <div>
					    	<canvas id="bar-chart-horizontal" height="150"></canvas>
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
	
	$("#today").text(dateSlist[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$("#yesterday").text(dateSlist[1].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
	increase();
	
	function increase() {
		let today = dateSlist[0];
		let yesterday = dateSlist[1];
		console.log(today);
		console.log(yesterday);
		let increase = ((today-yesterday)/yesterday) * 100;
		console.log(increase);
	
		$("#increase").text(increase.toFixed(2) + "%");
	}
	
	let monthSlist = new Array();
	<c:forEach items="${monthSalesList}" var="sales">
	monthSlist.push("${sales}");
	</c:forEach>
	
	let productRlist = new Array();
	<c:forEach items="${productRateList}" var="rate">
	productRlist.push(${rate});
	</c:forEach>

	let yearSlist = new Array();
	<c:forEach items="${yearSalesList}" var="ySales">
	yearSlist.push("${ySales}");
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

	//일 매출
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
						label : "일 매출(원)",
						borderColor : "#f7547a",
						fill : false
					} ]
				},
				options: {
					  scales: {
							yAxes: [{
								ticks: {
									beginAtZero: true,
									fontSize : 14
								}
							}],
							xAxes: [{
								ticks: {
									fontSize : 14
								}
							}]
						}
					}
			});

	//월 매출
	new Chart(document.getElementById("line-chart2"), {
		type : 'line',
		data : {
			labels : [ (month - 11) + '월', (month - 10) + '월', (month - 9) + '월', (month - 8) + '월', (month - 7) + '월', (month - 6) + '월', (month - 5) + '월', (month - 4) + '월', (month - 4) + '월', (month - 2) + '월', (month - 1) + '월', month + '월' ],
			datasets : [ {
				data : [ monthSlist[11], monthSlist[10], monthSlist[9], monthSlist[8], monthSlist[7], monthSlist[6], monthSlist[5], monthSlist[4], monthSlist[3], monthSlist[2], monthSlist[1], monthSlist[0] ],
				label : "월 매출(원)",
				borderColor : "#5f76e8",
				fill : false
			} ]
		},
		options: {
			  scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
							fontSize : 14
						}
					}]
				}
			}
	});
	
	//이번 달 메뉴 별 판매량 Top5
	new Chart(document.getElementById("bar-chart-horizontal"), {
		type: 'horizontalBar',
		data: {
		  labels: [ productRlist[0].title, productRlist[1].title, productRlist[2].title, productRlist[3].title, productRlist[4].title ],
		  datasets: [
			{
			  label: "판매량(개수)",
			  backgroundColor: ["#6174d5", "#5f76e8", "#768bf4", "#7385df", "#b1bdfa"],
			  data: [ productRlist[0].quantity, productRlist[1].quantity, productRlist[2].quantity, productRlist[3].quantity, productRlist[4].quantity ]
			}
		  ]
		},
		options: {
		  legend: { display: false },
		  scales: {
				xAxes: [{
					ticks: {
						beginAtZero: true,
						suggestedMax: productRlist[4].quantity + 10,
						fontSize : 14
					}
				}]
			}
		}
	});
	
	 new Chart(document.getElementById("line-chart3"), {
	      type : 'line',
	      data : {
	         labels : [ year - 4, year - 3, year - 2, year - 1, year],
	         datasets : [ {
	            data : [ yearSlist[4], yearSlist[3], yearSlist[2], yearSlist[1], yearSlist[0] ],
	            label : "연매출",
	            borderColor : "#9FC93C",
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