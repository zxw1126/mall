package com.zxw.myMall.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.common.bean.UserBean;
import com.zxw.myMall.common.mapper.UserIMapper;
import com.zxw.myMall.common.service.UserIService;

@Service
public class UserServiceImpl implements UserIService {

	@Autowired
	private UserIMapper userMapper;
	
	public String testName(UserBean user) {
		List<UserBean> list =  userMapper.selectModel(user);
		if(list!=null&&list.size()<=0) {//用户名可以注册,返回0
			return "0";
		}
		return "1";//,返回1
	}

	@Override
	public List<UserBean> login(UserBean user) {
		return userMapper.selectModel(user);	
	}

	@Override
	public int getCount(UserBean user) {
		return userMapper.selectCount(user);
	}

	@Override
	public List<UserBean> showData(UserBean user) {		
		return userMapper.selectModel(user);
	}

	@Override
	public int addUser(UserBean user) {
		return userMapper.insert(user);
	}

	@Override
	public String resetPwd(UserBean user) {
		return null;
	}

	@Override
	public UserBean echo(String code) {
		return userMapper.selectCode(code);
	}

	@Override
	public int update(UserBean user) {
		return userMapper.updateActive(user);
	}

	@Override
	public int delete(UserBean user) {
		return userMapper.delete(user.getId());
	}

}
