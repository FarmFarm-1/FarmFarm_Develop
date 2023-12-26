<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/첫페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<link rel="stylesheet" href="${cpath }/styles/mainpage.css" />
</head>

<body>

	<form action="/manuallyInputCropsData" method="get">
		<input type="text" name="date"> <input type="submit"
			value="cropsDataManuallyInput BY HS">
	</form>

	<jsp:include page="header.jsp" />


	<!-- front -->
	<div class="mainpage--A2H scroll_wrap">
		<div class="section1-L5B">
			<div class="pexels-flambo-1112080-1-T3K"></div>
			<div class="rectangle-208-VVo"></div>
			<div class="rectangle-206-1yw"></div>
			<div class="text-idT">
				<div class="rectangle-72-FdP"></div>
				<p class="item--xXo">
					<span class="item--xXo-sub-0"> 농산물의 주인이 되는 가장 쉬운 방법 <br />

					</span> <span class="item--xXo-sub-1">농산물펀딩플랫폼</span> <span
						class="item--xXo-sub-2"> </span> <span class="item--xXo-sub-3">
						팜팜 <br />

					</span>
				</p>
			</div>
			<a href="javascript:void(0);"
				onclick="scrollToSection('section2-WWh');"><img
				class="mingcute-down-line-Pgy" src="${cpath }/assets/down-line.png" /></a>
		</div>
		<div class="section2-WWh">
			<p class="item--drD">
				농작물 펀딩부터 경매까지 한 곳에서 경험하세요. <br /> 팜팜과 함께하는 농작물 펀딩이 <br /> 당신의 자산에
				새로움을 불어넣습니다.
			</p>
		</div>
		<div class="section31-oPK">
			<div class="scroll_on">
				<p class="item--XKK">신뢰</p>
				<p class="item--pZK">
					성장 가능성 확인하여 <br /> 투자를 똑똑하게
				</p>
			</div>
			<div class="auto-group-gf1f-4yT">
				<div class="section31mockup-NDT scroll_on">
					<img class="rectangle-JN1"
						src="${capth }/assets/section3_mockup1.png"> <img
						class="rectangle-Mr5" src="${cpath }/assets/section3_mockup2.png">
				</div>
				<div class="item-1-1--vGu scroll_on">
					펀딩 전 파머와 1:1 채팅을 통해 문의해 보세요. <br /> 농작물 및 재배 정보는 기본, <br /> 펀딩 관련
					정보를 꼼꼼히 체크해 볼 수 있어요.
				</div>
			</div>
		</div>
		<div class="section32-Tw3">
			<p class="item--C7w scroll_on">경매</p>
			<div class="auto-group-1e85-uo3">

				<div class="auto-group-xa6r-TZf">
					<p class="item-1--PiD scroll_on">
						여러 농작물의 시세 정보를 <br /> 1분 만에 <br /> 확인해보세요
					</p>
					<p class="item--jvV scroll_on">수익은 높게,</p>
					<p class="item--ovM scroll_on">
						<span class="item--ovM-sub-0">위험은 </span> <span
							class="item--ovM-sub-1">낮게,</span>
					</p>
					<p class="item--heM scroll_on">
						<span class="item--heM-sub-0">부담은 </span> <span
							class="item--heM-sub-1">적게.</span>
					</p>
					<div class="kamis--5PK scroll_on">
						<span class="kamis--5PK-sub-0"> 팜팜은 농산물 유통정보 플랫폼 KAMIS에서 <br />
							제공하는 소매 가격을 일단위<span class="kamis--5PK-sub-1">(주말 제외)</span> 로
							제공해줘요.
						</span>
					</div>
				</div>
				<div class="section32alert-UYd scroll_on">
					<div class="group-113-zWy">
						<p class="item--8t5">최고의 선택입니다!</p>
						<div class="group-112-M25">
							<div class="rectangle-102-g4M"></div>
							<p class="item-10--nNH">
								낙찰 시 시세보다 무려 10% 저렴한 가격으로 <br /> 구매하실 수 있습니다! <br />

							</p>
						</div>
						<div class="group-57-1kq">확인</div>
					</div>
				</div>
			</div>

		</div>
		<div class="section33-7Mw">
			<div class="scroll_on">
				<p class="item--2jo">투자</p>
				<p class="item--YCM">
					크라우드 펀딩, <br /> 모두가 할 수 있도록
				</p>
			</div>
			<div class="fundingpct-PCy scroll_on">
				<img src="${cpath }/assets/funding_pct.png" />
			</div>
			<div class="item-100--hmP scroll_on">
				크라우드펀딩 방식은 펀딩율 100% 달성 시 농사가 시작되기 때문에 <br /> 투자 부담과 위험이 상대적으로 적어요.
				<br /> 파머는 프로젝트를 효과적으로 어필하고 큰 광고 효과를 누릴 수 있어요.
			</div>
		</div>
		<div class="section4-ayb">
			<div class="section4-img"></div>
			<div class="section4-text">
				<p>비대면 경매로 간편하게</p>
			</div>

		</div>
		<div class="auto-group-kmzd-1Z7">
			<div class="section51-xUM">
				<div class="section51text-FiM scroll_on">
					<div class="item--PZf">경매한 팜</div>
					<p class="item--Huw">
						비대면 농산물 도매유통도 <br /> 믿을 수 있어요!
					</p>
					<p class="item--xWH">
						팜팜은 투자부터 경매까지 <br /> 검증된 농가와 함께합니다
					</p>
				</div>
				<img src="${cpath }/assets/section5_1_right.png"
					class="section51right-c53 scroll_on">

			</div>
			<div class="section52-jjK">
				<div id="apiChart"></div>

				<div class="section42text-ebP scroll_on">
					<p class="api-CN1">농산물 실시간 가격 API</p>
					<p class="item--WNh">
						직관적인 수치를 통해 <br /> 가격을 비교해보세요
					</p>
					<p class="item--Ai9">
						실시간 농산물 시세를 제공하여 <br /> 합리적인 가격의 낙찰이 가능합니다
					</p>
				</div>
			</div>
			<div class="section53-DAd">
				<div class="auto-group-pb7b-Xh7">
					<div class="section51text-e13 scroll_on">
						<div class="item--zKo">저렴한 단가</div>
						<p class="item--giR">
							유통단계를 줄여 <br /> 가격을 확 낮췄어요!
						</p>
						<p class="item--mE5">
							식량 작물의 유통비용은 <br /> 다른 작물보다 높아요
						</p>
					</div>
					<div class="section53right-e2y scroll_on">
						<p class="item-1--LwP">
							쌀의 유통비용 <br /> 1년 전보다
						</p>
						<p class="p-p5s">+</p>
						<p class="p-p5s-1">0</p>
						<p class="p-p5s">%p</p>
					</div>
				</div>
				<div id="areaChart" class="areaChart"></div>
				<div class="toggle-wrap">
					<div class="toggle-left"></div>
					<span class="toggle-control">10년 그래프 </span> <span
						class="toggle-control" name="toggle-control"
						style="display: none;">닫기</span> <span class="toggle-control"
						name="toggle-control">펼쳐보기</span><img class="toggle-control"
						src="${cpath}/assets/toggle_up-line.png" style="display: none;" />
					<img class="toggle-control"
						src="${cpath}/assets/toggle_down-line.png" />
				</div>
			</div>
		</div>

		<div class="section6-zuT">

			<div class="auto-group-xir1-hau">
				<p class="item--eW9">
					<span class="item--eW9-sub-0"> 팜팜에서 시작과 성장을 함께 하세요 <br />

					</span> <span class="item--eW9-sub-1">팜팜은 파머의 투자 지원부터 대량 판매까지 지원합니다</span>
				</p>
				<div class="auto-group-xtob-Gvq">
					<div class="section61-7DP">
						<div class="section61content-EJ1">
							<img class="mingcute-gift-fill-z2H"
								src="${cpath }/assets/section6_icon1.png" />
							<p class="item--iiy">펀딩</p>
							<p class="item--2jf">농사 자금을 마련할 수 있어요</p>
						</div>
					</div>
					<div class="section62-cE1">
						<div class="section62content-8y3">
							<img class="mdi-farm-home-tBX"
								src="${cpath }/assets/section6_icon2.png" />
							<div class="item--RBT">신뢰받는 농가</div>
							<p class="item--Wih">
								주기적인 정보 제공을 통해 <br /> 농가를 신뢰하도록 지원해요
							</p>
						</div>
					</div>
					<div class="section63-kd3">
						<div class="section63content-gmb">
							<img class="mingcute-diary-line-2aZ"
								src="${cpath }/assets/section6_icon3.png" />
							<p class="item--AAy">일지 작성</p>
							<p class="item--Gjo">
								간편하고 꾸준하게 <br /> 기록할 수 있어요
							</p>
						</div>
					</div>
					<div class="section64-j7b">
						<div class="section64content-ekM">
							<img class="bxs-store-QDj"
								src="${cpath }/assets/section6_icon4.png" />
							<p class="item--7dw">경매</p>
							<p class="item--cah">
								내가 제작한 작물 <br /> 대량 판매가 가능해요
							</p>
						</div>
					</div>

				</div>
			</div>

		</div>

		<div class="slider-title">팜팜 고객 후기</div>
		<div id="slider">
			<div class="image-box">
				<div>
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review2.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review3.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review2.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review3.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
				<div>
					<img class="reviewimg" src="${cpath }/assets/review2.png" />
				</div>
				<!--   clone     -->
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review3.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review2.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review3.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review2.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review3.png" />
				</div>
				<div class="clone">
					<img class="reviewimg" src="${cpath }/assets/review1.png" />
				</div>
			</div>
		</div>

		<div class="section7-f3B">
			<div class="section71-BnD">
				<div class="section71header-Vnu">
					<div class="logo-RAm">
						<img class="image-31-Nbo" src="${cpath }/assets/logo.png" />
						<p class="item--7JV">팜팜</p>
					</div>
					<p class="item--EP7">펀딩 페이지</p>
				</div>
				<div class="auto-group-xz1p-Vpq">
					<p class="item--dAM">팜팜에서 인기있는 펀딩 프로젝트를 살펴보세요</p>
					<button onclick="location.href='${cpath}/funding/fundingMain'"
						class="section71btn-UAy">프로젝트 살펴보기</button>

				</div>
			</div>
			<div class="section72-7Uq">
				<div class="section72header-cgV">
					<div class="logo-vSH">
						<img class="image-31-ssK" src="${cpath }/assets/logo.png" />
						<p class="item--ca1">팜팜</p>
					</div>
					<p class="item--jed">파머 센터</p>
				</div>
				<div class="auto-group-jwoo-emb">
					<p class="item--C2R">내 농작물을 위해 투자금 받고, 대량 판매 해보세요</p>
					<button onclick="goMypage()" class="section72btn-r6y">내 농장
						등록하기</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	
	function scrollToSection(sectionId) {
		var elements = document.getElementsByClassName('section2-WWh');
		var section = elements[0];
        section.scrollIntoView({ behavior: 'smooth' });
    }
	
	let serial_num = "${sessionScope.serial_num}";
	
	function goMypage(){
		if (serial_num.substring(0, 2) === "FA"){
			location.href='${cpath}/makeProject'
		} else {
			alert("파머 회원으로 로그인 하세요.");
		}
	}
	
	$(function(){
		showGraph();
	});
	
	function showGraph(){
		$.ajax({
			url : '/cropsQuote',
			type : 'GET',
			success : function(response) {
				$("#apiChart").html(response);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	/* 농산물 유통비용 데이터 차트 */
	$(document).ready(function() {
	    $('#areaChart').hide();
	    
	    // 토글 기능
	    $(".toggle-control").click(function(){
	        $('#areaChart').slideToggle(400, function() {
	            // 토글 완료 후 그래프가 보이지 않을 때만 텍스트와 이미지 토글
	            if ($('#areaChart').is(':hidden')) {
	                $("span[name='toggle-control']").text('펼쳐보기');
	                $("img.toggle-control").toggle();
	            } else {
	                $("span[name='toggle-control']").text('닫기');
	                $("img.toggle-control").toggle();
	            }
	        });
	    });
	});
	
		var options = {
			series : [ /* {
				name : '쌀',
				data : [ 15.9,16.2,17.4,17.8,18.1,15.2,16.3,23.2,22.3,21.2,20.9,19.6,20.7,21.3,20.8,21.5,22.0,25.8,28.7,27.0,24.3,24.2,23.6,27.2 ]
			},{
				name : '콩',
				data : [ 36.3,23.9,29.7,27.4,34.8,33.7,41.6,48.9,62.3,50.7,45.6,45.4,39.9,38.1,31.4,38.2,40.4,35.9,35.9,39.8,38.1,38.8,42.7,43.7 ]
			},{
				name : '봄감자',
				data : [ 67.0,59.5,65.4,67.2,53.9,65.0,65.0,71.0,76.6,72.2,70.9,71.8,67.5,67.5,65.2,61.2,62.7,57.8,67.7,67.9,66.1,70.5,70.1,74.4 ]
			},{
				name : '가을감자',
				data : [ 47.2,36.1,38.3,44.4,72.3,62.0,56.4,58.6,69.0,58.5,58.4,58.0,53.5,54.5,51.9,51.9,53.3,53.3,51.3,51.3,51.6,51.6,63.8,63.8 ]
			} , */{
				name : '고랭지감자(식량작물)',
				data : [ /* 61.5,64.4,65.6,62.5,63.1,64.6,56.2,74.0,58.7,64.8,78.0,67.0,68.3, */63.4,63.4,63.4,61.9,61.9,56.8,56.8,58.7,58.7,61.5,61.5 ]
			},{
				name : '고구마(식량작물)',
				data : [ /* 50.1,53.3,56.3,56.9,58.8,50.9,50.8,55.7,62.2,64.4,66.1,64.8,61.6, */58.8,59.7,59.7,70.6,70.6,69.3,69.3,62.7,62.7,62.4,62.4 ]
			},{
				name : '수박(과채류)',
				data : [ /* 52.9,50.4,49.2,49.3,48.4,47.5,48.4,43.9,47.9,40.8,35.6,34.7,39.4, */ 33.0,36.7,34.3,34.0,36.9,33.0,38.1,33.9,33.3,33.5,33.3 ]
			},/* {
				name : '복숭아',
				data : [ 0,0,38.2,42.3,54.7,47.1,46.8,48.6,56.7,57.4,49.0,50.7,36.4,36.7,36.9,36.9,37.3,37.3,40.3,40.3,32.5,32.5,34.8,34.8 ]
			} */],
			chart : {
				height : 500,
				width: 1100,
				type : 'area'
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				width : 1,
				curve : 'smooth'
			},
			xaxis : {
				type : 'category',
				categories: [/* "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", */ "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021"],
				labels: {
		            formatter: function (value) {
		                return value + "년";
		            },
		            style:{
	                	fontFamily: 'Pretendard, Source Sans Pro',
	                	color: 'lightgray'
	                }
		           
		        }
			},
            tooltip: {
                x: {
                    format: 'yyyy'
                },
                y: {
                    formatter: function (value) {
                        return value + "%";
                    }
                },    
                shared: false,
                style:{
                	fontFamily: 'Pretendard, Source Sans Pro'
                }
            },
            title: {
                text: '농산물 유통 비율(%)',
                align: 'left',
                style: {
                	fontFamily: 'Pretendard, Source Sans Pro',
                    fontSize: '18px',
                    fontWeight: 'bold',
                    color: '#686868'
                }
            },
            legend: {
                fontFamily: 'Pretendard, Source Sans Pro', // 원하는 글꼴 지정
                	color: 'lightgray'
            }
			/* colors: ['#ffffff', '#000000'], */
		};

		var chart = new ApexCharts(document.querySelector("#areaChart"),
				options);
		chart.render();

		// check if the checkbox has any unchecked item
		checkLegends()

		function checkLegends() {
			var allLegends = document
					.querySelectorAll(".legend input[type='checkbox']")

			for (var i = 0; i < allLegends.length; i++) {
				if (!allLegends[i].checked) {
					chart.toggleSeries(allLegends[i].value)
				}
			}
		}

		// toggleSeries accepts a single argument which should match the series name you're trying to toggle
		function toggleSeries(checkbox) {
			chart.toggleSeries(checkbox.value)
		}
		
		
		
	</script>

</body>
<script>
$(document).ready(function() {
    const $counters = $(".scroll_on");
    const exposurePercentage = 100;

    $(window).on('scroll', function() {
        $counters.each(function() {
            const $el = $(this);
            const rect = $el[0].getBoundingClientRect();
            const winHeight = window.innerHeight;
            const contentHeight = rect.bottom - rect.top;
            
            if (rect.top <= winHeight - (contentHeight * exposurePercentage / 100) && rect.bottom >= (contentHeight * exposurePercentage / 100)) {
                if (!$el.hasClass('active')) {
                    $el.addClass('active');
                    const $counter = $el.find('.p-p5s-1');
                    const max = 3.6;
                    setTimeout(() => counter($counter, max), 200);
                }
            }/*  else {
                $el.removeClass('active');
            } */
        });
    }).scroll();
});

function counter($counter, max) {
    let now = 0.1;
    const handle = setInterval(() => {
        $counter.text(now.toFixed(1));
        if (now >= max) {
            clearInterval(handle);
        }
        const step = (max - 0.1) / 10;
        now += step;
    }, 80);
}

</script>

</html>