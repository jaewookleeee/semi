<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
        	div#main{ position: absolute; border: 1.5px solid #A4A4A4; width: 310px;
            	height: 550px; left: 40%; top: 100px; text-align: center; }
            span#regTxt{ position: absolute; left: 95px; top: 10px; font-size: 20px; }
	        b#id{ position: absolute; left: 15px; top: 50px; font-size: 13px; }
	        b#name{ position: absolute; left: 15px; top: 110px; font-size: 13px; }
	        b#Gender{ position: absolute; left: 15px; top: 170px; font-size: 13px; }   
	        b#birth{ position: absolute; left: 15px; top: 230px; font-size: 13px; }
	        b#email{ position: absolute; left: 15px; top: 290px; font-size: 13px; }
	        b#num{ position: absolute; left: 15px; top: 350px; font-size: 13px; }
	        b#phone{ position: absolute; left: 15px; top: 410px; font-size: 13px; }
	        
	        input#regId{ position: absolute; left: 15px; top: 75px; width: 200px; height: 25px; font-size: 10px; }
	        input#regName{ position: absolute; left: 15px; top: 135px; width: 200px; height: 25px; font-size: 10px; }
	        input#regGender{ position: absolute; left: 15px; top: 195px; width: 200px; height: 25px; font-size: 10px; }
	      	input#regBirth{ position: absolute; left: 15px; top: 255px; width: 200px; height: 25px; font-size: 10px; }
	        input#regEmail{ position: absolute; left: 15px; top: 315px; width: 200px; height: 25px; font-size: 10px; }
	        /* input#regNum{ position: absolute; left: 15px; top: 375px; width: 200px; height: 25px; font-size: 10px;  }
	        input#regPhone{ position: absolute; left: 15px; top: 435px; width: 200px; height: 25px; font-size: 10px;  } */
	        
	        span#regNum-{position: absolute; left: 107px; top: 375px;}
	        input#regNum1{ position: absolute; left: 15px; top: 375px;
	            width: 85px; height: 25px; font-size: 10px;  }
	        input#regNum2{ position: absolute; left: 120px; top: 375px;   
	            width: 85px; height: 25px; font-size: 10px;  }
	            
	        span#regNum-1{position: absolute; left: 60px; top: 435px;}
	        span#regNum-2{position: absolute; left: 115px; top: 435px;}    
	        input#regPhone1{ position: absolute; left: 15px; top: 435px;
	            width: 40px; height: 25px; font-size: 10px; }
	        input#regPhone2{ position: absolute; left: 70px; top: 435px;
	            width: 40px; height: 25px; font-size: 10px; }
			input#regPhone3{ position: absolute; left: 125px; top: 435px;
	            width: 40px; height: 25px; font-size: 10px; }	
	            
	        button#cancel{ position: absolute; left: 180px; top: 495px; width: 50px; height: 25px;     color: white; 
	        	background-color: black; nborder-style: none; font-size: 10px; border: none;}
	        button#change{ position: absolute; left: 240px; top: 495px; width: 50px; height: 25px; font-size: 10px;
	            color: white; background-color: black; border-style: none; border: none;}	
            	
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div id="main">
            <span id="regTxt"><b>등록자 전환</b></span>
            <b id="id">아이디</b>
            <input id="regId" type="text" value="${sessionScope.loginId }" readonly>
            <b id="name">이름</b>
            <input id="regName" type="text" value="" readonly/>
            <b id="Gender">성별</b>
            <input id="regGender" type="text" readonly/>
            <b id="birth">생년월일</b>
            <input id="regBirth" type="text" readonly="readonly"/>
            <b id="email">이메일</b>
            <input id="regEmail" type="email" readonly/>
            <b id="num">주민등록번호</b>
            <input id="regNum1" type="text" placeholder=""/>
            <span id="regNum-">-</span>
            <input id="regNum2" type="text" placeholder=""/>
            <b id="phone">휴대폰 번호</b>
            <input id="regPhone1" type="text"/>
            <span id="regNum-1">-</span>
            <input id="regPhone2" type="text"/>
            <span id="regNum-2">-</span>
            <input id="regPhone3" type="text"/>
            
            <button id="cancel">취소</button>
            <button id="change">변경</button>
        </div>
	</body>
	<script>
		$(document).ready(function() {
			 $.ajax({
				 type : "post",
				 url : "./userInfo",
				 dataType : "json",
				 success : function (data) {
					if(data.login==false){
						alert("로그인ㄱ");
						location.href="login.jsp";
					}else if(data.login==true && data.userInfo != null){
						console.log(data.userInfo);
						$("#regName").val(data.userInfo.info_name);
						$("#regGender").val(data.userInfo.info_gender);
						$("#regBirth").val(data.userInfo.info_birth);
						$("#regEmail").val(data.userInfo.info_email);
					}
				},
				error : function (error) {
					console.log(error);
				}
			 });
		});
	
		$("#cancel").click(function() {
			location.href="index.jsp";
		});
		
		$("#change").click(function() {
			if($("#regNum1").val()==""){
				alert("주민등록번호 앞자리 입력");
				$("#regNum1").focus();
			}else if($("#regNum1").val().length < 6){
				alert("주민등록번호 6자리 입력");
				$("#regNum1").focus();
			}else if($("#regNum2").val()==""){
				alert("주민등록번호 뒷자리 입력");
				$("#regNum2").focus();
			}else if($("#regNum2").val().length < 7){
				alert("주민등록번호 7자리 입력");
				$("#regNum2").focus();
			}else if($("#regPhone1").val()==""){
				alert("휴대폰 번호 입력");
				$("#regPhone1").focus();
			}else if($("#regPhone2").val()==""){
				alert("휴대폰 번호 입력");
				$("#regPhone2").focus();
			}else if($("#regPhone3").val()==""){
				alert("휴대폰 번호 입력");
				$("#regPhone3").focus();
			}else{
				$.ajax({
					type : "post",
					url : "./regChange",
					data : {
						num1 : $("#regNum1").val(),
						num2 : $("#regNum2").val(),
						phone1 : $("#regPhone1").val(),
						phone2 : $("#regPhone2").val(),
						phone3 : $("#regPhone3").val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						console.log(data.loginId);
						console.log(data.loginDiv);
						if(data.success > 0){
							alert("등록자 전환 완료");
						}else{
							alert("등록자 전환 실패");
							location.href="regChange.jsp";
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			}
		});
	</script>
</html>