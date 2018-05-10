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
                padding: 5px 10px;
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
                left: 870px;
            }
            button{
                background-color: #212121;
                color: white;
                padding: 2px 7px;
                border: 0;
                font-size: 12pt;
            }
            .date{
                float: left;
                text-align: center;
            }
            select{
                width: 150px;
                height: 25px;
            
            }
            #search{
                position: absolute;
                left: 790px;
            }
            #date1{
                position: absolute;
                left: 620px;
            }
            #date2{
                position: absolute;
                left: 425px;
            }
            #date3{
                position: absolute;
                left: 581px;
                font-size: 14pt;
                border: 1px solid gray;
                padding: 0 10px;
                font-weight: 600;
            }
            #menuBar{
            	height: 20px;
            }
        </style>
    </head>
    <body>
    	<div id="menuBar">
    		<jsp:include page="/menuBar.jsp" flush="false"/>
    	</div>
       <h1>통계</h1>
        <br/>
        <select class="date" id="date1"></select>
        <div class="date" id="date3">~</div>
        <select class="date" id="date2"></select>
        <button id="search">검색</button>
        <br/>
        <br/>
        <table id="table1">
            <tr>
                <th>선택</th>
                <th>번호</th>
                <th style="padding: 5px 150px">상호명</th>
                <th>총 예약자 수</th>
            </tr>
        </table>
        <h1>예약자통계</h1>
        <table id="table2">
            <tr>
                <th>번호</th>
                <th style="padding: 5px 50px">예약일</th>
                <th style="padding: 5px 150px">상호명</th>
                <th style="padding: 5px 30px">예약자 ID</th>
                <th>예약인원</th>
            </tr>
        </table>
        <button id="pre">이전 목록</button>
        <button id="next">다음 목록</button>
    </body>
    <script>
        /*javascript area*/
    </script>
</html>