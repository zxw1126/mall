package com.zxw.myMall.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.user.bean.AddressBean;
import com.zxw.myMall.user.mapper.AddrIMapper;
import com.zxw.myMall.user.service.AddrIService;

@Service
public class AddrServiceImpl implements AddrIService {

	@Autowired
	private AddrIMapper addrMapper;
	@Override
	public List<AddressBean> testNumber(AddressBean addr) {
		return addrMapper.selectModel(addr);
	}
	@Override
	public int getCount(AddressBean addr) {
		return addrMapper.selectCount(addr);
	}
	@Override
	public List<AddressBean> showData(AddressBean addr) {
		return addrMapper.selectModel(addr);
	}
	@Override
	public int addAddr(AddressBean addr) {
		return addrMapper.insert(addr);
	}
	@Override
	public int delete(AddressBean addr) {
		return addrMapper.delete(addr.getId());
	}

}
