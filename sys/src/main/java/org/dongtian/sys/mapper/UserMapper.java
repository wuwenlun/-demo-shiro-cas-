package org.dongtian.sys.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dongtian.sys.entity.Menu;
import org.dongtian.sys.entity.User;

/**
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午7:44:00
 */
public interface UserMapper {
	
	/***
	 * 根据用户登录
	 * @param userName 用户名
	 * @return
	 */
	public User login(String userName);

	/***
	 * 
	 * @param user
	 * @return
	 */
	public List<User> findUserList(@Param("userName")String userName,@Param("nickName")String nickName,@Param("email")String email,@Param("mobile")String mobile,@Param("startTime")Date startTime,@Param("endTime")Date endTime);

	/***
	 * 
	 * @param user
	 * @return
	 */
	public Integer findUserCount(@Param("userName")String userName,@Param("nickName")String nickName,@Param("email")String email,@Param("mobile")String mobile,@Param("startTime")Date startTime,@Param("endTime")Date endTime);

	/***
	 * 检查用户名是否存在
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:12:40
	 * @param userName
	 * @return
	 */
	public User checkUserName(@Param("userName")String userName);
	/***
	 * 检查昵称是否存在
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:03:28
	 * @param nickName
	 * @param userId
	 * @return
	 */
	User checkNickName(String nickName);
	
	/***
	 * 
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:04:12
	 * @param email
	 * @param userId
	 * @return
	 */
	User checkEmail(String email);
	
	/***
	 * 检查手机号码是否为空
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:05:31
	 * @param mobile
	 * @param userId
	 * @return
	 */
	User checkMobile(String mobile);
	/**
	 * 新增用户
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午5:50:13
	 * @param user
	 */
	public void addUser(User user);

	/**
	 * 根据主键获取用户信息
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午1:47:13
	 * @param userId
	 * @return
	 */
	public User findUserByUserId(Integer userId);

	/***
	 * 更新用户
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午10:11:48
	 * @param user
	 */
	public void updateUser(User user);

	public void deleteUserByUserId(Integer userId);
	
	
	


}
