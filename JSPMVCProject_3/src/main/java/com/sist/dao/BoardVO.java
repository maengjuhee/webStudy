package com.sist.dao;
import java.util.*;

import lombok.Data;
// 응용 => 대댓글 , 묻고 답하기
// 묻고=사용자 답하기=관리자
// 데이터 베이스 SQL
@Data
public class BoardVO {
   private int no,hit,group_id,group_step,group_tab,root,depth;
   private String name,subject,content,pwd,dbday;
   private Date regdate;
}
