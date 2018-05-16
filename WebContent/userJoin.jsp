<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#main{ position: absolute; border: 1.5px solid #A4A4A4; width: 310px; height: 540px; left: 40%;
				top: 100px; text-align: center; }
	        span#usertxt{ position: absolute; left: 75px;
	            top: 10px; font-size: 20px; }
	        b#id{ position: absolute; left: 15px; top: 50px; font-size: 13px; }
	        b#pw{ position: absolute; left: 15px; top: 110px; font-size: 13px; }
	        b#pwChk{ position: absolute; left: 15px; top: 170px; font-size: 13px; }
	        b#name{ position: absolute; left: 15px; top: 230px; font-size: 13px;  }
	        b#Gender{ position: absolute; left: 15px; top: 290px; font-size: 13px; }   
	        b#birth{ position: absolute; left: 15px; top: 350px; font-size: 13px; }
	        b#email{ position: absolute; left: 15px; top: 410px; font-size: 13px; }
	        input#userId{ position: absolute; left: 15px; top: 75px; width: 200px; height: 25px; font-size: 10px; }
	        button#idChk{ position: absolute; left: 220px; top: 75px; width: 69px;
	            height: 25px; color: white; background-color: black; border-style: none; font-size: 10px; }
	        input#userPw{ position: absolute; left: 15px; top: 135px;
	            width: 200px; height: 25px; font-size: 10px; }
	        input#userPwChk{
	            position: absolute; left: 15px; top: 195px;
	            width: 200px; height: 25px; font-size: 10px;  }
	        input#userName{ position: absolute; left: 15px; top: 255px;
 				width: 200px; height: 25px; font-size: 10px;     } 
	        span#gender{ position: absolute; left: 15px; top: 315px; }
			
			label#lbM{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px;}
			label#lbW{ display: inline-block; border: 1px solid #A4A4A4; padding: 1px 20px; }
			input#man{ display: none; }
			input#woman{ display: none; }
			
	        select#userBirthYear{ position: absolute; left: 15px; top:375px;}
	        select#userBirthMonth{ position: absolute; left: 70px; top: 375px; }
	        select#userBirthDay{ position: absolute; left: 110px; top: 375px; }
	        input#userEmail{ position: absolute; left: 15px; top: 435px;
	            width: 200px; height: 25px; font-size: 10px;             }
	        button#cancel{ position: absolute; left: 180px; top: 495px; width: 50px; height: 25px;    
	            color: white; background-color: black; border-style: none; font-size: 10px; }
	        button#join{
	            position: absolute; left: 240px; top: 495px; width: 50px; height: 25px;
	            font-size: 10px; color: white; background-color: black; border-style: none; }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div id="main">
            <span id="userTxt"><b>사용자 회원가입</b></span>
            <b id="id">아이디</b>
            <input id="userId" name="userId" type="text" placeholder=" 아이디를 입력하세요." maxlength="16"/>
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
            	<label id="lbM"><input id="man" type="radio" name="userGender" value="남"/>남자</label>
            	&nbsp;
            	<label id="lbW"><input id="woman" type="radio" name="userGender" value="여"/>여자</label>
            </span>
                      
            <b id="birth">생년월일</b>
            <select name="userBirthYear" id="userBirthYear">
            	<option value="년도" selected>년도</option>
            	<%for(int i=1950; i<2019; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="userBirthMonth" id="userBirthMonth">
            	<option value="월" selected>월</option>
            	<%for(int i=1; i<13; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <select name="userBirthDay" id="userBirthDay">
            	<option value="일" selected>일</option>
            	<%for(int i=1; i<32; i++){ %>
            		<option value="<%=i %>"><%=i %></option>
            	<%} %>
            </select>
            
            <b id="email">이메일</b>
            <input id="userEmail" type="email" placeholder="이메일을 입력하세요."/>
            
            <button id="cancel">취소</button>
            <button id="join">완료</button>
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
			location.href="login.jsp";
		});
	
		var chk = false;//아이디 중복값 체크
		
		
		
		//회원가입
		$("#join").click(function() {
			var userPw = $("#userPw").val();
			var userPwChk = $("#userPwChk").val();

			if($("#userId").val()==""){
				alert("아이디를 입력하세요.");
				$("#userId").focus();
			}else if($("#userId").val().length < 5 || $("#userId").val().length > 16){
				alert("아이디는 5~16자리 입력");
				$("#userId").focus();
			}
			else if($("#userPw").val()==""){
				alert("비밀번호 입력하세요.");				
				$("#userPw").focus();
			}else if($("#userPw").val().length < 8 || $("#userPw").val().length >12){
				alert("비밀번호 8~12자리 입력");
				$("#userPw").focus();
			}else if($("#userPwChk").val()==""){
				alert("비밀번호 확인 해주세요");				
				$("#userPwChk").focus();
			}else if(userPw != userPwChk){
				alert("비밀번호 재입력");
				$("#userPwChk").focus();
			}else if($("#userName").val()==""){
				alert("이름을 입력해주세요.");
				$("#userName").focus();
			}else if($("#man").get(0).checked != true && $("#woman").get(0).checked != true){
				alert("성별을 선택해주세요.");	
			}else if($("#userBirthYear").val()=="년도"){
				alert("년도를 선택해주세요.");
				$("#userBirthYear").focus();
			}else if($("#userBirthMonth").val()=="월"){
				alert("월을 선택해주세요.");
				$("#userBirthMonth").focus();
			}else if($("#userBirthDay").val()=="일"){
				alert("일을 선택해주세요.");
				$("#userBirthDay").focus();
			}else if($("#userEmail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
			}else if(chk==false){
				alert("아이디 중복확인 하세요.");
				$("#userId").focus();
			}else{
				$.ajax({
					type : "post",
					url : "./userJoin",
					data : {
						id : $("#userId").val(),
						pw : $("#userPw").val(),
						name : $("#userName").val(),
						gender : $("input[name='userGender']:checked").val(),
						year : $("#userBirthYear").val(),
						month : $("#userBirthMonth").val(),
						day : $("#userBirthDay").val(),
						email : $("#userEmail").val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if(data.success > 0){
							alert("회원 가입 성공");
							location.href="index.jsp";
						}else{
							alert("회원가입 실패");
						}
					},
					error : function(error) {
						console.log(error);
					}
				});
			}

		});
		
		//중복체크
		$("#idChk").click(function() {
			var userIdTxt = $("#userId").val();
			
			$.ajax({
				type : "post",
				url : "./overlay",
				data : { id : $("#userId").val() },
				dataType : "json",
				success : function(data) {
					console.log(data);
					
					if(userIdTxt==""){
						alert("아이디 입력를 입력하세요.");
						$("#userId").focus();
					}else if($("#userId").val().length < 5 || $("#userId").val().length > 16){
						alert("아이디는 5~16자리 입력");
						$("#userId").focus();
					}else if(data.result == true){
						alert("중복된 아이디 입니다.");
						$("#userId").focus();
					}else{
						alert("사용 가능한 아이디 입니다.");
						$("#userPw").focus();
						chk = true;
					}
					
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	</script>
</html>