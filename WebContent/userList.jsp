<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#listDiv{ position: absolute; border: 1.5px solid #A4A4A4; width: 1000px; height: 1000px;
	            left: 100px; top: 80px; text-align: center; }
	        table{ position: absolute; left:250px; top: 100px; }
	        table, th, td{ text-align: center; font-size: 13px; border: 1px solid black; border-collapse: collapse; 
	        	width: 500px; height: 20px; }
	        th{ color: white; background-color: black;}

	        input[type='text']{ border-top: none; border-right: none; border-left: none; border-bottom: 1px solid black; }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
		<div id="listDiv">
          	<h3>회원 리스트</h3>
          	<input id="search" type="text" placeholder="검색"/>
          	<button id="searchBtn">검색</button>
          	<button id="userDel">삭제</button>
            <table id="userListTable">
                <tr>
                	<th id="th_sel">선택</th>
                    <th id="th_id">아이디</th>
                    <th id="th_name">이름</th>
                    <th id="th_gender">성별</th>
                    <th id="th_email">이메일</th>
                    <th id="th_div">구분</th>
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
									"<td id='td_sel'><input  type='checkbox' value='"+data.userList[i].info_id+"'></td>"+	
									"<td id='td_id'>"+data.userList[i].info_id+"</td>"+
									"<td>"+data.userList[i].info_name+"</td>"+
									"<td>"+data.userList[i].info_gender+"</td>"+
									"<td>"+data.userList[i].info_email+"</td>"+
									"<td>"+data.userList[i].info_div+"</td>"+
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
		
		//회원 검색
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
					
					$("#userListTable").empty();
					$("#userListTable").append("<tr><th>선택</th><th>아이디</th><th>이름</th><th>성별</th><th>이메일</th><th>구분</th></tr>");
					
					for(var i=0; i<data.userList.length; i++){
						$("#userListTable").append("<tr>"+
							"<td id='td_sel'><input type='checkbox' value='"+data.userList[i].info_id+"'></td>"+
							"<td id='td_id'>"+data.userList[i].info_id+"</td>"+
							"<td id='td_name'>"+data.userList[i].info_name+"</td>"+
							"<td id='td_gender'>"+data.userList[i].info_gender+"</td>"+
							"<td id='td_email'>"+data.userList[i].info_email+"</td>"+
							"<td id='td_div'>"+data.userList[i].info_div+"</td>"+
							"</tr>");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		//회원삭제
		$("#userDel").click(function() {
			var checked = [];
			$("input[type='checkbox']:checked").each(function() {
				checked.push($(this).val())
			});
			console.log(checked);
			$.ajax({
				type : "post",
				url : "./userDel",
				data : {
					userDel : checked
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					alert("삭제 완료");
					location.href="userList.jsp";
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	</script>
</html>