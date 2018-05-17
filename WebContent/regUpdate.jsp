<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
	        div#main{ position: absolute; border: 1.5px solid #A4A4A4; width: 320px; height: 650px; left: 40%;
				top: 100px; text-align: center; }
	        span#regTxt{ position: absolute; left: 100px;
	            top: 10px; font-size: 20px; }

	        b#id{ position: absolute; left: 15px; top: 77px; font-size: 13px; }
	        input#regId{ position: absolute; left: 75px; top: 75px; width: 200px; height: 25px; font-size: 10px; }
	        button#idChk{ position: absolute; left: 280px; top: 75px; width: 69px;
	            height: 25px; color: white; background-color: black; border-style: none; font-size: 10px; }
	        
	        
	        b#pw{ position: absolute; left: 15px; top: 130px; font-size: 13px; }
	        input#regPw{ position: absolute; left: 105px; top: 127px;
	            width: 170px; height: 25px; font-size: 10px; }	
	        
	        b#newPw{ position: absolute; left: 15px; top: 183px; font-size: 13px; }
	        input#regNewPw{
	            position: absolute; left: 105px; top: 180px;
	            width: 170px; height: 25px; font-size: 10px;  }
	            
	        b#newPwChk{ position: absolute; left: 15px; top: 236px; font-size: 13px; }
	        input#regNewPwChk{  position: absolute; left: 120px; top: 236px;
	            width: 155px; height: 25px; font-size: 10px;  }  

	        b#name{ position: absolute; left: 15px; top: 289px; font-size: 13px;  }
	        input#regName{ position: absolute; left: 75px; top: 286px;
 				width: 200px; height: 25px; font-size: 10px;     } 
	        
	        b#Gender{ position: absolute; left: 15px; top: 340px; font-size: 13px; }  
	        span#gender{ position: absolute; left: 75px; top: 339px; }
			label#lbM{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px;}
			label#lbW{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px; }
			input#man{ display: none; }
			input#woman{ display: none; }
	        
	        b#birth{ position: absolute; left: 15px; top: 395px; font-size: 13px; }
	        select#regBirthYear{ position: absolute; left: 75px; top:392px;}
	        select#regBirthMonth{ position: absolute; left: 130px; top: 392px; }
	        select#regBirthDay{ position: absolute; left: 170px; top: 392px; }
	        
	        b#email{ position: absolute; left: 15px; top: 448px; font-size: 13px; }
	        input#regEmail{ position: absolute; left: 75px; top: 445px;
	            width: 200px; height: 25px; font-size: 10px;             }
	            
	        b#num{ position: absolute; left: 15px; top: 501px; font-size: 13px; }
	        span#regNum-{position: absolute; left: 155px; top: 498px;}
	        input#regNum1{ position: absolute; left: 100px; top: 498px;
	            width: 50px; height: 25px; font-size: 10px;             }    
	        input#regNum2{ position: absolute; left: 165px; top: 498px;
	            width: 50px; height: 25px; font-size: 10px;             }    
	            
	        b#phone{ position: absolute; left: 15px; top: 554px; font-size: 13px; }
	        span#regPhone-1{position: absolute; left: 155px; top: 551px;}
	        span#regPhone-2{position: absolute; left: 220px; top: 551px;}
	        input#regPhone1{ position: absolute; left: 100px; top: 551px;
	            width: 50px; height: 25px; font-size: 10px;             }
			input#regPhone2{ position: absolute; left: 165px; top: 551px;
	            width: 50px; height: 25px; font-size: 10px;             }
			input#regPhone3{ position: absolute; left: 235px; top: 551px;
	            width: 50px; height: 25px; font-size: 10px;             }

	        button#cancel{ position: absolute; left: 180px; top: 607px; width: 50px; height: 25px;    
	            color: white; background-color: black; border-style: none; font-size: 10px; }
	        button#save{
	            position: absolute; left: 240px; top: 607px; width: 50px; height: 25px;
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
            <span id="regPhone-1">-</span>
            <input id="regPhone2" type="text"/>
            <span id="regPhone-2">-</span>
            <input id="regPhone3" type="text"/>
            
            
            <span class="msg" id="id_s"></span>
            <span class="msg" id="pw_s"></span>
            <span class="msg" id="pwC_s"></span>
            <span class="msg" id="name_s"></span>
            <span class="msg" id="gender_s"></span>
            <span class="msg" id="birth_s"></span>
            <span class="msg" id="email_s"></span>
            
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