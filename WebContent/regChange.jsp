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
            	height: 610px; left: 40%; top: 200px; text-align: center; }
            span#regTxt{ position: absolute; left: 95px; top: 10px; font-size: 20px; }
	        b#id{ position: absolute; left: 15px; top: 50px; font-size: 13px; }
	        b#pw{ position: absolute; left: 15px; top: 110px; font-size: 13px; }
	        b#name{ position: absolute; left: 15px; top: 170px; font-size: 13px; }
	        b#Gender{ position: absolute; left: 15px; top: 230px; font-size: 13px; }   
	        b#birth{ position: absolute; left: 15px; top: 290px; font-size: 13px; }
	        b#email{ position: absolute; left: 15px; top: 350px; font-size: 13px; }
	        b#num{ position: absolute; left: 15px; top: 410px; font-size: 13px; }
	        b#phone{ position: absolute; left: 15px; top: 470px; font-size: 13px; }
	        
	        input#regId{ position: absolute; left: 15px; top: 75px; width: 200px; height: 25px; font-size: 10px; }
	        input#regPw{ position: absolute; left: 15px; top: 135px; width: 200px; height: 25px; font-size: 10px; }
	        input#regName{ position: absolute; left: 15px; top: 195px; width: 200px; height: 25px; font-size: 10px; }
	        input#regGender{ position: absolute; left: 15px; top: 255px; width: 200px; height: 25px; font-size: 15px; }
	        /* span#gender{ position: absolute; left: 15px; top:255px; }  */
	      	input#regBirth{ position: absolute; left: 15px; top: 315px; width: 200px; height: 25px; font-size: 13px; }
	        /* select#regBirthYear{position: absolute;left: 15px;top: 315px; }
	        select#regBirthMonth{ position: absolute; left: 70px; top: 315px; }
	        select#regBirthDay{ position: absolute; left: 110px; top: 315px; } */
	        input#regEmail{ position: absolute; left: 15px; top: 375px; width: 200px; height: 25px; font-size: 10px; }
	        input#regNum{ position: absolute; left: 15px; top: 435px; width: 200px; height: 25px; font-size: 10px;  }
	        input#regPhone{ position: absolute; left: 15px; top: 495px; width: 200px; height: 25px; font-size: 10px;  }
	        button#cancel{ position: absolute; left: 180px; top: 555px; width: 50px; height: 25px;     color: white; 
	        	background-color: black; nborder-style: none; font-size: 10px; border: none;}
	        button#change{ position: absolute; left: 240px; top: 555px; width: 50px; height: 25px; font-size: 10px;
	            color: white; background-color: black; border-style: none; border: none;}	
            	
		</style>
	</head>
	<body>
		<div id="main">
            <span id="regTxt"><b>등록자 전환</b></span>
            <b id="id">아이디</b>
            <input id="regId" type="text" value="${sessionScope.loginId }" readonly>
            <b id="pw">비밀번호</b>
            <input id="regPw" type="password" value="" readonly>
            <b id="name">이름</b>
            <input id="regName" type="text" value="" readonly/>
            <b id="Gender">성별</b>
            <input id="regGender" type="text" readonly/>
            <!-- <span id="gender">
            	<input id="man" type="radio" name="regGender" value="남" checked readonly="readonly"/>남자
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input id="woman" type="radio" name="regGender" value="여" readonly="readonly"/>여자
            </span> -->
            <b id="birth">생년월일</b>
            <input id="regBirth" type="text" readonly="readonly"/>
            <%-- <select name="regBirthYear" id="regBirthYear">
            	<option value="년도" selected>년도</option>
            	<%for(int i=1950; i<2019; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="regBirthMonth" id="regBirthMonth">
            	<option value="월" selected>월</option>
            	<%for(int i=1; i<13; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="regBirthDay" id="regBirthDay">
            	<option value="일" selected>일</option>
            	<%for(int i=1; i<32; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select> --%>
            <b id="email">이메일</b>
            <input id="regEmail" type="email" readonly/>
            <b id="num">주민등록번호</b>
            <input id="regNum" type="text" placeholder="주민등록번호를 입력하세요."/>
            <b id="phone">휴대폰 번호</b>
            <input id="regPhone" type="tel" placeholder="휴대폰번호를 입력하세요."/>
            
            <button id="cancel">취소</button>
            <button id="change">변경</button>
        </div>
	</body>
	<script>
		$(document).ready(function() {
			 $("#regName").val();
		});
	
		$("#cancel").click(function() {
			location.href="index.jsp";
		});
		
		$("#change").click(function() {
			$.ajax({
				type : "post",
				url : "./regChange",
				data : {
					id : $("#regId").val(),
					pw : $("#regPw").val(),
					name : $("#regName").val(),
					gender : $("input[name='regGender']").val(),
					year : $("#regBirthYear").val(),
					month : $("#regBirthMonth").val(),
					day : $("#regBirthDay").val(),
					email : $("#regEmail").val(),
					num : $("#regNum").val(),
					phone : $("#regPhone").val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	</script>
</html>