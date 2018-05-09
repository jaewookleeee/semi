<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>SEMI</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            body{
                width: 1200px;
                max-width: none !important;
            }
            h1{
                text-align: center;
            }
            table,tr,th,td{
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
                position: static;
                margin:0 auto;
            }
            th{
                background-color: #212121;
                color: white; 
                padding: 5px 20px;
            }
            #pre{
                position: relative;
                top: 10px;
                left: 500px;
                background-color: #212121;
            }
            #next{
                position: relative;
                top: 10px;
                left: 505px;
                background-color: #212121;
            }
            #chart{
                position: relative;
                top: 10px;
                left: 822px;
                background-color: #212121;
            }
            input[type='button']{
                color: white;
                padding: 2px 7px;
                border: 0;
                font-size: 12pt;
            }
            td>input[type='button']{
                background-color: lightpink;
                width: 100%;
                height: 100%;
            }
            div{
            	height: 25px;
            }
        </style>
    </head>
    <body>
    	<div>
    		<jsp:include page="menuBar.jsp" flush="false"/>
    	</div>
    	<h1>예약 내역 확인</h1>
        <br/>
            <table>
            <tr>
                <th style="padding: 5px 10px">번호</th>
                <th style="padding: 5px 150px">상호명</th>
                <th style="padding: 5px 30px">대표자 ID</th>
                <th style="padding: 5px 50px">등록 일시</th>
                <th>별점 평균</th>
                <th>수정</th>
            </tr><!--
            <tr>
                <td>1</td>
                <td>kh정보교육원</td>
                <td>ksw6169</td>
                <td>2018-03-29 15:12</td>
                <td>4.5</td>
                <td><input type="button" value="수정"/></td>
            </tr>-->
        </table>
        <input type="button" id="pre" value="이전 목록"/>
        <input type="button" id="next" value="다음 목록"/>
        <input type="button" id="chart" value="통계"/>
    </body>
    <script>
        /*javascript area*/
    </script>
</html>