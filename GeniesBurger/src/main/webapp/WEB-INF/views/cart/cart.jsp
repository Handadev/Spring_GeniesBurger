<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
  .modal {
    min-width: 100%;
    min-height: 100%;
  }

  .modal-title {
    margin: auto;
  }

  .modal-body {
    text-align: center; 
  }

  .modal-img {
    margin: 10px;
  }

  .checkBtn {
    margin-top: 15px;
    width: 90%;
  }
  .modal-select{
  width: 50%;
  margin: 0;
  padding: 0;   
  float: left; 
  }
  .modal-select:active{
    color: #ff0000;
  }
  .img{
  	width: 120px;
  	height: 120px;
  }
</style>

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
								<c:choose>
									<c:when test="${ses.mno == cartList.mno }">
										<tr class="text-center">
											<%-- <td id="pnoVal">pno : ${cartList.pno }</td> --%>
											<%-- <td id="mno_val">mno : ${cartList.mno }</td> --%>
											<td class="product-remove">
												<button type="button"
													class="btn btn-outline-light outline btn-lg removeBtn"
													style="width: 50px;" data-cartno="${cartList.cartno }">
													<span class="ion-ios-close"> </span>
												</button>
											</td>
											<td class="image-prod">
											<img class="img" src="/upload/${cartList.savedir }/${cartList.puuid}_${cartList.fname}" alt="display none">
											
											</td>
											<td class="cartno">
												<h3>cartno</h3>
												<p>${cartList.cartno }</p>
											</td>
											<td class="product-name">
												<h3>${cartList.title }</h3>
											</td>
											<td class="quantity">
												<div class="input-group mb-3">
													<button type="button" class="ion-ios-arrow-down downQtyBtn"
														data-downqty="${cartList.cartno }" data-down="-1"></button>
													&nbsp;&nbsp;
														<p data-qtydata="${cartList.quantity }" class="qtyclass">${cartList.quantity }</p>
													&nbsp;&nbsp;
													<button type="button" class="ion-ios-arrow-up upQtyBtn"
														data-upqty="${cartList.cartno }" data-up="1"></button>
												</div>
											</td>
											<td class="price">₩ ${cartList.price }</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<c:forEach items="${cartList }" var="cartList">
					<c:if test="${ses.mno == cartList.mno }">
						<c:set var="sum" value="${sum + (cartList.price * cartList.quantity)}" />
					</c:if>
				</c:forEach>
				<c:if test="${ses.mno != null}">
				총 주문금액 :
				<c:out value="${sum }" /> 원
				<button type="button" class="btn btn-danger" 
				data-toggle="modal" data-target="#orderBtn"> 결제하기 </button>
				</c:if>
			</div>
		</div>
	</div>
</section>
<!-- 카트 담기 -->
<form class="" action="/product/register" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="mno" value="${ses.mno }"> <input
		type="hidden" name="pno" value="${pvo.pno }"> <input
		type="hidden" name="title" value="${pvo.title }"> <input
		type="hidden" name="price" value="${pvo.content }"> <input
		type="hidden" name="calorie" value="${pvo.calorie }"> <input
		type="hidden" name="sales" value="${pvo.sales }"> <input
		type="hidden" name="cansale" value="${pvo.cansale }">
</form>
<!-- Modal -->
   <div class="container">
       <!-- Modal -->
    <div class="modal fade" id="orderBtn">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">선택해주세요</h4>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="modal-select" class="modal-img">
              <img src="/resources/icons/delivery_logo.png" style="width:200px; height:180px;" class="modal-img" />
              <p>매장식사</p>
            </div>
            <div class="modal-select">
            <img src="/resources/icons/package_logo.png" style="width:200px; height:180px;" class="modal-img" />
            <p>포장주문</p>
          </div>
            <button type="button" class="btn btn-dark checkBtn">확인</button>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- 삭제 스크립트 -->
<script>
	$(document).on("click", ".removeBtn", function() {
		console.log(this);
		let cartno_val = $(this).data("cartno");
		console.log("cartno_val : " + cartno_val);
		remove_cart(cartno_val);
	});

	function remove_cart(cartno) {
		$.ajax({
			url : "/cart/" + cartno,
			type : "delete"
		}).done(function(result) {
			alert("카트 삭제 성공");
			location.reload();
		}).fail(function(err) {
			alert("카트 삭제 실패");
			location.reload();
		});
	}
</script>
<!-- 결제 스크립트 -->
<script>
	$("#orderBtn").on("click", function() {
		console.log(this);
	})
</script>
<!-- Quantity 스크립트 -->
<script>
	/* 수량 감소 */
	$(document).on("click", ".downQtyBtn", function(e) {
		console.log(this);
		let downqty_val = $(this).data("downqty");
		let downqty_val2 = $(this).data("down");
		let qtyData = $(".qtyclass").data("qtydata");
		console.log("qtyData : " + qtyData);
		console.log("downqty_val : " + downqty_val);
		console.log("downqty_val2 : " + downqty_val2);
		if(qtyData == 1){
			alert("더 이상 감소가 불가능합니다.");
		}else{
		downqty_cart(downqty_val, downqty_val2);
		}
	});
	function downqty_cart(downqty, downqty2) {
		$.ajax({
			url : "/cart/" + downqty,
			type : "post",
			data : {
				downqty_key : downqty2
			}
		}).done(function(result) {
			alert("수량 감소 성공");
			location.reload();
		}).fail(function(err) {
			alert("수량 감소 실패");
			location.reload();
		});
	}

	/* 수량 증가 */
	$(document).on("click", ".upQtyBtn", function(e) {
		console.log(this);
		let upqty_val = $(this).data("upqty");
		let upqty_val2 = $(this).data("up");
		console.log("Upcartno_val : " + upqty_val);
		console.log("Upcartno_val2 : " + upqty_val2);
		upqty_cart(upqty_val, upqty_val2);
	});
	function upqty_cart(upqty, upqty2) {
		$.ajax({
			url : "/cart/" + upqty,
			type : "post",
			data : {
				upqty_key : upqty2
			}
		}).done(function(result) {
			alert("수량 증가 성공");
			location.reload();
		}).fail(function(err) {
			alert("수량 증가 실패");
			location.reload();
		});
	}
	
</script>

<jsp:include page="../common/footer.jsp" />



















