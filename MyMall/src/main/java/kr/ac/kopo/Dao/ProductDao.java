package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Pager;
import kr.ac.kopo.Model.Parsing;
import kr.ac.kopo.Model.Product;

public interface ProductDao {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(List<Parsing> list);

	List<Product> list(int shoppingmallId,Pager pager);

	int total(Pager pager,int shoppingmallId);

	int allTotal(Pager pager);

	List<Product> allList(Pager pager);

}
