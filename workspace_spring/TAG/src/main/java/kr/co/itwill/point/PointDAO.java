package kr.co.itwill.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {

	public PointDAO() {
		System.out.println("-----PointDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int ptCount(String s_m_id) {
		return sqlSession.selectOne("point.ptCount", s_m_id);
	}//tckCount() end
	
	public List<PointDTO> list(String s_m_id){
		return sqlSession.selectList("point.list");
	}//list() end
	
}//class end
