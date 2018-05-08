<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#main{
            position: absolute;
            border: 1.5px solid #A4A4A4;
            width: 310px;
            height: 540px;
            left: 40%;
            top: 200px;
            text-align: center;
	        }
	        span#usertxt{
	            position: absolute;
	            left: 75px;
	            top: 10px;
	            font-size: 20px;     
	        }
	        b#id{
	            position: absolute;
	            left: 15px;
	            top: 50px;
	            font-size: 13px;
	        }
	        b#pw{
	            position: absolute;
	            left: 15px;
	            top: 110px;
	            font-size: 13px;    
	        }
	        b#pwChk{
	            position: absolute;
	            left: 15px;
	            top: 170px;
	            font-size: 13px;                
	        }
	        b#name{
	            position: absolute;
	            left: 15px;
	            top: 230px;
	            font-size: 13px; 
	        }
	        b#Gender{
	            position: absolute;
	            left: 15px;
	            top: 290px;
	            font-size: 13px;    
	        }   
	        b#birth{
	            position: absolute;
	            left: 15px;
	            top: 350px;
	            font-size: 13px;
	        }
	        b#email{
	            position: absolute;
	            left: 15px;
	            top: 410px;
	            font-size: 13px;            
	        }
	        input#userId{
	            position: absolute;
	            left: 15px;
	            top: 75px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;
	        }
	        button#idChk{
	            position: absolute;
	            left: 220px;
	            top: 75px;
	            width: 69px;
	            height: 25px;
	            color: white;
	            background-color: black;
	            border-style: none;
	            font-size: 10px;
	        }
	        input#userPw{
	            position: absolute;
	            left: 15px;
	            top: 135px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;
	        }
	        input#userPwChk{
	            position: absolute;
	            left: 15px;
	            top: 195px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        input#userName{
	            position: absolute;
	            left: 15px;
	            top: 255px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;    
	        }
	        span#gender{
	        	position: absolute;
	        	left: 15px;
	        	top: 315px;
	        }
/* 	        span#genM{
	            position: absolute;
	            left: 15px;
	            top: 315px;
	            border: 1px solid black;
	            width: 95px;
	            font-size: 15px;
	            
	        }
	        input#man{
	            display: none;
	        }
	        span#genW{
	            position: absolute;
	            left: 118;
	            top: 315px;
	            border: 1px solid black;
	            width: 95px;
	            font-size: 15px;
	        }
	        input#woman{
	            display: none;
	        } */
	        /* input#userBirth{
	            position: absolute;
	            left: 15px;
	            top: 375px;
	            width: 200px;
	            height: 25px;
	            font-size: 13px;
	        } */
	        select#userBirthYear{
	        	position: absolute;
	        	left: 15px;
	        	top: 375px;
	        }
	        select#userBirthMonth{
	        	position: absolute;
	        	left: 70px;
	        	top: 375px;
	        }
	        select#userBirthDay{
	        	position: absolute;
	        	left: 110px;
	        	top: 375px;
	        }
	        input#userEmail{
	            position: absolute;
	            left: 15px;
	            top: 435px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        button#cancel{
	            position: absolute;
	            left: 180px;
	            top: 495px;
	            width: 50px;
	            height: 25px;    
	            color: white;
	            background-color: black;
	            border-style: none;
	            font-size: 10px;
	        }
	        button#join{
	            position: absolute;
	            left: 240px;
	            top: 495px;
	            width: 50px;
	            height: 25px;
	            font-size: 10px;
	            color: white;
	            background-color: black;
	            border-style: none;            
	        }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.html"/>
		<div id="main">
            <span id="userTxt"><b>사용자 회원가입</b></span>
            <b id="id">아이디</b>
            <input id="userId" name="userId" type="text" placeholder=" 아이디를 입력하세요."/>
            <!--<input id="idChk" type="button" value="중복 확인"/>-->
            <button id="idChk" name="idChk">중복 확인</button>
            <b id="pw">비밀번호</b>
            <input id="userPw" name="userPw" type="password" placeholder="비밀번호를 입력하세요."/>
            <b id="pwChk">비밀번호 확인</b>
            <input id="userPwChk" name="userPwChk" type="password" placeholder="비밀번호를 입력하세요."/>
            <b id="name">이름</b>
            <input id="userName" name="userName" type="text" placeholder="이름을 입력하세요."/>
            <b id="Gender">성별</b>
            <span id="gender">
            	<input id="man" type="radio" name="userGenger" value="남자" checked/>남자
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input id="woman" type="radio" name="userGenger" value="여자"/>여자
            </span>
            <!-- <span id="genM">
                <input id="man" type="radio" name="userGenger" value="남자"/>
                <label id="manLb" for="man">남자</label>
            </span>
            
            <span id="genW">
                <input id="woman" type="radio" name="userGenger" value="여자"/>
                <label id="womanLb" for="woman">여자</label>
            </span>    -->             
            <b id="birth">생년월일</b>
            <!-- <input id="userBirth" type="date" value="2018-05-07"/> -->
            <select name="userBirthYear" id="userBirthYear">
            	<option value="년도" selected>년도</option>
            	<option value="1991" >1991</option>
            	<option value="1992" >1992</option>
            	<option value="1993" >1993</option>
            	<option value="1994" >1994</option>
            	<option value="1995" >1995</option>
            </select>
            <select name="userBirthMonth" id="userBirthMonth">
            	<option value="월" selected>월</option>
            	<option value="1" >1</option>
            	<option value="2" >2</option>
            	<option value="3" >3</option>
            	<option value="4" >4</option>
            	<option value="5" >5</option>
            </select>
            <select name="userBirthDay" id="userBirthDay">
            	<option value="일" selected>일</option>
            	<option value="1" >1</option>
            	<option value="2" >2</option>
            	<option value="3" >3</option>
            	<option value="4" >4</option>
            	<option value="5" >5</option>
            </select>
            
            <b id="email">이메일</b>
            <input id="userEmail" type="email" placeholder="이메일을 입력하세요."/>
            <button id="cancel">취소</button>
            <button id="join">완료</button>
        </div>
	</body>
	<script>
		$("#join").click(function() {
			$.ajax({
				type : "post",
				url : "/userJoin",
				DATA : {
					id : $("#userId").html(),
					pw : $("#userPw").html(),
					name : $("#userName").html(),
					gender : $("#userGender").html(),
					year : $("#userBirthYear").html(),
					month : $("#userBirthMonth").html(),
					day : $("#userBirthday").html(),
					email : $("#userEmail").html()
				},
				DataType : "json",
				success : function(data) {
					console.log(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		})
	</script>
</html>