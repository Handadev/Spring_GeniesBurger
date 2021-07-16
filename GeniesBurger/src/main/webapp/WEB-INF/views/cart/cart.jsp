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
  .btn-center-div{
    text-align: center;
    margin:auto;
  }
  .downQtyBtn, .upQtyBtn{
     width:30px;
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
								<th>상품</th>
								<th>수량</th>
								<th>가격</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartList }" var="cartList">
								<c:choose>
									<c:when test="${ses.mno == cartList.mno }">
										<tr class="text-center">
											<%-- <td id="pnoVal">pno : ${cartList.pno }</td> --%>
											<%-- <td id="mno_val">mno : ${cartList.mno }</td> --%>
											<%-- <td class="cartno">
												<h3>cartno</h3>
												<p>${cartList.cartno }</p>
											</td> --%>
											<td class="image-prod">
											<img class="img" src="/upload/${cartList.savedir }/${cartList.puuid}_${cartList.fname}" alt="display none">
											
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
											<td class="product-remove">
												<button type="button"
													class="btn-sm btn-danger removeBtn detailBtn"
													style="width: 50px;" data-cartno="${cartList.cartno }">삭제
												</button>
											</td>
										</tr>
									</c:when>
									<c:when test="${ses.mno eq '' || ses.mno eq null}">
										<script>
											alert("먼저 로그인을 하셔야 합니다!");
											location.replace("/member/login");
										</script>
									</c:when>
									<c:when test="${cartList.price eq null }">
										<script>
											alert("장바구니에 담긴 상품이 없습니다!");
											location.replace("/product/list");
										</script>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="font-size:2em; margin-top:30px; text-align: center; width:100%">
				<c:forEach items="${cartList }" var="cartList">
					<c:if test="${ses.mno == cartList.mno }">
						<c:set var="sum" value="${sum + (cartList.price * cartList.quantity)}" />
					</c:if>
				</c:forEach>
				<c:if test="${ses.mno != null}">
				총 주문금액 :
				<c:out value="${sum }"/>원
				<br>
				<button type="button" class="btn-lg btn-danger" style="width:280px"
				data-toggle="modal" data-target="#orderBtn"> 결제하기 </button>
				</c:if>
			</div>
		</div>
	</div>
</section>
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
            <div class="modal-select" id="background1">
               <div id="check1" style="position: absolute;"></div>
              <img src="/resources/icons/for_here.jpg" style="width:200px; height:200px;" class="modal-img" />
              <p><b>매장식사</b></p>
            </div>
            <div class="modal-select" id="background2">
               <div id="check2" style="position: absolute;"></div>
            <img src="/resources/icons/to_go.jpg" style="width:200px; height:200px;" class="modal-img" />
            <p><b>포장주문</b></p>
            </div>
             <div id="confirmBtn"><a class="btn btn-dark checkBtn" style="color: white;">확인</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- Modal 이미지 겹치기 스크립트 -->
<script>
let check = false;

$(document).on("click", "#background1", function() {
   let html = "<div style='position: relative; top: 50px; left:50px;'><img src='/resources/icons/check.png' style='width:150px'/></div>";
   $("#check1").html(html);
   $("#check2").html("");
   check = true;
});

$(document).on("click", "#background2", function() {
   let html = "<div style='position: relative; top: 50px; left:50px;'><img src='/resources/icons/check.png' style='width:150px'/></div>";
   $("#check2").html(html);
   $("#check1").html("");
   check = true;
});

$(document).on("click",".checkBtn",function() {
   if(check == true) {
      $(".checkBtn").attr("href", '/cart/payment?mno='+${ses.mno });
   } else {
      alert("항목을 선택하세요!");
   }
});
</script>
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
			location.reload();
		}).fail(function(err) {
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
			location.reload();
		}).fail(function(err) {
			location.reload();
		});
	}
</script>

<jsp:include page="../common/footer.jsp" />
