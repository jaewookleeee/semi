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
                left: 780px;
            }
            #date1{
                position: absolute;
            	left: 435px;
            }
            #date2{
                position: absolute;
                left: 635px;
            }
            #date3{
                position: absolute;
                left: 585px;
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
        <!-- <select class="date" id="date1"></select> -->
        <input type="date" id="date2"/>
        <div class="date" id="date3">~</div>
        <!--<select class="date" id="date2"></select>-->
        <input type="date" id="date1"/>
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
		var tableTh = ""; //테이블 껍데기 담는 변수
		var msg = ""; //비로그인시 오는 값 담을 변수
		var sNum = 1; //페이징 시작 값
		var eNum = 5; //페이징 마지막 값
		
		var obj = {}; //ajax 실행시 보낼 오브젝트 초기화
		obj.error=function(e){console.log(e)}; //ajax 에러날 경우의 함수
		obj.type="POST"; //ajax로 보낼 타입
		obj.dataType="JSON"; //ajax 실행 후 받을 값 형태
    
        $(document).ready(function(){
    	   obj.url="./total";
    	   obj.success=function(data){
    		   console.log(data);
    		   if(data.msg != null){ 
	   				msg = data.msg;//그 값을 msg변수에 담고
	   				alert(msg); //alert을 띄운다.
	   				location.href="./index.jsp" //그리고 login.jsp로 보냄
   				}else{
   					printlist(data.list);
   					bookCnt_in(data.bookCnt);
   				}
    		}
    	   	ajaxCall(obj);
    	});
		
		
		//테이블 값 넣기
		function printlist(list){
			var count = 1;
			var content = "";
			list.forEach(function (item, idx){
    			//console.log(item);
    			//console.log(item.book_no);
    			content += "<tr>";
    			content += "<td><input type='radio' name='chk' value='"+item.place_no+"'/></td>"
    			content += "<td>"+count+"</td>";
    			content += "<td>"+item.place_name+"</td>";
    			content += "<td class='bookCnt'></td>";
    			content += "</tr>";
    			count++;
    		});
    		$("#table1").append(content);
		}
       
		//예약자 수 값 넣기
		function bookCnt_in(bookCnt){
			bookCnt.forEach(function (item, idx){
    			$(".bookCnt")[idx].append(item);
    		});
    	}
		
	   	//ajax로 보내는 함수
	  	function ajaxCall(param){
	  		$.ajax(param)
	  	}
    </script>
</html>