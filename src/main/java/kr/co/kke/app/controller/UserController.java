

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   




package kr.co.kke.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kke.app.dao.DaoInterface;
import kr.co.kke.util.FinalUtil;
import kr.co.kke.util.HttpUtil;

@Controller
public class UserController {
	
	@Autowired
	DaoInterface di;
	
	
	@Resource(name="sqlSession")
	SqlSession session;

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping("/userInsert")
	public String userInsert(HttpServletRequest req) {
		HashMap<String, Object> param = HttpUtil.getParamMap(req);
		/*String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");
		String userName = req.getParameter("userName");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userEmail", userEmail);
		param.put("userPassword", userPassword);
		param.put("userName", userName);
		*/
		param.put("sqlType", "user.userInsert");
		param.put("sql", "insert");
		
		int status = (int) di.call(param);
		//int status = Integer.parseInt(resultMap.get("status").toString());
		//int status = session.insert("user.userInsert",param);
		System.out.println(status);
		
		return "redirect:/admin";
	}
	
	@RequestMapping("/userSelect")
	public String userSelect(HttpServletRequest req, RedirectAttributes attr, HttpSession session) {
		HashMap<String, Object> param = HttpUtil.getParamMap(req);
		/*
		String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userEmail", userEmail);
		param.put("userPassword", userPassword);
		*/
		param.put("sqlType", "user.userSelect");
		param.put("sql", "selectOne");
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>)di.call(param);
		//HashMap<String, Object> resultMap = session.selectOne("user.userSelect",param);
		
		if(resultMap == null) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("status", FinalUtil.NO);
		}else {
			resultMap.put("status", FinalUtil.OK);
			session = req.getSession();
			
		}
		session.setAttribute("user", resultMap);
		//attr.addFlashAttribute("data", resultMap);
		
		return "redirect:/admin";
	}
	@RequestMapping("/userList")
	public ModelAndView userList() {
		HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "user.userList");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
	}
	
	
}
