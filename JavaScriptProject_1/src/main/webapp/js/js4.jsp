<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	비교연산자
		=== 같다 ( == )
		!== 같지 않다 ( != ) => 뒤에 나오는 라이브러리는 경고를 받는다 (ES6 => 외국은 ES8)
		< 작다
		> 크다
		<= 작거나 같다
		>= 크거나 같다
		
		1) 출력할 데이터 => 오라클
								  === 자바스크립트에서 연결이 불가능
								  		  ======
								  		  	| 자바
			HTML = 자바 = 오라클 = 자바 = 자바스크립트
						자바와 자바스크립트가 호환이 안된다 => (XML , JSON)
						AJAX Async JavaScript AND XML => XML을 대체 (JSON)
						=> VO => {} / List => []
						=> 다른 프로그램과 연동 : RestFul (GET / POST / PUT / DELETE)
		2) 비교연산자 : 자바 (숫자) , 자바스크립트(문자열 , 날짜 비교가 가능)
			문자열 비교
				한글 : 가나다라 . . .
				알파벳 : ABCD . . .
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=10
	let b=5
	
	console.log("a===b :"+(a===b))
	console.log("a!==b :"+(a!==b))
	console.log("a<b :"+(a<b))
	console.log("a>b :"+(a>b))
	console.log("a<=b :"+(a<=b))
	console.log("a>=b :"+(a>=b))
	
	let c="Hello"
	let d = "JavaScript"
	
	console.log("c===d :"+(c===d))
	console.log("c!==d :"+(c!==d))
	console.log("c<d :"+(c<d))
	console.log("c>d :"+(c>d))
	console.log("c<=d :"+(c<=d))
	console.log("c>=d :"+(c>=d))
}
function send(){
	let frm=document.frm;
	if(frm.id.value===""){
		alert("아이디를 입력하세요")
		return
	}
	else if(frm.pwd.value===""){
		alert("비밀번호를 입력하세요")
		return
	}
	alert("ID:"+frm.id.value+"\n"+"Password:"+frm.pwd.value)
}
</script>
</head>
<body>
	<form name="frm">
		ID:<input type=text name=id size=10><br>
		PWD:<input type=password name=pwd size=10><br>
		<input type=button value="전송" onclick="send()">
	</form>
</body>
</html>