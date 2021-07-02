package com.dokyung.weather.controller;

public class Snippet {
	<script type="text/javascript">
		const doc = "document";
	
	document.addEventListener("DOMContentLoaded", ()=>{
		document.querySelector("button").addEventListener("click",(ev)=>{
			location.href="${rootPath}/member/login"
		})
		
	})
	</script>
	<body>
	
		<form method="POST">
			<input name="us_id"/>
			<input name="us_pw"/>
			<button>login</button>
		</form>
	
	
	
	</body>
}

