package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Shoppingmall;
import kr.ac.kopo.Model.User;

public interface ShoppingmallDao {

	List<Shoppingmall> list(Pager pager, String userId);

	void add(Shoppingmall item);

	void delete(int id);

	Shoppingmall item(int id);

	void update(Shoppingmall item);





}
