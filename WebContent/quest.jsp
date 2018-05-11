<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			/*style area*/
			table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				padding: 3px 10px;
				margin:0 auto;

			}
			th{
				background-color: #212121;
				color: white;
				width: 80px;
			}
			#subject{
				width: 300px;
			}
			#num{
				width: 40px;
			}
			body{
				text-align: center;
				width: 1200px;				
                max-width: none !important;
			}
			#writeBtn{
				position: absolute;
				left: 830px;
			}
			button{
				background-color: #212121;
				color: white;
				border: 0px;
				
			}
			#serch{
				border: 0;
				border-bottom: 1px solid #212121;
			}
			div{
				height: 60px;
			}
		</style>
	</head>
	<body>
	<div>
	<jsp:include page="/menuBar.jsp" flush="false"/>
	</div>
		<h2>문의 사항</h2><br/>
		<table id="listTable">
			<tr>
				<th id="num">번호</th>
				<th id="subject">제목</th>
				<th>작성자 ID</th>
				<th>작성일자</th>
			</tr>
		</table><br/>
		<input type="text" id="search"/>
		<button id="searchBtn">검색</button>
		<button id="writeBtn">작성하기</button><br/><br/>
		<button id="beforeList">이전 목록</button>
		<button id="afterList">다음 목록</button>
	</body>
	<script>
		/*java script area*/
		
		var tableTh = "";
       var msg = "";
       var sNum = 1;
       var eNum = 5;
        var obj = {};
        var tableTh = $("#listTable");		
		var obj={};
		obj.error = function(e){console.log(e)};
		obj.type="POST";
		obj.dataType="JSON";
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
		
		$(document).ready(function(){
			tableTh = $("#listTable").children().html();
			obj.url="./boardList";
			obj.data={
					"search":$("#search").val(),
					"cate":"문의사항",
					"sNum":sNum,
		            "eNum":eNum
			};
			obj.success = function(data){
				//console.log(data);
					listPrint(data.list);
			}
			ajaxCall(obj);
		});
		
		//로그인 체크
		var loginId = "${sessionScope.loginId}";
		console.log(loginId);
		if(loginId == ""){
			alert("로그인이 필요한 서비스 입니다.");
			location.href="login.jsp";
		}		
		var b=0;
		//리스트 출력
		function listPrint(list){
			console.log(list);
			var content = "";
				list.forEach(function(item, board_no){
					content+="<tr>";
					content+="<td>"+item.rnum+"</td>";
					content+="<td><a href='boardDetail?board_no="+item.board_no+"'>"+item.board_title+"</a></td>";
					content+="<td>"+item.info_id+"</td>";
					content+="<td>"+item.board_date+"</td>";
					content+="</tr>";	
				});
				$("#listTable").append(content);			
		}
		
		//작성하기 버튼
		$("#writeBtn").click(function(){
			location.href="questWrite.jsp";
		});
		
		//검색버튼
		$("#searchBtn").click(function(){
			obj.url="./boardList";
			obj.data={
					"search":$("#search").val(),
					"cate":"문의사항",
					 "sNum":sNum,
		            "eNum":eNum 
			};
			obj.success = function(data){
				console.log(data.list);
				$("#listTable").empty();
			 	$("#listTable").append(tableTh);
				listPrint(data.list);
			}
			ajaxCall(obj);
		});
		//이전목록 버튼
		$("#beforeList").click(function(){
			sNum -= 5;
	        eNum -= 5;
			obj.url="./boardList";
			obj.data={
					"search":$("#search").val(),
					"cate":"문의사항",
					"sNum":sNum,
		            "eNum":eNum
			};
			obj.success = function(data){
				console.log(data.list);
				console.log(data.list.length);
				if(data.list.length == 0){
					alert("첫번째 목록 입니다.");
					sNum = 1;
					eNum = 5;
				}else{
					var b = data.list.length;
					$("#listTable").empty();
					$("#listTable").append(tableTh);
					listPrint(data.list);
				}
			}
			ajaxCall(obj);
		});

		//다음 목록
		$("#afterList").click(function(){
			sNum += 5;
	        eNum += 5;
	        obj.url="./boardList";
			obj.data={
					"search":$("#search").val(),
					"cate":"문의사항",
					"sNum":sNum,
		            "eNum":eNum
			};
			obj.success = function(data){
				console.log(data.list);
				console.log(data.list.length);
				if(data.list.length == 0){
					alert("마지막 목록 입니다.");
					sNum -= 5;
					eNum -= 5;
				}else{
					$("#listTable").empty();
					$("#listTable").append(tableTh);
					listPrint(data.list);
				}
			}
			ajaxCall(obj);
		});
	</script>
</html>