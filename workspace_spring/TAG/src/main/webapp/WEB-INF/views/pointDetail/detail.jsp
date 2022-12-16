<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
	.leftcontent, .rightcontent, .box {
		border:1px solid black;
	}
	
	.leftcontent div, .rightcontent {
		padding:10px;
	}
</style>

<div class="title">
	<h3 style="text-align: center;">보유 포인트</h3>
</div>

<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
	<div><b>${s_m_id}</b> 님</div>
	<div><a href="/mypage/memberupdateG">회원 정보 수정</a></div>
	<div class="box">
		<div><b>MY티켓</b>
			<div><a href="/mypage/myticket">- 예매 확인 / 취소</a></div>	
		</div>
		<div><b>MY상품</b>
			<div><a href="/mypage/myproduct">- 상품 구매내역</a></div>	
			<div><a href="#">- 나의 문의내역</a></div>
		</div>
		<div><b>좋아요</b>
			<div><a href="/mypage/mylike">- 관심 공연 / 관심 상품</a></div>
		</div>
		<div><b>MY쿠폰 / MY포인트</b>
			<div><a href="/couponDetail/detail">- 보유 쿠폰</a></div>
			<div><a href="/pointDetail/detail">- 보유 포인트</a></div>
		</div>
	</div>
</div><!-- leftcontent end -->



<div class="rightcontent" style="float:right; width:80%; height:100%;"> 
	<div class="pointList">
		<c:if test="${ptCount == 0}">
			<p class="subject"><b>포인트 내역</b></p>
			<p>보유 포인트 내역이 없습니다.</p>
		</c:if>
	
		<c:if test="${ptCount != 0}">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>변경일</th>
					<th>포인트 변경 내역</th>
					<th>적립포인트</th>
					<th>사용포인트</th>
					<th>포인트 잔액</th>
					<th>주문번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}" varStatus="vs">
				<tr>
					<td>${row.cng_date}</td>
					<td>${row.detail}</td>
					<td>${row.pt_plus}</td>
					<td>${row.pt_minus}</td>
					<td>${row.pt_total}</td>
					<td>${row.order_num}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
	</div>   
</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>