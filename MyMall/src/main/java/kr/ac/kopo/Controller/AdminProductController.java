package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Pager.Pager;
import kr.ac.kopo.Service.ProductService;

@Controller
@RequestMapping("admin/product/{shoppingmallId}")
public class AdminProductController {
	final String path="admin/product/";
	
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/list")
	public String list(Model model ,Pager pager, @PathVariable int shoppingmallId) {
		pager.setPerPager(10);
		List<Product> list =service.admainlist(pager,shoppingmallId);
		model.addAttribute("list",list);

		return path+"list";
	}
	
	
	@GetMapping("/add")
	public String add() {
		return path+"add";
	}

	@PostMapping("/add")
	public String add(Product item ,@PathVariable int shoppingmallId) {
		item.setShoppingmallId(shoppingmallId);
		service.directAdd(item);
		System.out.println("controller "+item.getName());
		return "redirect:list";
	}
	@GetMapping("/update/{id}")
	public String update(@PathVariable int shoppingmallId, @PathVariable int id,Model model) {
		
		Product item=service.item(shoppingmallId,id);
		model.addAttribute("item",item);
		return path+"update";
	}
	@PostMapping("/update/{id}")
	public String update(Product item,@PathVariable int shoppingmallId,@PathVariable int id) {
		item.setShoppingmallId(shoppingmallId);
		item.setId(id);
		service.update(item);
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id,@PathVariable int shoppingmallId) {
		service.itemDelete(id,shoppingmallId);
		return "redirect:../list";
	}
}
