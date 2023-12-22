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
<title>mypage/파머/나의프로젝트/업데이트</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700" />
<link rel="stylesheet" href="${cpath }/styles/mypage--84M.css" />
</head>
<script>
	var cultivating_image;

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
				cultivating_image = response; // 업로드된 이미지의 URL을 반환
			},
			error : function(error) {
				console.log(error);
			}
		});

	}

	function goUpdate() {
		
		var cultivate_status = $(".status3-vcM.selected").text();
		var cultivating_content = $(".rectangle-193-VoB").val();
		var etc_content = $(".rectangle-197-TjK").val();
		var fertilizer_content = $(".group-184-AgM").val();
		var fertilizer_amount = $(".auto-group-5tsx-CmT").val();
		var product_serial_num = '${map.product_serial_num}';

		var file = $('#inputFile')[0].files[0];

		if (cultivate_status != '' && cultivating_content != ''
				 && file) {
			
			imageUpload(file);

			$.ajax({
				url : '/myPageFarmer/updateCultivate',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify({
					"cultivate_status" : cultivate_status,
					"cultivating_content" : cultivating_content,
					"etc_content" : etc_content,
					"fertilizer_content" : fertilizer_content,
					"fertilizer_amount" : fertilizer_amount,
					"product_serial_num" : product_serial_num,
					"cultivating_image" : cultivating_image
				}),
				success : function(response) {
					if (response === 'success') {
						alert('상품 경작 정보 업데이트 성공');
						location.href = '/myPageFarmer';
					} else {
						alet('업데이트 실패 ㅋㅋ');
					}

				},
				error : function(error) {
					console.log(error);
				}
			});

		} else {
			alert('상태, 이미지, 경작 정보는 필수 입력해야 합니다.');
		}

	}
</script>
<script>
	function previewImage(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.auto-group-mgop-Juj').css('background-image',
						'url(' + e.target.result + ')');
				$('.vector-ZKs').remove();
				$('.item--fNu').remove();
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script>
	var isNowon;
	/* 상품 등록 - 카테고리 선택 */
	function disSelect() {
		$('.status3-vcM').css('background-color', '#f6f6f6');
		$('.status3-vcM').css('color', '#3a3a3a');
		$('.status3-vcM').removeClass("selected");

	}
	function type1() {
		disSelect();
		$('#nemo1').css('background-color', '#3d3d3d');
		$('#nemo1').css('color', '#ffffff');

		$('#nemo1').addClass("selected");

		$('.group-184-AgM').attr('readonly', true);
		$('.auto-group-5tsx-CmT').attr('readonly', true);
		$('.group-184-AgM').val('');
		$('.auto-group-5tsx-CmT').val('');

	}
	function type2() {
		disSelect();
		$('#nemo2').css('background-color', '#3d3d3d');
		$('#nemo2').css('color', '#ffffff');

		$('#nemo2').addClass("selected");

		$('.group-184-AgM').attr('readonly', false);
		$('.auto-group-5tsx-CmT').attr('readonly', false);
	}
	function type3() {
		disSelect();
		$('#nemo3').css('background-color', '#3d3d3d');
		$('#nemo3').css('color', '#ffffff');
		$('#nemo3').addClass("selected");
		
		$('.group-184-AgM').attr('readonly', true);
		$('.auto-group-5tsx-CmT').attr('readonly', true);
		$('.group-184-AgM').val('');
		$('.auto-group-5tsx-CmT').val('');
	}
	function type4() {
		disSelect();
		$('#nemo4').css('background-color', '#3d3d3d');
		$('#nemo4').css('color', '#ffffff');
		$('#nemo4').addClass("selected");

		$('.group-184-AgM').attr('readonly', true);
		$('.auto-group-5tsx-CmT').attr('readonly', true);
		$('.group-184-AgM').val('');
		$('.auto-group-5tsx-CmT').val('');
	}
</script>

<body>
	<div class="mypage--kNh">
		<div class="updateform-BLh">
			<div class="auto-group-797k-813">
				<p class="item--rBw">나의 경작 중인 프로젝트</p>
				<div class="item--9Rw">경작 중인 작물 상태를 업데이트 하고 펀딩 참여자들과 공유해 보세요.</div>
			</div>
			<div class="fundinginfo-zhT">
				<div class="fundinginfo-idT">
					<img class="tomatoes-55667411280-UMj" src = "${map.funding_thumb_img_url }">
					<div class="auto-group-h5qx-Xqo">
						<p class="item--453">${map.product_name }</p>
						<p class="item--ANy">${map.farm_name }</p>
						<div class="auto-group-zsah-4z9">
							<img class="mdi-location-CKf" src="./assets/mdi-location-A37.png" />
							<p class="item--Xsj">${map.farm_address }</p>
						</div>
					</div>
				</div>
			</div>
			<div class="line-66-saD"></div>
			<div class="line-67-Qq3"></div>
			<div class="line-68-kP7"></div>
			<div class="auto-group-2fbt-VLh">
				<div class="updatecurrentstatus-nqb">
					<div class="curentstausleft-WWh">
						<p class="item--4YD">현재 상태</p>
						<p class="item--nUD">현재 상태를 선택해주세요.</p>
					</div>
					<div class="currentstatuschoose-UM3">
						<div class="status3-vcM" id="nemo1" onclick="type1()">경작준비중</div>
						<div class="status3-vcM" id="nemo2" onclick="type2()">경작중</div>
						<div class="status3-vcM" id="nemo3" onclick="type3()">수확중</div>
						<div class="status3-vcM" id="nemo4" onclick="type4()">수확완료</div>
					</div>
				</div>
				<div class="updateimage-TEu">
					<div class="updateimageleft-Av1">
						<p class="item--vPP">경작중 이미지</p>
						<p class="item--Scd">경작중 이미지를 첨부해주세요.</p>
					</div>
					<div class="auto-group-mgop-Juj"
						onclick="document.getElementById('inputFile').click();">
						<div class="imageupload-2Kw">
							<img class="vector-ZKs" src="./assets/vector-uk1.png" />
							<p class="item--fNu">사진 올리기</p>
						</div>
					</div>
					<input type="file" id="inputFile" style="display: none;"
						onchange="previewImage(this)" />
				</div>
				<div class="updatecultivatingcontent-H9P">
					<div class="cultivatingcontentleft-bvm">
						<p class="item--8fo">경작 정보</p>
						<p class="item--RQ1">
							경작 과정에 대한 설명을 작성해 주세요. <br /> 이미지에 대한 설명도 좋습니다. (50자)
						</p>
					</div>
					<div class="auto-group-nwyy-Ftq">
						<textarea class="rectangle-193-VoB" maxlength='50'></textarea>
					</div>
				</div>
				<div class="updatefertilizer-VAu">
					<div class="fertilizerleft-pU5">
						<p class="item--Myo">사용한 비료</p>
						<p class="item--tD3">
							사용한 비료의 종류와 양을 기록해 주세요.<br>(경작중 상태에만 작성 가능)
						</p>
					</div>
					<input class="group-184-AgM" placeholder="비료의 종류를 입력해주세요." readonly />
					<div class="group-185-TYy">
						<input type=number class="auto-group-5tsx-CmT" placeholder="사용량"
							readonly />
						<div class="kg-3GH">kg</div>
					</div>
				</div>
				<div class="updateetc-Mnm">
					<div class="etcleft-7mw">
						<p class="item--sFK">기타</p>
						<p class="item--zaq">
							추가적으로 기록해야 할 내용이 있다면 기록해 주세요. <br>(100자)
						</p>
					</div>
					<textarea class="rectangle-197-TjK" maxlength='100'></textarea>
				</div>
			</div>
			<div class="updatebtn-yBs" onclick="goUpdate()">업데이트</div>
		</div>
	</div>
</body>
</html>