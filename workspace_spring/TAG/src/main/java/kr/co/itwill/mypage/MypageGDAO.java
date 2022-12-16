package kr.co.itwill.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.myproduct.MyproductDTO;

@Repository
public class MypageGDAO {
	
	public MypageGDAO() {
		System.out.println("-----MypageGDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> list_p(String s_m_id){
		return sqlSession.selectList("mypageG.list_p", s_m_id);
	}//list_p() end
	
	public int orderCount(String s_m_id) {
		return sqlSession.selectOne("mypageG.orderCount", s_m_id);
	}//orderCount() end
	
	public Map<String, Object> couponCnt(String s_m_id){
		return sqlSession.selectOne("mypageG.couponCnt", s_m_id);
	}//couponCnt() end
	
	public List<Map<String, Object>> list_t(String s_m_id){
		return sqlSession.selectList("mypageG.list_t", s_m_id);
	}//list_t() end
	
	public int tckCount(String s_m_id) {
		return sqlSession.selectOne("mypageG.tckCount", s_m_id);
	}//tckCount() end

	
	
	public int ptTotal(String s_m_id) {
		return sqlSession.selectOne("mypageG.ptTotal", s_m_id);
	}//tckCount() end
	
	
}//class end
