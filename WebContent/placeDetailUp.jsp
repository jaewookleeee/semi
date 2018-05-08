<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<jsp:include page="menuBar.html"/>
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
	</div>
</body>
<script>
	$(".sub").click(function(){
	    $("#main").attr("src",this.src);
	});
	$("#detail").click(function(){
		console.log("hello");
	    $(this).css("background-color","deeppink");
	    $("#qa").css("background-color","white");
	    $("#reply").css("background-color","white");
	    $("#allinfo").after("<jsp:include page='placeDetail.jsp' flush='false'/>");
	});  
		$("#qa").click(function(){    
		     $(this).css("background-color","deeppink");
		     $("#detail").css("background-color","white");
		     $("#reply").css("background-color","white");    
		});
		$("#reply").click(function(){
		     $(this).css("background-color","deeppink");
		     $("#qa").css("background-color","white");
		     $("#detail").css("background-color","white");    
		}); 
</script>
</html>