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
import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Parsing;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	LikesDao likeDao;
	@Override
	public int count(int shoppingmallId) {
		// TODO Auto-generated method stub
		return dao.count(shoppingmallId);
	}
	
	@Transactional
	@Override
	public void delete(int shoppingmallId) {
		// TODO Auto-generated method stub
		Likes item=new Likes();
		item.setShoppingmallId(shoppingmallId);
		System.out.println("shoppingmallid "+item.getShoppingmallId()+" userId"+item.getUserId()+" prodcutId"+item.getProductId());
		likeDao.delete_product(item);
		dao.delete(shoppingmallId);
	}

	@Override
	public void add(Shoppingmall item) {
		int bestCode=item.getBestCode();
		String path=item.getUrl();

		System.out.println("bestCode:"+bestCode);
		System.out.println("path:"+path);

		List<Parsing> list=new ArrayList<>();
		try {
			Document docPage=Jsoup.connect(path+"/product/list.html?cate_no="+bestCode).get();



			Elements page=docPage.select("div .xans-product-normalpaging >ol >li");
			for(int j=1;j<=page.size();j++) {
				System.out.println(j+page.get(j-1).toString());

				
				Document doc=Jsoup.connect(path+"/product/list.html?cate_no="+bestCode+"&page="+j).get();
				Elements El;
				Elements contents;
				System.out.println(item.getName());
				if(item.getName().equals("메리어라운드")) {
					 contents =doc.select("ul[class=prdList grid3] ").select("div[class=prdImg] > a");
					 El =doc.select("ul[class=prdList grid3]  >li").select("div");
				}else {
					contents =doc.select("ul[class=prdList grid4] ").select("div[class=prdImg] > a");
					El =doc.select("ul[class=prdList grid4]  >li").select("div");
				}
				
				Elements Elprice_li_1=El.select("ul >li[rel=판매가]");
				Elements Elname=El.select("p[class=name] >a ");
				

				int index=0;
				String name;
				String url;
				String img;
				String price="";
				
				System.out.println("1:"+Elprice_li_1);
				System.out.println("1:"+Elname);
				for(int i = 0; i < contents.size(); i++) {

					name=Elname.select("span:nth-child(2)").get(i).text();
					System.out.println("name:"+name);
					url=contents.get(i).attr("href").toString();
					img=contents.select("img").get(i).attr("src");

					if(item.getName().equals("원로그")) {
						index=Elprice_li_1.get(i).text().indexOf(" ");
						System.out.println("price:"+Elprice_li_1.get(i).text().substring(index+1));
						price=Elprice_li_1.get(i).text().substring(index+1);
					}
					else {
						index=Elprice_li_1.get(i).text().indexOf(":");
						System.out.println("price:"+Elprice_li_1.get(i).text().substring(index+2));
						price=Elprice_li_1.get(i).text().substring(index+2);
					}
					

					
					//System.out.println("크롤링:"+ name+price+img+path+url);
					list.add(new Parsing(name,price,img,path+url,item.getId()));
					
				}

			}
			/*for(Object object :list) {
				System.out.println("list"+object);
			}*/
			dao.add(list);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

/*	@Override
	public List<Product> list(int shoppingmallId,Pager pager) {
		int total=dao.total(pager,shoppingmallId);
		pager.setTotal(total);
		System.out.println("service:"+total);
		return dao.list(shoppingmallId,pager);
	}

	@Override
	public List<Product> allList(Pager pager) {
		int total=dao.allTotal(pager);
		pager.setTotal(total);
		return dao.allList(pager);
	}*/

	@Override
	public List<Product> list(int shoppingmallId, Pager pager, String userId) {
		int total=dao.total(pager,shoppingmallId);
		pager.setTotal(total);
		System.out.println("service:"+total);
		return dao.list(shoppingmallId,pager,userId);
	}

	@Override
	public List<Product> allList(Pager pager, String userId) {
		int total=dao.allTotal(pager);
		pager.setTotal(total);
		return dao.allList(pager,userId);
	}

	@Override
	public List<Product> likeProduct(Pager pager, String userId) {
		int total=dao.likeTotal(pager);
		pager.setTotal(total);
		return dao.likeProduct(pager,userId);
	}



}
