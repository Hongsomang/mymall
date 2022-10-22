package kr.ac.kopo.Service;

import java.util.List;

import kr.ac.kopo.Model.Product;
import kr.ac.kopo.Model.Shoppingmall;

public interface ProductService {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(Shoppingmall item);

	List<Product> list(int shoppingmallId);

	

}
