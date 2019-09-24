package com.yjc.stk.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PostService {
	public void post(Map<String,Object> map);
	//게시글 리스트 불러오기
	public ArrayList<Map<String,Object>> allList(@Param("start") int start,
			@Param("end") int end,@Param("keyword")String keyword);
	
	// 총 페이지 갯수 가져오기
		public int totalPage();
		public int totalPage2(@Param("keyword") String keyword);
}
