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
            .regist { position: relative; width: 1200px; }  
            .sec_content { position: relative; }
            
            .div_info { position: relative; margin-top: 50px; width: 1100px; height: 190px; }
            .title { position: relative; float: left; width: 550px; height: 30px; font-size: 30px; }          
            .intro { position: relative; float: left; margin-top: 50px; width: 1080px; height: 30px; line-height: 30px; border: 1px solid #7E7E7E; }
            .cate{ position: relative; float: left; margin-top: 10px; width: 270px; height: 30px; line-height: 30px; text-align: center; border: 1px solid #7E7E7E; }
            .sel_btn { position: relative; float: left; margin-top: 10px; margin-right: 5px; width: 162px; height: 30px; background-color: #262626; color: white; border: 0; }
            .btn { position: relative; float: left; margin-top: 10px; margin-right: 5px; width: 120px; height: 30px; background-color: #F04768; color: white; border: 0; }
            
            .div_locate { position: relative; margin-top: 50px; width: 1100px; height: 420px; }
            .address { position: relative; margin-top: 50px; width: 1100px; height: 30px; border: 1px solid #7E7E7E; }
            .place { position: relative; margin-top: 10px; width: 400px; height: 300px; border: 1px solid #7E7E7E; }
            
            .div_guide {position: relative; margin-top: 50px; width: 1100px; }
            .div_attention { position: relative; margin-top: 50px; width: 1100px; }
            .content { position: relative; margin-top: 50px; width: 1100px; height: 200px; border: 1px solid #7E7E7E; }
		</style>
</head>
<body>
<div class="regist">
            <div class="sec_content">
                <div class="div_info">
                    <div class="title"><strong id="title"></strong></div>
                    
                    <div id="intro" class="intro">없음</div>
                    
                    <div id="categoly" class="cate"></div>
                    <div id="loc_short" class="cate"></div>
                    <div id="phone" class="cate"></div>
                    <div id="homepage" class="cate">홈페이지 없음</div>
                    
                    <input class="sel_btn" id="date" type="date"/>
                    <select class="sel_btn" id="starttime"><option>시작시간</option></select>
                    <select class="sel_btn" id="endtime"><option>끝시간</option></select>
                    <select class="sel_btn" id="people">
                    <option>인원</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6명 이상</option>
                    </select>
                    <input class="sel_btn" id="cash" type="text" value="요금" readonly/>
                    <button class="btn" id="book">예약하기</button>
                    <button class="btn" id="like">찜하기</button><br/>
                </div>
                
                <div class="div_locate">
                    <div class="title"><strong>위치</strong></div>
                    <input id="loc" class="address" type="text" readonly/><br/>
                    <div class="place">위치 api</div><br/><br/><br/><br/>
                </div>
                    
                <div class="div_guide">
                    <div class="title"><strong>시설안내</strong></div>
                    <textarea id="guide" class="content" readonly></textarea>
                </div>
                
                <div class="div_attention">
                    <div class="title"><strong>주의사항</strong></div>
                    <textarea id="attention" class="content" readonly>없음</textarea>
                </div>
                
                <br/><br/>
            </div>
        </div>
</body>
<script>
var array_loc=[];
var array_start=[];
var array_start2=[];
var array_end=[];
var array_end2=[];
var starttime=[];
var endtime=[];
var place_no="${param.place_no}";
var id ="${sessionScope.loginId}";
var cash=0;	

	//예약하기
	$("#book").click(function() {
		var today = new Date();
		var yyyy = today.getFullYear();
		var mm = today.getMonth()+1;
		var dd = today.getDate();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy+"-"+mm+"-"+dd;
		console.log(today);
		
		console.log("결과 : ",$("#starttime").val() > $("#endtime").val());

		
		
		if($("#date").val()==""){
			alert("날짜 선택");
		}else if($("#date").val() < today){
			alert("이전 날짜 선택안됨");
		}else if($("#people").val()=="인원"){
			alert("인원 선택");
		}else if($("#starttime").val() >= $("#endtime").val()){
			alert("예약시간 다시 설정");
		}else{
			$.ajax({
	    		type:"post",
				url:"./bookWrite",
				dataType:"JSON",
				data:{
					place_no : place_no,
					date : $("#date").val(),
					startTime : $("#starttime").val(),
					endTime : $("#endtime").val(),
					custom : $("#people").val(),
					price : $("#cash").val()
				},
				success : function(data){
					console.log(data);
					if(data.login == false){
						alert("로그인 후 사용");
					}else if(data.login == true){
						if(data.success > 0){
							alert("예약 완료");
						}else{
							alert("예약 실패");
						}
					}
				},
				error:function(e){
					console.log(e);
				}
	    	});   
		}
		
	});

    $("#like").click(function(){
    	
    	//console.log(id);
        if($("#like").html()=="찜하기"){
		        $.ajax({
		    		type:"post",
					url:"./like",
					dataType:"JSON",
					data:{
						place_no:place_no,
						id:id
					},
					success : function(data){
						//console.log(data);
						if(data.success==true){
							$("#like").html("찜취소");
							alert("찜이 되었습니다");
						}else{
							alert("찜이 안되었습니다");
						}				
					},
					error:function(e){
						console.log(e);
					}
		    	})   
        }else if($("#like").html()=="찜취소"){
        	$.ajax({
        		type:"post",
    			url:"./detaillikedel",
    			dataType:"JSON",
    			data:{
    				place_no:place_no,
    				id:id
    			},
    			success : function(data){
    				//console.log(data);
    				if(data.success==true){
    					$("#like").html("찜하기");
    					alert("찜이 취소되었습니다");
    				}else{
    					alert("찜이 취소가 안되었습니다");
    				}				
    			},
    			error:function(e){
    				console.log(e);
    			}
        	})
        }
    });
    $(document).ready(function(){
    	$.ajax({
			type:"post",
			url:"./placeDetail",
			dataType:"JSON",
			data:{
				place_no:place_no
			},
			success : function(data){
				array_start=data.dto.place_start.split(" ");
				array_start2=array_start[1].split(":");
				var starttime=parseInt(array_start2[0]);
				array_end=data.dto.place_end.split(" ");
				array_end2=array_end[1].split(":");
				var endtime=parseInt(array_end2[0]);
				array_loc=data.dto.place_loc.split("/");
				$("#title").text(data.dto.place_name);
				$("#intro").html(data.dto.place_info);
				$("#categoly").html(data.dto.place_category);
				$("#loc_short").html(array_loc[1]);
				$("#phone").html(data.dto.place_phone);
				$("#homepage").html(data.dto.home);
				$("#loc").val(array_loc[0]+array_loc[1]+array_loc[2]);
				$("#guide").val(data.dto.place_guide);
				$("#attention").val(data.dto.place_attention);
				$("#cash").val(data.dto.place_price);
				cash=data.dto.place_price;
				 $("#starttime").empty();
				$("#endtime").empty();
				var sta = "";					
				for(var i=0;i<(endtime-starttime);i++){
					sta += "<option>"+(starttime+i)+":00</option>";
				}
				var en ="";
				for(var i=1;i<=(endtime-starttime);i++){
					en += "<option>"+(starttime+i)+":00</option>";
				}
				$("#starttime").append(sta);
				$("#endtime").append(en);
			},
			error:function(e){
				console.log(e);
			}
		});
    	$.ajax({
    		type:"post",
			url:"./detaillike",
			dataType:"JSON",
			data:{
				place_no:place_no,
				id:id
			},
			success : function(data){
				console.log(data);
				if(data.success==true){
					$("#like").html("찜취소");
					//alert("찜을 한 페이지 입니다");					
				}else{
					$("#like").html("찜하기");
					//alert("찜이 안되어있습니다");
				}				
			},
			error:function(e){
				console.log(e);
			}
    	});
    	 
    });
    $("#starttime").change(function(e){
    	//console.log($("#endtime").val());
		var start =$("#starttime").val();
		starttime=start.split(":");
		var end=$("#endtime").val();
		var endtime=[];
		endtime=end.split(":");
		//console.log(endtime[0]-starttime[0]);	
		//console.log((endtime[0]-starttime[0])*cash);
		var cashed =(endtime[0]-starttime[0])*cash;
		/* console.log(cashed.indexOf('7')); */
		$("#cash").val(cashed);
	 })
    $("#endtime").change(function(){
    	//console.log($("#endtime").val());
		var start =$("#starttime").val();
		starttime=start.split(":");
		var end=$("#endtime").val();
		var endtime=[];
		endtime=end.split(":");
		//console.log(endtime[0]-starttime[0]);	
		//console.log((endtime[0]-starttime[0])*cash);
		var cashed =(endtime[0]-starttime[0])*cash;
		/* console.log(cashed.indexOf('7')); */
		$("#cash").val(cashed);
		})
</script>
</html>