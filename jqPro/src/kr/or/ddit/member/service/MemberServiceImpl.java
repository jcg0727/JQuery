package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;

import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.zip.vo.ZipVO;

public class MemberServiceImpl implements IMemberService {

   private IMemberDao dao;
   private static MemberServiceImpl service;
   
   private MemberServiceImpl() {
      dao = MemberDaoImpl.getDao();
   }
   
   public static IMemberService getInstance() {
      if (service == null) {
         service = new MemberServiceImpl();
      }
      return service;
      
   }
   
   
   @Override
   public String idCheck(String id) {
      String mId = null;
      
      try {
         mId = dao.idCheck(id);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return mId;
   }

   @Override
   public List<ZipVO> searchCode(String dong) {
      
      List<ZipVO> list = null;
      
      list = dao.searchCode(dong);
      return list;
   }

}