<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    <%
    // 오라클에서 데이터를 읽기 오기
    GoodsDAO dao=GoodsDAO.newInstance(); //싱글턴
    
    // 사용자가 페이지 요청
    // 요청한 페이지 받기
    String strPage=request.getParameter("page");
    if(strPage==null)
    	//처음 실행 화면
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
                                          
    List<GoodsVO> list=dao.goodsListData(curpage);
    
    for(GoodsVO vo:list)
    {
    	String img=vo.getPoster();
    	img=img.replace("https", "http");
    	vo.setPoster(img);
    }
    
    int totalpage=dao.goodsTotalPage(); //총페이지
    
    // 페이지 처리
    final int BLOCK=10;
    int startPage=((curpage-1)/BLOCK*BLOCK)+1;

    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    if(endPage>totalpage)
    	endPage=totalpage;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top:50px;
}
.row{
   margin:0px auto;
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
     <%
         for(GoodsVO vo:list)
         {
     %>
      <div class="col-sm-3">
       <div class="thumbnail"><!-- 이미지 카드: 이미지+제목 -->
         <a href="goods_detail.jsp?no=<%=vo.getNo()%>"><!-- 화면 이동 : 상세보기 -->
           <img src="<%=vo.getPoster() %>" style="width: 240px; height: 200px"><!-- height는 자동 설정 -->
           <p class="a"><%=vo.getName() %></p>
         </a>
        </div>
       </div>
       <%
          }
       %>
     </div>
     <div style="height: 10px"></div>
     <div class="text-center"><!-- 가운데 정렬 : text-left , text-right , text-center -->
       <ul class="pagination">
       <%
           if(startPage>1)
           {
       %>
         <li><a href="goods_list.jsp?page=<%=startPage-1%>">&lt;</a></li>
         <%
           }
         %>
         <% 
            for(int i=startPage;i<=endPage;i++)
            {
         %>
         <li class="<%= curpage==i?"active":""%>"><a href="goods_list.jsp?page=<%=i%>"><%=i %></a></li>
         <%
            }
         %>
         <%
             if(endPage<totalpage)
             {
         %>
         <li><a href="goods_list.jsp?page=<%=endPage+1%>">&gt;</a></li>
         <%
             }
         %>
       </ul>
     </div>
   </div>
</body>
</html>