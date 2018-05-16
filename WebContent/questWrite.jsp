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
				width: 1000px; 				
                max-width: none !important;
                margin: 0 auto;
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
				
				width: 60px;
				height: 40px;
				background-color: #212121;
				color: white;
				border: 0;
			}
			#write{
				float: right;
				margin-right: 95px;
			}
			#include{
				height: 60px;
			}
			#catetoryDiv{
				position: absolute;
				left: 405px;
				width: 120px;
				height: 50px;
				background-color: gray;
				display: table;
			}
			#questPage{
				border: 1px solid black;
				width: 800px;
				padding: 10px 10px;
			}
			#quest{
				color: white;	
				display: table-cell;
				vertical-align: middle;
				text-align: center;
				font-size: 15pt;
				font-weight: 900;
				
			}
		</style>
	</head>
<body>
	<div id="include">
		<jsp:include page="/menuBar.jsp" flush="false" />
	</div>
	<div id="questPage">
		<br />
		<div id="catetoryDiv">
			<p id="quest">문의사항</p>
		</div>
		<br />
		<br />
		<br />
		<table>
			<tr>
				<th>제목</th>
				<td id="subject"><input type="text" name="board_title"
					id="board_title" onKeyup="len_chk()" /> <input type="hidden"
					name="quest" id="Catequest" value="문의사항" /></td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2" id="contentTxt"><textarea id="board_content"
						name="board_content" onKeyup="len_chk()"></textarea></td>
			</tr>
		</table>
		<br />
		<button id="write">등록</button>
		<br />
		<br />
	</div>
</body>
<script>
		/*java script area*/
		/* $("#write").click(function(){
			location.href="./boardWrite";
		}); */			
		
		//로그인 체크
		var loginId = "${sessionScope.loginId}";
		console.log(loginId);
		if(loginId == ""){
			alert("로그인이 필요한 서비스 입니다.");
			location.href="login.jsp";
		}
		
		//ajax
		var obj={};
		var idx;
		obj.type="POST";
		obj.dataType="JSON";
		obj.error=function(e){console.log(e)};
		
		//글쓰기
		$("#write").click(function(){
			if($("#board_title").val() == ""){
				alert("제목을 입력해 주세요.");
				$("#board_title").focus();
			}else if($("#board_content").val() == ""){
				alert("내용을 입력해 주세요.");
				$("#board_content").focus();
			}else{
				obj.url="./boardWrite";
				obj.data={					
						"board_title":$("#board_title").val(),
						"board_content":$("#board_content").val(),
						"board_category":$("#Catequest").val()
				};
				obj.success=function(data){
					console.log(data);
					//성공/실패 : 상세보기 페이지
					
					if(data.result >0){
						console.log(data.result);
						 location.href="./boardDetailView?board_no="+data.result; 
					}else{
						alert("글쓰기 실패");
					}
				};
				ajaxCall(obj);
			}
		}); 
	    
		function len_chk(){  
			  var frm = document.getElementById("board_content");
			  var title = document.getElementById("board_title");
			  console.log(frm.value.length);
			  console.log(title.value.length);
			  if(frm.value.length > 300){  
			       alert("내용 글자수는 300자로 제한됩니다.!");  
			       frm.value = frm.value.substring(0,300);  
			       frm.focus();  
			       if(title.value.length > 50){
			    	   alert("제목 글자수는 50자로 제한됩니다!");
			    	   title.value = title.value.substring(0,50);  
			    	   title.focus(); 			    	   
			       }
			  }
			}


		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
	</script>
</html>