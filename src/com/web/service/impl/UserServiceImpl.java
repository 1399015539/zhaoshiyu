package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.UserDao;
import com.web.entity.User;
import com.web.service.UserService;
/**
 * user用户serviceimpl
 * @author llq
 *
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.findByUsername(username);
	}

	@Override
	public int add(User user) {
		// TODO Auto-generated method stub
		return userDao.add(user);
	}

	@Override
	public int edit(User user) {
		// TODO Auto-generated method stub
		return userDao.edit(user);
	}

	@Override
	public int delete(String ids) {
		// TODO Auto-generated method stub
		return userDao.delete(ids);
	}

	@Override
	public List<User> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return userDao.findList(queryMap);
	}

	@Override
	public int getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return userDao.getTotal(queryMap);
	}

	@Override
	public int editPassword(User user) {
		// TODO Auto-generated method stub
		return userDao.editPassword(user);
	}

}
