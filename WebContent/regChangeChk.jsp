<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var loginId = "${sessionScope.loginId}";
	var loginDiv = "${sessionScope.loginDiv}";
	
	if(loginId != null && loginDiv =="사용자"){
		location.href="regChange.jsp";
	}else if(loginId != null && loginDiv =="등록자" || loginDiv =="관리자"){
		alert("못가");
		history.back();
	}else if(loginId == ""){
		alert("로그인ㄱ");
		location.href="login.jsp";
	}
</script>
