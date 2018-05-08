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
		#all{
                position: absolute;
                top:100px;
                left:500px;
            }
            h1{
                text-align: center;
            }
            h4{
                background-color: black;
                width: 100px;
                text-align: center;
                color: white;
            }
            #placename{
                width: 400px;
            }
            #phone{
                width: 50px;
            }
            .address{
                margin: 5px 0px;
                width: 500px;
            }
            input[type="textarea"]{
                width: 500px;
                height: 150px;
            }
            .selectinfo{
                width: 500px;
            }
            p{
                font-size: 12px;
            }
            #save{
                position: absolute;
                left: 450px;
                width: 50px;
                margin: 10px;
            }
		</style>
	</head>
<body>
<div>
<jsp:include page="menuBar.html"/>
</div>
<form action="/placeWrite">
	<div id="all">
        <h1>장소등록</h1>
        <h2>필수정보</h2>
        <hr/>
        <h4>상호명</h4>
        <input id="placename" type="text"/>
        <h4>장소사진</h4>
        <p>사진은 최소 1장에서 최대 5장까지 올릴수 있습니다</p>
        <input type="file"/><br/>
        <input type="file"/><br/>
        <input type="file"/><br/>
        <input type="file"/><br/>
        <input type="file"/>
        <h4>전화번호</h4>
        <input id="phone" type="text"/> -
        <input id="phone" type="text"/> -
        <input id="phone" type="text"/>
        <h4>이용시간</h4>
        <select id="starttime">
        <option>시작시간</option>
        </select>
        <select id="endtime">
        <option>끝시간</option>
        </select>
        <h4>장소위치</h4>
        <input id="postnumber" type="text"/>
        <button>우편번호 검색</button><br>
        <input class="address" type="text"/><br>
        <input class="address" type="text"/><br>
        <h4>지불 안내</h4>
        <input type="textarea"/>
        <hr/>
        <h2>선택정보</h2>
        <h4>한줄소개</h4>
        <input class="selectinfo" type="text"/>
        <h4>홈페이지</h4>
        <input class="selectinfo" type="text"/>
        <h4>주의사항</h4>
        <input type="textarea"/><br/>
        <input type="submit" vlaue="저장"/>
        </div>
</form>

</body>
<script>
for(var i=0;i<24;i++){
	$("#starttime").append('<option>'+i+':00</option>');
	$("#endtime").append('<option>'+i+':00</option>');
}
	</script>
</html>