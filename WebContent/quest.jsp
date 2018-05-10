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
		</style>
	</head>
	<body>
		<h2>문의 사항</h2><br/>
		<table>
			<tr>
				<th id="num">번호</th>
				<th id="subject">제목</th>
				<th>작성자 ID</th>
				<th>작성일자</th>
			</tr>
			<c:forEach items="${list}" var="board">
			<tr>
				<td>${board.board_no}</td>
				<td><a href="boardDetail?board_no=${board.board_no}">${board.board_title}</a></td>
				<td>${board.info_id}</td>
				<td>${board.board_date}</td>
			</tr>
		</c:forEach>
		</table><br/>
		<input type="text" id="serch"/>
		<button>검색</button>
		<button id="writeBtn">작성하기</button><br/><br/>
		<button>이전 목록</button>
		<button>다음 목록</button>
	</body>
	<script>
		/*java script area*/
		$("#writeBtn").click(function(){
			location.href="questWrite.jsp";
		});
	</script>
</html>