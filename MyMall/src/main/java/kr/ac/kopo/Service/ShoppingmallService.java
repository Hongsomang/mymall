package kr.ac.kopo.Service;

import java.util.List;

import kr.ac.kopo.Model.Shoppingmall;

public interface ShoppingmallService {

	List<Shoppingmall> list();

	void add(Shoppingmall item);

}
