package com.zxw.myMall.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.admin.bean.ItemBean;
import com.zxw.myMall.admin.mapper.ItemIMapper;
import com.zxw.myMall.admin.service.ItemIService;

@Service
public class ItemServiceImpl implements ItemIService {

	@Autowired
	private ItemIMapper itemMapper;
	@Override
	public int getCount(ItemBean item) {		
		return itemMapper.selectCount(item);
	}

	@Override
	public List<ItemBean> showData(ItemBean item) {
		
		return itemMapper.selectModel(item);
	}

	@Override
	public int addItem(ItemBean item) {
		return itemMapper.insert(item);
	}

	@Override
	public List<ItemBean> echo(ItemBean item) {
		return itemMapper.selectModel(item);
	}

	@Override
	public int update(ItemBean item) {
		return itemMapper.updateActive(item);
	}

	@Override
	public int delete(String id) {
		return itemMapper.delete(id);
	}

	@Override
	public List<ItemBean> getParentCode(ItemBean item) {
		return itemMapper.selectModel(item);
	}

	@Override
	public List<ItemBean> testCode(ItemBean item) {		
		return itemMapper.selectModel(item);
	}

	@Override
	public List<ItemBean> getProvinceCode(ItemBean item) {
		return itemMapper.selectModel(item);
	}

	@Override
	public List<ItemBean> getCityCode(ItemBean item) {
		return itemMapper.selectModel(item);
	}

	@Override
	public List<ItemBean> getDistrictCode(ItemBean item) {
		return itemMapper.selectModel(item);
	}

	@Override
	public List<ItemBean> getPostCode(ItemBean item) {
		return itemMapper.selectModel(item);
	}

}
