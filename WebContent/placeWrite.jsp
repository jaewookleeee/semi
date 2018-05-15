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
		.writeForm { position: relative; margin-top: 50px; margin-left: 50px; width: 1200px; }
            .sec_title {font-size: 45px; text-align: center; margin-left: 500px; width: 200px; height: 50px; line-height: 50px; }
            .div_title { font-size: 30px; text-align: center; margin-top: 50px; width: 150px; height: 50px; line-height: 50px; }
            .sub_title { font-size: 20px; text-align: center; margin-top: 30px; width: 200px; height: 30px; line-height: 30px; background-color: #252525; color: white; }
            .photo_desc { float: left; width: 350px; font-size: 12px; margin-top: -15px; margin-left: 210px; color: #EF4667; }
            .div_content { margin-top: 30px; }
            #placename { width: 400px; height: 30px; }
            .phone { width: 100px; height: 30px; }
            .time { width: 150px; height: 30px; }
            #cash { width: 200px; height: 30px; }
            .address { height: 30px; margin-bottom: 10px; }
            #postnumber { width: 200px; }
            #addr { width: 200px; }
            #detailAddr { width: 400px; }
            .info_content { width: 1100px; height: 200px; }
            #info { width: 1100px; height: 100px; }
            #homepage { width: 1100px; height: 30px; }
            .save { margin-left: 1050px; }
            #categoly{width: 150px; height: 30px; margin-top:10px;}
		</style>
	</head>
<body>
<div>
	<jsp:include page="menuBar.jsp"/>
</div>
<form action="./placeWrite" method="post" enctype="multipart/form-data" id="fom">
           <div class="writeForm">
               <div class="sec_title"><strong>장소등록</strong></div>
               <div class="div_title"><strong>필수정보</strong></div>

               <div class="sub_title">상호명</div>
               <div class="div_content"><input name ="place_name" id="placename" type="text" placeholder="상호명을 입력해주세요."/></div>
			   <div class="sub_title">카테고리</div>
			   <select name="categoly" id="categoly">
                       <option>카페</option>
                       <option>식당</option>
                       <option>주점</option>
                       <option>스튜디오</option>
                       <option>연습실</option>
                       <option>공연장</option>
               </select>
               <div class="sub_title">장소 사진</div>
               <span class="photo_desc">사진은 최소 1장에서 최대 5장까지 업로드가 가능합니다.</span>
               <div class="div_content">
                   <input name="photo1" id="photo1" type="file"/><br/>
                   <input name="photo2" id="photo2" type="file"/><br/>
                   <input name="photo3" id="photo3" type="file"/><br/>
                   <input name="photo4" id="photo4" type="file"/><br/>
                   <input name="photo5" id="photo5" type="file"/><br/>    
               </div>

               <div class="sub_title">전화번호</div>
               <div class="div_content">
                   <input name="phone1" id="phone1" class="phone" type="text"/> 
                   <input name="phone2" id="phone2" class="phone" type="text"/> 
                   <input name="phone3" id="phone3" class="phone" type="text"/>
               </div>

               <div class="sub_title">이용시간 & 이용요금</div>
               <div class="div_content">
                   <select name="start" class="time" id="starttime">
                       <option>시작시간</option>
                   </select>
                   <select name="end" class="time" id="endtime">
                       <option>종료시간</option>
                   </select>
                   <input name="cash" id="cash" type="text" placeholder="시간당 요금(입력 예시: 13000)"/>
               </div>
               
               <div class="sub_title">장소위치</div>
               <div class="div_content">
                   <input name="postnumber" class="address" id="postnumber" type="text" placeholder="우편번호"/>
                   <input type="button" value="우편번호 검색"/><br/>
                   <input name="addr" class="address" id="addr" type="text" placeholder="주소"/><br/>
                   <input name="detailAddr" class="address" id="detailAddr" type="text" placeholder="상세 주소"/>
               </div>

               <div class="sub_title">시설 안내</div>
               <div class="div_content">
                   <input name="fac_info" class="info_content" id="fac_info" type="textarea"/>
               </div>
               
               <div class="div_title"><strong>선택정보</strong></div>
               <div class="sub_title">한 줄 소개</div>
               <div class="div_content">
                   <input name="info" id="info" type="text"/>
               </div>
               
               <div class="sub_title">홈페이지</div>
               <div class="div_content">
                   <input name="homepage" id="homepage" type="text"/>
               </div>
               
               <div class="sub_title">주의사항</div>
               <div class="div_content">
                   <input name="sub_content" class="info_content" id="sub_content" type="textarea"/><br/><br/>
                   <input id="save" class="save" type="button" value="저장"/>
               </div>
            </div>
       </form>
</body>
<script>
var form = $('form')[0];
var formData = new FormData(form);
	//var photo = [$("#photo1").val(),$("#photo2").val(),$("#photo3").val(),$("#photo4").val(),$("#photo5").val()];
	for(var i=0;i<24;i++){
		$(".time").append('<option>'+i+':00</option>');
	}
	/* $("#cash").focusin(function(){
	    $(this).val("");
	    //console.log(form);
	}); */
	/* $(".address").focusin(function(){
	    $(this).val("");
	});
	$(".selectinfo").focusin(function(){
	    $(this).val("");
	}); */
	$("#addphone").click(function(){
		var addphone = "<tr><td><input class='phone' type='text'/> - "+
		"<input class='phone' type='text'/> - "+"<input class='phone' type='text'/><td></tr>";
		$("#addphonetable").append(addphone);
	})
	$("#save").click(function(){
		if($("#placename").val()==""){
			alert("상호명을 입력하세요");
			$("#placename").focus();
		}else if($("#photo1").val()==""){
			alert("사진을 1장이상 입력하세요");
			$("#photo1").focus();
		}else if($("#phone1").val()==""||$("#phone2").val()==""||$("#phone3").val()==""){
			alert("번호를 입력하세요");
			$("#phone1").focus();
		}else if($("#postnumber").val()==""||$("#addr").val()==""||$("#detailAddr").val()==""){
			alert("주소를 확인하세요");
			$("#detailAddr").focus();
		}else if($("#fac_info").val()==""){
			alert("시설안내를 확인하세요");
			$("#fac_info").focus();
		}else if($("#starttime").val()=="시작시간"||$("#endtime").val()=="종료시간"){
			alert("시간을 입력하세요");
			$("#starttime").focus();
		}else if($("#cash").val()==""){
			alert("가격을 입력하세요");
			$("#cash").focus();
		}else{
			document.getElementById("fom").submit();
		}
	})
	</script>
</html>