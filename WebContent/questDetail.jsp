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
				padding: 5px 10px;
				margin:0 auto;

			}
			th{
				width: 80px;
				background-color: #212121;
				color: white;
			}
			td{
				width: 200px;
			}
			body{
				text-align: center;
				width: 1200px;
                max-width: none !important;
			}
			#content{
				height: 350px;
			}
			button{
				width: 55px;
				height: 30px;
				background-color: #212121;
				color: white;
				border: 0;
			}
			#list{
				position: absolute;
				left: 805px;
			}
			#update{
				position: absolute;
				left: 735px;
			}
			#delete{
				position: absolute;
				left: 875px;
			}
			#answer{
				position: absolute;
				left: 290px;
			}
			.anserContent{
				width: 520px;
				height: 100px;
			}
			#answerWrite{
				width: 80px;
				height: 100px;
			}
			textarea{
				width: 100%;
				height: 100%;
				border: 0px;
			}
		</style>
	</head>
	<body>
		<h2>문의 사항</h2><br/>
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">${board.board_title}</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${board.board_date}</td>
				<th>작성자 ID</th>
				<td>${board.info_id}</td>
			</tr>
			<tr>
				<td colspan="4" id="content">
					${board.board_content}
				</td>
			</tr>
		</table>
		<br/>
		<button id="list">목록</button>
		<button id="update">수정</button>
		<button id="delete">삭제</button>
		<br/><br/>
		<h2 id="answer">답변</h2><br/><br/><br/>
		<table>
			<tr>
				<th id="name">관리자</th>
				<td class="anserContent"></td>
			</tr>
		</table><br/><hr/><br/>
		<table>
			<tr>
				<td class="anserContent">
					<textarea></textarea>
				</td>
				<th><button id="answerWrite">등록</button></th>
			</tr>
		</table><br/>
	</body>
	<script>
		/*java script area*/
		$("#answerWrite").click(function(){
			location.href="./boardReplyWrite?board_no=${board.board_no}";
		});
		$("#list").click(function() {
			location.href="./boardList";
		})
	</script>
</html>