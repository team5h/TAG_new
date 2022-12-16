package kr.co.itwill.point;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointCont {

	public PointCont() {
		System.out.println("-----PointCont() 객체생성됨");
	}//end
	
	@Autowired
	PointDAO pointDao;
	
	@RequestMapping("pointDetail/detail")
	public ModelAndView list(HttpSession session) {
		String s_m_id=(String)session.getAttribute("s_m_id");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pointDetail/detail");
		
		int ptCount=pointDao.ptCount(s_m_id);
		mav.addObject("ptCount", ptCount);
		
		List<PointDTO> list=pointDao.list(s_m_id);
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
}//class end
