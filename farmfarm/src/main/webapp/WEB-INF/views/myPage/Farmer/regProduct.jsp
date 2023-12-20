<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
	// 상품 등록 
	var funding_thumb_img_url;
	var funding_product_img_url;

	function imageUpload(file) {

		var formData = new FormData();
		formData.append('file', file);

		$.ajax({
			url : '/s3/upload',
			type : 'POST',
			data : formData,
			async : false,
			processData : false,
			contentType : false,
			success : function(response) {
				funding_thumb_img_url = response; // 업로드된 이미지의 URL을 반환
			},
			error : function(error) {
				console.log(error);
			}
		});

	}

	function imageUpload2(file) {

		var formData = new FormData();
		formData.append('file', file);

		$.ajax({
			url : '/s3/upload',
			type : 'POST',
			data : formData,
			async : false,
			processData : false,
			contentType : false,
			success : function(response) {
				funding_product_img_url = response; // 업로드된 이미지의 URL을 반환
			},
			error : function(error) {
				console.log(error);
			}
		});

	}

	function regProduct() {

		var warning = document.querySelector('.warn-one');
		var warning2 = document.querySelector('.warn-two');

		var product_kind = $(".status2-3uo.selected").text();
		var product_name = $(".rectangle-193-TZX").val();
		var farm_name = $(".group-185-3Yq").val();
		var farm_address = $(".rectangle-192-BAV").val();
		var farm_introduction = $(".rectangle-193-ZxR").val();
		var farm_square_footage = $(".rectangle-195-2MT").val();
		var expected_planting_date = $(".group-185-7o3").val();
		var expected_harvest_date = $(".group-185-5Wu").val();
		var farmer_phone = $("#phoneNum").val();

		var file = $('#inputFile')[0].files[0];
		var file2 = $('#inputFile2')[0].files[0];
		var target_total_amount = $(".rectangle-195-G4m").val();
		var funding_deadline = $(".group-185-jW5").val();

		if (warning.style.display == 'flex' || warning2.style.display == 'flex') {
			alert('날짜 조건을 다시 확인하고 등록 해주세요 !')
		} else {

			if (product_kind != '' && product_name != '' && farm_name != ''
					&& farm_address != '' && farm_introduction != ''
					&& farm_square_footage != ''
					&& expected_planting_date != ''
					&& expected_harvest_date != '' && farmer_phone != ''
					&& file && file2 && target_total_amount != ''
					&& funding_deadline != '') {

				imageUpload(file);
				imageUpload2(file2);

				$.ajax({
					url : '/myPageFarmer/regProduct',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify({
						"product_kind" : product_kind,
						"product_name" : product_name,
						"farm_name" : farm_name,
						"farm_address" : farm_address,
						"farm_introduction" : farm_introduction,
						"farm_square_footage" : farm_square_footage,
						"expected_planting_date" : expected_planting_date,
						"expected_harvest_date" : expected_harvest_date,
						"funding_thumb_img_url" : funding_thumb_img_url,
						"funding_product_img_url" : funding_product_img_url,
						"target_total_amount" : target_total_amount,
						"funding_deadline" : funding_deadline,
						"farmer_phone" : farmer_phone

					}),
					success : function(response) {
						if (response === 'success') {
							console.log('상품 등록에 성공했습니다.');
							location.href = '/main';
						} else {
							console.log('등록 실패 ..');
						}

					},
					error : function(error) {
						console.log(error);
					}
				});

			} else {
				alert('모든 항목을 필수로 기입하여야 등록 가능합니다.');
			}

		}

	}
</script>
<script>
	// 주소 검색 api 
	function execution_daum_address() {

		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							addr += extraAddr;
						} else {
							addr += ' ';
						}

						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
						//document.getElementById("sample6_detailAddress").attr("readonly", false);
					}
				}).open();

	}
</script>
<script>
	function previewImage(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.imageupload-SCV').css('background-image',
						'url(' + e.target.result + ')');
				$('.vector-7Jd').remove();
				$('.item--Srh').remove();
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	function previewImage2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.imageupload-NQu').css('background-image',
						'url(' + e.target.result + ')');
				$('.vector-p21').remove();
				$('.item--idB').remove();
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script>
	/* 상품 등록 - 카테고리 선택 */
	function disSelect() {
		$('.status2-3uo').css('background-color', '#f6f6f6');
		$('.status2-3uo').css('color', '#3a3a3a');
		$('.status2-3uo').removeClass("selected");

	}
	function type1() {
		disSelect();
		$('#nemo1').css('background-color', '#3d3d3d');
		$('#nemo1').css('color', '#ffffff');

		$('#nemo1').addClass("selected");
	}
	function type2() {
		disSelect();
		$('#nemo2').css('background-color', '#3d3d3d');
		$('#nemo2').css('color', '#ffffff');

		$('#nemo2').addClass("selected");
	}
	function type3() {
		disSelect();
		$('#nemo3').css('background-color', '#3d3d3d');
		$('#nemo3').css('color', '#ffffff');
		$('#nemo3').addClass("selected");
	}
	function type4() {
		disSelect();
		$('#nemo4').css('background-color', '#3d3d3d');
		$('#nemo4').css('color', '#ffffff');
		$('#nemo4').addClass("selected");
	}
	function type5() {
		disSelect();
		$('#nemo5').css('background-color', '#3d3d3d');
		$('#nemo5').css('color', '#ffffff');
		$('#nemo5').addClass("selected");
	}
	function type6() {
		disSelect();
		$('#nemo6').css('background-color', '#3d3d3d');
		$('#nemo6').css('color', '#ffffff');
		$('#nemo6').addClass("selected");
	}
</script>



<body onclick = "daySet()">
	<div class="mypage--YJR" onclick = "daySet()">
		<div class="insertproject-e37">
			<div class="auto-group-ovs1-Nzh">
				<p class="item--JtM">내 프로젝트 만들기</p>
				<div class="item--RCH">경작 및 경매를 위한 프로젝트를 만들고 서포터들의 지지를 받아보세요!</div>
			</div>
			<div class="line-66-4m3"></div>
			<div class="line-68-bky"></div>
			<div class="line-68-kXo"></div>
			<div class="line-66-cgV"></div>

			<div class="auto-group-5qos-9Gh">
				<div class="category-FKj">
					<div class="categoryleft-AxV">
						<p class="item--vRs">상품 카테고리</p>
						<p class="item--2zh">내 프로젝트 상품 종류를 선택해 주세요.</p>
					</div>
					<div class="categorychoose-8Xw">
						<!-- 필터 쪽 지원이 검색 필터 보고 참고 합니다.. -->
						<div class="status2-3uo" id="nemo1" onclick="type1()">쌀</div>
						<div class="status2-3uo" id="nemo2" onclick="type2()">콩</div>
						<div class="status2-3uo" id="nemo3" onclick="type3()">팥</div>
						<div class="status2-3uo" id="nemo4" onclick="type4()">녹두</div>
						<div class="status2-3uo" id="nemo5" onclick="type5()">감자</div>
						<div class="status2-3uo" id="nemo6" onclick="type6()">고구마</div>
					</div>
				</div>
				<div class="productname-3Ts">
					<div class="productnameleft-mPs">
						<p class="item--W6Z">상품명</p>
						<p class="item--EHT">
							상품을 잘 나타낼 수 있는 상품명을 설정해 주세요. <br /> 서포터들이 쉽게 검색할 수 있도록 다양한 워딩을 <br />
							사용해 주면 좋아요. (최대 30자)
						</p>
					</div>
					<div class="auto-group-4ru5-Qr9">
						<div class="rectangle-192-wr5"></div>
						<textarea class="rectangle-193-TZX" maxlength='30'></textarea>
					</div>
				</div>
				<div class="projectthubimage-Rem">
					<div class="projectthubimageleft-M2d">
						<p class="item--hMP">농산물 이미지</p>
						<p class="item--Dad">
							펀딩을 위한 농산물 이미지를 업로드 해주세요. <br /> 상세 페이지의 최상단에 노출됩니다.
						</p>
					</div>
					<div class="imageupload-SCV"
						onclick="document.getElementById('inputFile').click();">
						<div class="imageuploadicon-xRj">
							<img class="vector-7Jd" src="${cpath }/assets/vector-ZXb.png" />
							<p class="item--Srh">사진 올리기</p>
						</div>
					</div>
					<input type="file" id="inputFile" style="display: none;"
						onchange="previewImage(this)" />
				</div>
				<div class="projectimage-WLm">
					<div class="projectimageleft-EGm">
						<p class="item--yk9">농산물 상세 이미지</p>
						<p class="item-5--guT">
							상세 페이지에 삽일될 이미지를 업도르 해주세요. <br /> 농산물의 특징과 상태및 설명이 포함된 긴 이미지 파일
							입니다. <br /> 정보를 잘 드러내는 설명식 이미지 파일을 선택해주세요.

						</p>
					</div>
					<div class="auto-group-xen9-2rq">
						<div class="imageupload-NQu"
							onclick="document.getElementById('inputFile2').click();">
							<div class="imageuploadicon-H25">
								<img class="vector-p21" src="${cpath }/assets/vector-Pmo.png" />
								<p class="item--idB">사진 올리기</p>
							</div>
						</div>
						<input type="file" id="inputFile2" style="display: none;"
							onchange="previewImage2(this)" />


					</div>

				</div>
				<div class="harvestdate-38y">
					<div class="harvestdateleft-YLd">
						<p class="item--67F">재배 예정일</p>
						<p class="item--p3F">재배 예정일을 설정해주세요.</p>
					</div>
					<input class="group-185-7o3" type="date" id="harvestDate" />


				</div>
				<div class="plantingdate-9zd">
					<div class="plantingdateleft-Vob">
						<p class="item--rPF">수확 예정일</p>
						<p class="item--mm7">수확 예정일을 설정해주세요.</p>
					</div>
					<input class="group-185-5Wu" type="date" id="harvest2Date" />
					<div class="warn-one">수확 예정일은 재배 예정일보다 빠를 수 없습니다.</div>

				</div>
			</div>
			<div class="auto-group-ujlv-dbb">
				<div class="farmname-YCm">
					<div class="farmnameleft-GPf">
						<p class="item--pRB">농장명</p>
						<p class="item--Y6H">농장명을 입력해주세요.</p>
					</div>
					<input class="group-185-3Yq" />
				</div>
				<div class="farminfo-snm">
					<div class="farminfoleft-zsP">
						<p class="item--XMX">농장 소개글</p>
						<p class="item-00--eBF">
							짧은 농장 소개글을 입력해주세요. <br /> 최대 50글자까지 입력 가능합니다.
						</p>
					</div>
					<div class="auto-group-sayu-Hzu">
						<div class="rectangle-192-r2R"></div>
						<textarea class="rectangle-193-ZxR" maxlength='50'></textarea>
					</div>
				</div>
				<div class="farmaddress-iTw">
					<div class="auto-group-aenz-4Gu">
						<p class="item--1C9">농장 주소</p>
						<div class="auto-group-ub2u-YC5">
							<div class="addresspost-4RK">
								<div class="item--QVB">우편번호</div>
								<input class="rectangle-192-tv9" id="sample6_postcode"
									readonly="readonly"></input>
							</div>
							<div class="updatebtn-1js" onclick="execution_daum_address()">주소
								검색</div>
						</div>
					</div>
					<div class="auto-group-5dqh-qU1">
						<div class="addressdetail-LvZ">
							<div class="item--HL1">주소</div>
							<input class="rectangle-192-BAV" id="sample6_address"
								readonly="readonly"></input>
						</div>
						<div class="addressroad-h8q">
							<div class="item--ScD">상세주소</div>
							<input class="rectangle-192-LxV" id="sample6_detailAddress"></input>
						</div>
					</div>
				</div>
				<div class="farmarea-TnD">
					<div class="auto-group-ztzq-133">
						<p class="item--jzd">농장 평수</p>
						<p class="item--fdP">대략적인 농장 평수를 입력해주세요.</p>
					</div>
					<div class="auto-group-6qqh-ZCy">
						<div class="group-185-VMX">
							<input class="rectangle-195-2MT" type="number"></input>
						</div>
						<div class="item--xF7">평</div>
					</div>
				</div>
				<div class="farmarea-Tn">
					<div class="auto-group-ztzq-133">
						<p class="item--jzd">대표자 연락처</p>
						<p class="item--fdP">전화번호를 입력해주세요.</p>
					</div>
					<div class="auto-group-6qqh-ZCy">
						<div class="group-185-VMX">
							<input class="rectangle-195-2MT" id="phoneNum"></input>
						</div>

					</div>
				</div>
			</div>
			<div class="auto-group-57ch-VuF">
				<div class="targetamount-QFX">
					<div class="auto-group-w2um-uxy">
						<p class="item--fhF">펀딩 목표 금액</p>
						<p class="item--yxq">
							목표 펀딩 금액을 설정해주세요. <br /> 비슷한 카테고리 및 농장 규모의 펀딩 금액을 살펴보면 <br />
							쉽게 설정 가능해요!
						</p>
					</div>
					<div class="targetamountinput-BZ7">
						<div class="group-185-Jdj">
							<input class="rectangle-195-G4m" type="number"></input>
						</div>
						<div class="p-ar9">P</div>
					</div>
				</div>
				<div class="auto-group-yjps-hvm">
					<div class="deadline-rHs">
						<p class="item--Pob">펀딩 마감일</p>
						<p class="item--v2q">
							재배 예정일을 고려하여 펀딩 마감일을 설정해주세요. <br /> 기한이 지나면 프로젝트가 종료됩니다.
						</p>
					</div>
					<input class="group-185-jW5" type="date" id="deadline"></input>
					<div class="warn-two">펀딩 마감일은 재배 예정일보다 늦을 수 없습니다.</div>
				</div>
			</div>
			<div class="addressbtn-4Z3" onclick="regProduct()">프로젝트 만들기</div>
			<p class="item--jE5">상품정보</p>
			<p class="item--9Zo">펀딩정보</p>
			<p class="item--S37">농장정보</p>
		</div>
	</div>
</body>
<script>
	// 날짜 필터링 관련 
	var harvestDate = document.getElementById('harvestDate');
	var harvest2Date = document.getElementById('harvest2Date');
	var deadline = document.getElementById('deadline');

	var warning = document.querySelector('.warn-one');
	var warning2 = document.querySelector('.warn-two');

	function daySet() {
		console.log('ddd')
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
		document.getElementById("harvestDate").setAttribute("min", today);


	}
	
	harvest2Date.onchange = function() {
		if (harvestDate.valueAsDate >= harvest2Date.valueAsDate) {
			warning.style.display = "flex"; // Show warning if second date is before first date
		} else {
			warning.style.display = "none"; // Hide warning if not
		}
	}
	
	deadline.onchange = function() {
		if (deadline.valueAsDate >= harvestDate.valueAsDate) {
			warning2.style.display = "flex"; // Show warning if second date is before first date
		} else {
			warning2.style.display = "none"; // Hide warning if not
		}
	}

	/* window.onload = function() {
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
		document.getElementById("harvestDate").setAttribute("min", today);

		var harvestDate = document.getElementById('harvestDate');
		var harvest2Date = document.getElementById('harvest2Date');
		var deadline = document.getElementById('deadline');

		var warning = document.querySelector('.warn-one');
		warning.style.display = "none"; // Initially hide the warning

		harvest2Date.onchange = function() {
			if (harvestDate.valueAsDate >= harvest2Date.valueAsDate) {
				warning.style.display = "flex"; // Show warning if second date is before first date
			} else {
				warning.style.display = "none"; // Hide warning if not
			}
		}

		var warning2 = document.querySelector('.warn-two');
		warning2.style.display = "none";

		deadline.onchange = function() {
			if (deadline.valueAsDate >= harvestDate.valueAsDate) {
				warning2.style.display = "flex"; // Show warning if second date is before first date
			} else {
				warning2.style.display = "none"; // Hide warning if not
			}
		}

	} */
</script>

</html>