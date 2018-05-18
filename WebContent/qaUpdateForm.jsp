<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
            .qa_write {
                width: 1000px;
                margin-top: 50px;
                margin-left: 50px;
            }
            
            #qa_header {
                width: 1000px;
                margin-top: 50px;
                font-size: 30px;
                text-align: center;
            }
            
            table {
                border-collapse: collapse;
                width: 1000px;
                border: 1px solid black;
                margin-top: 50px;
            }
            
            th {
                height: 30px;    
                border: 1px solid black;
                background-color: #222222;
            }
            
            #title_header {
                width: 100px;
            }
            
            #regist {   
                width: 50px;
                height: 30px;
                margin-left: 950px;
            }
            
            #title {
                width: 900px;
            }
            
            #content {
                width: 1000px;
                height: 400px;
            }
		</style>
	</head>
	<body>
		<jsp:include page="menuBar.jsp"/>
        <div class="qa_write">
            <div id="qa_header"><strong>Q&A</strong></div>
            
            <form action="qaUpdate?qa_no=${dto.qa_no}" method="post">
	            <table>
	                <tr>
	                    <th id="title_header">제목</th>
	                    <td><textArea id="title" name="qa_title">${dto.qa_title}</textArea></td>
	                </tr>
	                <tr>
	                    <th colspan="2">내용</th>
	                </tr>
	                <tr>
	                    <td colspan="2"><textArea id="content" name="qa_content">${dto.qa_content}</textArea></td>
	                </tr>
	            </table><br/>
	            <button id="regist">등록</button>
            </form>
        </div>
	</body>
	<script>
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
		
		if(msg == "Q&A 수정에 성공했습니다.") {
			location.href = "./qaDetail?qa_no=${qa_no}";
		} else if(msg == "Q&A 제목이 20자가 넘습니다.") {
			$("#title").text("${qa_title}");
			$("#content").text("${qa_content}");
		} else if(msg == "Q&A 내용이 300자가 넘습니다.") {
			$("#title").text("${qa_title}");
			$("#content").text("${qa_content}");
		}
	</script>
</html>