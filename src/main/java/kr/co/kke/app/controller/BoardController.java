package kr.co.kke.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kke.app.dao.DaoInterface;
import kr.co.kke.util.FinalUtil;
import kr.co.kke.util.HttpUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class BoardController {
	
	@Autowired
	DaoInterface di;
	
	@RequestMapping("/bid")
	public ModelAndView bid(HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(HttpUtil.checkLogin(session)) {
			int status = 0;
			String data = req.getParameter("data");
			HashMap<String, Object> params = new HashMap<String, Object>();
			List<Map<String, Object>> dataList = JSONArray.fromObject(data);
			
			for(int i = 0; i < dataList.size(); i++) {
				String fileName = dataList.get(i).get("fileName").toString();
				String fileURL = dataList.get(i).get("fileURL").toString();
				HashMap<String, Object> fileMap = new HashMap<String, Object>();
				fileMap.put("fileName", fileName);
				fileMap.put("fileURL", FinalUtil.FILE_DNS + fileURL);
				fileMap.put("sqlType", "board.fileInsert");
				fileMap.put("sql", "insert");
				
				status = (int) di.call(fileMap);
			}
			
				if(status == 1) {
					params = new HashMap<String, Object>();
					params.put("sqlType", "board.getFileNo");
					params.put("sql", "selectOne");
					int fileNo = (int) di.call(params);
					
					HashMap<String, Object> boardparams = new HashMap<String, Object>();
					String boardTitle = req.getParameter("boardTitle");
					String boardContents = req.getParameter("boardContents");
					String boardType = req.getParameter("boardType");
					boardparams.put("boardTitle", boardTitle);
					boardparams.put("boardContents", boardContents);
					boardparams.put("boardType", boardType);
					boardparams.put("fileNo", fileNo);
					boardparams.put("sqlType", "board.boardInsert");
					boardparams.put("sql", "insert");
					System.out.println(boardparams);
					status = (int) di.call(boardparams);
					
					if(status == 1) {
						map.put("msg", "글작성이 완료 되었습니다.");
						map.put("status", FinalUtil.OK);
					}else {
						map.put("msg", "게시글 오류 발생.");
					}
				} else {
					map.put("msg", "글 작성 시 오류 발생.");
				}
				} else {
						map.put("msg", "로그인이 되어 있지 않습니다.");
				}
				return HttpUtil.makeJsonView(map);
		}
		
		
		
		

    @RequestMapping("/bld")
    public ModelAndView bld(HttpServletRequest req) {
    	String boardNo = req.getParameter("boardNo");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("boardNo", boardNo);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	
    	param.put("sqlType","board.boardOne");
    	param.put("sql","selectOne");
    	resultMap.put("boardData", di.call(param));
    	
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/fld")
    public ModelAndView fld(HttpServletRequest req) {
    	String fileNo = req.getParameter("fileNo");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("fileNo", fileNo);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	
    	param.put("sqlType","board.fileOne");
    	param.put("sql","selectOne");
    	resultMap.put("boardData", di.call(param));
    	
    	System.out.println(resultMap);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    
    @RequestMapping("/spl")
    public ModelAndView spl() {
    	System.out.println("selectPickList");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.selectPickList");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/sdl")
    public ModelAndView sdl() {
    	System.out.println("selectDetailLon");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.selectDetailLon");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/sdb")
    public ModelAndView sdb() {
    	System.out.println("selectDetailBar");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.selectDetailBar");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    @RequestMapping("/ssb")
    public ModelAndView ssb() {
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.selectSB");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/bbld")
    public ModelAndView bbld() {
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.boardList");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/bud")
	public ModelAndView bud(HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(HttpUtil.checkLogin(session)) {
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String boardTitle = req.getParameter("boardTitle");
			String boardContents = req.getParameter("boardContents");
			String data = req.getParameter("data");	
			String delData = req.getParameter("delData");
			
			/********************************************************************************************/
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("boardNo", boardNo);
			params.put("boardTitle", boardTitle);
			params.put("boardContents", boardContents);
			
			params.put("sqlType", "board.boardUpdate");
	    	params.put("sql", "update");
			int status = (int) di.call(params);
			/********************************************************************************************/
			
			if(status == 1) {
				
				List<Map<String, Object>> dataList = JSONArray.fromObject(data);
				for(int i = 0; i < dataList.size(); i++) {
					String fileName = dataList.get(i).get("fileName").toString();
					String fileURL = dataList.get(i).get("fileURL").toString();
					HashMap<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("boardNo", boardNo);
					fileMap.put("fileName", fileName);
					
				
					
					fileMap.put("fileURL", FinalUtil.FILE_DNS + fileURL);
					fileMap.put("sqlType", "board.boardFileUpdate");
					fileMap.put("sql", "update");
					di.call(fileMap);
				}
				
				if(status == 1) {
					map.put("msg", "글수정이 완료 되었습니다.");
					map.put("status", FinalUtil.OK);
					map.put("boardNo", boardNo);
				}else {
					map.put("msg", "첨부파일 오류 발생.");
				}
			} else {
				map.put("msg", "글 작성 시 오류 발생.");
			}
		}else {
			map.put("msg", "로그인이 되어 있지 않습니다.");
		}
		
		return HttpUtil.makeJsonView(map);
	}
    
    @RequestMapping("/fud")
	public ModelAndView fud(HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(HttpUtil.checkLogin(session)) {
			int fileNo = Integer.parseInt(req.getParameter("fileNo"));
			String fileName = req.getParameter("fileName");
			String data = req.getParameter("data");
	
				List<Map<String, Object>> dataList = JSONArray.fromObject(data);
				for(int i = 0; i < dataList.size(); i++) {
					String fileURL = dataList.get(i).get("fileURL").toString();
					HashMap<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("fileNo", fileNo);
					fileMap.put("fileName", fileName);
				
					fileMap.put("fileURL", FinalUtil.FILE_DNS + fileURL);
					fileMap.put("sqlType", "board.fileUpdate");
					fileMap.put("sql", "update");
					di.call(fileMap);
				}
				
				map.put("msg", "글수정이 완료 되었습니다.");
				map.put("status", FinalUtil.OK);
				map.put("fileNo", fileNo);
		}
		return HttpUtil.makeJsonView(map);    
    }
    
    @RequestMapping("/bDel")
    public String bDel(HttpServletRequest req) {
    	String boardNo = req.getParameter("boardNo");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("boardNo", boardNo);
    	
    	param.put("sqlType", "board.boardDel");
    	param.put("sql", "update");
    	int status1 = (int) di.call(param);
    	System.out.println(status1);
    	
    	param.put("sqlType", "board.filesBoardDel");
    	param.put("sql", "update");
    	int status2 = (int) di.call(param);
    	System.out.println(status2);
    	
    	return "redirect:/index";
    }
    
   
    
    
    @RequestMapping("/boardList")
    public ModelAndView boardList() {
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.boardList");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/syl")
    public ModelAndView syl() {
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("sqlType", "board.selectYoutubeList");
    	param.put("sql", "selectList");
    	List list = (List) di.call(param);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("list", list);
    	return HttpUtil.makeJsonView(resultMap);
    }
    
    @RequestMapping("/likeB")
	public ModelAndView likeB(HttpServletRequest req, HttpSession session) {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	int vNum = Integer.parseInt(req.getParameter("vNum"));
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("vNum", vNum);
    	param.put("sqlType", "board.updateLikeNum");
    	param.put("sql", "update");
		di.call(param);
		map.put("msg", "좋아요!");
		map.put("status", FinalUtil.OK);
		map.put("fileNo", vNum);
    	return HttpUtil.makeJsonView(map);    
    }
    
    @RequestMapping("/bestB")
	public ModelAndView bestB(HttpServletRequest req, HttpSession session) {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	int vNum = Integer.parseInt(req.getParameter("vNum"));
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("vNum", vNum);
    	param.put("sqlType", "board.updateBestNum");
    	param.put("sql", "update");
		di.call(param);
		map.put("msg", "최고예요!");
		map.put("status", FinalUtil.OK);
		map.put("fileNo", vNum);
    	return HttpUtil.makeJsonView(map);    
    }
    
    @RequestMapping("/yud")
	public ModelAndView yud(HttpServletRequest req, HttpSession session) {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	int vNum = Integer.parseInt(req.getParameter("vNum"));
    	String vTitle = req.getParameter("vTitle");
		String vContents = req.getParameter("vContents");
		String vUrl = req.getParameter("vUrl");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("vNum", vNum);
    	param.put("vTitle", vTitle);
    	param.put("vUrl", vUrl);
    	param.put("vContents", vContents);
    	param.put("sqlType", "board.updateYt");
    	param.put("sql", "update");
		di.call(param);
		map.put("msg", "수정 성공");
		map.put("status", FinalUtil.OK);
		map.put("fileNo", vNum);
    	return HttpUtil.makeJsonView(map);    
    }
    @RequestMapping("yld")
    public ModelAndView yld(HttpServletRequest req) {
    	String vNum = req.getParameter("vNum");
    	HashMap<String, Object> param = new HashMap<String, Object>();
    	param.put("vNum", vNum);
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	
    	param.put("sqlType","board.youtubeOne");
    	param.put("sql","selectOne");
    	resultMap.put("boardData", di.call(param));
    	
    	return HttpUtil.makeJsonView(resultMap);
    }
}