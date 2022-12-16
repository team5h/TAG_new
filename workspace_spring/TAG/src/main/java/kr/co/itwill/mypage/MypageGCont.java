package kr.co.itwill.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.myproduct.MyproductDAO;
import kr.co.itwill.myproduct.MyproductDTO;
import kr.co.itwill.product.ProductDAO;


@Controller
public class MypageGCont {
	
	public MypageGCont() {
		System.out.println("-----MypageGCont() 객체생성됨");
	}//end
	
	@Autowired
	MypageGDAO mypageGDao;
	
	
	@RequestMapping("mypage/mypageG")
	public ModelAndView mypage(HttpSession session) {
		String s_m_id=(String)session.getAttribute("s_m_id");
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("mypage/mypageG");
		
		List<Map<String, Object>> list_p=mypageGDao.list_p(s_m_id);
		mav.addObject("list_p", list_p);
		
		mav.addObject("orderCount", mypageGDao.orderCount(s_m_id));
		
		Map<String, Object> couponCnt=mypageGDao.couponCnt(s_m_id); 
		mav.addObject("couponCnt", couponCnt.get("cpCnt"));
		
		List<Map<String, Object>> list_t=mypageGDao.list_t(s_m_id);
		mav.addObject("list_t", list_t);
		
		int tckCount=mypageGDao.tckCount(s_m_id);
		mav.addObject("tckCount", tckCount);
		
		int ptTotal=mypageGDao.ptTotal(s_m_id);
		mav.addObject("ptTotal", ptTotal);
		
		
		return mav;
		
	}//mypage() end
		
}//class end
