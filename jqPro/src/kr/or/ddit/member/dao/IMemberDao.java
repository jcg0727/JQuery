package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.zip.vo.ZipVO;

public interface IMemberDao {
	
	//id 중복체크
		public String idCheck(String id) throws SQLException;

		public List<ZipVO> searchCode(String dong);
}
