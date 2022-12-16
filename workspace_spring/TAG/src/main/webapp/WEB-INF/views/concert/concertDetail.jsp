<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/css/detailStyle.css">
<script src="/js/detailScript.js" defer></script>

<style>

/* 전체 가로 너비 */
.container {max-width: 1350px !important;} 
.wrapAll {width: 90%; margin: 0 auto;}

/* 상품 테이블 전체박스 */
#product_box {
  width: 355px;
  --padding: 0 25px 0 25px;
  --padding-right: 70px;
  --padding-bottom: 70px;
}


/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}


/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


/* 바디 전체 폰트 설정 */
body {
  font-family: 'Jost', sans-serif;
  letter-spacing: 0.25px;
}

/* 링크 컬러 */
a{color: black; !important;}


/* 상품명 */
#product_name{font-size: 18px;}

/* 제목 (Merchandise) */
h2{
  font-size: 40px; !important;
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
  padding: 10px 0 2px 0;
}


/* 최신순 카테고리 오른쪽으로 */
#catergory {float: right;}

/* aside 네비바 큰 카테고리 (All, Concert) */
h3{
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
}

/* 선택박스(최신순, 인기순, 좋아요순) 디자인 */
select {
  width: 80px;
  border: none; 
  border-bottom: 2px solid black;
  font-size: 14px;
}

/* aside 네비바 텍스트 디자인 */
#pro_name {
  border: none; 
  border-bottom: 2px solid black;
}

/* aisde 네비바 큰 카테고리 밑에 여백 */
.h3_title{padding-bottom: 10px;}

/* 검색기능까지 영역 아래 여백 */
#intro_wrap{
  padding-top: 50px;
  padding-bottom: 20px;
  --border-bottom: 1px solid black;
}


/* ul 점 제거 */
ul{
  list-style:none;
  margin:0px; padding:0px;
  font-size: 20px;
}

   
/* 상품 이미지 꽉차게 */
img{object-fit: contain;}


/* 네비바 + 상품 전체 영역 */
.list_container {
  width: 100%;
  margin: 0 auto;
  padding-bottom: 0px;
}

.list_container:after {  /* after를 이용하여 float해제하기 */
  display: block;
  clear: both;
  content: '';
}


/* 상품의 네비바 영역 */
.calendar_aside {
  --position: sticky;
  --position: relative;
  top: 80;
  width: 350px;
  --padding-top: 20px;
  margin-bottom: 20px;
  float: right;
}

/* 상품 영역 */
.list_content {
  width: 70%;
  --padding-top: 10px;
  margin-bottom: 20px;
  float: left;
}
 
/* 푸터 */
.footer {
    clear: both; !important;
}

/* Go to top */
#myBtn {
  position: fixed;
  bottom: 10px;
  right: 10px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  color: black;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  background: transparent;
}
#myBtn:hover {color: #B3B6B7;}




.product-image img{
  width: 350px;
}


.cart-icon{
  display: none;
  position: absolute;
  top: 11px;
  right: 0px;
}

#detail-table td {
    vertical-align : top; !import;
	padding: 12px 30px 36px 0px;
    border-bottom: 1px solid black;
}

#reservationBtn {
  width: 294px;
  padding-top: 12px;
  padding-bottom: 12px;
  margin: 0 40px 0 29px;
  border: none;
  background-color: black;
  color: white;
}


/* 공연정보, Q&A 네비바 박스 */
.concert-content{
  border-top: 1px solid #EAEDED;
}
.content-navbar > ul li{
	font-size: 18px;
	display: inline-block;
	padding: 0 15px 10px 15px;
}
/* 콘서트포스터 밑에 하트 아이콘 */
.heart-icon{
padding-top: 10px;
}

.likecnt{
line-height : 10px;
}

/* 콘서트 정보 */
.concert-inform{
  width: 1000px;
  height: 6700px;
  margin: 0 auto;
  margin-top: 50px;
  --background-color: lightgreen;
}


</style>






<!-- 본문영역 -->
${mem_grade == null}

<button onclick="topFunction()" id="myBtn" title="Go to top" style="font-size: 26px;">Go to top ↑</button>

<!-- 선예매 hidden 값 -->
<input type="hidden" name="earlybird" value="${earlybird}" />
<!-- <c:if test="${earlybird == 0}"></c:if> --> <!-- 선예매 날짜 아님 -->
<!-- <c:if test="${earlybird == 1}"></c:if> --> <!-- 선예매 날짜임 -->

<!-- c_no hidden 값 -->
<input type="hidden" name="c_no" value="${concert.c_no}" />


<div class="wrapAll">
	
		<!-- intro_wrap 시작 -->
		<div id="intro_wrap">
			<!-- 공연 제목 -->
			<div class="concert-genre" style="padding-left: 2px;">
			<c:choose>
       			<c:when test="${concert.genre == 'A'}"> Alternative </c:when>
       			<c:when test="${concert.genre == 'P'}"> POP </c:when>
       			<c:when test="${concert.genre == 'E'}"> Electronica </c:when>
       			<c:when test="${concert.genre == 'C'}"> Classic </c:when>
       		</c:choose>
       		</div>
			<h2> ${concert.title} </h2>
			<div  style="padding-left: 2px;" >
				<!-- 날짜 포맷 변경 -->
				<input type="hidden" name="concertDate" value="${concert.date}"/>
				<fmt:parseDate var="regDate" value="${concert.date}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${regDate}" pattern="yyyy. MM. dd"/>
				<!-- 날짜 포맷 변경 종료 -->
			</div>
		
		</div><!-- intro_wrap 끝 -->	

		<!-- list_container 시작 -->
		<div class="list_container">
		
			
			
			<!-- list_content 시작 -->
			<div class="list_content">

				<table id="detail-table">
					<tr>

						<td id="product_box" style="border-bottom: 0; padding-right: 90px;">
							<!-- 상품 이미지 -->
							<div class="product-imageandicon">
											
								<div class="product-image">
									<%-- <a href="detail/${row.pro_no}"><img src="/storage/${row.postername}" width="300px" height="400px"></a> --%>
									<img src="/storage/${concert.postername}">
								</div>
							</div>
							
							
							
							
							
							<!-- 하트 아이콘 -->
							
							<!-- 비회원은 비어있는 하트만 -->
							<c:if test="${mem_grade == null}">
								<div class="heart-icon"> 
										<img id="heart" src="/images/heart-192x192_1.svg"/>
									<span class="likecnt">${concert.likecnt}</span>
									</div>
							</c:if>	
							
							
							<!-- 회원은 하트 클릭할 수 있도록 -->
							<c:if test="${mem_grade != null}">
								<div class="heart-icon"> 
										<img id="heart" src="/images/heart-192x192_1.svg"/>
									<span class="likecnt">${concert.likecnt}</span>
									</div>
							</c:if>	
							
						</td>	
						
						
						
						
						
						<td style="border-bottom: 0; padding-right: 60px;">
							<div>
								<table style="width: 360px;">
									<!-- 장소 -->
									<tr>
									<div id="concert-jangso" style="border-top: 1px solid black; margin-top: 1px;">
										<td style="font-weight: 600"> 장소 </td>
										<td href="#">
											<c:choose>
								     			<c:when test="${concert.j_id == 'yes24'}"> yes24 라이브홀 </c:when>
								     			<c:when test="${concert.j_id == 'bluesquare'}"> 블루스퀘어 마스터홀 </c:when>
								     		</c:choose>
										</td>
									</div>
									</tr>
										
									<!-- 관람시간 -->
									<tr>		
									<div id="concert-time">
										<td style="font-weight: 600"> 관람시간 </td>
										<td href="#">
										<div style="padding-bottom: 7px;">
											<!-- 날짜 포맷 변경 -->
											<fmt:parseDate var="regDate" value="${concert.date}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${regDate}" pattern="yyyy. MM. dd (E)"/>
											<!-- 날짜 포맷 변경 종료 -->
										
										</div>
										<div>
										<fmt:formatDate value="${concert.start_time}" type="time" pattern="a hh:mm" /> -
										<fmt:formatDate value="${concert.end_time}" type="time" pattern="hh:mm" />						
										</div>
									</div>
									</tr>
									
									<!-- 관람연령 -->
									<tr>		
									<div id="concert-age">
										<td style="font-weight: 600"> 관람연령 </td>
										<td href="#">${concert.watch_age}</td>
									</div>
									</tr>
									
									<!-- 관람가격 -->
									<tr>		
									<div id="concert-price">
										<td style="font-weight: 600"> 가격 </td>
										<td href="#">
										<div style="padding-bottom: 7px;">
											스탠딩석 
											<fmt:formatNumber value="${concert.price}" pattern="#,###" /> 원
										</div>
										<div>
											지정석
											<fmt:formatNumber value="${concert.price}" pattern="#,###" /> 원
										</div>
										</td>
									</div>
									</tr>	
									
									<!-- 배송정보 -->
									<tr>		
									<div id="concert-deliver">
										<td style="font-weight: 600"> 배송 </td>
										<td href="#">
											<!-- 날짜 포맷 변경 -->
											<fmt:parseDate var="regDate" value="${concert.dlv_date}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${regDate}" pattern="yyyy. MM. dd"/>
											<!-- 날짜 포맷 변경 종료 -->
											
											<c:choose>
								     			<c:when test="${concert.dlv_date == null}"> 현장수령 </c:when>
								     		</c:choose>
										</td>
									</div>
									</tr>	
									
									<!-- 공연사 -->
									<tr>		
									<div id="concert-deliver">
										<td style="font-weight: 600"> 공연사 </td>
										<td href="#">
										<c:choose>
							     			<c:when test="${concert.com_name == '라이브네이션코리아'}"> LIVENATION </c:when>
							     			<c:when test="${concert.com_name == '긱가이드'}"> gigguide </c:when>
							     			<c:when test="${concert.com_name == '프라이빗커브'}"> PRIVATE CURVE </c:when>
								     	</c:choose>
										
										</td>
									</div>
									</tr>	
									
									
										
								</table>			
							</td>
							
							<!-- 캘린더 td 시작 -->
							<td style="border-bottom: 0; padding-top: 0;">
							<div class="calendar_aside"><!-- calendar_aside 시작 -->
							
								<!-- 캘린더 코드 -->
								    <div class="wrapper">
								      <header>
								        <p class="current-date"></p>
								        <div class="icons">
								          <span id="prev" class="material-symbols-rounded"><</span>
								          <span id="next" class="material-symbols-rounded">></span>
								        </div>
								      </header>
								      <div class="calendar">
								        <ul class="weeks">
								          <li>일</li>
								          <li>월</li>
								          <li>화</li>
								          <li>수</li>
								          <li>목</li>
								          <li>금</li>
								          <li>토</li>
								        </ul>
								        <ul class="days"></ul>
								      </div>
								    </div>
				
								<!-- 캘린더 코드 종료 -->
								
								<button id="reservationBtn" style="font-size: 18px;" > 예매하기 </button>
							     
							</div><!-- calendar_aside 끝 -->
							</td>
							<!-- 캘린더 td 끝 -->
					</tr>
				</table>   
				

						
			</div><!-- list_content -->
		</div><!-- list_container -->
	
		
		
		<div class="concert-content"></div>
		
		
		<!-- 공연 상세 이미지 -->
		<div class="concert-inform" style="text-align: center; width: 844px; height: 7630px; background-color: lightgreen;">
			<img class="edit-img" src="/storage/${concert.edit}" style="width: 800px; margin: 0 auto; padding: 22px 0 22px 0;">
		</div>
		
		

</div><!-- wrapAll end -->




<!-- ------------------------------------------------------------------------------------------ -->



<!-- The Modal -->
<div id="bookModal" class="bookModal">
	<!-- Modal content -->
	<div class="bmodal-content">
	
	    <div class="bmodal-header">
	    	<span class="closeBmodal">&times;</span>
	    	Choose your ticket
	    </div><!-- header end -->
	    
	    <div class="bmodal-body clearfix">
	    	<form name="tckfrm" method="post" action="/insert.do">
		    	<div id="mainContainer" style="--display: inline-block; float:left; overflow-y:scroll; height:540px; --margin-right:200px;">
					<!-- include 영역 시작 -->
					<%@ include file="../tickets/mainContents.jsp" %>
					<!-- include 영역 끝 -->
				</div><!-- mainContainer end -->
				
				<div class="sideContainer" id="sideContainer" style="--display: inline-block; float:right; overflow-y:scroll; height:540px; width: 364px; --background:red;">
					<!-- include 영역 시작 -->
					<%@ include file="../tickets/sideContents.jsp" %>
					<!-- include 영역 끝 -->
				</div><!-- sideContainer end -->
			</form>
	    </div><!-- body end -->
	    
	    <div class="bmodal-footer">
	      TAG Tickets and Goods
	    </div><!-- footer end -->
	</div><!-- modal-content end -->
</div><!-- modal-test end -->





<!-- 본문영역 -->



<script>
/* Go to top */
function scrollFunction() {
	let mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	$('html, body').animate({scrollTop:0}, '200');
}//scrollFunction() end



/* 캘린더 날짜 표시 */
var concertDate = `${concert.date}`;
var dateSplit = concertDate.split('-');


var concertYear = dateSplit[0];
var concertMonth = dateSplit[1];
var concertDay = dateSplit[2];


let testDate = new Date();
testYear = new Date(concertYear, concertMonth - 1, concertDay); // Sat Dec 24 2022 00:00:00 GMT+0900 (한국 표준시)
//alert(testYear);

let concertdateYear = testYear.getFullYear(); //2022
let concertdateMonth = testYear.getMonth(); //12월
let concertdateDate = testYear.getDate(); //

//alert("concertdateDate : " + concertdateDate);



/* 좋아요 클릭 */
 

$(document).ready(function(){
	
	let c_no = "${concert.c_no}";
	let likecnt = "${concert.likecnt}";
	
	// likecnt가 0 이상이면 채워져있는 하트아이콘 출력하기
	
	
/* 	if (likecnt > 0) {
		$("#heart").prop("src", "/images/heart-192x192_2.svg");
	}else {
		$("#heart").prop("src", "/images/heart-192x192_1.svg");
} */
 
 
	var flag = false;

	$("#heart").click(function(){
		
		if(flag==false) {
			$("#heart").prop("src", "/images/heart-192x192_2.svg");
			flag = true;
			alert("flag=true? : "+flag);
		}else if(flag==true) {
			$("#heart").prop("src", "/images/heart-192x192_1.svg");
			flag = false;
			alert("flag=false? : "+flag);
		}

	});

});











/* 모달창 ------------------------------------------------------------------------------------------------ */

//modal test
//Get the modal
var modal = document.getElementById("bookModal");

//Get the button that opens the modal
var openBmodal = document.getElementById("reservationBtn");

//Get the <span> element that closes the modal
var closeBmodal = document.getElementsByClassName("closeBmodal")[0];

//When the user clicks the button, open the modal 
openBmodal.onclick = function() {
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
closeBmodal.onclick = function() {
modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
 modal.style.display = "none";
}
}

//페이지가 로딩되면 처음으로 불러올 페이지 설정
$(document).ready(function(){
	//MainContainer에서
	$("#map1Fjsp").css("display", "block");
	$("#map2Fjsp").css("display", "none");
	$("#ticketSalejsp").css("display", "none");
	$("#ticketDeliveryjsp").css("display", "none");
	
	//SideContainer에서
	$("#seatAddFormjsp").css("display", "block");
	$("#ticketAddFormjsp").css("display", "none");
	
	//map1층 버튼 비활성화
	$("#map1F").attr("disabled", true);
	
	//button컨트롤
	$("#goSaddForm").css("display", "inline-block;"); //이전단계1
	$("#goSale").css("display", "none"); //이전단계2
	$("#goDlv").css("display", "inline-block;"); //다음단계1
	$("#goFinish").css("display", "none"); //결제완료
	
});//ready() end


//좌석선택완료버튼 2.가격할인으로
$("body").on('click', '#goTaddForm', function(){
	//MainContainer에서
	$("#map1Fjsp").css("display", "none");
	$("#map2Fjsp").css("display", "none");
	$("#ticketSalejsp").css("display", "block");
	
	//SideContainer에서
	$("#seatAddFormjsp").css("display", "none");
	$("#ticketAddFormjsp").css("display", "block");
	
	ticketCal(); //가격 계산
	saleDefault(); //할인 정보 설정

});//click() end

//다음버튼 3.배송현장수령으로
$("body").on('click', '#goDlv', function(){ 
	//mainContainer에서
	$("#ticketSalejsp").css("display", "none");
	$("#ticketDeliveryjsp").css("display", "block");
	
	//SideContainer에서
	//$("#seatAddFormjsp").css("display", "none");
	$("#ticketAddFormjsp").css("display", "block");
	
	//button컨트롤
	$("#goSaddForm").css("display", "none"); //이전단계1
	$("#goSale").css("display", "inline-block"); //이전단계2
	$("#goDlv").css("display", "none"); //다음단계1
	$("#goFinish").css("display", "inline-block"); //결제완료
	
	//배송선택페이지 디폴트값으로
	deliverDefault();
});//click() end

//이전버튼 1.좌석선택으로
$("body").on('click', '#goSaddForm', function(){ 
	//mainContainer에서
	$("#map1Fjsp").css("display", "block");
	$("#ticketSalejsp").css("display", "none");
	
	//SideContainer에서
	$("#seatAddFormjsp").css("display", "block");
	$("#ticketAddFormjsp").css("display", "none");
	
	//map버튼
	$("#map1F").attr("disabled", true);
	$("#map2F").attr("disabled", false);
});//click() end

//이전버튼 2.가격할인으로
$("body").on('click', '#goSale', function(){ 
	//mainContainer에서
	$("#ticketSalejsp").css("display", "block");
	$("#ticketDeliveryjsp").css("display", "none");
	
	//SideContainer에서
	//$("#seatAddFormjsp").css("display", "block");
	//$("#ticketAddFormjsp").css("display", "none");
	
	//button컨트롤
	$("#goSaddForm").css("display", "inline-block"); //이전단계1
	$("#goSale").css("display", "none"); //이전단계2
	$("#goDlv").css("display", "inline-block"); //다음단계1
	$("#goFinish").css("display", "none"); //결제완료
});//click() end



/* ------------------------ test start ---------------------------------- */


/* ------------------------ test end ---------------------------------- */




//전역변수 선언
var flagsA = new Array(826); //좌석tb의 좌석개수+1 (배열[0]번째는 쓰지않는다)
var flagsB = new Array(826);
var flagsX = new Array(86);
var flagsY = new Array(168);
var flagsZ = new Array(86);

//flags 초기 설정
//A구역
for(let i = 0; i < flagsA.length; i++){
	flagsA[i] = true;
}//for end
//B구역
for(let i = 0; i < flagsB.length; i++){
	flagsB[i] = true;
}//for end
//X구역
for(let i = 0; i < flagsX.length; i++){
	flagsX[i] = true;
}//for end
//Y구역
for(let i = 0; i < flagsY.length; i++){
	flagsY[i] = true;
}//for end
//Z구역
for(let i = 0; i < flagsZ.length; i++){
	flagsZ[i] = true;
}//for end

//A,B구역 전체 R등급
for(let i = 1; i < flagsA.length; i++){ 
	//css 등급별 색깔 적용
	$("#btnA"+i).addClass("StandingR");
	$("#btnB"+i).addClass("StandingR");
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsA[i]){//false이면
		$("#btnA"+i).addClass("on");
	}//if end
	if(!flagsB[i]){//false이면
		$("#btnB"+i).addClass("on");
	}//if end
}//for end

//X구역 R등급, S등급, A등급
for(let i = 1; i < flagsX.length; i++){ 
	if(i <= 29){
		$("#btnX"+i).addClass("R");
		//$("#btnX"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 29 && i <= 76){
		$("#btnX"+i).addClass("S");
		//$("#btnX"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 76){
		$("#btnX"+i).addClass("A");
		//$("#btnX"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsX[i]){//false이면
		$("#btnX"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsY.length; i++){ //Y구역 R등급, S등급, A등급
	if(i <= 43){
		$("#btnY"+i).addClass("R");
		//$("#btnY"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 43 && i <= 145){
		$("#btnY"+i).addClass("S");
		//$("#btnY"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 145){
		$("#btnY"+i).addClass("A");
		//$("#btnY"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsY[i]){//false이면
		$("#btnY"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsZ.length; i++){ //Z구역 R등급, S등급, A등급
	if(i <= 29){
		$("#btnZ"+i).addClass("R");
		//$("#btnZ"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 29 && i <= 76){
		$("#btnZ"+i).addClass("S");
		//$("#btnZ"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 76){
		$("#btnZ"+i).addClass("A");
		//$("#btnZ"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end

	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsZ[i]){//false이면
		$("#btnZ"+i).addClass("on");
	}//if end
}//for end





//미니맵 1층 버튼을 누르면
$("body").on('click', '#map1F', function(){ //map1F버튼 id받아오기
	//MainContainer에서
	$("#map1Fjsp").css("display", "block");
	$("#map2Fjsp").css("display", "none");
	
	$("#map1F").attr("disabled", true);
	$("#map2F").attr("disabled", false);
});//click() end

//미니맵 2층 버튼을 누르면
$("body").on('click', '#map2F', function(){ //map2F버튼 id받아오기
	//MainContainer에서
	$("#map1Fjsp").css("display", "none");
	$("#map2Fjsp").css("display", "block");
	
	$("#map2F").attr("disabled", true);
	$("#map1F").attr("disabled", false);
});//click() end





//스탠딩 좌석 추가와 삭제
function standAdd(SeatNum, section, flagNum){ //좌석번호, 구역이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	
	switch (section){
		case "A" : 
			if(flagsA[flagNum]){ //좌석을 선택할 때
				flagsA[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsA[flagNum]=true; swt=false; break;
			}//if end
		case "B" : 
			if(flagsB[flagNum]){ //좌석을 선택할 때
				flagsB[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsB[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' readonly value='";
		input += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(input); //<div id="panel">안에 <input class=input+section+flagNum></input> 생성
		
		let input2="";
		input2 += "<input type='text' class='input";
		input2 += 									section+flagNum;
		input2 += 	"' name='cseat' readonly value='";
		input2 += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input2 += "'>";
		$("#addedSeat").append(input2);
		
		countSeats(); //좌석수 계산하기
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("input").remove(".input"+section+flagNum); //<input class=input+section+flagNum></input> 제거
		countSeats(); //좌석수 계산하기
	}//if end
}//standAdd() end




//지정좌석 추가와 삭제
function rseatAdd(SeatNum, section, row, flagNum){ //좌석번호, 구역이름, 열이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	var grade=$(SeatNum).attr('class'); //좌석등급을 클래스명으로 가져옴
	
	switch (section){
		case "X" : 
			if(flagsX[flagNum]){ //좌석을 선택할 때
				flagsX[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsX[flagNum]=true; swt=false; break;
			}//if end
		case "Y" : 
			if(flagsY[flagNum]){ //좌석을 선택할 때
				flagsY[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsY[flagNum]=true; swt=false; break;
			}//if end
		case "Z" : 
			if(flagsZ[flagNum]){ //좌석을 선택할 때
				flagsZ[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsZ[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' readonly value='";
		input += grade+"석 2층-"+section+"구역"+row+"열 좌석번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(input); //<div id="panel">안에 <input class=input+section+flagNum></input> 생성
		
		let input2="";
		input2 += "<input type='text' class='input";
		input2 += 									section+flagNum;
		input2 += 	"' name='cseat' readonly value='";
		input2 += grade+"석 2층-"+section+"구역"+row+"열 좌석번호-"+snum;
		input2 += "'>";
		$("#addedSeat").append(input2);
		countSeats(); //좌석수 계산하기
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("input").remove(".input"+section+flagNum); //<span class=span+str></span> 제거
		countSeats(); //좌석수 계산하기
	}//if end
}//rseatAdd() end



//다시선택 버튼을 누르면
function reSelectFN(){
	//모든 flag=true로 바꾸기
	for(let i = 0; i < flagsA.length; i++){
		flagsA[i] = true;
	}//for end
	for(let i = 0; i < flagsB.length; i++){
		flagsB[i] = true;
	}//for end
	for(let i = 0; i < flagsX.length; i++){
		flagsX[i] = true;
	}//for end
	for(let i = 0; i < flagsY.length; i++){
		flagsY[i] = true;
	}//for end
	for(let i = 0; i < flagsZ.length; i++){
		flagsZ[i] = true;
	}//for end
	
	//모든 class="on" 제거
	$("input").removeClass("on");
	
	//<div id="panel">안에 비우기
	$("#panel").empty();
	$("#addedSeat").empty();
	
	//좌석수 계산 초기화
	countSeats();
}//reSelectFN()



//선택한 좌석 수 계산하기
function countSeats(){
	let cntSeats=$("#panel").children().length;
	//$("#seatCnt").val("총 0석 선택하였습니다");
	$("#seatCnt").val("총 "+cntSeats+"석 선택하였습니다");
}//countSeats() end




/* ------------------------ 가격계산 start ---------------------------------- */

//전역변수 선언
var cntT=0;//총 석 개수
var cntR=0;//R석 개수
var cntS=0;//S석 개수
var cntA=0;//A석 개수

//등급당 가격 선언
let priceR = $("#R").val(); //88000
let priceS = $("#S").val(); //77000
let priceA = $("#A").val(); //66000

//총결제금액
function ticketCal(){
	//변수선언
	var ticketPrc 	 = ticketPrice(); //좌석 총 금액
	var discountPrcR = 0; //R석 할인 금액
	var discountPrcS = 0; //R석 할인 금액
	var discountPrcA = 0; //R석 할인 금액
	var deliveryPrc  = 0; //배송 금액
	var discountPrcT = 0; //총 할인 금액
	var totalPrc 	 = 0; //총 결제 금액
	
	//할인내용
	var Jhal = 0; //장애인할인 매수
	var Khal = 0; //국가유공자할인 매수
	
	//할인 계산하기
	//R
	switch($("select[name='disSelectR']").val()){
		case "N" : break;
		case "J" : 
			Jhal += $("select[name='disCntR']").val()*1; //R석 중에 J를 선택했다면 매수를 가져온다
			discountPrcR += $("select[name='disCntR']").val() * priceR * 0.3; 
			break; //2매 * R가격 * 30%
		case "K" : 
			Khal += $("select[name='disCntR']").val()*1; //R석 중에 K를 선택했다면 매수를 가져온다
			discountPrcR += $("select[name='disCntR']").val() * priceR * 0.3; break;	//2매 * R가격 * 30%
	}//switch end
	//S
	switch($("select[name='disSelectS']").val()){
		case "N" : break;
		case "J" : 
			Jhal += $("select[name='disCntS']").val()*1; //S석 중에 J를 선택했다면 매수를 가져온다
			discountPrcS += $("select[name='disCntS']").val() * priceS * 0.3; break; //2매 * R가격 * 30%
		case "K" : 
			Khal += $("select[name='disCntS']").val()*1; //S석 중에 K를 선택했다면 매수를 가져온다
			discountPrcS += $("select[name='disCntS']").val() * priceS * 0.3; break;	//2매 * R가격 * 30%
	}//switch end
	//A
	switch($("select[name='disSelectA']").val()){
		case "N" : break;
		case "J" : 
			Jhal += $("select[name='disCntA']").val()*1; //A석 중에 J를 선택했다면 매수를 가져온다
			discountPrcA += $("select[name='disCntA']").val() * priceA * 0.3; break; //2매 * R가격 * 30%
		case "K" : 
			Khal += $("select[name='disCntA']").val()*1; //A석 중에 K를 선택했다면 매수를 가져온다
			discountPrcA += $("select[name='disCntA']").val() * priceA * 0.3; break;	//2매 * R가격 * 30%
	}//switch end
	
	//등급당 할인가격 표시
	$("#disPriceR").val(discountPrcR.toLocaleString('ko-KR')+"원"); //R석 할인금액
	$("#disPriceS").val(discountPrcS.toLocaleString('ko-KR')+"원"); //S석 할인금액
	$("#disPriceA").val(discountPrcA.toLocaleString('ko-KR')+"원"); //A석 할인금액
	
	//배송비 계산하기
	if($("#dlvBtn").is(":checked")){ //checked면 true값 반환
		deliveryPrc=3000;
		$("#dlvPrice").val(deliveryPrc.toLocaleString('ko-KR')+"원"); //배송비칸에 추가
		$("#dlvText").val("배송"); //배송비칸에 추가
	}else if($("#pUpBtn").is(":checked")){
		deliveryPrc=0;
		$("#dlvPrice").val(deliveryPrc.toLocaleString('ko-KR')+"원"); //배송비칸에 추가
		$("#dlvText").val("현장수령"); //배송비칸에 추가
	}//if end
	
	//var testDlv=$("#dlvBtn").is(":checked");
	//alert(testDlv);
	
	//최종 계산
	discountPrcT = discountPrcR + discountPrcS + discountPrcA; //총 할인 금액
	totalPrc 	 = ticketPrc - discountPrcT + deliveryPrc;	//총 금액
	
	
	$("#ticketCount").val(cntT.toLocaleString('ko-KR')+"매"); //매수 칸에 표시
	$("#originPrice").val(ticketPrc.toLocaleString('ko-KR')+"원"); //티켓 금액 칸에 표시
	$("#discountPrice").val("-"+discountPrcT.toLocaleString('ko-KR')+"원"); //총 할인 금액 칸에 표시
	$("#totalPrice").val(totalPrc.toLocaleString('ko-KR')+"원"); //총 금액 칸에 표시
	

	//input type="hidden"에 넣을 value들
	$("#cnt").val(cntT); 				//수량
	$("#order_price").val(ticketPrc); 	//주문금액
	$("#dis_price").val(discountPrcT); 	//할인금액
	$("#d_fee").val(deliveryPrc); 		//배송비
	$("#total_price").val(totalPrc); 	//최종결제금액
	
	//할인내용 계산하기
	if(Jhal == 0 && Khal == 0){ //전체할인이 없으면
		$("#dis_descrip").val("일반 기본가");
	}else if(Jhal == 0){ //장애인 할인이 없으면
		$("#dis_descrip").val("국가유공자 할인 " + Khal + "매");
	}else if(Khal == 0){ //국가유공자 할인이 없으면
		$("#dis_descrip").val("장애인 할인 " + Jhal + "매");
	}else{ //이외에 둘 다 있으면
		$("#dis_descrip").val( "장애인 할인 " + Jhal + "매, " + "국가유공자 할인 " + Khal + "매");
	}//if end
	
	
	
	
}//ticketCal() end

//티켓의 금액
function ticketPrice(){
	//변수 초기화하기
	cntT=0; //총 석 개수
	cntR=0;//R석 개수
	cntS=0;//S석 개수
	cntA=0;//A석 개수
	
	//선택한 티켓 갯수 가져오기
	let mySeats=$("#panel").children();
	
	//변수 담기
	var sum=0; //합계 금액
	cntT=mySeats.length; //총 석 개수
	
	//alert(mySeats.length);
	//alert(mySeats.eq(0).val());
	//alert(mySeats.eq(1).val());
	
	for(i=0; i<=mySeats.length-1; i++){
		var mySeatGrade=mySeats.eq(i).val().substr(0,1);
		//alert(mySeats.eq(i).val()); //R석 1층-스탠딩B구역 입장번호-150
		//alert(mySeatGrade); //R
		
		switch(mySeatGrade){
			case 'R' : sum += priceR; cntR++; break;
			case 'S' : sum += priceS; cntS++; break;
			case 'A' : sum += priceA; cntA++; break;
		}//switch end\
	}//for end
	
	return sum;
	
	/*
	return {
	         sum : sum
			,cntT : cntT
	        ,cntR : cntR
	        ,cntS : cntS
	        ,cntA : cntA
 };
 */
}//ticketPrice() end


//할인 페이지 설정
function saleDefault(){
	let saleTypeR = $("select[name='disSelectR']"); //select태그 할인종류 R석
	let saleTypeS = $("select[name='disSelectS']");
	let saleTypeA = $("select[name='disSelectA']");
	let saleCntR = $("select[name='disCntR']"); //select태그 할인매수 R석
	let saleCntS = $("select[name='disCntS']");
	let saleCntA = $("select[name='disCntA']");
	let saleDesR = $("#disDesR");
	let saleDesS = $("#disDesS");
	let saleDesA = $("#disDesA");

	//옵션 초기화
	saleCntR.empty();
	saleCntR.append("<option value='0'>-선택없음-</option>");
	
	saleCntS.empty();
	saleCntS.append("<option value='0'>-선택없음-</option>");
	
	saleCntA.empty();
	saleCntA.append("<option value='0'>-선택없음-</option>");
	
	//해당등급에서 선택한 좌석 개수만큼 옵션 append
	//R석 할인정보
	for(i=1; i<=cntR; i++){
		saleCntR.append("<option value='" + i + "'>" + i + "매</option>");
	}//for end
	//S석 할인정보
	for(i=1; i<=cntS; i++){
		saleCntS.append("<option value='" + i + "'>" + i + "매</option>");
	}//for end
	//A석 할인정보
	for(i=1; i<=cntA; i++){
		saleCntA.append("<option value='" + i + "'>" + i + "매</option>");
	}//for end

	//기본값 부여
	saleTypeR.val("N"); //종류 선택 없음
	saleCntR.attr("disabled", true); //매수 선택 없음
	saleCntR.val("0"); //매수 선택 없음
	saleDesR.val("일반 기본가");
	
	saleTypeS.val("N");
	saleCntS.attr("disabled", true);
	saleCntS.val("0");
	saleDesS.val("일반 기본가");
	
	saleTypeA.val("N");
	saleCntA.attr("disabled", true);
	saleCntA.val("0");
	saleDesA.val("일반 기본가");
	
	//할인된 가격 초기화
	$("#disPriceR").val("0원"); //R석 할인금액
	$("#disPriceS").val("0원"); //S석 할인금액
	$("#disPriceA").val("0원"); //A석 할인금액
	$("#discountPrice").val("0원"); //총 할인 금액 칸에 표시
}//saleDefault() end



//할인 선택을 바꾸면
//R등급
$("select[name='disSelectR']").on("change", function(){
	//alert("바뀜~");
	if($("select[name='disSelectR']").val()=="N"){ //일반
		$("select[name='disCntR']").attr("disabled", true);
		$("#disDesR").val("일반 기본가");
		$("select[name='disCntR']").val("0"); //매수 선택 없음
	}else{
		$("select[name='disCntR']").attr("disabled", false);
		$("#disDesR").val("30% 할인");
	}//if end
	ticketCal();
});//change() end
//S등급
$("select[name='disSelectS']").on("change", function(){
	//alert("바뀜~");
	if($("select[name='disSelectS']").val()=="N"){
		$("select[name='disCntS']").attr("disabled", true);
		$("#disDesS").val("일반 기본가");
		$("select[name='disCntS']").val("0"); //매수 선택 없음
	}else{
		$("select[name='disCntS']").attr("disabled", false);
		$("#disDesS").val("30% 할인");
	}//if end
	ticketCal();
});//change() end
//A등급
$("select[name='disSelectA']").on("change", function(){
	//alert("바뀜~");
	if($("select[name='disSelectA']").val()=="N"){
		$("select[name='disCntA']").attr("disabled", true);
		$("#disDesA").val("일반 기본가");
		$("select[name='disCntA']").val("0"); //매수 선택 없음
	}else{
		$("select[name='disCntA']").attr("disabled", false);
		$("#disDesA").val("30% 할인");
	}//if end
	ticketCal();
});//change() end

//할인 매수를 바꾸면
//R등급
$("select[name='disCntR']").on("change", function(){
	ticketCal();
});//change() end
//S등급
$("select[name='disCntS']").on("change", function(){
	ticketCal();
});//change() end
//A등급
$("select[name='disCntA']").on("change", function(){
	ticketCal();
});//change() end

//배송 페이지 디폴트 설정
function deliverDefault(){
	$("#rec_addr").attr("disabled", true); //주소창 비활성화
	$("#msg").attr("disabled", true); //배송메세지 비활성화
	$("#dlvBtn").removeAttr("checked"); //배송 비활성화
	$("#pUpBtn").prop("checked", true); //현장수령 활성화
	$("#dlvPrice").val("0원"); //배송비칸에 현장수령 금액 표시
	$("#dlvText").val("현장수령"); //배송비칸 현장수령 표시
}//dlvDefault() end


//배송을 선택하면
function dlvSelected(){
	$("#rec_addr").attr("disabled", false);
	$("#msg").attr("disabled", false);
	ticketCal();
}//selectDelivery() end

//현장수령을 선택하면
function pUpSelected(){
	$("#rec_addr").attr("disabled", true);
	$("#msg").attr("disabled", true);
	ticketCal();
}//selectDelivery() end




/* ------------------------ 가격계산 end ---------------------------------- */




/* 모달창 끝 ------------------------------------------------------------------------------------------------ */





</script>

<%@ include file="../footer.jsp" %>