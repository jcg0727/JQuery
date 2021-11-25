package kr.or.ddit;

import java.util.Map;

public class MemberService {
	public static MemberService memberService;
	public MemberDao memberDao;
	
	public MemberService() {
		//dao객체 얻어오기
		memberDao = memberDao.getInstance();
	}
	
	public static MemberService getInstance() {
		if(memberService == null) {
			memberService = new MemberService();
		}
		return memberService;
	}
	public Map<String, Object> selectMemberOne(String name){
		Map<String, Object> map = memberDao.selectMemberOne(name);
		return map;
	}
}
