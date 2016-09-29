package org.dongtian.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.dongtian.sys.entity.User;
import org.dongtian.sys.mapper.UserMapper;
import org.dongtian.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月31日 下午2:55:34
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User login(String userName) {
		return userMapper.login(userName);
	}

	public List<User> findUserList(String userName,String nickName,String email,String mobile,Date startTime,Date endTime) {
		return this.userMapper.findUserList(userName,nickName,email,mobile,startTime,endTime);
	}

	public int findUserCount(String userName,String nickName,String email,String mobile,Date startTime,Date endTime) {
		Integer userCount = this.userMapper.findUserCount(userName,nickName,email,mobile,startTime,endTime);
		return  userCount== null? 0:userCount;
	}

	public boolean checkUserName(String userName, Integer userId) {
		User user = this.userMapper.checkUserName(userName);
		if(user == null){
			return true;
		} else {
			
			if(user.getUserId() == userId) {
				return true;
			} else {
				return false;
			}
		}
	}

	public boolean checkNickName(String nickName, Integer userId) {
		User user = this.userMapper.checkNickName(nickName);
		if(user == null){
			return true;
		} else {
			
			if(user.getUserId() == userId) {
				return true;
			} else {
				return false;
			}
		}
	}

	public boolean checkEmail(String email, Integer userId) {
		User user = this.userMapper.checkEmail(email);
		if(user == null){
			return true;
		} else {
			
			if(user.getUserId() == userId) {
				return true;
			} else {
				return false;
			}
		}
	}

	
	public boolean checkMobile(String mobile, Integer userId) {
		User user = this.userMapper.checkMobile(mobile);
		if(user == null){
			return true;
		} else {
			
			if(user.getUserId() == userId) {
				return true;
			} else {
				return false;
			}
		}
	}

	/***
	 * 新增用户
	 */
	public void addUser(User user) {
		this.userMapper.addUser(user);
	}

	public User findUserByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return this.userMapper.findUserByUserId(userId);
	}

	public void updateUser(User user) {
		
		this.userMapper.updateUser(user);
		
	}

	public void deleteUserByUserId(Integer userId) {
		this.userMapper.deleteUserByUserId(userId);
	}
}
