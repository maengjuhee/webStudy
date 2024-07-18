<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.model.GoodsModel"/>
<%
   model.goodsLlistData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
  margin: 0px auto;
  width: 960px;
}
.a{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
</head>
<body>
   <div class="container">
     <div class="row">
       <c:forEach var="vo" items="${list }">
         <div class="col-sm-3">
           <div class="thumbnail">
             <img src="${vo.poster }" style="width: 240px;height: 200px">
             <p class="a">${vo.name }</p>
           </div>
         </div>
       </c:forEach>
     </div>
     <div style="height: 20px"></div>
     <div class="row">
      <a href="jstl_4.jsp?page=${surpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
      ${curpage } page / ${totalpage } pages
      <a href="jstl_4.jsp?page=${surpage>1?totalpage+1:curpage }" class="btn btn-sm btn-danger">다음</a>
     </div>
   </div>
</body>
</html>