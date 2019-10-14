package com.zxw.myMall.common.mapper;

import java.util.List;

import com.zxw.myMall.common.bean.UserBean;

public interface UserIMapper {
	int insert(UserBean user);

	int delete(Object id);

	int deleteModel(UserBean user);

	int update(UserBean user);

	int updateActive(UserBean user);

	UserBean selectCode(String code);

	List<UserBean> selectLogin(UserBean user);

	List<UserBean> selectModel(UserBean user);

	int selectCount(UserBean user);
}
