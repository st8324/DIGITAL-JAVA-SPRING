package kr.green.springtest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.springtest.service.UserService;
import kr.green.springtest.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView home(ModelAndView mv,UserVo inputUser) {
		logger.info("URI:/");
		mv.setViewName("/main/home");
		UserVo user = userService.isUser(inputUser);
		if(user != null) {
			mv.setViewName("redirect:/board/list");
			mv.addObject("user",user);
		}
		return mv;
	}
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		logger.info("URI:/signup:GET");
		mv.setViewName("/main/signup");
		return mv;
	}
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv,UserVo user) {
		logger.info("URI:/signup:POST");
		if(userService.signup(user)) {
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("redirect:/user/signup");
		}
		
		return mv;
	}
	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv,HttpServletRequest request) {
		logger.info("URI:/signout:GET");
		mv.setViewName("redirect:/");
		request.getSession().removeAttribute("user");
		return mv;
	}
	@RequestMapping(value ="/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){

	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("res",userService.getUser(id)==null);
	    return map;
	}
}
