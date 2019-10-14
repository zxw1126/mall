package com.zxw.myMall.admin.service;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemBean;
import com.zxw.myMall.admin.bean.ItemDetailBean;

public interface ItemDetailIService {

	List<ItemDetailBean> testCode(ItemDetailBean itemDetail);

	int getCount(ItemDetailBean itemDetail);

	List<ItemBean> getParentCode(ItemBean itemDetail);

	List<ItemDetailBean> showData(ItemDetailBean itemDetail);

	List<ItemDetailBean> echo(ItemDetailBean itemDetail);

	int addItemDetail(ItemDetailBean itemDetail);

	int update(ItemDetailBean itemDetail);

	int delete(String valueOf);

}
