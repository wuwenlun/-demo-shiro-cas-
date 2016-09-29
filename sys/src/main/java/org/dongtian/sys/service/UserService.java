package org.dongtian.sys.service;

import java.util.Date;
import java.util.List;

import org.dongtian.sys.entity.User;

public interface UserService {
	/***
	 * 根据用户名登录
	 * @param userName用户名
	 * @return
	 */
	User login(String userName);
	/***
	 * 查询用户列表
	 * @param user
	 * @return
	 */
	List<User> findUserList(String userName,String nickName,String email,String mobile,Date startTime,Date endTime);
	/***
	 * 
	 * @param user
	 * @return
	 */
	int findUserCount(String userName,String nickName,String email,String mobile,Date startTime,Date endTime);
	
	/***
	 * 检查用户名是否存在
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:02:33
	 * @param userName
	 * @param userId
	 * @return
	 */
	boolean checkUserName(String userName,Integer userId);
	
	/***
	 * 检查昵称是否存在
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:03:28
	 * @param nickName
	 * @param userId
	 * @return
	 */
	boolean checkNickName(String nickName,Integer userId);
	
	/***
	 * 
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:04:12
	 * @param email
	 * @param userId
	 * @return
	 */
	boolean checkEmail(String email,Integer userId);
	
	/***
	 * 检查手机号码是否为空
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:05:31
	 * @param mobile
	 * @param userId
	 * @return
	 */
	boolean checkMobile(String mobile,Integer userId);
	/***
	 * 新建
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午5:48:28
	 * @param user
	 */
	void addUser(User user);
	/***
	 * 根据用户id获取用户信息
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午1:42:08
	 * @param userId
	 * @return
	 */
	User findUserByUserId(Integer userId);
	/***
	 * 修改用户
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午10:10:56
	 * @param user
	 */
	void updateUser(User user);
	/***
	 * 删除用户
	 * @author gaoyuandong
	 * @date   2015年9月18日 下午2:53:51
	 * @param userId
	 */
	void deleteUserByUserId(Integer userId);

}
