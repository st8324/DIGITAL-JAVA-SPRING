package kr.green.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.UserDao;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public String getPw(String id) {
		return userDao.getPw(id);
	}

	@Override
	public int getCount() {
		return userDao.getCount();
	}
	
}
