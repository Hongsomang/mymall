package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.Model.Parsing;

public interface ProductDao {

	int count(int shoppingmallId);

	void delete(int shoppingmallId);

	void add(List<Parsing> list);

}
