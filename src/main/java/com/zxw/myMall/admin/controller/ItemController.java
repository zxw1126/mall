package com.zxw.myMall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.admin.bean.ItemBean;
import com.zxw.myMall.admin.service.ItemIService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemIService itemService;

	@ResponseBody
	@RequestMapping("/testCode")
	public int testCode(ItemBean item) {
		System.out.println("获取分页时传入的数据时获取到的user:" + item);
		List<ItemBean> list = itemService.testCode(item);
		if (list != null && list.size() <= 0) {// 可以注册
			return 0;
		}
		return 1;
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(ItemBean item) {
		System.out.println("获取分页时传入的数据时获取到的user:" + item);
		return itemService.getCount(item);
	}

	@ResponseBody
	@RequestMapping("/getParentCode")
	public List<ItemBean> getParentCode(ItemBean item) {
		System.out.println("获取分页时传入的数据时获取到的user:" + item);
		return itemService.getParentCode(item);
	}

	@ResponseBody
	@RequestMapping("/showData")
	public List<ItemBean> showData(ItemBean item, String code, String descr) {
		item.setCode("%" + code + "%");
		item.setDescr("%" + descr + "%");
		System.out.println("显示数据时传入的数据时获取到的user:" + item);
		List<ItemBean> list = itemService.showData(item);
		return list;
	}

	@ResponseBody
	@RequestMapping("/addItem")
	public int addItem(ItemBean item, String parentCodeOne, String parentCodeTwo) {
		System.out.println("添加商品分类时获得的商品码和商品父级码:one:" + parentCodeOne + ",Two:" + parentCodeTwo);
		if (parentCodeTwo == null || parentCodeTwo.equals("") || parentCodeTwo.equals("xxxx"))
			item.setParentCode("xxxx");
		else
			item.setParentCode(parentCodeTwo);
		System.out.println("添加商品分类时传入的数据时获取到的user:" + item);
		return itemService.addItem(item);
	}

	@ResponseBody
	@RequestMapping("/echo")
	public List<ItemBean> echo(ItemBean item) {
		System.out.println("回显商品分类时传入的数据时获取到的item:" + item);
		return itemService.echo(item);
	}


	@ResponseBody
	@RequestMapping("/update")
	public int update(ItemBean item) {
		System.out.println("确定更改时传入的数据时获取到的user:" + item);
		return itemService.update(item);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(ItemBean item) {
		System.out.println("确定删除时传入的数据时获取到的user:" + item);
		return itemService.delete(String.valueOf(item.getId()));
	}
		
	@RequestMapping("/getProvinceCode")
	@ResponseBody
	public List<ItemBean> getProvinceCode(ItemBean item) {
		item.setParentCode("9999");
		item.setPageIndex(-1);
		System.out.println("getProvinceCode时获取到的item:" + item);		
		return itemService.getProvinceCode(item);
	}
	
	
	@RequestMapping("/getCityCode")
	@ResponseBody
	public List<ItemBean> getCityCode(ItemBean item,String parentCode) {
		item.setPageIndex(-1);
		System.out.println("getCityCode时获取到的item:" + item);		
		return itemService.getCityCode(item);
	}
	
	@RequestMapping("/getDistrictCode")
	@ResponseBody
	public List<ItemBean> getDistrictCode(ItemBean item,String parentCode) {
		item.setPageIndex(-1);
		System.out.println("getDistrictCode时获取到的item:" + item);		
		return itemService.getDistrictCode(item);
	}
	
	
	@RequestMapping("/getPostCode")
	@ResponseBody
	public List<ItemBean> getPostCode(ItemBean item,String code) {
		item.setPageIndex(-1);
		System.out.println("getPostCode时获取到的item:" + item);		
		return itemService.getPostCode(item);
	}
	
}
