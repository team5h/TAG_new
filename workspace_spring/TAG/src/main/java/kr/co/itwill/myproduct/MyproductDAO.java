package kr.co.itwill.myproduct;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyproductDAO {

	public MyproductDAO() {
		System.out.println("-----MyproductDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<MyproductDTO> list(String s_m_id){
		return sqlSession.selectList("myproduct.list", s_m_id);
	}//list() end
	
	public int orderCount(String s_m_id) {
		return sqlSession.selectOne("myproduct.orderCount", s_m_id);
	}//orderCount() end
	
	public List<Map<String, Object>> detail(String order_num) throws Exception{
		System.out.println("도착?");
		return sqlSession.selectList("myproduct.detail", order_num);
	}//detail() end
	
}//class end
