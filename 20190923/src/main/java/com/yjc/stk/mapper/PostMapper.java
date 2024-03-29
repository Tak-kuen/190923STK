package com.yjc.stk.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface PostMapper {
	public void post(Map<String,Object> map);
	public void fileUpload(Map<String,Object> map);
	public void addReply(Map<String,Object> map);
	public void addVisit(Map<String,Object> map);
	public ArrayList<Map<String,Object>> allList(Map<String,Object> map);
	public Map<String,Object> totalPage();
	public Map<String,Object> totalPage2(Map<String,Object> map);
	public Map<String,Object> postDetail(String post_id);
	public List<Map<String,Object>> post_reply(String post_id);
	public List<Map<String,Object>> fileFind(String post_id);
	public Map<String,Object> viewFile(String post_id);
	public void update(Map<String,Object> map);
	public void deleteFile(Map<String,Object> map);
	public void deletePost(String post_id);
}
