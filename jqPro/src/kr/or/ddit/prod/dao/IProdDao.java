package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdDao {

	
		//prod목록 리스트 검색
		public List<ProdVO> prodNames(String prod_lgu) throws SQLException;
		
		//prod상세정보검색
		public ProdVO prodDetaiL(String pId) throws SQLException;
}
