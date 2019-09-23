package com.yjc.stk.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yjc.stk.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImplement implements MemberService {

	private MemberMapper mapper;
	@Override
	public List<Map<String, Object>> getMemberList() {
		// TODO Auto-generated method stub
		return mapper.getMemberList();
	}

}
