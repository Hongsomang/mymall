package kr.ac.kopo.Controller;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.BookmarkService;

@RestController
@RequestMapping("/mymall/bookmark")
public class RestBookmarkController {
	@Autowired
	BookmarkService bookmarkSerice;


	@GetMapping
	public String bookmark(int id, @SessionAttribute User user) {
		
			
			 System.out.println(id+user.getId());
			 bookmarkSerice.add(id,user.getId());


		return "ok";


	}
}
