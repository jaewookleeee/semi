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
            
            th {
                border: 0.1px solid black;
                float: left;
                text-align: center;
                height: 30px;
                line-height: 30px;
               	border-collapse: collapse;
            }
            
            td {
                border: 0.1px solid black;
                float: left;
                text-align: center;
                height: 30px;
                line-height: 30px;
               	border-collapse: collapse;
            }
            
            .review {
                position: relative;
                width: 1000px;
                margin-top: 50px;
            }
            
            .review_header {
                width: 150px;
                height: 30px;
                font-size: 30px;
                line-height: 30px;
            }
            
            .review_table {
                width: 1000px;
            }
            
            .review_id {
                width: 150px;
                height: 30px;
                line-height: 30px;
                border: 0.1px solid #222222;
                text-align: center;
                float: left;
            }
            
            .review_textarea {
                width: 450px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                float: left;
                margin: 0px;
            }
            
            .review_content {
                width: 450px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                float: left;
                margin: 0px;
            }
            
            .review_date {
                width: 150px;
                height: 30px;
                line-height: 30px;
                border: 0.1px solid #222222;
                text-align: center;
                float: left;
            }
            
            .btn {
                width: 50px;
                height: 30px;
                background-color: #343434;
                border: 0.1px solid white;
                color: white;
                border: 0;
            }
            
            .review_writeForm {
                margin-top: 50px;
            }
            
            .review_content_write {
                width: 650px;
                height: 60px;
                float: left;
                border: 0.1px solid #222222;
            }
            
            .review_score_write {
                width: 100px;
                height: 60px;
                float: left;
                border: 0.1px solid #222222;
                text-align: center;
            }
            
            .review_score_header {
                width: 100px;
                height: 30px;
                float: left;
                border: 0.1px solid #222222;
                line-height: 30px;
                font-size: 14px;
                text-align: center;
                background-color: #222222;
                color: white;
            }
            
            .review_score {
                width: 100px;
                height: 30px;
                line-height: 30px;
                text-align: center;
            }
            
            .review_regist {
                width: 100px;
                height: 60px;
                border: 0.1px solid black;
                line-height: 60px;
                float: left;
                font-size: 14px;
                text-align: center;
                background-color: #222222;
                color: white;
            }
            
            #review_header {
            	background: #222222;
            	color: white;
            }
        </style>
    </head>
    <body>
        <div class="review">
            <div class="review_header"><strong>이용 후기</strong></div>
            <div class="review_table"><table>
                <tr id="review_add">
                	<th class='review_id' id="review_header">작성자 ID</th>
					<th class='review_content' id="review_header">내용</th>
					<th class='review_date' id="review_header">작성일자</th>
					<th class='review_score' id="review_header">평점</th>
				</tr>
            </table></div>
            <div class="review_writeForm">
               	<form action="reviewWrite" method="post">
               		<input type="hidden" name="place_no" value="${param.place_no}"/>
               		<input type="hidden" name="info_id" value="${sessionScope.loginId}"/>
	                <div class="review_content_write"><textarea class="review_content_write" placeholder=" 후기 내용을 입력해주세요. (최대 300자)" name="review_content"></textarea></div>
	                <div class="review_score_write">
	                    <div class="review_score_header">평점</div> 
	                    <select class="review_score" name="review_score">
	                        <option value="1.0">1.0</option>
	                        <option value="1.5">1.5</option>
	                        <option value="2.0">2.0</option>
	                        <option value="2.5">2.5</option>
	                        <option value="3.0">3.0</option>
	                        <option value="3.5">3.5</option>
	                        <option value="4.0">4.0</option>
	                        <option value="4.5">4.5</option>
	                        <option value="5.0" selected="selected">5.0</option>
	                    </select>
	                </div>
	                <button class="review_regist">등록</button>
            	</form>
            </div>
        </div>
    </body>
    <script>
    	var obj = {};
    	var isreadyed = false;
    	var place_no = 0;
    	var review_update_content = "";
		obj.type = "POST";
		obj.dataType = "JSON";
		obj.error = function(error){console.log(error)};

		// 'Q&A' 탭이 눌렸을 때,
		$(document).ready(function() {
			var loginId = "${sessionScope.loginId}";
			var loginDiv = "${sessionScope.loginDiv}";
			var msg = "${msg}";
			
			if(!isreadyed) {
				if(loginId == "") {
					alert("로그인이 필요합니다.");
					history.back();
				} else {
					place_no = ${param.place_no};
					
					obj.url = "./reviewList";
					obj.data = {
						place_no: place_no
					};
					
					obj.success = function(data) {
						for(var i=data.list.length-1; i>=0; i--) {
							var str = "<tr><td class='review_id'>"+data.list[i].info_id+"</td>";
							str += "<td><textarea class='review_textarea' readonly='readonly'>"+data.list[i].review_content+"</textarea></td>";
							str += "<td class='review_date'>"+data.list[i].review_date+"</td>";
							str += "<td class='review_score'>"+data.list[i].review_score+"</td>";
							
							if(data.list[i].info_id == loginId) {
								str += "<td><button class='btn' id='review_update"+data.list[i].review_no+"' onclick='updateInit("+data.list[i].review_no+")'>수정</button>";
								str += "<a href='reviewDel?review_no="+data.list[i].review_no+"'><button class='btn' id='reviewDel'>삭제</button></a></td></tr>";
							} else {
								str += "</tr>";
							}
							$("#review_add").after(str);
						}
					}
					ajaxCall(obj);
				}
				isreadyed = true;
			}
		});    		 
		
		function updateInit(review_no) {
			$("#review_update"+review_no).parent().prev().prev().prev().children($('.review_textarea')).attr('readonly', false);
			$("#review_update"+review_no).next().after("<button class='btn' id='completeBtn"+review_no+"' onclick='reviewUpdate("+review_no+")'>완료</button>");
			$("#review_update"+review_no).next().hide();
			$("#review_update"+review_no).hide();
		}
		
		// 후기 수정 후 '완료' 버튼을 눌렀을 시, 
		function reviewUpdate(review_no) {
			$("#review_update"+review_no).next().show();
			$("#review_update"+review_no).show();
			$("#completeBtn"+review_no).remove();
			review_update_content = $("#review_update"+review_no).parent().prev().prev().prev().children($('.review_textarea')).val();
			$("#review_update"+review_no).parent().prev().prev().prev().children($('.review_textarea')).attr('readonly', true);
			
			obj.url = "./reviewUpdate";		
			obj.data = {
				place_no: place_no,
				review_no: review_no,	
				review_content: $("#review_update"+review_no).parent().prev().prev().prev().children($('.review_textarea')).val()
			};
			
			obj.success = function(data) {
				if(data.msg != "") {
					alert(data.msg);
					location.href = "placeDetailUp?place_no="+place_no+"&page=review.jsp";
				}
			}
			ajaxCall(obj);
		}  
		
		function ajaxCall(param) {
			$.ajax(param);
		}
    </script>
</html>