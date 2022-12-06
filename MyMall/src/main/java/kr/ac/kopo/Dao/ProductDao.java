package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Crawling;
import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Pager.Pager;

public interface ProductDao {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(List<Crawling> list);

	

	int total(Pager pager);

	

	

	List<Product> likeProduct(Pager pager);

	int likeTotal(Pager pager);

	

	void directAdd(Product item);

	Product item(Product item);

	void update(Product item);

	void itemDelete(int id);

	List<Product> list(Pager pager);

	

	

}
