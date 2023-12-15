<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>donut progress bar</title>
<link rel="stylesheet" href="${cpath }/styles/progressBar.css" />

</head>
<body>
	<div class="circular">
		<div class="inner"></div>
		<div class="outer"></div>
		<div class="numb">0%</div>
		<div class="circle">
			<div class="dot">
				<span></span>
			</div>
			<div class="bar left">
				<div class="progress"></div>
			</div>
			<div class="bar right">
				<div class="progress"></div>
			</div>
		</div>
	</div>
	<script>
            const numb = document.querySelector(".numb");
            let counter = 0;
            setInterval(()=>{
              if(counter == 67){
                clearInterval();
              }else{
                counter+=1;
                numb.textContent = counter + "%";
              }
            }, 80);
         </script>
</body>
</html>