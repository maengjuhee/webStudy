package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class GoodsDAO {
   private Connection conn; // 연결 담당
   private PreparedStatement ps; // SQL문장 송수신 => SQL문장 전송 / 결과값을 받는다
   private static GoodsDAO dao; // 싱글턴
   private DataBaseConnection dbconn=new DataBaseConnection();
   
   // 라이브러리 형식 (.jar) => 보안
   // 싱글턴
   public static GoodsDAO newInstance()
   {
	   if(dao==null)
		   dao=new GoodsDAO();
	   return dao;
   }
   // 기능
   // => 결과값 (브라우저) => 사용자 요청
   // => 사용자가 페이지를 선택하면 오라클에 저장된 데이터 중에 페이지에 해당되는 데이터를 보낸다 
   // => List, FoodVO , int(총페이지, 몇개확인) , String , void
   // 화면 목록 출력 => List
   // 상세보기 => VO 
   public List<GoodsVO> goodsListData(int page)
   {
	   List<GoodsVO> list=new ArrayList<GoodsVO>();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT no,goods_poster,goods_name num "
				   +"FROM (SELECT no,goods_poster,goods_name,rownum as num "
				   +"FROM (SELECT /*+ INDEX_ASC(goods_all fh_fno_pk)*/no,goods_poster,goods_name "
				   +"FROM goods_all)) "
				   +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1); // rownum은 1
		   int end=rowSize*page;
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   GoodsVO vo=new GoodsVO();
			   vo.setNo(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setName(rs.getString(3));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return list;
   }
   public int goodsTotalPage() 
   {
	   int total=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
		   //전송
		   ps=conn.prepareStatement(sql);
		   //결과값
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return total;
   }

   public GoodsVO goodsDetailData(int no)
   {
	   GoodsVO vo=new GoodsVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="UPDATE goods_all SET "
				   +"hit=hit+1 "
				   +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ps.executeQuery();
		   ////////////////////조회수 증가
		   sql="SELECT no,goods_name,goods_sub,goods_price,goods_discount,goods_delivery,goods_poster "
				   +"FROM goods_all "
				   +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   //?에 값을 채운다
		   ps.setInt(1, no);
		   //실행 요쳥 => 결과값 받기
		   ResultSet rs=ps.executeQuery();
		   //커서를 데이터 출력된 위치로 이동
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setSub(rs.getString(3));
		   vo.setPrice(rs.getString(4));
		   vo.setDiscount(rs.getInt(5));
		   vo.setDelivery(rs.getString(6));
		   vo.setPoster(rs.getString(7).replace("https", "http"));
		   //메모리 닫기
		   rs.close();
	   }catch(Exception ex)
	   {
		   System.out.println("=====goodsDetailData 오류=====");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 오라클 연결 해제
		   dbconn.disConnection(conn, ps);
	   }
	   return vo;
   }
   
}