package kr.ac.kopo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Model.Likes;
import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.LikesService;

@RestController
@RequestMapping("mymall/likes")
public class RestLikesController {

	@Autowired 
	LikesService service;
	
	@GetMapping
	public String addLike(int id, @SessionAttribute User user) {
		Likes item =new Likes();
		item.setProductId(id);
		item.setUserId(user.getId());
		
		if(service.add(item))
			return "ok";
		return "fail";
	}
	
	
	@DeleteMapping
	public String deleteLike(int id, @SessionAttribute User user) {
		System.out.println("dfdf:"+id);
		Likes item =new Likes();
		item.setProductId(id);
		item.setUserId(user.getId());
		
		if(service.delete(item))
			return "ok";
		
		return "fail";
	}
}
