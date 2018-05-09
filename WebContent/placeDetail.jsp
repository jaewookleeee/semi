<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
            .cate{
                float: left;
                padding: 0px 50px;
                text-align: center;
                width: 140px;
                border: 1px solid black;
            }
            #date{
                position: absolute;
                left: 25px;
                width: 125px;
                background-color: black;
                color: white;
            }
            #starttime{
                position: absolute;
                left: 155px;
                background-color: black;
                color: white;
                width: 100px;
                height: 23px;
            }
            #endtime{
                position: absolute;
                left: 260px;
                background-color: black;
                color: white;
                width: 100px;
                height: 23px;
            }
            #cash{
                position: absolute;
                left: 420px;
                background-color: black;
                color: white;
                width: 80px;
                height: 23px;
            }
            #timeadd{
                background-color: black;
                color: white;
                width: 20px;
                height: 20px;
                position: absolute;
                left: 0px;
                border: 0;
            }
            #people{
                position: absolute;
                left: 365px;
                background-color: black;
                color: white;
                width: 50px;
                height: 23px;
            }
            #book{
                position: absolute;
                left: 505px;
                border: 0;
                background-color: deeppink;
            }
            #like{
                position: absolute;
                left: 580px;
                border: 0;
                background-color: deeppink;
            }
            #address{
                width: 500px
            }
            textarea{
                width: 600px;
                height: 150px;
            }
		</style>
</head>
<body>
<div>
        <h3>상호명</h3>
        <p>한줄소개</p>
        <div>
        <div class="cate">은평구 응암동</div>
        <div class="cate">02-374-5151</div>
        <div class="cate">hsp2041@naver.com</div>
        </div><br/><br/>
        <button id="timeadd">+</button>
        <input id="date" type="date"/>
        <select id="starttime">
        <option>시작시간</option>
        </select>
        <select id="endtime">
        <option>끝시간</option>
        </select>
        <select id="people">
        <option>인원</option>
        </select>
        <input id="cash" type="text" value="요금" readonly=""/>
        
        <button id="book">예약하기</button>
        <button id="like">찜 하기</button><br/>
        <h3>위치</h3>
        <input id="address" type="text" value="상세주소" readonly=""/><br/>
        <a>위치 api</a>
        <h3>시설안내</h3>
        <textarea readonly="">내용</textarea>
        <h3>주의사항</h3>
        <textarea readonly="">내용</textarea>
        </div>
</body>
<script>
	
</script>
</html>