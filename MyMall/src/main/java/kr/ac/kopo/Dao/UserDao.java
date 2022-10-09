package kr.ac.kopo.Dao;

import kr.ac.kopo.Model.User;

public interface UserDao {

	void signup(User user);

	User login(User user);

}
