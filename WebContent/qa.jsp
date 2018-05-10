<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
            table {
                position: relative;
                width: 1000px;
                margin-top: 50px;
                border-collapse: collapse;
            }
            
            th, td {
                border: 0.1px solid black;
                float: left;
                text-align: center;
                line-height: 30px;
            }
            
            .qa {
                position: relative;
                margin-top: 50px;
                width: 1000px;
                
            }
            
            #qa_header {
                width: 150px;
                height: 30px;
                font-size: 30px;
                line-height: 30px;
            }
            
            .qa_row {
                width: 1000px;
                height: 30px;
            }
            
            #no {
                width: 100px;
                height: 30px;
                line-height: 30px;
            }
            
            #title {
                width: 400px;
                height: 30px;
                line-height: 30px;
            }
            
            #writer {
                width: 200px;
                height: 30px;
                line-height: 30px;
            }
            
            #write_date {
                width: 200px;
                height: 30px;
                line-height: 30px;
            }
            
            #search_area {
                width: 200px;
                height: 30px;
                margin-top: 30px;
                margin-left: 350px;
            }
            
            #search {
                height: 30px;
                line-height: 30px;
                background-color: #343434;
                color: white;
                border: 0;
            }
            
            .btn {
                width: 100px;
                height: 30px;
                background-color: #343434;
                color: white;
                border: 0;
            }
            
            #qa_write {
                margin-top: -50px;
                margin-left: 250px;
                margin-bottom: 50px;
            }
            
            .page {
                margin-left: 350px;
                margin-bottom: 50px;
            }
		</style>
	</head>
	<body>
        <div class="qa">
            <div id="qa_header"><strong>Q&A</strong></div>

            <table>
                <tr class="qa_row">
                    <th id="no" style="background-color: #343434; color: white;">번호</th>
                    <th id="title" style="background-color: #343434; color: white;">제목</th>
                    <th id="writer" style="background-color: #343434; color: white;">작성자 ID</th>
                    <th id="write_date" style="background-color: #343434; color: white;">작성일자</th>
                </tr>

                <tr class="qa_row">
                    <td id="no"></td>
                    <td id="title"></td>
                    <td id="writer"></td>
                    <td id="write_date"></td>
                </tr>
                
                <tr class="qa_row">
                    <td id="no"></td>
                    <td id="title"></td>
                    <td id="writer"></td>
                    <td id="write_date"></td>
                </tr>
                
                <tr class="qa_row">
                    <td id="no"></td>
                    <td id="title"></td>
                    <td id="writer"></td>
                    <td id="write_date"></td>
                </tr>
                
                <tr class="qa_row">
                    <td id="no"></td>
                    <td id="title"></td>
                    <td id="writer"></td>
                    <td id="write_date"></td>
                </tr>
                
                <tr class="qa_row">
                    <td id="no"></td>
                    <td id="title"></td>
                    <td id="writer"></td>
                    <td id="write_date"></td>
                </tr>
            </table>

            <input id="search_area" type="text" placeholder=" 검색할 제목을 입력해주세요."/>
            <input id="search" type="button" value="검색"><br/><br/>
            
            <span class="page">
                <input class="btn" id="beforePage" type="button" value="이전 목록"/>
                <input class="btn" id="nextPage" type="button" value="다음 목록"/>
            </span>
            <input class="btn" id="qa_write" type="button" value="작성하기"/>
        </div>
	</body>
	<script>
		$("#qa_write").click(function() {
			location.href = "qaWrite.jsp";
		});
	</script>
</html>



















