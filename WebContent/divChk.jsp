<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	var loginId = "${sessionScope.loginId}";
	var loginDiv = "${sessionScope.loginDiv}";

	if(loginId != null && loginDiv == "사용자" || loginDiv =="관리자"){
		alert("등록자로 전환후 이용가능");
		history.back();
	}else if(loginId != null && loginDiv == "등록자"){
		location.href="placeWrite.jsp";
	}else{
		alert("로그인 후 이용가능");
		history.back();
	}
</script>
