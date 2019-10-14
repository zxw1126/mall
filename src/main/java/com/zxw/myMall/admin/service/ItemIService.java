package com.zxw.myMall.admin.service;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemBean;

public interface ItemIService {

	int getCount(ItemBean item);

	List<ItemBean> showData(ItemBean item);

	int addItem(ItemBean item);

	List<ItemBean> echo(ItemBean item);

	int update(ItemBean item);

	int delete(String id);

	List<ItemBean> getParentCode(ItemBean item);

	List<ItemBean> testCode(ItemBean item);

	List<ItemBean> getProvinceCode(ItemBean item);

	List<ItemBean> getCityCode(ItemBean item);

	List<ItemBean> getDistrictCode(ItemBean item);

	List<ItemBean> getPostCode(ItemBean item);

}
