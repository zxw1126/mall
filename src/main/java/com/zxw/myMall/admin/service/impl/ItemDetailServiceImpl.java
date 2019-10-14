package com.zxw.myMall.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.admin.bean.ItemBean;
import com.zxw.myMall.admin.bean.ItemDetailBean;
import com.zxw.myMall.admin.mapper.ItemDetailIMapper;
import com.zxw.myMall.admin.mapper.ItemIMapper;
import com.zxw.myMall.admin.service.ItemDetailIService;

@Service
public class ItemDetailServiceImpl implements ItemDetailIService {

	@Autowired
	private ItemDetailIMapper itemDetailMapper;
	@Autowired
	private ItemIMapper itemMapper;

	@Override
	public List<ItemDetailBean> testCode(ItemDetailBean itemDetail) {
		return itemDetailMapper.selectModel(itemDetail);
	}

	@Override
	public int getCount(ItemDetailBean itemDetail) {

		return itemDetailMapper.selectCount(itemDetail);
	}

	@Override
	public List<ItemBean> getParentCode(ItemBean itemDetail) {
		return itemMapper.selectModel(itemDetail);
	}

	@Override
	public List<ItemDetailBean> showData(ItemDetailBean itemDetail) {
		return itemDetailMapper.selectModel(itemDetail);
	}

	@Override
	public List<ItemDetailBean> echo(ItemDetailBean itemDetail) {
		return itemDetailMapper.selectModel(itemDetail);
	}

	@Override
	public int addItemDetail(ItemDetailBean itemDetail) {
		return itemDetailMapper.insert(itemDetail);
	}

	@Override
	public int update(ItemDetailBean itemDetail) {
		return itemDetailMapper.update(itemDetail);
	}

	@Override
	public int delete(String id) {
		return itemDetailMapper.delete(id);
	}
}
