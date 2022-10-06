package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Admin;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Service.AdminService;
import kr.ac.kopo.Service.ShoppingmallService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path="admin/";
	
	@Autowired
	AdminService service;
	
	@Autowired
	ShoppingmallService shoppingService;
	
	@GetMapping("/login")
	public String login() {
		
		return path+"login";
	}
	
	@PostMapping("/login")
	public String login(Admin admin) {
		if(service.login(admin)) {
			System.out.println("로그인성공 ");
			return "redirect:list";
		}
		else {
			System.out.println("로그인 실패 ");
			return "redirect:login";
		}
		
		
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Shoppingmall> list =shoppingService.list();
		model.addAttribute("list",list);
		
		return path+"list";
	}
}
