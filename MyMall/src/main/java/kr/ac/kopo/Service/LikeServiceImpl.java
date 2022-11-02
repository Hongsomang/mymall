

package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.LikeDao;

@Service
public class LikeServiceImpl  implements LikeService{
	@Autowired
	LikeDao dao;
	
	@Override
	public boolean add(int shoppingmallId, String userId) {
		if(dao.add(shoppingmallId,userId)>0) {
			return true;
		}
		
		
		return false;
	}

	@Override
	public boolean delete(int productId, String userId) {
		if(dao.delete(productId,userId)>0) {
			return true;
		}
		return false;
	}

}
