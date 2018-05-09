<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		
		<style>
			#all{
	                position: absolute;
	                top:100px;
	                left:500px;
	            }
	            
	        #main{
	            padding: 5px;
	            width: 580px;
	            height: 200px;
	            position: relative;
	            left: 10px
	        }
	        
	        .sub{
	            width: 100px;
	            position: relative;
	            left: 40px
	        }
	        
	        div{
	            background-color: white;
	        }
	        
	        .info{
	            float: left;
	            padding: 0px 50px;
	            text-align: center;
	            width: 100px;
	            border: 1px solid black;
	        }
		</style>
		
	</head>
	<body>
		<div id="all">
        	<img id="main" src="#"/><br/>
        	<img class="sub" src="#"/>
        	<img class="sub" src="#"/>
        	<img class="sub" src="#"/>
	        <img class="sub" src="#"/>
	        <img class="sub" src="#"/>
	        <div id="allinfo">
	            <div class="info" id="detail">상세정보</div>
	            <div class="info" id="qa">QA</div>
	            <div class="info" id="reply">이용후기</div>
	        </div>  
	        <div id="area"></div>
		</div>
	</body>
	<script>
		// 하단의 img 태그를 클릭하면 메인 img 태그에 클릭한 사진이 삽입됨
		$(".sub").click(function(){
		    $("#main").attr("src",this.src);
		});
	
		// 장소정보에서 상세정보는 기본으로 켜져있음
		$(document).ready(function() {
			$("#area").load("placeDetail.jsp");
		});
	
		// div(상세정보, QA, 이용후기)를 클릭하면,
		// 1. 클릭한 div의 색상을 핑크로 변경하고, 나머지 div의 색상을 흰색으로 설정
		// 2. 클릭한 div에 따라, 다른 페이지(placeDetail.jsp OR qa.jsp OR reply.jsp)를 가져옴
		$(".info").click(function(e) {
			var page = "";
			$(this).css("background-color","#FF376C");
			
			if(e.target.id == "detail") {
				page = "placeDetail.jsp";
				$("#qa").css("background-color","white");
		    	$("#reply").css("background-color","white");
			} else if(e.target.id == "qa") {
				page = "qa.jsp";
				$("#detail").css("background-color","white");
		    	$("#reply").css("background-color","white");
			} else {
				page = "reply.jsp";
				$("#detail").css("background-color","white");
		    	$("#qa").css("background-color","white");
			}
			
			$("#area").load(page, function(res, stat) { $("#area").html(res); });
		});
	</script>
</html>