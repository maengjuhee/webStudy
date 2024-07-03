<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<% 
   GoodsDAO dao=GoodsDAO.newInstance();
   String no=request.getParameter("no");
   GoodsVO vo=dao.goodsDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.container{
		margin-top: 50px;
	}
	.row{
		width: 960px;
		margin: 0px auto;
	}
</style>
</head>
<body>
   <div class="container">
     <div class="row">
       <table class="table table-hover">
         <tr>
           <td width="30%" class="text-center" rowspan="7">
             <img src="<%=vo.getPoster() %>" style="width: 100%" class="img-rounded">
           </td>
            <td colspan="2"><h3><%=vo.getName() %></h3></td>
         </tr>
         <tr>
           <td><%=vo.getSub() %></td>
         </tr>
         <tr>
           <th>가격</th>
           <td><%=vo.getPrice() %></td>
         </tr>
         <tr>
            <th>배송</th>
            <td><%=vo.getDelivery() %></td>
         </tr>
         <tr>
            <td colspan="2" class="text-right">
              <input type=button value="바로구매" class="btn-lg btn-success">
              <input type=button value="장바구니" class="btn-lg btn-info">
              <input type=button value="찜하기" class="btn-lg btn-primary">
              <input type=button value="목록" class="btn-lg btn-warning"
              onclick="javascript:history.back()"
              >
            </td>
         </tr>
       </table>
       
     </div>
   </div>
</body>
</html>