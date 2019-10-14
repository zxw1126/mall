package com.zxw.myMall.user.mapper;

import java.util.List;

import com.zxw.myMall.user.bean.AddressBean;

public interface AddrIMapper {

	int insert(AddressBean addr);

	int delete(Object id);

	int deleteModel(AddressBean addr);

	int update(AddressBean addr);

	int updateActive(AddressBean addr);

	AddressBean selectCode(String code);

	List<AddressBean> selectLogin(AddressBean addr);

	List<AddressBean> selectModel(AddressBean addr);

	int selectCount(AddressBean addr);
}
