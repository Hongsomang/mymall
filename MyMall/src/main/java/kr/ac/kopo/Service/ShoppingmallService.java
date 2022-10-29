package kr.ac.kopo.Service;

import java.util.List;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;

public interface ShoppingmallService {

	List<Shoppingmall> list(Pager pager);

	void add(Shoppingmall item);

	void delete(int id);

	Shoppingmall item(int id);

	void update(Shoppingmall item);

	

	



}
