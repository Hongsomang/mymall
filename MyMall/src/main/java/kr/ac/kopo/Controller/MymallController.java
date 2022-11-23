package kr.ac.kopo.Controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Model.User;
import kr.ac.kopo.Service.BookmarkService;
import kr.ac.kopo.Service.LikeService;
import kr.ac.kopo.Service.ProductService;
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

	@Autowired
	ProductService productService;

	//@Autowired
	//BookmarkService bookmarkSerice;
	
	@Autowired 
	LikeService likeService;

	@RequestMapping("/main")
	public String main(Model model ,Pager pager ,@SessionAttribute User user) {
		
		List<Shoppingmall> list=new ArrayList<Shoppingmall>();
		list=service.list(pager,user.getId());
		model.addAttribute("list", list);
		return path+"main";
	}
	@GetMapping("/login")
	public String login() {
		return path+"login";
	}

	@PostMapping("/login")
	public String login(User user,HttpSession session) {
		if(userService.login(user)) {
			session.setAttribute("user", user);
			String targetUrl =(String) session.getAttribute("target_url");
			System.out.println("로그인 성공 ");
			
			System.out.println(targetUrl);

			if(targetUrl == null) {
				return "redirect:main";
			}
			else {
				return "redirect:"+targetUrl;
			}
			//return "redirect:main";
		}
		else {
			System.out.println("로그인 실패 ");
			return "redirect:login";
		}

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

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:main";
	}
	
	@RequestMapping("/product/{id}")
	public String productList(@PathVariable int id,Model model, Pager pager, @SessionAttribute User user) {
		int shoppingmallId=id;
		List<Product> list=productService.list(shoppingmallId,pager,user.getId());
		System.out.println("controller"+list.get(1).getShopName());
		model.addAttribute("list", list);
		return path+"product";
	}

	@RequestMapping("/allProduct")
	public String allProduct(Model model, Pager pager ,@SessionAttribute User user) {
		List<Product> list =productService.allList(pager,user.getId());
		model.addAttribute("list", list);
		return path+"all_product";
	}
	
	@RequestMapping("/mypage")
	public String mypage(@SessionAttribute User user) {
		System.out.println("mypage"+user.getName());
		return path+"mypage";
	}
	
	@ResponseBody
	@GetMapping("/like")
	public String addLike(int id, @SessionAttribute User user) {
		if(likeService.add(id,user.getId()))
			return "ok";
		return "fail";
	}
	
	@ResponseBody
	@DeleteMapping("/like")
	public String deleteLike(int id, @SessionAttribute User user) {
		System.out.println("dfdf:"+id);
		if(likeService.delete(id,user.getId()))
			return "ok";
		return "fail";
	}
	@RequestMapping("/likesProduct")
	public String likesProduct(Model model, Pager pager ,@SessionAttribute User user) {
		List<Product> list =productService.likeProduct(pager,user.getId());
		model.addAttribute("list", list);
		return path+"like_product";
	}
	@ResponseBody
	@GetMapping("/checkId/{id}")
	public String checkId(@PathVariable String id) {	
		if(userService.checkId(id))
			return "OK";
		else
			return "FAIL";
	}

}
