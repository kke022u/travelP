package kr.co.kke.app.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/London")
	public String london() {
		return "London";
	}
	
	@RequestMapping("/Barcelona")
	public String barcelona() {
		return "Barcelona";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/user")
	public String user() {
		return "user";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "list";
	}
	
	@RequestMapping("/updateBoard")
	public String updateBoard() {
		return "updateBoard";
	}
	@RequestMapping("/updateYt")
	public String updateYt() {
		return "updateYt";
	}
	
	@RequestMapping("/updateFile")
	public String updateFile() {
		return "updateFile";
	}
	
	@RequestMapping("/userM")
	public String userM() {
		return "userM";
	}
	@RequestMapping("/boardM")
	public String boardM() {
		return "boardM";
	}
	@RequestMapping("/fileM")
	public String fileM() {
		return "fileM";
	}
	@RequestMapping("/insert")
	public String insert() {
		return "insert";
	}
}
