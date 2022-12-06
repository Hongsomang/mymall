package kr.ac.kopo.Service;

import java.util.List;

import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Pager.Pager;

public interface ProductService {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(Shoppingmall item);

	List<Product> list(Pager pager);

	

	List<Product> likeProduct(Pager pager);

	Product total(Pager pager);

	

	void directAdd(Product item);

	Product item(int shoppingmallId, int id);

	void update(Product item);

	void itemDelete(int id, int shoppingmallId);



}
