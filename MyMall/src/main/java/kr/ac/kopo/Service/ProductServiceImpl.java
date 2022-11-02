package kr.ac.kopo.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ProductDao;
import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Parsing;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Override
	public int count(int shoppingmallId) {
		// TODO Auto-generated method stub
		return dao.count(shoppingmallId);
	}

	@Override
	public void delete(int shoppingmallId) {
		// TODO Auto-generated method stub
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

				Elements contents =doc.select("ul[class=prdList grid4]").select("div[class=prdImg] > a");
				Elements Elprice =doc.select("ul[class=prdList grid4]").select("div > ul ");
				Elements Elprice_li_1=Elprice.select("li:nth-child(1)");
				Elements Elprice_li_2=Elprice.select("li:nth-child(2)");


				int index=0;
				String name;
				String url;
				String img;
				String price;

				for(int i = 0; i < contents.size(); i++) {

					name=contents.select("img").get(i).attr("alt");
					url=contents.get(i).attr("href").toString();
					img=contents.select("img").get(i).attr("src");

					if(Elprice_li_2.get(i).text().equals(":")) {
						index=Elprice_li_1.get(i).text().indexOf(":");
						price=Elprice_li_1.get(i).text().substring(index+2);


					}else {
						index=Elprice_li_2.get(i).text().indexOf(":");
						price=Elprice_li_2.get(i).text().substring(index+2);
					}
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



}
