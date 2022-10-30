package kr.ac.kopo.Controller;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.BookmarkService;

@RestController
@RequestMapping("/mymall/bookmark")
public class RestBookmarkController {
	@Autowired 
	BookmarkService bookmarkSerice;
	
	
	@PostMapping
	public String bookmark(@RequestBody HashMap<String, Object> item, @SessionAttribute User user) {
		
		int id=(int)item.get("id");
		
		System.out.println(item.get("id")+user.getId());
		bookmarkSerice.add(id,user.getId());
		
		return "ok";
		
		
	}
}
