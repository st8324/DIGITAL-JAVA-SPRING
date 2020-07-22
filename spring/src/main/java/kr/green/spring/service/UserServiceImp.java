package kr.green.spring.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.UserDao;
import kr.green.spring.vo.UserVo;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Override
	public boolean signup(UserVo user) {
		if(user == null)	return false;
		if(user.getId() == null || user.getId().length() == 0)	
			return false;
		if(user.getPw() == null || user.getPw().length() == 0)	
			return false;
		if(user.getEmail() == null || user.getEmail().length() == 0)	
			return false;
		if(user.getGender() == null) 
			user.setGender("male");
		if(!user.getGender().equals("male") 
			&& !user.getGender().equals("female") )	return false;
		//아이디 있는 경우
		if(userDao.getUser(user.getId())!=null)
			return false;
		//비밀번호 암호화
		String encodePw = passwordEncoder.encode(user.getPw());
		user.setPw(encodePw);
		
		//회원가입 진행
		userDao.insertUser(user);
		
		return true;
	}
	@Override
	public UserVo isSignin(UserVo user) {
		UserVo dbUser = userDao.getUser(user.getId());
		if(dbUser != null && passwordEncoder.matches(user.getPw(), dbUser.getPw()))
			return dbUser;
		return null;
	}
	@Override
	public UserVo getUser(HttpServletRequest request) {
		return (UserVo)request.getSession().getAttribute("user");
	}
	@Override
	public UserVo getUser(String id) {
		return userDao.getUser(id);
	}
	
}
