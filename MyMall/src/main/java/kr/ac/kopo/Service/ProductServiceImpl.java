package kr.ac.kopo.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.Dao.LikesDao;
import kr.ac.kopo.Dao.ProductDao;
import kr.ac.kopo.Model.Likes;
import kr.ac.kopo.Model.Crawling;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Pager.Pager;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Autowired
	LikesDao likesDao;

	@Override
	public int count(int shoppingmallId) {
		// TODO Auto-generated method stub
		return dao.count(shoppingmallId);
	}

	@Override
	public void add(Shoppingmall item) {
		int bestCode = item.getBestCode();
		String path = item.getUrl();

		System.out.println("bestCode:" + bestCode);
		System.out.println("path:" + path);

		List<Crawling> list = new ArrayList<>();
		try {
			Document docPage = Jsoup.connect(path + "/product/list.html?cate_no=" + bestCode).get();

			Elements page = docPage.select("div .xans-product-normalpaging >ol >li");
			System.out.println("page.size()"+page.size());
			for (int j = 1; j <= page.size(); j++) {
				System.out.println(j + page.get(j - 1).toString());

				Document doc = Jsoup.connect(path + "/product/list.html?cate_no=" + bestCode + "&page=" + j).get();
				Elements El;
				Elements contents;
				System.out.println(item.getName());

				contents = doc.select("ul[class=prdList grid4] ").select("div[class=prdImg] > a");
				El = doc.select("ul[class=prdList grid4]  >li").select("div");

				if (contents.size() == 0) {
					contents = doc.select("ul[class=prdList grid3] ").select("div[class=prdImg] > a");
					El = doc.select("ul[class=prdList grid3]  >li").select("div");
					System.out.println("size 0");
				}

				Elements Elprice_li_1 = El.select("ul >li[rel=판매가] span:nth-child(2)");
				Elements Elname = El.select(".name >a ");
				
				//int index = 0;
				String name;
				String url;
				String img;
				String price = "";
				
				System.out.println("cotent.size()"+contents.size());
				System.out.println("Elprice_li_1 "+Elprice_li_1 .size());
				System.out.println("Elname"+ Elname.size());
				for (int i = 0; i < contents.size(); i++) {

					if(Elname.select("span:nth-child(2)").size()==0) {
						name = contents.select("img").get(i).attr("alt");
					}
					else {
						name = Elname.select("span:nth-child(2)").get(i).text();
					}
					
				
					System.out.println("name:" + name);
					url = contents.get(i).attr("href").toString();
					img = contents.select("img").get(i).attr("src");

				
					
						
					price=Elprice_li_1.get(i).text();
				
					

					 System.out.println("크롤링:"+ name+price+img+path+url);
					list.add(new Crawling(name, price, img, path + url, item.getId()));

				}

			}
			/*
			 * for(Object object :list) { System.out.println("list"+object); }
			 */
			dao.add(list);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/*
	 * @Override public List<Product> list(int shoppingmallId,Pager pager) { int
	 * total=dao.total(pager,shoppingmallId); pager.setTotal(total);
	 * System.out.println("service:"+total); return dao.list(shoppingmallId,pager);
	 * }
	 * 
	 * @Override public List<Product> allList(Pager pager) { int
	 * total=dao.allTotal(pager); pager.setTotal(total); return dao.allList(pager);
	 * }
	 */

	@Override
	public List<Product> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);

		return dao.list(pager);
	}

	@Override
	public List<Product> likeProduct(Pager pager) {
		int total = dao.likeTotal(pager);
		pager.setTotal(total);
		return dao.likeProduct(pager);
	}

	@Override
	@Transactional
	public void delete(int shoppingmallId) {
		// TODO Auto-generated method stub
		likesDao.delete_product(shoppingmallId);
		dao.delete(shoppingmallId);

	}

	@Override
	public Product total(Pager pager) {
		// TODO Auto-generated method stub
		int total = dao.total(pager);

		Product item = new Product();
		item.setTotal(total);
		return item;
	}

	@Override
	public void directAdd(Product item) {
		// TODO Auto-generated method stub
		dao.directAdd(item);
	}

	@Override
	public Product item(int shoppingmallId, int id) {
		// TODO Auto-generated method stub
		Product item = new Product();
		item.setShoppingmallId(shoppingmallId);
		item.setId(id);
		return dao.item(item);
	}

	@Override
	public void update(Product item) {
		// TODO Auto-generated method stub
		dao.update(item);
	}

	@Override
	@Transactional
	public void itemDelete(int id, int shoppingmallId) {
		// TODO Auto-generated method stub
		likesDao.delete_product(shoppingmallId);
		dao.itemDelete(id);
	}

}
