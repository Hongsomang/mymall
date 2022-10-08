package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.UserDao;
import kr.ac.kopo.Model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public void signup(User user) {
		// TODO Auto-generated method stub
		dao.signup(user);
	}

}
