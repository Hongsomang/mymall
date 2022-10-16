package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Admin;
import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Service.AdminService;
import kr.ac.kopo.Service.ProductService;
import kr.ac.kopo.Service.ShoppingmallService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path="admin/";
	
	@Autowired
	AdminService service;
	
	@Autowired
	ShoppingmallService shoppingService;
	
	@Autowired
	ProductService productService;
	
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
	public String list(Model model ,Pager pager) {
		
		List<Shoppingmall> list =shoppingService.list(pager);
		model.addAttribute("list",list);
		
		return path+"list";
	}
	
	@GetMapping("/add")
	public String add() {
		
		return path+"add";
	}
	
	@PostMapping("/add")
	public String add(Shoppingmall item) {
		item.setAdminId("admin1"); //세션 전 
		shoppingService.add(item);
		return "redirect:list";
	}
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id , Model model) {
		Shoppingmall item= shoppingService.item(id);
		model.addAttribute("item", item);
		
		return path+"update";
		
	}
	
	@PostMapping("/update/{id}")
	public String update( Shoppingmall item) {
		shoppingService.update(item);
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		shoppingService.delete(id);
		return "redirect:../list";
	}
	
	@RequestMapping("/product_update/{id}")
	public String product_update(@PathVariable int id) {
		if(productService.count(id)>0) {
			System.out.println("제품삭제 ");
			productService.delete(id);
		}
		Shoppingmall item=shoppingService.item(id);
		productService.add(item);
		return "redirect:../list";
	}
}