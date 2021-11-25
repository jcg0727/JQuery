package kr.or.ddit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class MemberDao {
	
	public static MemberDao memberDao;
	private Connection conn;
	
	/*싱글톤 디자인 패턴
	 * 애플리케이션이 시작될 때 어떤 클래스가 최초 한번만 메모리를 할당하고(static)
	 * 그 메모리에 instance를 생성해 사용하는 디자인 패턴
	*/
	
	/*public MemberDao() {		//생성자 아닌 static으로 
		jdbc = new JDBCUtil();
	}*/
	
	
	//service에서 사용하기 위한 자신의 dao객체 생성
	public static MemberDao getInstance() {	//최초에 할당된 하나의 메모리를 계속 쓰는 방식
	
		if(memberDao == null) {				//null일 경우에
			memberDao = new MemberDao();	//최초 한번한 new연산자를 통해 메모리에 할당
			
		}
		return memberDao;
	}
	
	
	//Sql구문 작성
	public Map<String, Object> selectMemberOne(String name){
		
		Map<String, Object> map = new HashMap<>();
		String sql = "select * from member where mem_name = ?";
		
		conn = JDBCUtil.getConn();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			//executeQuery를 통해 쿼리를 실행하면 ResultSet타입으로 반환해 결과 값을 저장
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				map.put("id", rs.getString("mem_id"));
				map.put("name", rs.getString("mem_name"));
				map.put("hp", rs.getString("mem_hp"));
				map.put("mail", rs.getString("mem_mail"));
			}
			JDBCUtil.close(conn, ps, rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	
	
	
	
}
