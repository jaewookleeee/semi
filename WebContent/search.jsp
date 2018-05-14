<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>리스트</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            body {
                text-align: center;
            }

            #input_search {
                width: 250px;
                border-top: 2px solid white;
                border-left: 2px solid white;
                border-right: 2px solid white;
                border-bottom: 3px solid black;
                margin-right: 10px;
                margin-top: 50px;
                text-align: center;
            }

            .search_btn {
                width: 80px;
                border: 0px solid white;
                background-color: black;
                color: white;
                height: 30px;
            }

            .search_btn:hover {
                cursor: pointer;
            }

            .category {
                background-color: white;
                width: 100px;
                margin-top: 7px;
                margin-bottom: 7px;
                text-align: center;
                display: inline-block;
                border: 1px solid black;
            }

            .category:hover {
                cursor: pointer;
            }

            #loc {
                border: 1px solid black;
                width: 400px;
                height: auto;
                display: inline-block;
                background-color: black;
                position: relative;
                z-index: 2;
            }

            #div_main {
                height: 20px;
                width: 100%;
                text-align: center;
                color: white;
                padding-top: 0px;
                padding-bottom: 0px;
            }

            #div_loc {
                width: 100%;
                background-color: white;
                display: none;
                margin-top: 1px;
                text-align: center;
            }

            .locati {
                background-color: white;
                width: 70px;
                margin: 2px 2px;
                border: 1px solid black;
                padding: 10px 5px;
                display: inline-block;
            }

            .locati:hover {
                cursor: pointer;
            }

            #loc_btn {
                color: black;
                display: inline;
                float: right;
                background-color: white;
                height: 100%;
                padding: 5px 3px;
            }

            #loc_btn:hover {
                cursor: pointer;
            }

            #text_div {
                margin-top: 5px;
                padding-top: 3px;
                display: inline-block;
            }
            
            #text_div:hover{
				cursor: default;
			}

            .place {
                margin: 10px 10px;
                display: inline-block;
                width: 350px; /* 100% */
                height:333px; /* 95% */
                background-color: #FAFAFA;
            }

            .place:hover {
                cursor: pointer;
            }

            table {
                margin: 10px;
                width: 95%;
            }

            td {
                border: 1px solid black;
                font-size: 13;
            }

            .place_name {
                border: 0px solid black;
                font-size: 20;
                font-weight: 600;
            }

            .td_info {
                background-color: #FE2E64;
                color: white;
                text-align: center;
            }
        </style>
    </head>

    <body>
        <jsp:include page="menuBar.jsp" />
        <div id="div_search" style="position: absolute; top: 0px; left: 0px;">
            <input id="input_search" type="text" placeholder="상호명을 입력해주세요." />
            <button id="main_btn" class="search_btn">검색</button>
            <br>
            <div class="category">카페</div>
            <div class="category">식당</div>
            <div class="category">주점</div>
            <div class="category">스튜디오</div>
            <div class="category">연습실</div>
            <div class="category">공연장</div>
            <br />
            <div id="loc">
                <div id="div_main">
                    <div id="text_div">지역 선택</div>
                    <div id="loc_btn">▼</div>
                </div>
                <div id="div_loc">
                    <div class="locati">강남구</div>
                    <div class="locati">강동구</div>
                    <div class="locati">강북구</div>
                    <div class="locati">강서구</div>
                    <div class="locati">관악구</div>
                    <div class="locati">관진구</div>
                    <div class="locati">구로구</div>
                    <div class="locati">금천구</div>
                    <div class="locati">노원구</div>
                    <div class="locati">도봉구</div>
                    <div class="locati">동대문구</div>
                    <div class="locati">동작구</div>
                    <div class="locati">마포구</div>
                    <div class="locati">서대문구</div>
                    <div class="locati">서초구</div>
                    <div class="locati">성동구</div>
                    <div class="locati">성북구</div>
                    <div class="locati">송파구</div>
                    <div class="locati">양천구</div>
                    <div class="locati">영등포구</div>
                    <div class="locati">용산구</div>
                    <div class="locati">은평구</div>
                    <div class="locati">종로구</div>
                    <div class="locati">중구</div>
                    <div class="locati">중랑구</div>
                </div>
            </div>
            <br />
        </div>
        <div id="listBox" style="width: 1110px; height: 355px; display: inline-block; position: absolute; top: 180px; left: 0px; z-index: 1; text-align:left;"></div>

        <div id="dvi_btn" style="position: absolute; top: 580px; left: 0px; z-index: 2;">
            <button id="before" class="search_btn">이전 목록</button> &nbsp;&nbsp;&nbsp;&nbsp;
            <button id="after" class="search_btn">다음 목록</button>
        </div>
    </body>
    <script>
        var category = "none";
        var keyword = "none";
        var loc = "none";
        var start = 1;
        var end = 6;

        $("#listBox").css("left", window.innerWidth / 2 - 555);
        $("#dvi_btn").css("left", window.innerWidth / 2 - 97);
        $("#div_search").css("left", window.innerWidth / 2 - 325);

        $(document).ready(function() {
            placeSearch(keyword, category, loc, start, end);
        });

        function placeSearch(keyword, category, area, start, end) {
            var obj = {};
            obj.error = function(err) {
                console.log(err)
            };
            obj.type = "POST";
            obj.dataType = "JSON";

            obj.url = "./placeSearch";
            obj.data = {
                keyword: keyword,
                category: category,
                area: area,
                start: start,
                end: end
            };
            obj.success = function(data) {
                placeList(data.list);
            }
            $.ajax(obj);
        };

        function placeList(list) {
        	$("#listBox").css("height","355px");
        	$("#dvi_btn").css("top","580px");
            $("#div_loc").css("display", "none");
            $("#loc_btn").text("▼");
            if (list.length != 0) {
                $("div.place").remove();
                $("div#listBox").empty();
                var newLine = "";
                list.forEach(function(item, i) {
                    newLine += "<div class='place'>";
                    newLine += "<input type='hidden' value='" + item.place_no + "'/>";
                    newLine += "<div style='width: 100%; height: 60%; background-color: black;'>"
                    newLine += "<img width='100%' height='100%' src='./upload/" + item.place_photo + "'/>";
                    newLine += "</div>";
                    newLine += "<div style='text-align: left;'>";
                    newLine += "<table>";
                    newLine += "<tr><td colspan='2' class='place_name'>" + item.place_name + "</td></tr>"
                    newLine += "<tr><td class='td_info'>" + item.place_category + "</td><td class='td_info'>" + item.place_loc + "</td></tr>";
                    newLine += "<tr><td colspan='2'>" + item.place_info + "</td></tr>";
                    newLine += "<tr><td colspan='2' class='td_info'>" + item.place_price + "</td></tr>";
                    newLine += "</table>";
                    newLine += "</div>";
                    newLine += "</div>";
                    if(i==3){
                    	$("#listBox").css("height","710px");
                    	$("#dvi_btn").css("top","915px");
                    }
                });
                $("#listBox").append(newLine);
                $("div.place").click(function() {
                    location.href = "./placeDetailUp.jsp?place_no=" + $(this).children("input[type='hidden']").val();
                });
            } else {
                $("#listBox").html("<br/><br/><br/><br/><br/><span style='text-align:center;'><h3>해당 검색 결과가 더 이상 존재하지 않습니다.</h3></span>");
            }
        };

        $("#loc_btn").click(function() {
            var so = $("#div_loc").css("display");
            if (so == "none") {
                $("#div_loc").css("display", "inline-block");
                $("#loc_btn").text("▲");
            } else {
                $("#div_loc").css("display", "none");
                $("#loc_btn").text("▼");
            }
        });

        $("div.category").click(function() {
            if ($(this).css("background-color") != "rgb(255, 255, 255)") {
                $(this).css("background-color", "white");
                $(this).css("color", "black");
                category = "none";
                start = 1;
                end = 6;
                placeSearch(keyword, category, loc, start, end);
            } else {
                $("div.category").css("background-color", "white");
                $("div.category").css("color", "black");
                $(this).css("color", "white");
                $(this).css("background-color", "#FE2E64");
                category = $(this).text();
                start = 1;
                end = 6;
                placeSearch(keyword, category, loc, start, end);
            }
        });
        $("div.locati").click(function() {
            if ($(this).css("background-color") != "rgb(255, 255, 255)") {
                $(this).css("background-color", "white");
                $(this).css("color", "black");
                loc = "none";
                start = 1;
                end = 6;
                placeSearch(keyword, category, loc, start, end);
            } else {
                $("div.locati").css("background-color", "white");
                $("div.locati").css("color", "black");
                $(this).css("color", "white");
                $(this).css("background-color", "#FE2E64");
                loc = $(this).text();
                start = 1;
                end = 6;
                placeSearch(keyword, category, loc, start, end);
            }
        });
        $("#main_btn").click(function() {
            category = "none";
            keyword = "none";
            loc = "none";
            start = 1;
            end = 6;

            if ($("#input_search").val() != "") {
                keyword = $("#input_search").val();
            }
            $("div.category").each(function(index, item) {
                if ($(this).css("background-color") != "rgb(255, 255, 255)") {
                    category = $(this).text();
                }
            });
            $("div.locati").each(function(index, item) {
                if ($(this).css("background-color") != "rgb(255, 255, 255)") {
                    loc = $(this).text();
                }
            });
            placeSearch(keyword, category, loc, start, end);
        });

        $("#before").click(function() {
            if (start >= 7) {
                start = start - 6;
                end = end - 6;
            }
            placeSearch(keyword, category, loc, start, end);
        });

        $("#after").click(function() {
            if ($("#listBox").children("div").length) {
                start = start + 6;
                end = end + 6;
            }
            placeSearch(keyword, category, loc, start, end);
        })

        $(window).resize(function() {
            $("#listBox").css("left", window.innerWidth / 2 - 555);
            $("#dvi_btn").css("left", window.innerWidth / 2 - 97);
            $("#div_search").css("left", window.innerWidth / 2 - 325);
        });
    </script>

</html>