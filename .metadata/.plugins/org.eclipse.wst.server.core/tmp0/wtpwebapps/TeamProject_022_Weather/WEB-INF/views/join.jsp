<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 10;
	padding: 10;
}

body {
	background: linear-gradient(130deg, #7389d0, #eebdc3);
	background-attachment: fixed;
}

h1, h4 {
	/* 상단 로고 부분 */
	color: white;
	text-shadow: 0px 0px 20px rgb(234, 237, 176);
}

h1 {
	text-align: center;
	font-size: 70px;
	height: 50px;
}

h4 {
	font-size: 28px;
	text-align: center;
}

@
keyframes sparkle {from { background-position:0%100%;
	
}

to {
	background-position: 200% 100%;
}

}
section {
	/* 개인정보 등록하는 부분을 감싼 옅은 선 */
	display: grid;
	justify-items: center;
}

fieldset {
	/* 개인정보 등록하는 부분을 감싼 옅은 선 */
	border-radius: 20px;
	display: grid;
	justify-items: center;
}

table {
	border-collapse: collapse;
}

.joinTable th, .joinTable td {
	padding: 10px;
	box-sizing: border-box;
	border-bottom: 1px solid #ddd;
}

.joinTable th {
	text-align: center;
	background-color: gray;
	border-radius: 15px;
	margin: 10px 0px;
}

.joinTable td {
	width: 400px;
}
.joinTable td#id_check {
	width: 100px;
	cursor: pointer;
	border: 0;
	border-radius: 5px;
}

.joinTable .textForm {
	width: 300px;
	height: 30px;
	border: 0;
	border-radius: 5px;
}

.joinTable:hover .textForm:hover {
	animation: sparkle 4s infinite linear;
	background: linear-gradient(90deg, #7389d0, #eebdc3, #7389d0);
	background-size: 300% 100%;
	border-radius: 4px;
	z-index: -1;
	transform: scale(0.99) translateY(3px);
}

.joinTable .btn {
	
}

.btn {
	display: inline-block;
	color: rgb(90, 90, 90);
	transition: all 0.3s ease-out;
	background: linear-gradient(270deg, rgba(223, 190, 106, 0.8),
		rgba(146, 111, 52, 0.8), rgba(34, 34, 34, 0), rgba(34, 34, 34, 0));
	background-position: 1% 50%;
	background-size: 300% 300%;
	border: 1px solid rgba(223, 190, 106, 0.3);
	padding: 5px;
	font-weight: bold;
	font-size: 15px;
}

.btn:hover {
	background-position: 99% 50%;
}

button {
	cursor: pointer;
	margin-top: 10px;
	border-radius: 5px;
}
</style>

</head>
<body>
	<h1>Sign Up</h1>
	<h4>WEATHER & OOTD</h4>
	<section id="join_wrap">
		<form class="mem_join" method="POST">
			<fieldset>
				<table class="joinTable">
					<tr>
						<th class="first"><label for="us_id">ID</label></th>
						
						<td >
							<input type="text" id="us_id" name="us_id" class="textForm" placeholder="ID를 입력...">
							<button id="id_check" type="button">중복확인</button>
						</td>
					</tr>
					<tr>
						<th><label for="user_pwd">PW</label></th>
						<td><input type="password" id="us_pw" name="us_pw" class="textForm"
							placeholder="비밀번호를 입력..."></td>
					</tr>
					 <tr>
            <th><label for="user_pwd_check">PW(check)</label></th>
            <td><input type="password" id="us_pw_ch" class="textForm" placeholder="비밀번호를 재확인..."></td>
          </tr>
					<tr>
						<th><label for="us_name">이름</label></th>
						<td><input type="text" name="us_name" class="textForm"
							placeholder="이름을 입력...">
					</tr>
					<tr>
						<th>지역선택</th>
						<td><select name="us_city" class="textForm">
								<option>선택</option>
								<option>서울</option>
								<option>대전</option>
								<option>대구</option>
								<option>부산</option>
								<option>광주</option>
								<option>경기도</option>
								<option>강원도</option>
								<option>충청북도</option>
								<option>충청남도</option>
								<option>전라북도</option>
								<option>전라남도</option>
								<option>경상북도</option>
								<option>경상남도</option>
						</select></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input name="us_dist" class="textForm"></td>
					</tr>
				</table>
				<button type="button" class="btn">가입하기</button>
			</fieldset>
		</form>
	</section>
</body>
<script>
// document.querySelector("table.joinTable").addEventListener("click", (e)=>{
	

	  let objId = document.querySelector("td input#us_id");
	  let objPw1 = document.querySelector("td input#us_pw");
	  let objPw2 = document.querySelector("td input#us_pw_ch");
	  
	  
	  document.querySelector("button#id_check").addEventListener("click", ()=> {
		  let json = { objId };
		  let jsonString = JSON.stringify(json);
		  fetch("${rootPath}/idcheck/" + objId.value)
		  .then(res=>res.text())
		  .then(result=>{
			  if(result == "1") {
				  alert("이미 사용중인 아이디 입니다.")
				  objId.focus();
				  objId.value = ""
				  return false;
			  } else {
				  alert("사용할 수 있는 아이디 입니다.")
			  }
			  
			  
		  })
		  		// , {
			  	// method:"POST",
				// body : jsonString,
				// headers : {
				// 	"content-Type" : "applications/json"	
				// }
		  // })
		  
	  })
	  
	  
	  
	  
	  document.querySelector("button.btn").addEventListener("click", ()=> {
		  
	  if((objId.value) == "") {
		  alert("ID를 입력하세요")
		  objId.focus();
		  return false;
	  }
	  if ((objPw1.value) == ""){
          alert("비밀번호를 입력해 주세요");
          objPw1.focus();
          return false;
      }
      if ((objPw2.value)==""){
          alert("비밀번호를 입력해 주세요");
          objPw2.focus();
          return false;
      }
      if((objPw1.value) !== (objPw2.value)) {
    	 alert("비밀번호가 일치하지 않습니다.")
    	 objPw1.focus();
    	 return false;
      }
      document.querySelector("form.mem_join").submit();
	  })
// })
  </script>
</html>