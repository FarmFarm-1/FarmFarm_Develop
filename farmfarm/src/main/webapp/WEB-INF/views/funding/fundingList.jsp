<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=5" />
<meta name="theme-color" content="#000000" />
<title>mainpage/펀딩/로그인 안함</title>
<link rel="stylesheet" href="${cpath }/styles/fundingMain.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="mainpage--54h">
	<div class="body">
			<div class="group-156-QXX">
				<div class="search">
					<input id="searchInput" type="text"
						placeholder="관심있는 농작물 또는 농장 정보를 찾아보세요">
					<button
						onclick="search(document.getElementById('searchInput').value)"
						class="searchBtn">
						<img class="searchIcon" src="${cpath }/assets/search.png" />
					</button>
				</div>

				<div class="crop_type_container">
					<button onclick="type1()" id="type1" class="crop_type">
						<div class="nemo" id="nemo1">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_ALL.png">
						</div>
						<p class="item">전체</p>
					</button>
					<button onclick="type2()" id="type2" class="crop_type">
						<div class="nemo" id="nemo2">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_rice.png">
						</div>
						<p class="item">쌀</p>
					</button>
					<button onclick="type3()" id="type3" class="crop_type">
						<div class="nemo" id="nemo3">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_bean.png">
						</div>
						<p class="item">콩</p>
					</button>
					<button onclick="type4()" id="type4" class="crop_type">
						<div class="nemo" id="nemo4">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_beans.png">
						</div>
						<p class="item">팥</p>
					</button>
					<button onclick="type5()" id="type5" class="crop_type">
						<div class="nemo" id="nemo5">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_green.png">
						</div>
						<p class="item">녹두</p>
					</button>
					<button onclick="type6()" id="type6" class="crop_type">
						<div class="nemo" id="nemo6">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_potato.png">
						</div>
						<p class="item">감자</p>
					</button>
					<button onclick="type7()" id="type7" class="crop_type">
						<div class="nemo" id="nemo7">
							<img class="crop_type_img"
								src="${cpath }/assets/crop_type_sweetpotato.png">
						</div>
						<p class="item">고구마</p>
					</button>
				</div>

				<div class="order_container">
					<button onclick="order1()" id="order1" class="order">전체</button>
					<button onclick="order2()" id="order2" class="order">참여자순</button>
					<button onclick="order3()" id="order3" class="order">마감임박순</button>
					<button onclick="order4()" id="order4" class="order">최소금액순</button>
					<button onclick="order5()" id="order5" class="order">최신순</button>

				</div>

				<div class="searchOutput_container-none">
					<div id="output" class="search_output"></div>
					<div class="search_output-">검색결과</div>
					
				</div>

				<div class="item--uPK" id="fundingOrder">
					<!-- ajax -->

				</div>
			</div>
		</div>

	</div>
	<script>
		var gtype;
		let serial_num = "${sessionScope.serial_num}";

		$(function() {
			type1();
			
			$('#order1').css('color', 'black');
			$('#order1').css('font-weight', '800');
			type_light();
			$('#nemo1').css('border-style', 'solid');
			$('#nemo1').css('border-color', '#64A346');
			$('#nemo1').css('border-width', 'medium');

			clearSearch();

		});

		function search(input) {
			type_filter_light();
			type_light();
			document.getElementById('output').innerHTML = input; //input 출력
			$("div.searchOutput_container-none").removeClass("searchOutput_container-none").addClass("searchOutput_container");
			$("div.order_container").removeClass("searchOutput_container").addClass("order_container-none");
			$.ajax({
				url : '/funding/fundingSearch',
				type : 'GET',
				data : {
					'input' : input
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
			gtype='all';
			
		}

		function type1() {
			type_filter_light();
			clearSearch();
			filterByType('all');
		}
		function type2() {
			type_filter_light();
			clearSearch();
			filterByType('쌀');
		}
		function type3() {
			type_filter_light();
			clearSearch();
			filterByType('콩');
		}
		function type4() {
			type_filter_light();
			clearSearch();
			filterByType('팥');
		}
		function type5() {
			type_filter_light();
			clearSearch();
			filterByType('녹두');
		}
		function type6() {
			type_filter_light();
			clearSearch();
			filterByType('감자');
		}
		function type7() {
			type_filter_light();
			clearSearch();
			filterByType('고구마');
		}

		function filterByType(type) {
			clearSearch();
			gtype = type;
			$.ajax({
				url : '/funding/fundingListByType',
				type : 'GET',
				data : {
					'type' : type
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function order1() {
			$.ajax({
				url : '/funding/orderAll',
				type : 'GET',
				data : {
					'type' : gtype
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function order2() {
			$.ajax({
				url : '/funding/orderSupport',
				type : 'GET',
				data : {
					'type' : gtype
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function order3() {
			$.ajax({
				url : '/funding/orderClosing',
				type : 'GET',
				data : {
					'type' : gtype
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function order4() {
			$.ajax({
				url : '/funding/orderAmount',
				type : 'GET',
				data : {
					'type' : gtype
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function order5() {
			$.ajax({
				url : '/funding/orderRecent',
				type : 'GET',
				data : {
					'type' : gtype
				},
				success : function(response) {
					$("#fundingOrder").html(response);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}

		function filter_light() {
			// 검색 결과 output 지우기
			$("div.searchOutput_container").removeClass("searchOutput_container").addClass("searchOutput_container-none");
			/* gtype = 'all'; */
			clearSearch();
			$('.order').css('color', '#686868');
			$('.order').css('font-weight', '700');
		}

		function type_filter_light() {
			filter_light();
			$("div.order_container-none").removeClass("order_container-none").addClass("order_container");
			$('#order1').css('color', 'black');
			$('#order1').css('font-weight', '800');
		}

		$('#order1').click(function() {
			filter_light();
			$('#order1').css('color', 'black');
			$('#order1').css('font-weight', '800');
		});
		$('#order2').click(function() {
			filter_light();
			$('#order2').css('color', 'black');
			$('#order2').css('font-weight', '800');
		});
		$('#order3').click(function() {
			filter_light();
			$('#order3').css('color', 'black');
			$('#order3').css('font-weight', '800');
		});
		$('#order4').click(function() {
			filter_light();
			$('#order4').css('color', 'black');
			$('#order4').css('font-weight', '800');
		});
		$('#order5').click(function() {
			filter_light();
			$('#order5').css('color', 'black');
			$('#order5').css('font-weight', '800');
		});

		function type_light() {
			$('.nemo').css('border-style', 'none');
		}
		$('#type1').click(function() {
			type_light();
			$('#nemo1').css('border-style', 'solid');
			$('#nemo1').css('border-color', '#64A346');
			$('#nemo1').css('border-width', 'medium');
		});
		$('#type2').click(function() {
			type_light();
			$('#nemo2').css('border-style', 'solid');
			$('#nemo2').css('border-color', '#64A346');
			$('#nemo2').css('border-width', 'medium');
		});
		$('#type3').click(function() {
			type_light();
			$('#nemo3').css('border-style', 'solid');
			$('#nemo3').css('border-color', '#64A346');
			$('#nemo3').css('border-width', 'medium');
		});
		$('#type4').click(function() {
			type_light();
			$('#nemo4').css('border-style', 'solid');
			$('#nemo4').css('border-color', '#64A346');
			$('#nemo4').css('border-width', 'medium');
		});
		$('#type5').click(function() {
			type_light();
			$('#nemo5').css('border-style', 'solid');
			$('#nemo5').css('border-color', '#64A346');
			$('#nemo5').css('border-width', 'medium');
		});
		$('#type6').click(function() {
			type_light();
			$('#nemo6').css('border-style', 'solid');
			$('#nemo6').css('border-color', '#64A346');
			$('#nemo6').css('border-width', 'medium');
		});
		$('#type7').click(function() {
			type_light();
			$('#nemo7').css('border-style', 'solid');
			$('#nemo7').css('border-color', '#64A346');
			$('#nemo7').css('border-width', 'medium');
		});
		function clearSearch() {
			document.getElementById('searchInput').value = '';
			
		}
		document.addEventListener('keydown', onEnter);

		function onEnter() {
			var keyCode = window.event.keyCode;

			if (keyCode == 13) { //엔테키 이면
				console.log("enter");
				search(document.getElementById('searchInput').value);
			}
		}
	</script>
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>