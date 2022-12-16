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
	
	.mycpAndpt {
		/*border: solid 1px blue;*/
		height: 20%;
	}
	
	.mytickets {
		/*border: solid 1px blue;*/
		height: 30%;
	}
	
	.mytickets .subject {
		border-bottom: solid 3px black;
		text-align: center;
	}
	
	.myproducts {
		/*border: solid 1px blue;*/
		margin-top: 1%;
		height: 30%;
	}
	
	.myproducts .subject {
		border-bottom: solid 3px black;
		text-align: center;
	}
</style>

<div class="title">
	<h3 style="text-align: center;">마이페이지</h3>
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
	<div class="mycpAndpt">
		<div class="mycp">
			<div><b>보유 쿠폰</b>
				<span>- 할인 쿠폰 : ${couponCnt}매</span>
				<!-- <td style="color:red;"><b>- 만료 예정 쿠폰 : ${cnt}매</b></td> -->
			</div>
		</div>
		<div class="mypt">
			<div><b>보유 포인트</b>
				<span>- 보유 포인트 : ${ptTotal}P</span>
			</div>
		</div>
	</div>
	<div class="mytickets">
		<c:if test="${tckCount == 0}">
			<p class="subject"><b>최근 티켓 예매내역</b></p>
			<p>최근 티켓 예매내역이 없습니다.</p>
		</c:if>
		
		<c:if test="${tckCount != 0}">
		<p class="subject"><b>최근 티켓 예매내역</b></p>
		<table class="table table-hover">
			<tr>
				<th>예매일</th>
				<th>예매번호</th>
				<th>공연명</th>
				<th>관람일시</th>
				<th>매수</th>
				<th>예매상태</th>
			</tr>
			<c:forEach var="row" items="${list_t}" varStatus="vs">
			<tr>
				<td>${row.orderDate}</td>
				<td>${row.tck_num}</td>
				<td>${row.title}</td>
				<td>${row.date}</td>
				<td>${row.cnt}</td>
				<td>${row.stus}</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>
	<div class="myproducts">
		<c:if test="${orderCount == 0}">
			<p class="subject"><b>최근 상품 구매내역</b></p>
			<p>최근 상품 구매내역이 없습니다.</p>
		</c:if>
		
		<c:if test="${orderCount != 0}">
		<p class="subject"><b>최근 상품 구매내역</b></p>
		<table class="table table-hover">
			<tr>
				<th>구매일</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>배송상태</th>
			</tr>
			<c:forEach var="row" items="${list_p}" varStatus="vs">
			<tr>
				<td>${row.orderDate}</td>
				<td>${row.order_num}</td>
				<td>${row.pro_name}</td>
				<td>${row.detail_cnt}</td>
				<td>${row.stus}</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
	</div>

</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>