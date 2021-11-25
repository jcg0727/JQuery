package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.zip.vo.ZipVO;

public interface IMemberService {

	//id 중복체크
	public String idCheck(String id);

	List<ZipVO> searchCode(String dong);
	
	
	
	
}
