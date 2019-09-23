package com.yjc.stk.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.yjc.stk.domain.MemberVO;
import com.yjc.stk.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImplement implements MemberService {

	private MemberMapper mapper;
	@Override
	public ArrayList<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		System.out.println(mapper.getMemberList());
		return mapper.getMemberList();
	}

}
