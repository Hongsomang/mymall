package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Crawling;
import kr.ac.kopo.Model.Product;

public interface ProductDao {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(List<Crawling> list);

	List<Product> list(int shoppingmallId,Pager pager, String userId);

	int total(Pager pager,int shoppingmallId);

	int allTotal(Pager pager);

	List<Product> allList(Pager pager);

	List<Product> likeProduct(Pager pager, String userId);

	int likeTotal(Pager pager);

}
