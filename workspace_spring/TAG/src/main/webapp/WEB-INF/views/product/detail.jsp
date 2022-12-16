<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문영역 -->

<!-- 
<div id="catergory" style="font-size: 13px; height: 50px; padding-top: 10px; font-weight: bold;"> 
	<span><a>POSTER</a></span>
	/
	<span><a>CLOTHES</a></span>
	/
	<span><a>ALBUM</a></span>
	/
	<span style="color:lightgreen"><a>ACC</a></span>
</div>
 -->
<div id="productinfo" style="height: 547px; padding: 0 20px 0 20px; margin-top: 50px;">
	<div style="width:547px; height:547px; overflow: hidden; float: left; margin:0 auto;">
		<img src="/storage/johnnystimson9.png" style="width:100%; height:100%; object-fit:cover;">
	</div><!-- product image -->

	<div id="rightside" style=" display: inline-block; text-align: left; padding-left: 50px; width: 630px;">
		<p style="font-size:15px; padding-top:50px; color:lightgreen; margin-bottom: 0px;">Live Nation Korea</p>
		<p style="font-size:30px; font-weight: bold; width: 100%;">Harry's House Limited Edition White Cassette</p>
		
		<div id="priceinfo" style="text-align:right; padding-right: 40px; padding-top: 15px;"> 
			<span style="font-size:15px; margin-bottom:0;"> ￦ </span> 
			<p style="display:inline-block; font-size:25px; margin-bottom:0; font-weight: 500;"> 32,000 </p>
			<p style="font-size:13px; color:gray; font-weight: 400;"> ＋ 320P (1%)</p>
		</div><!-- priceinfo -->
		
		<div id="deliveryinfo" style="padding-top: 30px; padding-right: 40px; font-size: 14px;">
			<p style="border-bottom: 1px solid black;">Delivery Info</p>
			
			<span> 출고 정보 </span> 
				<label id="delinfo" style="cursor: pointer;">
					<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="16" height="16" viewBox="0 0 16 16">
					<path d="M 7.5 1 C 3.917969 1 1 3.917969 1 7.5 C 1 11.082031 3.917969 14 7.5 14 C 11.082031 14 14 
							11.082031 14 7.5 C 14 3.917969 11.082031 1 7.5 1 Z M 7.5 2 C 10.542969 2 13 4.457031 13 
							7.5 C 13 10.542969 10.542969 13 7.5 13 C 4.457031 13 2 10.542969 2 7.5 C 2 4.457031 
							4.457031 2 7.5 2 Z M 7 4 L 7 5 L 8 5 L 8 4 Z M 7 6 L 7 11 L 8 11 L 8 6 Z"></path>
					</svg>
				</label><!-- info icon -->
				
			<span style="margin-left: 70px;"> 오늘 주문 시 <strong>내일</strong> 출고 </span>
			
				<div class="info_popup" style="display: none; z-index: 2; position: absolute;">
					판매자가 설정한 정보로, 업체 및 상품상황에 따라 변경될 수 있습니다. 
					<br>주말, 공휴일 및 업체 휴무일 제외한 평일(영업일) 기준 일자 입니다.
				</div><!-- popup message -->
			<br>
			<div style="position: relative; z-index: 1;">
				<span> 배송 방법 </span>
				<span style="margin-left: 90px; font-weight: bold;"> 국내 배송 / 입점사 배송 </span>
			</div>	
		</div><!-- deliveryinfo -->

        <div id="quantity" style="border:1px solid black; margin-top: 30px;">				
	        <div class="plus" style="display: inline-block;"><a href="javascript:change_qty2('p')"> + </a></div>
	        <input type="text" name="ct_qty" id="ct_qty" value="1" readonly="readonly" style="display: inline-block;">
	        <div class="minus" style="display: inline-block;"><a href="javascript:change_qty2('m')" > - </a></div>
	     	<br>
	     	<span> 총 금액 </span>  <div id="total_amount" style="display: inline-block;">74,000</div>
		</div>	<!-- quantity -->

	</div><!-- rightside -->
</div><!-- productinfo -->

<!-- 본문영역 -->

<script>
	$("#delinfo").click(function(){		
		if($(".info_popup").css("display") == "none"){
		    $(".info_popup").show();
		} else {
		    $(".info_popup").hide();
		}
	})// end
	

	Number.prototype.format = function(){
	  if(this==0) return 0;

	  var reg = /(^[+-]?\d+)(\d{3})/;
	  var n = (this + '');

	  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	  return n;
	};
	 

	String.prototype.format = function(){
	  var num = parseFloat(this);
	  if( isNaN(num) ) return "0";

	  return num.format();
	};
	    
	var basic_amount = parseInt('74000');

	function change_qty2(t){
	  //var min_qty = '수량버튼'*1;
	  var min_qty = 1;
	  var this_qty = $("#ct_qty").val()*1;
	  var max_qty = '200'; // 현재 재고
	  if(t=="m"){
	    this_qty -= 1;
	    if(this_qty<min_qty){
	      //alert("최소구매수량 이상만 구매할 수 있습니다.");
	      alert("수량은 1개 이상 입력해 주십시오.");
	      return;
	      }
	    }
	    else if(t=="p"){
	      this_qty += 1;
	      if(this_qty>max_qty){
	        alert("죄송합니다. 재고가 부족합니다.");
	        return;
	        }
	    }

	  var show_total_amount = basic_amount * this_qty;
	  //$("#ct_qty_txt").text(this_qty); 
	  $("#ct_qty").val(this_qty);
	  $("#it_pay").val(show_total_amount);
	  $("#total_amount").html(show_total_amount.format());
	}


</script>

<%@ include file="../footer.jsp" %>