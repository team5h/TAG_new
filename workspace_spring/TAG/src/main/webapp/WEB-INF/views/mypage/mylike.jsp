<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->

<style>
	.leftcontent {
		float: left;
		width: 15%;
		margin-right: 5%;
		height: 100%;
	}
	.rightcontent {
		float: right;
		width: 80%;
		height: 100%;		
	}
	.leftcontent, .rightcontent, .box {
		border: 1px solid black;
	}
	.leftcontent div, .rightcontent {
		padding: 10px;
	}
	.rightcontent ul {
		list-style: none;
		padding-left: 0;
		margin: 0 auto;
		width: 100%;
		display: flex;
		border: 1px solid red;
	}
	.rightcontent li {
		border: 1px solid black;
		/*display: inline;*/
		/*margin-right: 30px;*/
		margin: 0 auto;
	}
	.likecategory {
		float: right;
	}
	.memberLike {
		display: flex;
		flex-wrap: wrap; /* 상위 요소의 너비보다 하위 요소의 너비가 더 클 경우 줄바꿈 */
		justify-content: space-between;
		width: 800px;
		/*height: 100%;*/
		border: 1px solid blue;
		margin: 0 auto;
	}
	.memberLike .likeItem {
		border: 1px solid green; /* 테두리를 1px 실선의 #eee 색상으로 */
		height: 350px;
		width: 250px;
		padding: 5px;
		margin-bottom: 10px;	
	}
	.likeItem img {
		height: 150px;
		width: 200px;
	}
	.likeItem p {
		font-size: 14px;
	}
	
	.mylike_concert {
		/*border: solid 1px blue;*/
		height: 50%;
	}
	
	.mylike_concert p {
		border-bottom: solid 3px black;
	}
	
	.mylike_product {
		margin-top: 1%;
		/*border: solid 1px blue;*/
		height: 50%;
	}

	.mylike_product p {
		border-bottom: solid 3px black;
	}
	
</style>

<div class="title">
	<h3 style="text-align: center;">관심 공연 / 관심 상품</h3>
</div>
<div></div>

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



<!-- 
	<div class="myLike">
		<div class="likeItem">
		상품개수 : ${fn:length(list)}
			<br>
			<table border="1">
				<tr>
					<th>일련번호</th>
					<th>구분코드</th>
					<th>관심상품</th>
				</tr>
				<c:forEach var="row" items="${list}" varStatus="vs">
				<tr>
					<td>${row.lno}</td>
					<td>${row.like_cd}</td>
					<td>${row.like_li}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
 -->

<div class="rightcontent" style="">
	<div class=mylike_concert>
		<table border="1">
		<tr>
			<p style="text-align: center;">공연 좋아요</p>
			<c:forEach var="row" items="${list_c}" varStatus="vs">
				<td>
					<c:choose>
						<c:when test="${row.m_id == null}">
							관심 공연이 없습니다
						</c:when>
						<c:when test="${row.postername != null}">
							<img src="/storage/${row.postername}" width="100px">
						</c:when>
						<c:otherwise>
							등록된 사진 없음!!<br>
						</c:otherwise>
					</c:choose>
					<div id="concert_name">
						<a href="#">PREP LIVE IN SEOUL</a>
					</div>
				</td>
				<!-- 테이블 한줄에 3칸씩 -->
				<c:if test="${vs.count mod 3==0 }">
					<tr></tr>
				</c:if>
			</c:forEach>
		</tr>
		</table>
	</div>
	
	<div class=mylike_product>
		<table border="1">
		<tr>
			<p style="text-align: center;">상품 좋아요</p>
			<!-- varStatus="상태용 변수" -->
			<c:forEach var="row" items="${list_p}" varStatus="vs">
				<td>
					<c:choose>
						<c:when test="${row.postername != null}">
							<img src="/storage/${row.postername}" width="100px">
						</c:when>
						
						<c:otherwise>
							등록된 사진 없음!!<br>
						</c:otherwise>
					</c:choose>
					<div id="concert_name">
						<a href="#">PREP LIVE IN SEOUL</a>
					</div>
					<div id="product_name">
						<a href="detail/${row.pro_no}">${row.pro_name}</a>
					</div>
				</td>
				<!-- 테이블 한줄에 3칸씩 -->
				<c:if test="${vs.count mod 3==0 }">
					<tr></tr>
				</c:if>
			</c:forEach>
		</tr>
		</table>
	</div>


</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>