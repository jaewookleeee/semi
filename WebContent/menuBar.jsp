<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Main</title>
		<style>
            /* 나눔 스퀘어 폰트 */
            @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

            /* 웹용 폰트 사용, 해당 폰트가 로컬 PC에 저장되어 있다면, 다운로드 X, 저장이 안되어 있다면, 아래 글꼴을 내려받아 렌더링 
               woff(파이어폭스, 사파리, 오페라, 크롬, IE 9 지원), eot(IE 6~8 지원) 
               	브라우저 호환성 확보를 위해 woff, eot 포멧 모두 사용 
               	참고 - https://www.xpressengine.com/tip/20333948 
               	참고 - http://woodstar.tistory.com/108 */
            
            /*  폰트 설정 
                src 수정 필요(폰트 파일 - 서버 업로드 필요) 
                ex. src: url(http://myall.co.kr/폰트파일명.eot) */
            @font-face { font-family: 'odibeeSans'; font-style: normal; src: url('OdibeeSans-Regular.eot'); src: url('OdibeeSans-Regular.woff'); }
            
            /* 요소 */
            a { color: black; text-decoration: none; }
            li { list-style-type: none; float: left; }
            
            /* 클래스 */
            .menu { position: absolute; z-index: 1; width: 100%; height: 50px; top: 0px; left: -20px; }
            .logo { position: relative; top: 2px; margin-right: 50px; font-family: 'odibeeSans', sans-serif; font-size: 22px; color: #FF376C; }   
            .menu_item { position: relative; padding: 0px; line-height: 10px; left: 0px; margin-right: 40px; font-family: 'Nanum Square', sans-serif; font-size: 14px; }
            
            .submenu { position: absolute; display: none; width: 700px; height: 50px; top: 20px; left: -50px; background-color: white; }
            .submenu_item { position: relative; display: inline; width: 80px; height: 20px; left: 5px; margin: 3px 30px 10px 0px; line-height: 50px; font-family: 'Nanum Square', sans-serif; font-size: 14px; float:left; }
            
            /* 효과 */ 
            #myPage { height: 50px; }
            #myPage:hover .submenu { display: inline; }
            .submenu:hover .submenu { display: inline; }
		</style>
	</head>
	<body>
        <span class="menu">
            <ul>
                <li class="menu_item"><a class="logo" href="#">WAKE UP PLACE</a></li>
                <li class="menu_item" id="myPage"><a href="login.jsp">마이페이지</a>
                    <span class="submenu">
                        <ul>
                            <li class="submenu_item"><a href="#">회원정보수정</a></li>
                            <li class="submenu_item"><a href="#">예약내역확인</a></li>
                            <li class="submenu_item"><a href="#">찜한내역확인</a></li>
                            <li class="submenu_item"><a href="#">등록내역확인</a></li>
                            <li class="submenu_item"><a href="#">등록자전환</a></li>
                            <li class="submenu_item"><a href="#">회원관리</a></li>
                        </ul>
                    </span>
                </li>
                <li class="menu_item"><a href="#">문의사항</a></li>
                <li class="menu_item"><a href="#">공지사항</a></li>
                <li class="menu_item"><a href="search.jsp">장소검색</a></li>
                <li class="menu_item"><a href="#">장소등록</a></li>
            </ul>
        </span>
    </body>
</html>