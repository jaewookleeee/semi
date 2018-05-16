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
	            top: 100px;
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
	        input#regNewPw{
	            position: absolute;
	            left: 15px;
	            top: 195px;
	            width: 200px;
	            height: 25px;
	            font-size: 10px;            
	        }
	        input#regNewPwChk{
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
	        label#lbM{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px;}
			label#lbW{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px; }
			input#man{ display: none; }
			input#woman{ display: none; }
	        
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
	        
	        span#regNum-{position: absolute; left: 107px; top: 555px;}
	        input#regNum1{ position: absolute; left: 15px; top: 555px;
	            width: 85px; height: 25px; font-size: 10px;  }
	        input#regNum2{ position: absolute; left: 120px; top: 555px;   
	            width: 85px; height: 25px; font-size: 10px;  }
	            
	        span#regNum-1{position: absolute; left: 60px; top: 615px;}
	        span#regNum-2{position: absolute; left: 115px; top: 615px;}    
	        input#regPhone1{ position: absolute; left: 15px; top: 615px;
	            width: 40px; height: 25px; font-size: 10px; }
	        input#regPhone2{ position: absolute; left: 70px; top: 615px;
	            width: 40px; height: 25px; font-size: 10px; }
			input#regPhone3{ position: absolute; left: 125px; top: 615px;
	            width: 40px; height: 25px; font-size: 10px; }	
	        
	        
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
	        button#save{
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
		<jsp:include page="menuBar.jsp"/>
		<div id="main">
            <span id="regTxt"><b>회원정보 수정</b></span>
            <b id="id">아이디</b>
            <input id="regId" type="text" readonly value="${sessionScope.loginId }"/>
            <b id="pw">현재 비밀번호</b>
            <input id="regPw" type="password" placeholder="비밀번호를 입력하세요."/>
            
            <b id="newPw">새 비밀번호</b>
            <input id="regNewPw" type="password" placeholder="비밀번호를 입력하세요."/>
            
            <b id="newPwChk">새 비밀번호 확인</b>
            <input id="regNewPwChk" type="password" placeholder="비밀번호를 입력하세요."/>
            
            <b id="name">이름</b>
            <input id="regName" type="text" placeholder="이름을 입력하세요."/>
            <b id="Gender">성별</b>
          	<span id="gender">
            	<label id="lbM"><input id="man" type="radio" name="regGender" value="남"/>남자</label>
            	&nbsp;
            	<label id="lbW"><input id="woman" type="radio" name="regGender" value="여"/>여자</label>
            </span>

            <b id="birth">생년월일</b>
            <!-- <input id="regBirth" type="date" value="2018-05-07"/> -->
            <select name="regBirthYear" id="regBirthYear">
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
            </select>
            
            <b id="email">이메일</b>
            <input id="regEmail" type="email" placeholder="이메일을 입력하세요."/>
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
            <button id="save">수정</button>
        </div>
	</body>
	<script>
		$("#man").click(function() {
			$("#lbM").css("background", "#FA5882");
			$("#lbW").css("background", "white");
			
			$("#lbM").css("color", "white");
			$("#lbW").css("color", "black");
		});
		$("#woman").click(function() {
			$("#lbW").css("background", "#FA5882");
			$("#lbM").css("background", "white");
			
			$("#lbW").css("color", "white");
			$("#lbM").css("color", "black");
		});	
	
	
		$("#cancel").click(function() {
			location.href="index.jsp";
		});
		
		$("#save").click(function() {
			var newPw = $("#regNewPw").val();
			var newPwChk = $("#regNewPwChk").val();
			var pw = $("#regPw").val();
			
			if($("#regPw").val()==""){
				alert("현재 비밀번호 입력");				
				$("#regPw").focus();//포커스 이동
			}else if($("#regNewPw").val()==""){
				alert("새 비밀번호 입력");				
				$("#regNewPw").focus();//포커스 이동	
			}else if($("#regNewPw").val().length < 8 || $("#regNewPw").val().length >12){
				alert("비밀번호 8~12자리 입력");
				$("#regNewPw").focus();//포커스 이동	
			}else if($("#regNewPwChk").val()==""){
				alert("새 비밀번호 재입력");
				$("#regNewPwChk").focus();
			}else if($("#regNewPw").val() != $("#regNewPwChk").val()){
				alert("비밀번호 재입력");
				$("#regNewPwChk").focus();//포커스 이동	
			}else if($("#regName").val()==""){
				alert("이름을 입력");
				$("#regName").focus();//포커스 이동	
			}else if($("#man").get(0).checked != true && $("#woman").get(0).checked != true){
				alert("성별을 선택");	
			}else if($("#regBirthYear").val()=="년도"){
				alert("년도를 선택해주세요.");
				$("#regBirthYear").focus();
			}else if($("#regBirthMonth").val()=="월"){
				alert("월을 선택해주세요.");
				$("#regBirthMonth").focus();
			}else if($("#regBirthDay").val()=="일"){
				alert("일을 선택해주세요.");
				$("#regBirthDay").focus();
			}else if($("#regEmail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#regEmail").focus();
			}else if($("#regNum1").val()==""){
				alert("주민등록번호 앞자리를 입력해주세요.");
				$("#regNum1").focus();
			}else if($("#regNum2").val()==""){
				alert("주민등록번호 뒷자리를 입력해주세요.");
				$("#regNum2").focus();
			}else if($("#regPhone1").val()==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#regPhone1").focus();
			}else if($("#regPhone2").val()==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#regPhone2").focus();
			}else if($("#regPhone3").val()==""){
				alert("휴대폰 번호를 입력해주세요.");
				$("#regPhone3").focus();
			}else {
				$.ajax({
					type : "post",
					url : "./regUpdate",
					data : {
						id : $("#regId").val(),
						pw : $("#regPw").val(),
						newPw : $("#regNewPw").val(),
						newPwChk : $("#regNewPwChk").val(),
						name : $("#regName").val(),
						gender : $("input[name='regGender']:checked").val(),
						year : $("#regBirthYear").val(),
						month : $("#regBirthMonth").val(),
						day : $("#regBirthDay").val(),
						email : $("#regEmail").val(),
						num1 : $("#regNum1").val(),
						num2 : $("#regNum2").val(),
						phone1 : $("#regPhone1").val(),
						phone2 : $("#regPhone2").val(),
						phone3 : $("#regPhone3").val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if(data.success >0){
							alert("수정 성공");
							location.href="regDetail.jsp";
						}else{
							alert("수정 실패");
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