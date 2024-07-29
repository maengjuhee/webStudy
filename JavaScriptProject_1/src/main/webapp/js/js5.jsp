<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	논리연산자 : && , ||
		(조건) && (조건) => 범위 포함 , 기간 포함
		===		 ===
			|			|
			======
				  |
				 결과값 : true/false
		(조건) || (조건) : 범위 미포함 , 기간 미포함
		===		===
			|			|
			======
				  |
				 결과값 
			&& : 직렬 연산자 => 조건 두개가 동시에 true => true
			|| : 병렬 연산자 => 조건 두개중에 한개이상 true => true
			
			=====================================
											&&					||
			=====================================
			true true						true					true
			=====================================
			true false					false					true
			=====================================
			false true					false					true
			=====================================
			false false					false					false
			=====================================
			
			대입연산자
			=
			+=
			-=
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
 * 1. Jquery : $(function(){})
    2. VueJS : mounted()
    3. React : useEffect()
 */
 window.onloar=function(){
let i =(6<) && (6==7)   
console.log("i="+i)
let j =(6<) && (6==7)   
console.log("j="+j)

let k = 10;
console,log("k="+k)
k+=20
console,log("k="+k)
k-=10
console,log("k="+k)

let m=(6%2==0)?"짝수":"홀수"
		console.log("m="+m)
let n=10/0
		console.log("n="+n)
}
</script>
</head>
<body>

</body>
</html>