package kr.ac.kopo.Controller;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Model.Bookmark;
import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.BookmarkService;

@RestController
@RequestMapping("/mymall/bookmark")
public class RestBookmarkController {
	@Autowired
	BookmarkService service;


	@GetMapping
	public String add(int id, @SessionAttribute User user) {
		
		Bookmark item=new Bookmark();
		item.setUserId(user.getId());
		item.setShoppingmallId(id);
		System.out.println(id+user.getId());
	    service.add(item);


		return "ok";


	}
	@DeleteMapping
	public String delete(int id, @SessionAttribute User user) {
		Bookmark item=new Bookmark();
		item.setUserId(user.getId());
		item.setShoppingmallId(id);
		System.out.println(id+user.getId());
		service.delete(item);
		
		return "ok";
	}
}
