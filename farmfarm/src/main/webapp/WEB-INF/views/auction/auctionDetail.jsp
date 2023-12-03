<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>상품명</th>
				<th>재배 예정일</th>
				<th>평수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${auctionInfo.product_name}</td>
				<td>${auctionInfo.expected_planting_date}</td>
				<td>${auctionInfo.farm_square_footage}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>