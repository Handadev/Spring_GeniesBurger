<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Start footer -->
<footer class="ftco-footer ftco-section">
  <div class="container">
  <div id="warning">
  	유의사항
  	<hr>
  	<div>
  	<ul>
<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
<li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
<li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로 <br>식품위생법상 위반될 여지가 있어 별도로 보관 하지 않으며,
재배달 또는 환불처리가 어려울 수 있습니다.</li>
<li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타쿠폰을 사용하실 수 없습니다. (일부품목 배달 제외)</li>
<li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
<li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
<li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
<li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
</ul>
  	</div>
  </div>
  
  </div>
  <script>
	let result = '<c:out value="${result}"/>';
	if (result != "") {
		alert(result);
	}
</script>
</footer>




<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>
  
</body>
</html>