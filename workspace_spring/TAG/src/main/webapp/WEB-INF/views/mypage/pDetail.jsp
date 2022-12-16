<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문영역 -->

<div class="title">
	<h3 style="text-align: center;">상품 구매내역</h3>
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
	<div></div>
	<div class="myproductList">
		<c:if test="${orderCount == 0}">
			상품 구매내역이 없습니다.
		</c:if>
		
		<c:if test="${orderCount != 0}">
		<p class="clickInfo">상세내역을 보고싶으시면 주문번호를 클릭해주세요!</p>
		<table class="table table-hover">
			<tr>
				<th>주문 날짜</th>
				<th>주문 번호</th>
				<th>상품명</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>가격</th>
				<th>할인금액</th>
				<th>주문 결제금액</th>
				<th>결과 상태</th>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="vs">
			<tr>
				<td>
					<a href="pDetail/${row.order_num}">${row.order_num}</a>
				</td>
				<td>${row.order_price}</td>
				<td>${row.cp_dis}</td>
				<td>${row.cp_no}</td>
				<td>${row.pt_minus}</td>
				<td>${row.d_fee}</td>
				<td>${row.total_price}</td>
				<td>${row.pt_plus}</td>
				<td>${row.rec_name}</td>
				<td>${row.rec_addr}</td>
				<td>${row.rec_tel}</td>
				<td>${row.msg}</td>
				<td>${row.stus}</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>

</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>