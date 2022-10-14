package kr.ac.kopo;

import java.io.IOException;
import java.util.ArrayList;
//import java.util.Arrays;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class ParsingServiceImpl  implements ParsingService{

	private static int bestCode=101;
	private static String path="https://withyoon.com";
	private Product product;
	
	@Override
	public void getParsing()  {
		// TODO Auto-generated method stub
		List<Product> list=new ArrayList();
		try {
			Document doc=Jsoup.connect(path+"/product/list.html?cate_no="+bestCode).get();
			Elements contents =doc.select("ul[class=prdList grid4]").select(".name > a");
			Elements Elprice =doc.select("ul[class=prdList grid4]").select("div > ul ");
			Elements Elprice_li_1=Elprice.select("li:nth-child(2)");
			Elements Elprice_li_2=Elprice.select("li:nth-child(1)");
			//System.out.println(Elprice_li_1.text());
			
			//System.out.println(contents.select(".name a span ").get(2).text());
			
			int index=0;
			for(int i = 0; i < contents.size(); i++) {
				//url
				//System.out.println("url: "+contents.get(i).attr("href"));
				//System.out.println("제목:"+contents.select("span:nth-child(2)").get(i).text()); 
				//System.out.println(i);
				//System.out.println(Elprice.get(i).text());
				if(Elprice_li_1.get(i).text().equals(":")) {
					index=Elprice_li_2.get(i).text().indexOf(":");
					System.out.println(Elprice_li_2.get(i).text().substring(index+2));
					System.out.println(Elprice_li_2.get(i).text());
					
				}else {
					index=Elprice_li_1.get(i).text().indexOf(":");
					System.out.println(Elprice_li_1.get(i).text().substring(index+2));
					System.out.println(Elprice_li_1.get(i).text());
				}
				
			}
		
			System.out.println(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
