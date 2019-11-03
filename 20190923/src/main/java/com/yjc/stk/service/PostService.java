package com.yjc.stk.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PostService {
	public String post(Map<String,Object> map);
	public void fileUpload(Map<String,Object> map);
	public String addReply(Map<String,Object> map);
	public String addVisit(Map<String,Object> map);
	//게시글 리스트 불러오기 
	public ArrayList<Map<String,Object>> allList(@Param("start") int start,
			@Param("end") int end,@Param("keyword")String keyword);
	
	// 총 페이지 갯수 가져오기
	public int totalPage();
	public int totalPage2(@Param("keyword") String keyword);
	//글정보 가져오기
	public Map<String,Object> postDetail(String post_id);
	//게시글에 담긴 파일 정보 가져오기
	public Map<String,Object> fileFind(String post_id);
	
	public void update(Map<String,Object> map);
	//파일 하나에 담긴 정보찾아서 삭제하기
	public String deleteFile(String file_id);
	//파일삭제하기(파일도 같이 다 삭제됨)
	public String deletePost(String post_id);
}
