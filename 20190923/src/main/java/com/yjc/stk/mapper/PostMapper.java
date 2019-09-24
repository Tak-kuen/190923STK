package com.yjc.stk.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface PostMapper {
	public void post(Map<String,Object> map);
	
	public ArrayList<Map<String,Object>> allList(Map<String,Object> map);
	public Map<String,Object> totalPage();
	public Map<String,Object> totalPage2(Map<String,Object> map);
}
