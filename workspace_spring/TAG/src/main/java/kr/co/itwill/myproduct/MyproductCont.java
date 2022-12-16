package kr.co.itwill.myproduct;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.myproduct.MyproductDTO;
import kr.co.itwill.product.ProductDAO;

@Controller
public class MyproductCont {

	public MyproductCont() {
		System.out.println("-----MyproductCont() 객체생성됨");
	}//end
	
	@Autowired
	MyproductDAO myproductDao;
	
	/*
	@RequestMapping("mypage/myproduct")
	public String myproduct() {
		return "mypage/myproduct";
	}//myproduct() end
	*/
	
	@RequestMapping("mypage/myproduct")
	public ModelAndView list(HttpSession session) {
		String s_m_id=(String)session.getAttribute("s_m_id");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myproduct");
		
		List<MyproductDTO> list=myproductDao.list(s_m_id);
		//myproductDao.orderCount(s_m_id);
		//System.out.println(myproductDao.orderCount(s_m_id));
		mav.addObject("list", list);
		mav.addObject("orderCount", myproductDao.orderCount(s_m_id));
		
		return mav;
		
	}//list() end
	
	@RequestMapping("/mypage/detail/{order_num}")
	public ModelAndView detail(@PathVariable String order_num) throws Exception {
		System.out.println(myproductDao.detail(order_num));
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/mypage/pDetail");
		mav.addObject("detail", myproductDao.detail(order_num));
		return mav;
	}//detail() end
	
}//class end
