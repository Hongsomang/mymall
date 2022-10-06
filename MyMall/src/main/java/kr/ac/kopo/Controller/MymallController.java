package kr.ac.kopo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Service.ShoppingmallService;

@Controller
@RequestMapping("/mymall")
public class MymallController {
	final String path="mymall/";
	
	@Autowired
	ShoppingmallService service;
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<Shoppingmall> list=service.list();
		
		model.addAttribute("list", list);
		return path+"main";
	}
}
