<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var loginId = "${sessionScope.loginId}";
	var loginDiv = "${sessionScope.loginDiv}";
	
	if(loginId == ""){
		alert("로그인이 필요한 서비스입니다.");
	}else if(loginId != null && loginDiv == "사용자"){
		location.href="userUpdate.jsp";
	}else if(loginId != null && loginDiv == "등록자"){
		location.href="regUpdate.jsp";
	}
</script>