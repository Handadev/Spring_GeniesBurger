<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>cartno</th>
								<th>Product name</th>
								<th>Quantity</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartList }" var="cartList">
								<tr class="text-center">
								<td id="pnoVal">pno : ${cartList.pno }</td>
									<td class="product-remove">
									<button type="button" class="btn btn-outline-light outline btn-lg removeBtn" style="width:50px;" data-cartno="${cartList.cartno }">
									<span class="ion-ios-close">
									</span>
									</button>
									</td>
									<td class="image-prod"><div class="img"
											style="background-image: url(/resources/images/demo.png);"></div></td>
									<td class="cartno">
										<h3>cartno</h3>
										<p>${cartList.cartno }</p>
									</td>
									<td class="product-name">
										<h3>${cartList.title }</h3>
									</td>
									<td class="quantity">
										<div class="input-group mb-3">
											<input type="text" name="quantity"
												class="quantity form-control input-number"
												value="${cartList.quantity }" readonly>
										</div>
									<td class="price">₩ ${cartList.price }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- <form action="/cart/remove" id="removeForm" method="post">
</form> -->
<script>
	$(document).on("click", ".removeBtn", function() {
		console.log(".removeBtn");
		let cartno_val = $(this).data("cartno");
		console.log("cartno_val : " + cartno_val);
		remove_cart(cartno_val);
	});
	
	function remove_cart(cartno){
		/* let pno_val = $("#pnoVal").text(); */
	      $.ajax({
	         url: "/cart/"+cartno,
	         type: "delete"
	      }).done(function(result) {
	         alert("카트 삭제 성공");
	         location.reload();
	      }).fail(function(err) {
	         alert("카트 삭제 실패");
	         location.reload();
	      });
	}
</script>

<jsp:include page="../common/footer.jsp" />



















