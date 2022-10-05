package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Admin;
import kr.ac.kopo.Service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path="admin/";
	
	@Autowired
	AdminService service;
	
	@GetMapping("/login")
	public String login() {
		
		return path+"login";
	}
	
	@PostMapping("/login")
	public String login(Admin admin) {
		if(service.login(admin)) {
			System.out.println("로그인성공 ");
			return path+"list";
		}
		else {
			System.out.println("로그인 실패 ");
			return "redirect:login";
		}
		
		
	}
	
	/*@RequestMapping("/list")
	public String list() {
		
		List<> list =service.list();
		
		
		return path+"list";
	}*/
}
