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
			#updateOk{
				position: absolute;
				left: 875px;
				display: none; 
			}
			#cancel{
				position: absolute;
				left: 805px;
				 display: none;
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
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="board_title" id="board_title" value="${board.board_title}" onKeyup="len_chk()" readonly/>
					<input type="hidden" id="board_no" value="${board.board_no }"/>
				</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${board.board_date}</td>
				<th>작성자 ID</th>
				<td>${board.info_id}</td>
			</tr>
			<tr>
				<td colspan="4" id="content">
					<textarea id="board_content" onKeyup="len_chk()" readonly>${board.board_content}</textarea>
				</td>
			</tr>
		</table>
		<br/>
		<button id="cancel">취소</button>
		<button id="updateOk">완료</button>
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
	

		$("#answerWrite").click(function(){
			location.href="./boardReplyWrite?board_no=${board.board_no}";
		});
		$("#list").click(function() {
			location.href="quest.jsp";
		});
		$("#update").click(function(){
			console.log("click");
			  if("${board.info_id}" == "${loginId}"){
					console.log("OK");
					$("#board_title").attr("readonly",false);
					$("#board_title").focus();
					$("#board_content").attr("readonly",false);
					$("#list").css("display","none");
					$("#update").css("display","none");
					$("#delete").css("display","none");
					$("#updateOk").css("display","block");
					$("#cancel").css("display","block"); 
					
				}else{
					alert("글을 수정할 권한이 없는 아이디 입니다.");
				} 
		});
		
		$("#cancel").click(function(){
			location.href="boardDetail?board_no=${board.board_no}";
		});
		
		$("#updateOk").click(function(){
			console.log("click");
			if($("#board_title").val() == ""){
				alert("제목을 입력해 주세요.");
				$("#board_title").focus();
			}else if($("#board_content").val() == ""){
				alert("내용을 입력해 주세요.");
				$("#board_content").focus();
			}else{
				obj.url="./boardUpdate?board_no=${board.board_no}";
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
						location.href="boardDetail?board_no=${board.board_no}";
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
		
		$("#delete").click(function(){			
			if("${board.info_id}" == "${loginId}"){
				console.log("OK");
				location.href="./boardDel?board_no=${board.board_no}";				
			}else{
				alert("글을 삭제할 권한이 없는 아이디 입니다.");
			}
		});
		
		var msg="${msg}";
		
		if(msg!=""){
			   alert(msg);
			   location.href="quest.jsp";
		}
		
		function len_chk(){  
			  var frm = document.getElementById("board_content");
			  var title = document.getElementById("board_title");
			  console.log(frm.value.length);
			  console.log(title.value.length);
			  if(frm.value.length > 300){  
			       alert("내용 글자수는 300자로 제한됩니다.!");  
			       frm.value = frm.value.substring(0,300);  
			       frm.focus();  
			  }
		       if(title.value.length > 50){
		    	   alert("제목 글자수는 50자로 제한됩니다!");
		    	   title.value = title.value.substring(0,50);  
		    	   title.focus(); 			    	   
		       }
			}
		
	</script>
</html>