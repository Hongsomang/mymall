package kr.ac.kopo.Service;

import kr.ac.kopo.Model.User;

public interface UserService {

	void signup(User user);

	boolean login(User user);

	boolean checkId(String id);

}
