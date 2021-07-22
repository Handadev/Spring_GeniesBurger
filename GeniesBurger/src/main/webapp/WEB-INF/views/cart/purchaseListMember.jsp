<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<section class="ftco-section ftco-cart" style="background-color: #F1EAE5;">
   <c:choose>
      <c:when test="${purchaseListMember[0].title eq null || purchaseListMember[0].title eq '' }">
         <img src="/resources/icons/nolist_logo2.png" style="width: 350px; display: block; margin: auto; margin-top: 50px;">
      </c:when>
      <c:otherwise>
         <div class="container">
            <div class="row">
               <div class="col" style="margin-bottom: 10px;">
                  <form action="/cart/purchaseListMember" class="form-inline justify-content-end">
                  <p style="font-size:2em; margin-right:450px;">나의 주문내역</p>
                     <select class="form-control" name="range">
                        <option value="t"
                           <c:out value="${pghdlM.mpgvo.range eq 't' ? 'selected' : '' }"/>>상품명</option>
                        <option value="p"
                           <c:out value="${pghdlM.mpgvo.range eq 'p' ? 'selected' : '' }"/>>가격</option>
                     </select>&nbsp;&nbsp;
                     <input class="form-control" type="text" placeholder="검색어 입력" name="keyword" value="${pghdlM.mpgvo.keyword }">
                     <input type="hidden" name="mno" value="${pghdlM.mpgvo.mno }"> 
                     &nbsp;&nbsp;
                     <button type="submit" class="btn-sm btn-danger detailBtn">검색</button>
                  </form>
               </div>
               <div class="col-md-12 ftco-animate">
                  <table class="table">
                     <thead class="thead-primary">
                        <tr class="text-center">
                           <th>상품명</th>
                           <th>가격</th>
                           <th>수량</th>
                           <th>주문시간</th>
                           <th>리뷰</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${purchaseListMember }" var="purchaseListMember">
                           <input type="hidden" value="${purchaseListMember.pno }">
                                 <input type="hidden" value="${purchaseListMember.purno }">
                           <tr class="text-center">
                              <td>${purchaseListMember.title }</td>
                              <td><fmt:formatNumber value="${purchaseListMember.price }" pattern="#,###"/></td>
                              <td>${purchaseListMember.quantity }</td>
                              <td>${purchaseListMember.regdate }</td>
                              <c:choose>
                              <c:when test="${purchaseListMember.rlist.size() == 0}">
                                 <td><button type="button" class="revBtn btn-sm btn-danger" style="width:50px;">작성</button></td>
                              </c:when>
                              <c:otherwise>
                                 <td>리뷰 작성 완료</td>
                              </c:otherwise>
                           </c:choose>
                           </tr>
                        </c:forEach>
                     </tbody>
                     <tfoot>
                  </table>
                  <jsp:include page="pagingMember.jsp" />
               </div>
            </div>
         </div>
         <script>
            $(".ftco-cart").css("background-color", "white");
         </script>
         
      </c:otherwise>
   </c:choose>
</section>
<script>
$(document).on("click",".revBtn",function(){
   let pno = $(this).closest("tr").prev("input").prev("input").val();
   let purno = $(this).closest("tr").prev("input").val();
   localStorage.setItem("pno", pno);
   localStorage.setItem("purno", purno);
   location.href="/review/register";
});
</script>

<jsp:include page="../common/footer.jsp" />