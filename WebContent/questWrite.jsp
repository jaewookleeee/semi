<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				padding: 5px 10px;
				margin:0 auto;

			}
			th{
				width: 70px;
				background-color: #212121;
				color: white;
			}
			body{
				text-align: center;
				width: 1200px;
                max-width: none !important;
			}
			#subject{
				width: 500px;
			}
			input[type='text']{
				width: 100%;
				border: 0;
			}
			textarea{
				width: 100%;
				height: 100%;
				border: 0;
			}
			#contentTxt{
				height: 450px;
			}
			button{
				position: absolute;
				left: 830px;
				width: 50px;
				height: 30px;
				background-color: #212121;
				color: white;
				border: 0;
			}
		</style>
	</head>
	<body>
	<form action="./boardWrite" method="post">
		<h2>문의 사항</h2><br/>
		<table>
			<tr>
				<th>제목</th>
				<td id="subject">
					<input type="text" name="board_title"/>
					<input type="hidden" name="quest" value="문의사항"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2" id="contentTxt">
					<textarea name="board_content"></textarea>
				</td>
			</tr>
		</table>
		<br/>
		<button id="write">등록</button>
		</form>
	</body>
	<script>
		/*java script area*/
		/* $("#write").click(function(){
			location.href="./boardWrite";
		}); */
	</script>
</html>