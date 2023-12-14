<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mypage/파머/내 프로젝트 만들기/상품정보</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700%2C800" />
<link rel="stylesheet" href="${cpath }/styles/1.css" />
</head>

<script>
	function next(){
		
		$.ajax({
			type : "GET",
			url : "/myPageFarmer/regFarm",
			data : {
				"email" : $("#email").val(),
				"password" : $("#password").val(),
				"name" : $("#name").val()
			},
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
		
		
	}



</script>


<body>
	<div class="mypage--YJR">
		<div class="insertproject-e37">
			<div class="auto-group-ovs1-Nzh">
				<p class="item--JtM">내 프로젝트 만들기</p>
				<div class="item--RCH">경작 및 경매를 위한 프로젝트를 만들고 서포터들의 지지를 받아보세요!</div>
			</div>
			<div class="line-66-4m3"></div>
			<div class="line-68-bky"></div>
			<div class="auto-group-5qos-9Gh">
				<div class="category-FKj">
					<div class="categoryleft-AxV">
						<p class="item--vRs">상품 카테고리</p>
						<p class="item--2zh">내 프로젝트 상품 종류를 선택해 주세요.</p>
					</div>
					<div class="categorychoose-8Xw">
						<!-- 필터 쪽 지원이 검색 필터 보고 참고 합니다.. -->
						<div class="status2-3uo">쌀</div>
						<div class="status1-WoP">콩</div>
						<div class="status3-CRK">팥</div>
						<div class="status4-4Cd">녹두</div>
						<div class="status5-uyw">감자</div>
						<div class="status6-P8R">고구마</div>
					</div>
				</div>
				<div class="productname-3Ts">
					<div class="productnameleft-mPs">
						<p class="item--W6Z">상품명</p>
						<p class="item--EHT">
							상품을 잘 나타낼 수 있는 상품명을 설정해 주세요. <br /> 서포터들이 쉽게 검색할 수 있도록 다양한 워딩을
							사용해 주면 좋아요.
						</p>
					</div>
					<div class="auto-group-4ru5-Qr9">
						<div class="rectangle-192-wr5"></div>
						<input class="rectangle-193-TZX"></input>
						<!-- <p class="item--b9w">탕루루 납품 달달 스테비아 토망고</p> -->
					</div>
				</div>
				<div class="projectthubimage-Rem">
					<div class="projectthubimageleft-M2d">
						<p class="item--hMP">농산물 이미지</p>
						<p class="item--Dad">
							경매를 위한 농산물 이미지를 업로드 해주세요. <br /> 상세 페이지의 최상단에 노출됩니다.
						</p>
					</div>
					<div class="imageupload-SCV">
						<div class="imageuploadicon-xRj">
							<img class="vector-7Jd" src="${cpath }/assets/vector-ZXb.png" />
							<p class="item--Srh">사진 올리기</p>
						</div>
					</div>
				</div>
				<div class="projectimage-WLm">
					<div class="projectimageleft-EGm">
						<p class="item--yk9">농산물 상세 이미지</p>
						<p class="item-5--guT">
							상세 페이지에 삽일될 이미지를 업도르 해주세요. <br /> 농산물의 특징과 상태가 잘 드러나는 이미지를 선택해
							보세요. <br /> 최대 5장까지 업로드 가능합니다.
						</p>
					</div>
					<div class="auto-group-xen9-2rq">
						<div class="imageupload-NQu">
							<div class="imageuploadicon-H25">
								<img class="vector-p21" src="${cpath }/assets/vector-Pmo.png" />
								<p class="item--idB">사진 올리기</p>
							</div>
						</div>
						<div class="imageupload-iWh">
							<div class="imageuploadicon-qbK">
								<img class="vector-zj7" src="${cpath }/assets/vector-wAm.png" />
								<p class="item--8aR">사진 올리기</p>
							</div>
						</div>
					</div>
					<div class="auto-group-j7b3-biu">
						<div class="imageupload-k61">
							<div class="imageuploadicon-sRX">
								<img class="vector-q7T" src="${cpath }/assets/vector-wEd.png" />
								<p class="item--Zp9">사진 올리기</p>
							</div>
						</div>
						<div class="imageupload-dZ7">
							<div class="imageuploadicon-AZ3">
								<img class="vector-8Ey" src="${cpath }/assets/vector-CV3.png" />
								<p class="item--fkh">사진 올리기</p>
							</div>
						</div>
					</div>
					<div class="imageupload-jkZ">
						<div class="imageuploadicon-4H3">
							<img class="vector-1i5" src="${cpath }/assets/vector-eb7.png" />
							<p class="item--kvZ">사진 올리기</p>
						</div>
					</div>
				</div>
				<div class="harvestdate-38y">
					<div class="harvestdateleft-YLd">
						<p class="item--67F">재배 예정일</p>
						<p class="item--p3F">재배 예정일을 설정해주세요.</p>
					</div>
					<input class="group-185-7o3" type = "date">
						<!--  <img class="mingcute-calendar-line-FuF"
							src="./assets/mingcute-calendar-line.png" />  -->
					</input>
				</div>
				<div class="plantingdate-9zd">
					<div class="plantingdateleft-Vob">
						<p class="item--rPF">수확 예정일</p>
						<p class="item--mm7">수확 예정일을 설정해주세요.</p>
					</div>
					<input class="group-185-5Wu" type = "date">
						<%-- <img class="mingcute-calendar-line-cFw"
							src="${cpath }/assets/mingcute-calendar-line-mxh.png" /> --%>
					</input>
				</div>
			</div>
			<div class="updatebtn-6wo" onclick="next()">다음</div>
			<p class="item--jE5">상품정보</p>
		</div>
	</div>
</body>
</html>