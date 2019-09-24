package com.yjc.stk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjc.stk.domain.PostPager;
import com.yjc.stk.service.MemberService;
import com.yjc.stk.service.PostService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class PostController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	private MemberService memservice;
	private PostService postservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@ResponseBody
	@RequestMapping(value = "/load", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String loadPost(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword) {
		//190924 처음 불러와서 테스트용
		int totPage=0;
		PostPager postPager;
		if(keyword.isEmpty()) {
			totPage=postservice.totalPage();
			System.out.println("인자 1개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}else {
			totPage=postservice.totalPage2(keyword);
			System.out.println("인자 2개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}
		int start=postPager.getPageBegin();
		int end=postPager.getPageEnd();
		List<Map<String,Object>> areaList=postservice.allList(start,end,keyword);
		System.out.println(areaList.toString());
		System.out.println(postPager.toString());
		Map<String,Object> map=new HashMap<String,Object>();
		JSONArray postJsonArr = new JSONArray();
//		for(Map<String,Object> post : areaList) {
//			JSONObject obj = JSONObject.fromObject
//		}
		postJsonArr=JSONArray.fromObject(areaList);
		System.out.println("JSON 변환 잘 됐나? ==> "+postJsonArr.toString());
		JSONObject resultobj = new JSONObject();
		resultobj.put("totPage",totPage);
		resultobj.put("keyword",keyword);
		resultobj.put("postPager",postPager);
		resultobj.put("postlist",postJsonArr);
		resultobj.put("result","success");
		
		
		//글을 전부다 불러온다
		//댓글을 확인한다(ref가 있으면 다 댓글)
		//파일들을 불러온다 (post_id 별로 분류)
		
		//=========최종 예정============
		//	post = {
		//		post_id : 'df',
		//		post_cont : 'dfdfdf',
		//		post_visit : 2323,
		//		post_userid: 'dfdf',
		//		reply : [댓글1{
		//					post_id :'댓글 아디',
		//					post_cont: '댓글 내용',
		//					post_userid : '댓글 작성자',
		//					post_regdate : '댓글 작성일자',
		//					post_moddate: '댓글 수정일자'
		//				},댓글2{}],
		//		post_regdate : '게시글 작성일자',
		//		post_moddate : '게시글 수정일자',
		//		post_file : [ {file_id : '파일 아이디', file_path:'파일 경로'},{}]
		//	}
		//
		
		//모집공고 컨트롤러
//		@RequestMapping(value = "/announce")
//		public String recruit(Model model,@RequestParam(defaultValue="1") int post_class,
//				@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword) {
//			//========================================페이징 하기=======================================
//			int totPage=0;
//			PostPager postPager;
//			if(keyword.isEmpty()) {
//				totPage=postService.totalPage(post_class);
//				System.out.println("인자 1개"+totPage);
//				postPager=new PostPager(totPage,curPage);
//			}else {
//				totPage=postService.totalPage2(post_class,keyword);
//				System.out.println("인자 2개"+totPage);
//				postPager=new PostPager(totPage,curPage);
//			}
//			int start=postPager.getPageBegin();
//			int end=postPager.getPageEnd();
//			ArrayList<Map<String,Object>> areaList=postService.allList(start,end,keyword,post_class);
//			System.out.println(areaList.toString());
//			System.out.println(postPager.toString());
//			Map<String,Object> map=new HashMap<String,Object>();
//			map.put("totPage",totPage);
//			map.put("keyword",keyword);
//			map.put("postPager",postPager);
//			model.addAttribute("announcepostList",postService.getPostList(1));
//			model.addAttribute("announceList",areaList);
//			model.addAttribute("map",map);
//			return "announce/localrecruit";
//		}
		
		return resultobj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String post(@RequestBody Map<String,Object> map) {
		JSONObject resultobj = new JSONObject();
		try {
			postservice.post(map);
			resultobj.put("result","success");
		}catch(Exception e) {
			System.out.println("===========================에러============================");
			e.printStackTrace();
			resultobj.put("result","fail");
		}
		
		
		return resultobj.toString();
	}
	
	
}
