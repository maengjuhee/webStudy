package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.*;
import com.sist.database.DataBaseConnection;
public class GoodsDAO {
  private Connection conn; // conn=DriverManager.getConnection()
  private PreparedStatement ps;
  private DataBaseConnection dbconn=new DataBaseConnection();
  private static GoodsDAO dao;
  private String[] tabs={"","goods_all","goods_new","goods_special","goods_best"};
  public static GoodsDAO newInstance()
  {
	  if(dao==null)
		  dao=new GoodsDAO();
	  return dao;
  }

  public List<GoodsVO> goodsListData(int type, int page)
  {
	  List<GoodsVO> list=new ArrayList<GoodsVO>();
	  try
	  {
		  conn=dbconn.getConnection();
		  String sql="SELECT no,goods_name,goods_poster, num "
				  +"FROM (SELECT no,goods_name,goods_poster,rownum as num "
				  +"FROM (SELECT no,goods_name,goods_poster "
				  +"FROM "+tabs[type]+")) "
				  +"WHERE num BETWEEN ? AND ?";

		  ps=conn.prepareStatement(sql);
		  int rowSize=12;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=rowSize*page;
		  
		  
		  ps.setInt(1, start);
		  ps.setInt(2, end);
		  
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  GoodsVO vo=new GoodsVO();
			  vo.setNo(rs.getInt(1));
			  vo.setName(rs.getString(2));
			  vo.setPoster(rs.getString(3));
			  
			  list.add(vo);
		  }
		  
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
  public int goodsListTotalPage(int type)
  {
	  int total=0; 
	  try
	  {
		  // 테이블 / 컬럼 => 문자열 결합 => setString() => ''
		  conn=dbconn.getConnection();
		  String sql="SELECT CEIL(COUNT(*)/12.0) "
				  +"FROM "+tabs[type];
		  ps=conn.prepareStatement(sql);
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
  public GoodsVO goodsDetailData(int no,int type)
  {
	   GoodsVO vo=new GoodsVO();
	   try
		  {
			  conn=dbconn.getConnection();
			  String sql="SELECT no,goods_poster,goods_name,goods_price,"
					    +"goods_sub,goods_delivery,goods_discount "
					    +"FROM "+tabs[type]
					    +" WHERE no=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, no);
			  
			  // 결과값 받기 
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  vo.setNo(rs.getInt(1));
			  vo.setPoster(rs.getString(2));
			  vo.setName(rs.getString(3));
			  String price=rs.getString(4);
			  vo.setPrice(price);
			  vo.setSub(rs.getString(5));
			  vo.setDelivery(rs.getString(6));
			  vo.setDiscount(rs.getInt(7));
			  String rp=price.replaceAll("[^0-9]", "");
			  vo.setRprice(Integer.parseInt(rp));
			  rs.close();
	   }catch(Exception ex)
	   {
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

