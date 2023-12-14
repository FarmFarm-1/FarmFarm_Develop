<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundingList</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>상품명</th>
				<th>재배 예정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${fundingList }" var="list">
				<tr>
					<td><a
						onclick="location.href='${cpath}/funding/fundingDetail?product_serial_num=${list.product_serial_num }';">${list.product_name }</a></td>
					<td>${list.expected_planting_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>