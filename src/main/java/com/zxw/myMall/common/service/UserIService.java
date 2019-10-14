package com.zxw.myMall.common.service;

import java.util.List;

import com.zxw.myMall.common.bean.UserBean;

public interface UserIService {

	String testName(UserBean user);

	List<UserBean> login(UserBean user);

	int getCount(UserBean user);
 
	List<UserBean> showData(UserBean user);

	int addUser(UserBean user);

	String resetPwd(UserBean user);

	UserBean echo(String code);

	int update(UserBean user);

	int delete(UserBean user);

}
