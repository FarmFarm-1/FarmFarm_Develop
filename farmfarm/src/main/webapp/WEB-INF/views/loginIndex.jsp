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
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<link rel="stylesheet" href="../styles/mainpage.css" />
</head>

<body>
	<jsp:include page="header.jsp" />

	<button onclick="location.href='logout'">로그아웃</button>
	
	<!-- front -->
	<div class="mainpage--A2H">
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
			<img class="mingcute-down-line-Pgy"
				src="./assets/mingcute-down-line.png" />
		</div>
		<div class="section2-WWh">
			<p class="item--drD">
				농작물 펀딩부터 경매까지 한 곳에서 경험하세요. <br /> 팜팜과 함께하는 농작물 펀딩이 <br /> 당신의 자산에
				새로움을 불어넣습니다.
			</p>
		</div>
		<div class="section31-oPK">
			<p class="item--XKK">신뢰</p>
			<p class="item--pZK">
				성장 가능성 확인하여 <br /> 투자를 똑똑하게
			</p>
			<div class="auto-group-gf1f-4yT">
				<div class="section31mockup-NDT">
					<div class="rectangle-JN1"></div>
					<div class="rectangle-Mr5"></div>
				</div>
				<div class="item-1-1--vGu">
					펀딩 전 파머와 1:1 채팅을 통해 문의해 보세요. <br /> 농작물 및 재배 정보는 기본, <br /> 펀딩 관련
					정보를 꼼꼼히 체크해 볼 수 있어요.
				</div>
			</div>
		</div>
		<div class="section32-Tw3">
			<p class="item--C7w">경매</p>
			<div class="auto-group-1e85-uo3">
				<div class="auto-group-xa6r-TZf">
					<p class="item-1--PiD">
						여러 농작물의 시세 정보를 <br /> 1분 만에 <br /> 확인해보세요
					</p>
					<p class="item--jvV">수익은 높게,</p>
					<p class="item--ovM">
						<span class="item--ovM-sub-0">위험은 </span> <span
							class="item--ovM-sub-1">낮게,</span>
					</p>
					<p class="item--heM">
						<span class="item--heM-sub-0">부담은 </span> <span
							class="item--heM-sub-1">적게.</span>
					</p>
				</div>
				<div class="section32alert-UYd">
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
			<div class="kamis--5PK">
				<span class="kamis--5PK-sub-0"> 팜팜은 농산물 유통정보 플랫폼 KAMIS에서 <br />
					제공하는 소매 가격을 일단위
				</span> <span class="kamis--5PK-sub-1">(주말 제외)</span> <span
					class="kamis--5PK-sub-2">로 제공해줘요.</span>
			</div>
		</div>
		<div class="section33-7Mw">
			<p class="item--2jo">투자</p>
			<p class="item--YCM">
				크라우드 펀딩, <br /> 모두가 할 수 있도록
			</p>
			<div class="fundingpct-PCy">
				<div class="fundingpct-V17">32%</div>
				<div class="fundingpct-9LZ">70%</div>
				<div class="fundingpct-1tZ">100%</div>
			</div>
			<div class="item-100--hmP">
				크라우드펀딩 방식은 펀딩율 100% 달성 시 농사가 시작되기 때문에 <br /> 투자 부담과 위험이 상대적으로 적어요.
				<br /> 파머는 프로젝트를 효과적으로 어필하고 큰 광고 효과를 누릴 수 있어요.
			</div>
		</div>
		<div class="section4-ayb">
			<div class="section4-ayb-bg"></div>
			비대면 경매로 간편하게
		</div>
		<div class="auto-group-kmzd-1Z7">
			<div class="section51-xUM">
				<div class="section51text-FiM">
					<div class="item--PZf">경매한 팜</div>
					<p class="item--Huw">
						비대면 농산물 도매유통도 <br /> 믿을 수 있어요!
					</p>
					<p class="item--xWH">
						팜팜은 투자부터 경매까지 <br /> 검증된 농가와 함께합니다
					</p>
				</div>
				<div class="section51right-c53">
					<div class="group-188-7Xb">
						<p class="item--MRw">
							크라우드 펀딩 통한 <br /> 투자금 유치
						</p>
					</div>
					<div class="group-189-RAu">
						<p class="item--ifo">
							지속적인 일지 <br /> 업데이트 지원
						</p>
					</div>
					<div class="group-190-BpH">농산품 경매</div>
					<img class="arrow-1-G53" src="REPLACE_IMAGE:60:81" /> <img
						class="arrow-2-oam" src="REPLACE_IMAGE:60:82" />
				</div>
			</div>
			<div class="section52-jjK">
				<div class="section42text-ebP">
					<p class="api-CN1">농산물 실시간 가격 API</p>
					<p class="item--WNh">
						직관적인 수치를 통해 <br /> 가격을 비교해보세요
					</p>
					<p class="item--Ai9">
						실시간 농산물 시세를 제공하여 <br /> 합리적인 가격의 낙찰이 가능합니다
					</p>
				</div>
			</div>
		</div>
		<div class="section53-DAd">
			<div class="auto-group-pb7b-Xh7">
				<div class="section51text-e13">
					<div class="item--zKo">저렴한 단가</div>
					<p class="item--giR">
						유통단계를 줄여 <br /> 가격을 확 낮췄어요!
					</p>
					<p class="item--mE5">
						식량 작물의 유통비용은 <br /> 다른 작물보다 높아요
					</p>
				</div>
				<div class="section53right-e2y">
					<p class="item-1--LwP">
						쌀의 유통비용 <br /> 1년 전보다
					</p>
					<p class="p-p5s">+3.6%p</p>
				</div>
			</div>
			<img class="image-54-g85" src="./assets/image-54.png" />
		</div>
		<div class="section6-zuT">
			<div class="section61-7DP">
				<div class="section61content-EJ1">
					<img class="mingcute-gift-fill-z2H"
						src="./assets/mingcute-gift-fill.png" />
					<p class="item--iiy">펀딩</p>
					<p class="item--2jf">농사 자금을 마련할 수 있어요</p>
				</div>
			</div>
			<div class="auto-group-xir1-hau">
				<p class="item--eW9">
					<span class="item--eW9-sub-0"> 팜팜에서 시작과 성장을 함께 하세요 <br />

					</span> <span class="item--eW9-sub-1">팜팜은 파머의 투자 지원부터 대량 판매까지 지원합니다</span>
				</p>
				<div class="auto-group-xtob-Gvq">
					<div class="section62-cE1">
						<div class="section62content-8y3">
							<img class="mdi-farm-home-tBX" src="./assets/mdi-farm-home.png" />
							<div class="item--RBT">신뢰받는 농가</div>
							<p class="item--Wih">
								주기적인 정보 제공을 통해 <br /> 농가를 신뢰하도록 지원해요
							</p>
						</div>
					</div>
					<div class="section63-kd3">
						<div class="section63content-gmb">
							<img class="mingcute-diary-line-2aZ"
								src="./assets/mingcute-diary-line.png" />
							<p class="item--AAy">일지 작성</p>
							<p class="item--Gjo">
								간편하고 꾸준하게 <br /> 기록할 수 있어요
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="section64-j7b">
				<div class="section64content-ekM">
					<img class="bxs-store-QDj" src="./assets/bxs-store.png" />
					<p class="item--7dw">경매</p>
					<p class="item--cah">
						내가 제작한 작물 <br /> 대량 판매가 가능해요
					</p>
				</div>
			</div>
		</div>
		<div class="section7-f3B">
			<div class="section71-BnD">
				<div class="section71header-Vnu">
					<div class="logo-RAm">
						<img class="image-31-Nbo" src="./assets/image-31-aPw.png" />
						<p class="item--7JV">팜팜</p>
					</div>
					<p class="item--EP7">펀딩 페이지</p>
				</div>
				<div class="auto-group-xz1p-Vpq">
					<p class="item--dAM">팜팜에서 인기있는 펀딩 프로젝트를 살펴보세요</p>
					<div class="section71btn-UAy">프로젝트 살펴보기</div>
				</div>
			</div>
			<div class="section72-7Uq">
				<div class="section72header-cgV">
					<div class="logo-vSH">
						<img class="image-31-ssK" src="./assets/image-31.png" />
						<p class="item--ca1">팜팜</p>
					</div>
					<p class="item--jed">파머 센터</p>
				</div>
				<div class="auto-group-jwoo-emb">
					<p class="item--C2R">내 농작물을 위해 투자금 받고, 대량 판매 해보세요</p>
					<div class="section72btn-r6y">내 농장 등록하기</div>
				</div>
			</div>
		</div>
	</div>


	<div id="areaChart"></div>
	<script>
		var options = {
			series : [ {
				name : 'series1',
				data : [ 31, 40, 28, 51, 42, 109, 100 ]
			}, {
				name : 'series2',
				data : [ 11, 32, 45, 32, 34, 52, 41 ]
			} ],
			chart : {
				height : 350,
				type : 'area'
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				curve : 'smooth'
			},
			xaxis : {
				type : 'datetime',
				categories : [ "2018-09-19T00:00:00.000Z",
						"2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z",
						"2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z",
						"2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z" ]
			},
			tooltip : {
				x : {
					format : 'dd/MM/yy HH:mm'
				},
			},
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
	<!-- End Area Chart -->



	<%-- <div style="width: 1000px; height: 700px;">
		<canvas id="myChart" style="width: 500px"></canvas>
	</div>

	<script>
		var ctx = document.getElementById('myChart').getContext('2d');

		var myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday"/* , "Friday", "Saturday"  */],
				datasets : [ {
					data : [ 86, 114, 106, 106, 107, 111, 133 ],
					label : "쌀",
					borderColor : "rgb(62,149,205)",
					backgroundColor : "rgb(62,149,205,0.1)",
					borderWidth : 1,
					fill : 'origin',
					pointRadius : 1, // 데이터 포인트의 크기 설정
					pointHoverRadius : 6, // 마우스 호버 시 데이터 포인트의 크기 설정
					pointHitRadius : 20
				}, {
					data : [ 70, 90, 44, 60, 83, 90, 100 ],
					label : "콩",
					borderColor : "rgb(60,186,159)",
					backgroundColor : "rgb(60,186,159,0.1)",
					borderWidth : 1,
					fill : 'origin',
					pointRadius : 1, // 데이터 포인트의 크기 설정
					pointHoverRadius : 6, // 마우스 호버 시 데이터 포인트의 크기 설정
					pointHitRadius : 20
				}, {
					data : [ 10, 21, 60, 44, 17, 21, 17 ],
					label : "녹두",
					borderColor : "rgb(255,165,0)",
					backgroundColor : "rgb(255,165,0,0.1)",
					borderWidth : 1,
					fill : 'origin',
					pointRadius : 1, // 데이터 포인트의 크기 설정
					pointHoverRadius : 6, // 마우스 호버 시 데이터 포인트의 크기 설정
					pointHitRadius : 20
				}, {
					data : [ 100, 100, 100, 100, 100 ], // 'Friday'와 'Saturday'의 데이터 값을 0에서 0.1로 변경
					label : "고구마",
					borderColor : "rgb(196,88,80)",
					backgroundColor : "rgb(196,88,80,0.1)",
					borderWidth : 1,
					fill : 'origin',
					pointRadius : 1, // 데이터 포인트의 크기 설정
					pointHoverRadius : 6, // 마우스 호버 시 데이터 포인트의 크기 설정
					pointHitRadius : 20
				} ]
			},
			options : {
				elements : {
					line : {
						tension : 0.4
					}
				},
				plugins : {
					tooltip : {
						enabled : true,
						mode : 'nearest',
						intersect : false
					},
					legend : {
						labels : {
							font : {
								size : 14
							}
						},
						position: 'top',
						align: 'start',
						itemSpacing: 500,
						offset: 100
					}

				},
				scales : {
					x : {
						grid : {
							display : false
						}
					},
					y : {
						grid : {
							display : false
						}
					}
				},
				animation : {
					mode : 'x',
					active : {
						duration : 400
					},
					show : {
						type : 'boolean',
						duration : 0
					},
					hide : {
						type : 'boolean',
						easing : 'easeInExpo'
					}
				}
			}
		});
	</script> --%>
</body>
</html>