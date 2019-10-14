package com.zxw.myMall.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.admin.bean.ItemImgBean;
import com.zxw.myMall.admin.mapper.ItemImgIMapper;
import com.zxw.myMall.admin.service.ItemImgIService;

@Service
public class ItemImgServiceImpl implements ItemImgIService {

	@Autowired
	private ItemImgIMapper imgMapper;
	
	@Override
	public List<ItemImgBean> showData(ItemImgBean img) {	
		return imgMapper.selectModel(img);
	}

	@Override
	public int getCount(ItemImgBean img) {
		return imgMapper.selectCount(img);
	}

	@Override
	public int insert(ItemImgBean img) {
		return imgMapper.insert(img);
	}

	@Override
	public int setMain(ItemImgBean img) {		
		return imgMapper.update(img);
	}

	@Override
	public int setMainTwo(ItemImgBean img) {
		return imgMapper.updateActive(img);
	}

	@Override
	public int delete(ItemImgBean img) {
		return imgMapper.delete(img.getId());
	}

	@Override
	public List<ItemImgBean> showDataTwo(ItemImgBean img) {
		return imgMapper.selectAll(img);
	}

	@Override
	public List<ItemImgBean> userImgView(ItemImgBean img) {
		return imgMapper.selectModel(img);
	}

	@Override
	public ItemImgBean findImg(ItemImgBean img) {
		return imgMapper.selectAll(img).get(0);
	}

	@Override
	public List<ItemImgBean> showItemDetailImg(ItemImgBean img) {
		return imgMapper.selectId(img);
	}
	

}
