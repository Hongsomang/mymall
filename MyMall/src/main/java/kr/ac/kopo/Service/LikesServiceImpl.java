

package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.LikesDao;
import kr.ac.kopo.Model.Likes;

@Service
public class LikesServiceImpl  implements LikesService{
	@Autowired
	LikesDao dao;

	@Override
	public boolean add(Likes item) {
		if(dao.add(item)>0) {
			return true;
		}
		
		
		return false;
	}

	@Override
	public boolean delete(Likes item) {
		if(dao.delete(item)>0) {
			return true;
		}
		return false;
	}

}
