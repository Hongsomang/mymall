package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.ShoppingmallService;
import kr.ac.kopo.Service.UserService;

@Controller
@RequestMapping("/mymall")
public class MymallController {
	final String path="mymall/";
	
	@Autowired
	ShoppingmallService service;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<Shoppingmall> list=service.list();
		
		model.addAttribute("list", list);
		return path+"main";
	}
	@GetMapping("/login")
	public String login() {
		return path+"login";
	}
	
	
	@GetMapping("/signup")
	public String signup() {
		return path+"signup";
	}
	
	@PostMapping("/signup")
	public String signup(User user) {
		System.out.println(user.getEmail());
		userService.signup(user);
		
		return "redirect:login";
	}
}
