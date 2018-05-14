<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#listDiv{
	            position: absolute;
	            /*border: 1.5px solid #A4A4A4;*/
	            width: 500px;
	            height: 300px;
	            left: 30%;
	            top: 80px;
	            text-align: center;
	        }
	        table{
	        	position: absolute;
	        	top: 100px;
	        }
	        table, th, td{
	            text-align: center;
	            font-size: 13px;
	            border: 1px solid black;
	            border-collapse: collapse;
	            width: 500px;
	            height: 20px;
	        }
	        
	        input[type='text']{
	        	border-top: none;
	        	border-right: none;
	        	border-left: none;
	        	border-bottom: 1px solid black;
	        }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div id="listDiv">
          	<h3>유저 리스트</h3>
          	<input id="search" type="text" placeholder="검색"/>
          	<button id="searchBtn">검색</button>
            <table id="userListTable">
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>이메일</th>
                </tr>
            </table>
        </div>
	</body>
	<script>
		$(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./userList",
				dataType : "json",
				success : function(data) {
					console.log(data);
					if(data.login == false){
						alert("권한 없음");
						//location.href="index.jsp";
					}else{
						if(data.userList != null){//BoardService 에서 받은 list 값이 true 면은
							//방법1
	 						for(var i=0; i<data.userList.length; i++){
								$("#userListTable").append("<tr>"+
									"<td>"+data.userList[i].info_id+"</td>"+
									"<td>"+data.userList[i].info_name+"</td>"+
									"<td>"+data.userList[i].info_gender+"</td>"+
									"<td>"+data.userList[i].info_email+"</td>"+
									"</tr>");
							}
						}
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		$("#searchBtn").click(function() {
			$.ajax({
				type : "post",
				url : "./userList",
				data : {
					idSearch : $("#search").val()
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