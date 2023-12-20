<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<link rel="stylesheet" href="${cpath }/styles/fundingMain.css" />

<div class="myproject-mx9">
	<div class="auto-group-15mw-HvV">
		<p class="item--RG1">나의 프로젝트를 확인해보세요</p>
		<div
			class="${hasAuctionWaiting > 0 ? 'auctionmessage-iku ':'auctionmessage-iku hidden' }">
			<p class="item--fRF">현재 경매대기 중인 프로젝트가 있어요! 경매하기 버튼</p>
			<img class="updatebtn-t37" src="${cpath }/assets/updatebtn-Rt1.png" />
			<p class="item--fRF-1">통해 얼른 경매에 참여해 보세요.</p>
		</div>
	</div>
	<div class="fundinglistheader-mch">
		<p class="item--hFT">상품 정보</p>
		<p class="item--BwK">등록일</p>
		<p class="item--WTo">펀딩 달성률</p>
		<p class="item--dHX">최고 입찰가</p>
		<p class="item--x4u">진행 상태</p>
	</div>

	<c:forEach items="${projectList }" var="projectItem" varStatus="status">

		<div class="fundinglist1-5vD">
			<p class="hidden" id="serial_num${status.index }">${projectItem.product_serial_num }</p>
			<div class="fundinginfo-yVo">
				<img class="tomatoes-55667411280-Jny" id="tomatoes-55667411280-Jny${status.index }"
					src="${projectItem.auction_thumb_img_url }" />
				<div class="auto-group-pee9-aVb">
					<p class="item--6iq" id="item--6iq${status.index }">${projectItem.product_name }</p>
					<p class="item--QDj" id="item--QDj${status.index }">${projectItem.farm_name }</p>
					<div class="auto-group-7bph-j17">
						<img class="mdi-location-rLd" src="./assets/mdi-location-mMX.png" />
						<p class="item--b3K" id="item--b3K${status.index }">${projectItem.farm_address }</p>
					</div>
				</div>
			</div>
			<p class="fundingdate-V8h">${projectItem.product_regdate }</p>
			<%-- <div class="fundingpct-ntV">${projectItem.funding_pct }%</div> --%>
			<div id="chart${status.index }" class="fundingpct-ntV"></div>
			<p class="fundingpay-r7f">${projectItem.max_price }</p>
			<div
				class="${projectItem.product_status.contains('실패')?'fundingstate-9cZ-1':'fundingstate-9cZ' }">${projectItem.product_status }</div>
			<button onclick="goUpdateCultivate(${status.index })">
				<img
					class="${projectItem.product_status=='경작중'?'updatebtn-zrh':'updatebtn-zrh hidden' }"
					src="${cpath}/assets/updatebtn-Eq3.png" />
			</button>
			<button onclick="goRegAuction(${status.index })">
				<img
					class="${projectItem.product_status=='경매대기중'?'updatebtn-eXF':'updatebtn-eXF hidden' }"
					src="${cpath}/assets/updatebtn.png" />
			</button>
		</div>

	
	<script>

	/*도넛 차트*/
	var seriesData${status.index} = [${projectItem.funding_pct}];
	var options${status.index} = {
	        series: seriesData${status.index},
	        chart: {
	            height: 150,
	            width: 150,
	            type: 'radialBar',
	        },
	        plotOptions: {
	            radialBar: {
	                hollow: {
	                    size: '50%',
	                },
	                /* track: {
	                    dropShadow: {
	                      enabled: true,
	                      top: 0.5,
	                      left: 0,
	                      blur: 1,
	                      opacity: 0.04
	                    }
	                  }, */
	                dataLabels: {
	                    showOn: "always",
	                    name: {
	                      show: false,
	                      color: "#64A346",
	                      fontSize: "13px"
	                    },
	                    value: {
	                    	offsetY: 8,
	                      color: "#64A346",
	                      fontSize: "16px",
	                      show: true,
	                      fontWeight: "bold",
	                      fontFamily: 'Pretendard, Source Sans Pro'
	                    }
	                  }
	            },
	        },
	        labels: [  ],
	        fill: {
	        	colors: ['#64A346'],
	        },
	        stroke:{
	        	lineCap: "round",
	        	width:2,
	        },
	        
	    };
	
	var chart${status.index} = new ApexCharts(document.querySelector("#chart${status.index}"), options${status.index});
	chart${status.index}.render();
	
	/*goUpdateCultivate btn 클릭 시*/
	function goUpdateCultivate(currentIndex){
		
		console.log(currentIndex);
		
		var product_serial_num = $("#serial_num" + currentIndex).text();
		var product_name = $("#item--6iq" + currentIndex).text();
		var farm_name = $("#item--QDj" + currentIndex).text();
		var farm_address = $("#item--b3K" + currentIndex).text();
		var imgurl = $("#tomatoes-55667411280-Jny" + currentIndex).attr("src");
		
		
		$.ajax({
            url : '/myPageFarmer/showUpdateCultivate',
            type : 'POST',
            contentType : 'application/json',
            data : JSON.stringify({
               "product_serial_num" : product_serial_num,
               "product_name" : product_name,
               "farm_name" : farm_name,
               "farm_address" : farm_address,
               "imgurl" : imgurl
            }),
            success : function(response) {
            	$("#here").html(responseData);
            },
            error : function(error) {
               console.log(error);
            }
         });

	}
	
	/*goRegAuction btn 클릭 시*/
	function goRegAuction(currentIndex){		
		var product_serial_num = $("#serial_num" + currentIndex).text();
		var product_name = $("#item--6iq" + currentIndex).text();
		var farm_name = $("#item--QDj" + currentIndex).text();
		var farm_address = $("#item--b3K" + currentIndex).text();
		var imgurl = $("#tomatoes-55667411280-Jny" + currentIndex).attr("src");
		
		
		$.ajax({
            url : '/myPageFarmer/showRegAuction',
            type : 'POST',
            contentType : 'application/json',
            data : JSON.stringify({
               "product_serial_num" : product_serial_num,
               "product_name" : product_name,
               "farm_name" : farm_name,
               "farm_address" : farm_address,
               "imgurl" : imgurl
            }),
            success : function(response) {
            	$("#here").html(response);
            },
            error : function(error) {
               console.log(error);
            }
         });

	}
	
	</script>
</c:forEach>
</div>

