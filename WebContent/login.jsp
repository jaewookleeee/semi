<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div{
	            position: absolute;
	            border: 1.5px solid #A4A4A4;
	            width: 300px;
	            height: 300px;
	            left: 40%;
	            top: 200px;
	            text-align: center;
       		}
	        span#logSpan1{
	            position: absolute;
	            font-size: 20px;
	            left: 15px;
	            top: 10px;
	        }
	        span#logSpan2{
	            position: absolute;
	            font-size: 12px;
	            left: 15px;
	            top: 255px;
	            color: #F7819F;
	        }
	        input#userId{
	            position: absolute;
	            left: 15px;
	            top: 50px;
	            width: 200px;
	            height: 30px;
	        }
	        input#userPw{
	            position: absolute;
	            left: 15px;
	            top: 87px;
	            width: 200px;
	            height: 30px;
	        }
	        button#login{
	            position: absolute;
	            left: 220px;
	            top: 50px;
	            width: 65px;
	            height: 67px;
	            background-color: #FA5882;
	            color: white;
	            border-style: none;
	        }
	        span#logChktxt{
	            position: absolute;
	            left: 15px;
	            top: 125px;
	            font-size: 10px;
	            color: red;
	        }
	        button#userJoin{
	            position: absolute;
	            left: 15px;
	            top: 145px;
	            width: 270px;
	            height: 30px;
	            background-color: #FA5882;
	            color: white;
	            border-style: none;
	        }
	        button#regJoin{
	            position: absolute;
	            left: 15px;
	            top: 185px;
	            width: 270px;
	            height: 30px;
	            background-color: #F5A9BC;
	            color: white;
	            border-style: none;
	        }
	        hr{
	            position: absolute;
	            left: 15px;
	            top: 225px;
	            width: 266px;
	            height: 1px;
	            border: 0;
	            background: #E6E6E6;
	        }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div>
            <span id="logSpan1"><b>로그인</b>하고 <b>공간 대여</b> 하세요!</span>
            <input id="userId" type="text" placeholder="아이디"/>
            <input id="userPw" type="password" placeholder="비밀번호"/>
            <!-- <input id="login" type="submit" value="로그인"/> -->
            <button id="login">로그인</button>
            <span id="logChkTxt"></span>
            <button id="userJoin" onclick="uJoin()">사용자 회원가입</button>
            <button id="regJoin" onclick="rJoin()" >등록자 회원가입</button>
            <hr/>
            <span id="logSpan2">등록자로 회원가입하시면, 장소 등록이 가능합니다.</span>
        </div>
	</body>
	<script>
		function uJoin() {
			location.href="userJoin.jsp";
		}
		function rJoin() {
			location.href="regJoin.jsp";
		}
		$("#login").click(function () {
			$.ajax({
				type : "post",
				url : "./login",
				data : {
					id : $("#userId").val(),
					pw : $("#userPw").val()
				},
				dataType : "json",
				success : function (data) {
					console.log(data);
					if(data.result == true){
						alert("로그인 성공");
						location.href="index.jsp";
					}else{
						$("#logChkTxt").html("아이디 또는 비밀번호를 다시 확인하세요.");
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});
	</script>
</html>