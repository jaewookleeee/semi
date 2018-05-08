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
            table,tr,td,th{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px 20px;
                text-align: center;
                position: static;
                margin:0 auto;
            }
            th{
                background-color: #212121;
                color: white;
            }
            #pre{
                position: relative;
                top: 10px;
                left: 500px;
            }
            #next{
                position: relative;
                top: 10px;
                left: 505px;
            }
            #cancle{
                position: relative;
                top: 10px;
                left: 920px;
            }
            input[type='button']{
                background-color: #212121;
                color: white;
                padding: 2px 7px;
                border: 0;
                font-size: 12pt;
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
                <th id="allckh" style="padding: 5px 10px"><input type="checkbox"/></th>
                <th style="padding: 5px 10px">번호</th>
                <th style="padding: 5px 150px">상호명</th>
                <th style="padding: 5px 30px">대표자 ID</th>
                <th >예약일</th>
                <th>예약 시작 시간</th>
                <th>예약 종료 시간</th>
                <th>예약 인원</th>
                <th style="padding: 5px 25px">금액</th>
            </tr>
        </table>
        <input type="button" id="pre" value="이전 목록"/>
        <input type="button" id="next" value="다음 목록"/>
        <input type="button" id="cancle" value="예약 취소"/>
    </body>
    <script>
        /*javascript area*/
    </script>
</html>