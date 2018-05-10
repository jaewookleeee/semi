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
	            height: 720px;
	            left: 40%;
	            top: 200px;
	            text-align: center;
	        }
	        span#regTxt{
	            position: absolute;
	            left: 89px;
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
	        b#newPw{
	            position: absolute;
	            left: 15px;
	            top: 170px;
	            font-size: 13px;                
	        }
	        b#newPwChk{
	            position: absolute;
	            left: 15px;
	            top: 230px;
	            font-size: 13px;   
	        }
	        b#name{
	            position: absolute;
	            left: 15px;
	            top: 290px;
	            font-size: 13px; 
	        }
	        b#Gender{
	            position: absolute;
	            left: 15px;
	            top: 350px;
	            font-size: 13px;    
	        }   
	        b#birth{
	            position: absolute;
	            left: 15px;
	            top: 410px;
	            font-size: 13px;
	        }
	        b#email{
	            position: absolute;
	            left: 15px;
	            top: 470px;
	            font-size: 13px;            
	        }
	        b#num{
	            position: absolute;
	            left: 15px;
	            top: 530px;
	            font-size: 13px;  
	        }
	        b#phone{
	            position: absolute;
	            left: 15px;
	            top: 590px;
	            font-size: 13px;  
	        }
	        input#regId{
	            position: absolute;
	            left: 15px;
	            top: 75px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;
	        }
	        input#regPw{
	            position: absolute;
	            left: 15px;
	            top: 135px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;
	        }
	        input#newPw{
	            position: absolute;
	            left: 15px;
	            top: 195px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        input#newPwChk{
	            position: absolute;
	            left: 15px;
	            top: 255px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        input#regName{
	            position: absolute;
	            left: 15px;
	            top: 315px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;
	        }
	        span#gender{
	        	position: absolute;
	        	left: 15px;
	        	top:375px;
	        } 
	        /* span#genM{
	            position: absolute;
	            left: 15px;
	            top: 375px;
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
	            top: 375px;
	            border: 1px solid black;
	            width: 95px;
	            font-size: 15px;
	        }
	        input#woman{
	            display: none;
	        } */
	        /* input#regBirth{
	            position: absolute;
	            left: 15px;
	            top: 435px;
	            width: 200px;
	            height: 25px;
	            font-size: 13px;
	        } */
	        
	        select#regBirthYear{
	        	position: absolute;
	        	left: 15px;
	        	top: 435px;
	        }
	        select#regBirthMonth{
	        	position: absolute;
	        	left: 70px;
	        	top: 435px;
	        }
	        select#regBirthDay{
	        	position: absolute;
	        	left: 110px;
	        	top: 435px;
	        }
	        input#regEmail{
	            position: absolute;
	            left: 15px;
	            top: 495px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        input#regNum{
	            position: absolute;
	            left: 15px;
	            top: 555px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px; 
	        }
	        input#regPhone{
	            position: absolute;
	            left: 15px;
	            top: 615px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px; 
	        }
	        button#cancel{
	            position: absolute;
	            left: 180px;
	            top: 675px;
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
	            top: 675px;
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
		<div id="main">
            <span id="regTxt"><b>회원정보 수정</b></span>
            <b id="id">아이디</b>
            <input id="regId" type="text" readonly value="${sessionScope.loginId }"/>
            <b id="pw">현재 비밀번호</b>
            <input id="regPw" type="password" placeholder="비밀번호를 입력하세요."/>
            <b id="newPw">새 비밀번호</b>
            <input id="newPw" type="password" placeholder="비밀번호를 입력하세요."/>
            <b id="newPwChk">새 비밀번호 확인</b>
            <input id="newPwChk" type="password" placeholder="비밀번호를 입력하세요."/>
            <b id="name">이름</b>
            <input id="regName" type="text" readonly/>
            <b id="Gender">성별</b>
            <span id="gender">
            	<input id="man" type="radio" name="regGender" value="남" checked/>남자
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input id="woman" type="radio" name="regGender" value="여"/>여자
            </span>
            <!-- <span id="genM">
                <input id="man" type="radio" name="userGenger" value="남자"/>
                <label id="manLb" for="man">남자</label>
            </span>
            
            <span id="genW">
                <input id="woman" type="radio" name="userGenger" value="여자"/>
                <label id="womanLb" for="woman">여자</label>
            </span>          -->       
            <b id="birth">생년월일</b>
            <!-- <input id="regBirth" type="date" value="2018-05-07"/> -->
            <select name="regBirthYear" id="regBirthYear">
            	<option value="년도" selected>년도</option>
            	<!-- <option value="1991" >1991</option>
            	<option value="1992" >1992</option>
            	<option value="1993" >1993</option>
            	<option value="1994" >1994</option>
            	<option value="1995" >1995</option> -->
            	<%for(int i=1950; i<2019; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="regBirthMonth" id="regBirthMonth">
            	<option value="월" selected>월</option>
            	<!-- <option value="1" >1</option>
            	<option value="2" >2</option>
            	<option value="3" >3</option>
            	<option value="4" >4</option>
            	<option value="5" >5</option> -->
            	<%for(int i=1; i<13; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="regBirthDay" id="regBirthDay">
            	<option value="일" selected>일</option>
            	<!-- <option value="1" >1</option>
            	<option value="2" >2</option>
            	<option value="3" >3</option>
            	<option value="4" >4</option>
            	<option value="5" >5</option> -->
            	<%for(int i=1; i<32; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            <b id="email">이메일</b>
            <input id="regEmail" type="email" placeholder="이메일을 입력하세요."/>
            <b id="num">주민등록번호</b>
            <input id="regNum" type="text" placeholder="주민등록번호를 입력하세요."/>
            <b id="phone">휴대폰 번호</b>
            <input id="regPhone" type="tel" placeholder="휴대폰번호를 입력하세요."/>
            
            <button id="cancel">취소</button>
            <button id="join">완료</button>
        </div>
	</body>
	<script>
	
	</script>
</html>