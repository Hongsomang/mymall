package kr.ac.kopo.Service;

import kr.ac.kopo.Model.Shoppingmall;

public interface ProductService {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(Shoppingmall item);

	

}
