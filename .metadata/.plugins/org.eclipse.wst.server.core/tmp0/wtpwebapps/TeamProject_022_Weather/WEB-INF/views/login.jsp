<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var="rootPath" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

document.addEventListener("DOMContentLoaded", ()=>{
	document.querySelector("div.msg").style.display = "${MSG}"
	document.querySelector("button.btn_join").addEventListener("click", ()=> {
		location.href="{rootPath}/join"
	})
	document.querySelector("button#btn_login").addEventListener("click",(e)=>{
		document.querySelector("form#login").submit();
	})
	
})
</script>
</head>

<body>

	<form id="login" method="POST">
	<h2>로그인</h2>
		<div class="msg">${MSG}</div>
			<input name="us_id" />
			<input type="password" name="us_pw" />
			<button id="btn_login">login</button>
			<button id="btn_join">join us</button>
	</form>



</body>
</html>