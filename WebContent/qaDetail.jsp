<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
            .qa_detail {
                width: 1000px;
                margin-top: 50px;
                margin-left: 50px;
            }
            
            #qa_header {
                width: 1000px;
                margin-top: 50px;
                font-size: 30px
            }
            
            table {
                border-collapse: collapse;
                width: 1000px;
                border: 0.1px solid #222222;
                margin-top: 50px;
            }
            
            tr, td {
                border: 0.1px solid #222222;
            }
            
            th {
                width: 150px;
                height: 30px;    
                line-height: 30px;
                border: 1px solid black;
                background-color: #222222;
                color: white;
            }
            
            #title {
                width: 850px;
                height: 30px;
            }
            
            #write_date {
                width: 350px;
                height: 30px;
            }
            
            #writer {
                width: 200px;
                height: 30px;
            }
            
            #content {
                width: 1000px;
                height: 300px;
            }
            
            .btn_list {
                margin-left: 850px;
            }
            
            
            .qa_reply {
                margin-top: 50px;
            }
            
            #qa_reply_writer {
                height: 150px;
            }
            
            #reply_content {
                width: 850px;
                height: 150px;
                float: left;
                border: 0.1px solid #222222;
            }
            
            #reply_regist {
                width: 145px;
                height: 150px;
                float: left;
                border: 1px solid black;
                background-color: #222222;
                font-size: 18px;
                color: white;
            }
            
            .reply {
                margin-top: 50px;
            }
            
		</style>
	</head>
	<body>
        <div class="qa_detail">
            <div id="qa_header" style="text-align: center;"><strong>Q&A</strong></div>
            <table>
                <tr>
                    <th id="title_header">제목</th>
                    <td colspan="3" id="title"></td>
                </tr>
                <tr>
                    <th>작성일자</th>
                    <td id="write_date"></td>
                    <th>작성자 ID</th>
                    <td id="writer"></td>
                </tr>
                <tr>
                    <td colspan="4" id="content" colspan="2"></td>
                </tr>
            </table><br/>
            <div class="btn_list">
                <input class="btn" id="list" type="button" value="목록"/>
                <input class="btn" id="chg" type="button" value="수정"/>
                <input class="btn" id="regist" type="button" value="등록"/>
            </div>
            
            <div class="qa_reply">
                <div id="qa_header"><strong>답변</strong></div>
                <table>
                    <tr>
                        <th id="qa_reply_writer"></th>
                        <td id="qa_reply_content"></td>
                    </tr>
                </table><br/><br/><hr/>
                
                <div class="reply">
                    <span id="reply_content"></span>
                    <input id="reply_regist" type="button" value="답변 등록"/>
                </div>
            </div>
        </div>
	</body>
</html>








