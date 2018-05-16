<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
 			div#bookInfo{
 				border: 1px solid black;
 				position: absolute;
 				left: 40%;
 				top: 100px;
 				width: 300px;
 				height: 300px;
 				text-align: center;
 			}
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div id="bookInfo">
			<h3>예약 정보</h3>
			<div id="placeName"></div>
			<div id="bookDate"></div>
			<div id="bookTime"></div>
			<div id="bookCustom"></div>
			<div id="bookPrice"></div>
			
        </div>
	</body>
	<script>
		$(document).ready(function() {
			$.ajax({
				type:"post",
				url:"./bookInfo",
				dataType:"json",
				success : function(data){
					console.log(data);
					if(data.login == false){
						alert("로그인");
					}else{
						$("#bookDate").html(data.bookInfo.book_date);
						$("#bookTime").html(data.bookInfo.book_start+" ~ "+data.bookInfo.book_end);
						$("#bookCustom").html(data.bookInfo.book_custom);
						$("#bookPrice").html(data.bookInfo.book_price);
					}
					
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
	</script>
</html>