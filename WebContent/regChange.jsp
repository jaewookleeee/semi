<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
	        div#main{ position: absolute; border: 1.5px solid #A4A4A4; width: 320px; height: 500px; left: 40%;
				top: 100px; text-align: center; }
	        span#regTxt{ position: absolute; left: 100px;
	            top: 10px; font-size: 20px; }

	        b#id{ position: absolute; left: 15px; top: 77px; font-size: 13px; }
	        input#regId{ position: absolute; left: 75px; top: 75px; width: 200px; height: 25px; font-size: 10px; }
	        button#idChk{ position: absolute; left: 280px; top: 75px; width: 69px;
	            height: 25px; color: white; background-color: black; border-style: none; font-size: 10px; }

	        b#name{ position: absolute; left: 15px; top: 130px; font-size: 13px;  }
	        input#regName{ position: absolute; left: 75px; top: 127px;
 				width: 200px; height: 25px; font-size: 10px;     } 
	        
	        b#Gender{ position: absolute; left: 15px; top: 183px; font-size: 13px; }  
	        input#regGender{ position: absolute; left: 75px; top: 180px; }
	        
	        b#birth{ position: absolute; left: 15px; top: 236px; font-size: 13px; }
	        input#regBirth{ position: absolute; left: 75px; top:233px;}
	        
	        b#email{ position: absolute; left: 15px; top: 289px; font-size: 13px; }
	        input#regEmail{ position: absolute; left: 75px; top: 289px;
	            width: 200px; height: 25px; font-size: 10px;             }
	            
	        b#num{ position: absolute; left: 15px; top: 342px; font-size: 13px; }
	        span#regNum-{position: absolute; left: 155px; top: 339px;}
	        input#regNum1{ position: absolute; left: 100px; top: 339px;
	            width: 50px; height: 25px; font-size: 10px;             }    
	        input#regNum2{ position: absolute; left: 165px; top: 339px;
	            width: 50px; height: 25px; font-size: 10px;             }    
	            
	        b#phone{ position: absolute; left: 15px; top: 395px; font-size: 13px; }
	        span#regPhone-1{position: absolute; left: 155px; top: 392px;}
	        span#regPhone-2{position: absolute; left: 220px; top: 392px;}
	        input#regPhone1{ position: absolute; left: 100px; top: 392px;
	            width: 50px; height: 25px; font-size: 10px;             }
			input#regPhone2{ position: absolute; left: 165px; top: 392px;
	            width: 50px; height: 25px; font-size: 10px;             }
			input#regPhone3{ position: absolute; left: 235px; top: 392px;
	            width: 50px; height: 25px; font-size: 10px;             }

	        button#cancel{ position: absolute; left: 180px; top: 448px; width: 50px; height: 25px;    
	            color: white; background-color: black; border-style: none; font-size: 10px; }
	        button#change{
	            position: absolute; left: 240px; top: 448px; width: 50px; height: 25px;
	            font-size: 10px; color: white; background-color: black; border-style: none; }
	            
	        span#id_s{position: absolute; left: 75px; top: 105px;}
	        span#pw_s{position: absolute; left: 75px; top: 157px;}
	        span#pwC_s{position: absolute; left: 75px; top: 210px;}
	        span#name_s{position: absolute; left: 75px; top: 264px;}
	        span#gender_s{position: absolute; left: 75px; top: 316px;}
	        span#birth_s{position: absolute; left: 75px; top: 368px;}
	        span#email_s{position: absolute; left: 75px; top: 422px;}
	            
	            
            	
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
            <span id="regPhone-1">-</span>
            <input id="regPhone2" type="text"/>
            <span id="regPhone-2">-</span>
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