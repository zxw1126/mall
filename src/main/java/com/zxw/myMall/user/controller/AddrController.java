package com.zxw.myMall.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.user.bean.AddressBean;
import com.zxw.myMall.user.service.AddrIService;

@Controller
@RequestMapping("/addr")
public class AddrController {

	@Autowired
	private AddrIService addrService;

	@ResponseBody
	@RequestMapping("/testNumber")
	public String testName(AddressBean addr) {
		System.out.println("测试地址数量时获取到的user:" + addr);
		List<AddressBean> list = addrService.testNumber(addr);
		if(list.size()>7) {
			return "0";
		}
		return "1";
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(AddressBean addr) {
		return addrService.getCount(addr);

	}
	
	@ResponseBody
	@RequestMapping("/showData")
	public List<AddressBean> showData(AddressBean addr) {
		System.out.println("显示地址数据时获取到的user:" + addr);
		return addrService.showData(addr);
		
	}
	
	@ResponseBody
	@RequestMapping("/addAddr")
	public int addAddr(AddressBean addr,String addrCode) {
		
		System.out.println("增加地址时获取到的addr:" + addr);
		AddressBean addr1 = new AddressBean();
		addr1.setUserCode(addr.getUserCode());
		List<AddressBean> list = addrService.showData(addr1);
		if(list.size()>5) {
			return 3;
		}
		return addrService.addAddr(addr);		
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(AddressBean addr) {
		System.out.println("显示地址数据时获取到的user:" + addr);
		return addrService.delete(addr);		
	}
	
}
