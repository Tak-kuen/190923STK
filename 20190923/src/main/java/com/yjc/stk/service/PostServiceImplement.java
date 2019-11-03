package com.yjc.stk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yjc.stk.domain.UploadHandler;
import com.yjc.stk.mapper.PostMapper;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@Service
@AllArgsConstructor
public class PostServiceImplement implements PostService {

//	@Resource(name = "uploadPath")
//	private String upload_path; // common
	private PostMapper mapper;
	@Override
	public String post(Map<String, Object> map) {
		mapper.post(map);
		return (String)map.get("post_id");
	}
	@Override
	public String addReply(Map<String,Object> map) {
		mapper.addReply(map);
		return (String)map.get("post_id");
	}
	@Override
	public String addVisit(Map<String, Object> map) {
		mapper.addVisit(map);
		return (String)map.get("post_visit");
	}
	
	@Override
	public ArrayList<Map<String, Object>> allList(int start, int end, String keyword) {
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return mapper.allList(map);
	}
	@Override
	public int totalPage() {
		Map<String,Object> map=mapper.totalPage();
		System.out.println(map.toString());
		int tot_page=Integer.parseInt(String.valueOf(map.get("TOT_PAGE")));
		return tot_page;
	}
	@Override
	public int totalPage2(String keyword) {
		Map<String,Object> map=new HashMap<>();
		map.put("keyword", keyword);
		System.out.println(map.toString());
		Map<String,Object> result=mapper.totalPage2(map);
		System.out.println(result.toString());
		int tot_page=Integer.parseInt(String.valueOf(result.get("TOT_PAGE")));
		return tot_page;
	}

	@Override
	public Map<String, Object> postDetail(String post_id) {
		Map<String, Object> map = new HashMap<>();
		map=mapper.postDetail(post_id);
		map.put("reply",mapper.post_reply(post_id));
		return map;
	}

	@Override
	public void fileUpload(Map<String, Object> map) {
		mapper.fileUpload(map);
	}

	@Override
	public Map<String, Object> fileFind(String post_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("files",mapper.fileFind(post_id));
		return map;
	}

	@Override
	public void update(Map<String, Object> map) {
		mapper.update(map);
	}

	@Override
	public String deleteFile(String file_id) {
		Map <String,Object> delmap =mapper.viewFile(file_id);
		JSONObject resultobj = new JSONObject();
		try {
			System.out.println(delmap.toString());
			String file_path = (String)delmap.get("FILE_PATH");
			System.out.println("|||"+file_path);
			UploadHandler test = new UploadHandler("D:/file_upload",file_path);
			System.out.println("|||"+test.getFile_path());
			System.out.println("|||"+test.deleteFileExecute());
			mapper.deleteFile(delmap);		
			resultobj.put("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			resultobj.put("result","failed");
		}
		return resultobj.toString();
		//
	}

	@Override
	public String deletePost(String post_id) {
		JSONObject resultobj = new JSONObject();
		try{
			List<Map<String,Object>> delFiles = mapper.fileFind(post_id);
			for(Map<String,Object> map:delFiles) {
				new UploadHandler("D:/file_upload",(String)map.get("FILE_PATH")).deleteFileExecute();
			}
			System.out.println(post_id);
			mapper.deletePost(post_id);
			resultobj.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			resultobj.put("result", "failed");
		}
		return resultobj.toString();
	}
	

	
	

}
