<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			table{
				width:700px;
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
				width: 900px; 
                max-width: none !important;
                margin: 0 auto;
			}
			input{
				width:100%;
				text-align: center; 
				border:0px;
			}
			textarea{
				width: 100%;
				height: 100%;
				text-align:center;
				border: 0px;
				padding-left:5px;
				padding-top:30%;
				word-break:break-all;	
			}
			#content{
				height: 450px;
			}
			button{
				width: 55px;
				height: 30px;
				background-color: #212121;
				color: white;
				border: 0;
			}
			#updateOk{
				position: absolute;
				left: 1040px;
				display: none; 
			}
			#cancel{
				position: absolute;
				left: 970px;
				 display: none;
			}
			#list{
				position: absolute;
				left: 1040px;
			}
			#update{
				position: absolute;
				left: 900px;
			}
			#delete{
				position: absolute;
				left: 970px;
			}
			#categoryP{
				color: white;	
				display: table-cell;
				vertical-align: middle;
				text-align: center;
				font-size: 15pt;
				font-weight: 900;
			}
			#catetoryDiv{
				position: absolute;
				left: 400px;
				width: 120px;
				height: 50px;
				background-color: gray;
				display: table;
			}
			#include{
				height: 60px;
			}
			#noticePage{
				border: 1px solid black;
				width: 800px;
			}
		</style>
	</head>
	<body>
	<div id="include">
	<jsp:include page="/menuBar.jsp" flush="false"/>
	</div>
	<div id="noticePage"><br/>
		<div id="catetoryDiv">
			<p id="categoryP">공지사항</p>
		</div>
		<br/><br/><br/>
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="board_title" id="board_title" onKeyup="len_chk()" readonly/>
					<input type="hidden" id="board_no" value="공지사항">
				</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td id="board_date"></td>
				<th>작성자 ID</th>
				<td id="info_id"></td>
			</tr>
			<tr>
				<th colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4" id="content">
					<textarea id="board_content" onKeyup="len_chk()" readonly></textarea>
				</td>
			</tr>
		</table>
		<br/>
		<button id="cancel">취소</button>
		<button id="updateOk">완료</button>
		<button id="list">목록</button>
		<button id="update">수정</button>
		<button id="delete">삭제</button><br/><br/>
		</div>
	</body>
	<script>
		/*java script area*/
		//ajax
		var tableTh = "";
		var obj={};
		var idx;
		obj.type="POST";
		obj.dataType="JSON";
		obj.error=function(e){console.log(e)};
		var loginId = "${sessionScope.loginId}";
		

		/* $("#answerWrite").click(function(){
			location.href="./boardReplyWrite?board_no=${board.board_no}";
		}); */
		$(document).ready(function(){
			if(loginId != "ADMIN"){
				$("#update").css("display","none");
				$("#delete").css("display","none");
			}
			tableTh = $("#answerDiv").children().html();
			obj.url="./boardDetail?board_no=${board.board_no}";
			obj.data={
					"board_no":$("#board_no").val(),
					"board_title":$("#board_title").val(),
					"board_content":$("#board_content").val()
			};
			obj.success=function(data){
				console.log(data);
				//성공/실패 : 상세보기 페이지
				$("#board_no").val(data.dto.board_no);
				$("#board_title").val(data.dto.board_title);
				$("#board_date").text(data.dto.board_date);
				$("#info_id").text(data.dto.info_id);
				$("#board_content").val(data.dto.board_content);
				//$("#answerDiv").append(tableTh);
			};
			ajaxCall(obj);
		});
		
		//공지사항 목록
		$("#list").click(function() {
			location.href="notice.jsp";
		});
		
		//공지사항 수정버튼
		$("#update").click(function(){
			console.log("click");
			  if($("#info_id").text() == "${loginId}"){
					console.log("OK");
					$("#board_title").attr("readonly",false);
					$("#board_title").focus();
					$("#board_content").attr("readonly",false);
					$("#list").css("display","none");
					$("#update").css("display","none");
					$("#delete").css("display","none");
					$("#updateOk").css("display","block");
					$("#cancel").css("display","block"); 
					
				}else if(loginId == ""){					
					console.log(loginId);
						alert("로그인이 필요한 서비스 입니다.");
						location.href="login.jsp";
				} else{
					alert("글을 수정할 권한이 없는 아이디 입니다.");
				}
		});
		
		//취소
		$("#cancel").click(function(){
			/* location.href="boardDetail?board_no=${board.board_no}"; */
			location.href="noticeDetail.jsp";
		});
		
		//공지사항 수정 완료
		$("#updateOk").click(function(){
			console.log("click");
			if($("#board_title").val() == ""){
				alert("제목을 입력해 주세요.");
				$("#board_title").focus();
			}else if($("#board_content").val() == ""){
				alert("내용을 입력해 주세요.");
				$("#board_content").focus();
			}else{
				obj.url="./boardUpdate?board_no="+$("#board_no").val();
				obj.data={
						"board_no":$("#board_no").val(),
						"board_title":$("#board_title").val(),
						"board_content":$("#board_content").val()
				};
				obj.success=function(data){
					console.log(data);
					//성공/실패 : 상세보기 페이지
					if(data.success == 1){
						alert("수정 완료");
						location.href="noticeDetail.jsp";
					}else{
						alert("수정 실패");
					}
				};
				ajaxCall(obj);
			}			
		});
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
		
		//공지사항 삭제
		$("#delete").click(function(){			
			if($("#info_id").text() == "${loginId}"){
				console.log("OK");
				location.href="./boardDel?board_no="+$("#board_no").val();;				
			}else if(loginId == ""){					
				console.log(loginId);
				alert("로그인이 필요한 서비스 입니다.");
				location.href="login.jsp";
			}else{
				alert("글을 삭제할 권한이 없는 아이디 입니다.");
			}
		});
		
		var msg="${msg}";
		
		if(msg!=""){
			   alert(msg);
			   location.href="notice.jsp";
		}
		
		//글자수 제한
		function len_chk(){  
			  var frm = $("#board_content");
			  var title = $("#board_title");
			  console.log("공지 내용 : "+frm.val().length);
			  console.log("공지 제목 : "+title.val().length);
			  if(frm.val().length > 300){  
			       alert("내용 글자수는 300자로 제한됩니다.!");  
			       frm.val(frm.val().substring(0,300));  
			       frm.focus();  
			  }
		       if(title.val().length > 50){
		    	   alert("제목 글자수는 50자로 제한됩니다!");
		    	   title.val(title.val().substring(0,50));  
		    	   title.focus(); 			    	   
		       }
		       
			}
		
		
		
		
	</script>
</html>