package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;

public interface ShoppingmallDao {

	List<Shoppingmall> list(Pager pager);

	void add(Shoppingmall item);

	

}
