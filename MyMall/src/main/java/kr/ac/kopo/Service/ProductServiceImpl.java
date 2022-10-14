package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ProductDao;
import kr.ac.kopo.Model.Shoppingmall;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	
	@Override
	public int count(int shoppingmallId) {
		// TODO Auto-generated method stub
		return dao.count(shoppingmallId);
	}

	@Override
	public void delete(int shoppingmallId) {
		// TODO Auto-generated method stub
		dao.delete(shoppingmallId);
	}

	@Override
	public void add(Shoppingmall item) {
		// TODO Auto-generated method stub
		
	}



}
