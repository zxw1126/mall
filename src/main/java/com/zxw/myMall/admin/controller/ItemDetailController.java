package com.zxw.myMall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.admin.bean.ItemBean;
import com.zxw.myMall.admin.bean.ItemDetailBean;
import com.zxw.myMall.admin.service.ItemDetailIService;

@Controller
@RequestMapping("/itemDetail")
public class ItemDetailController {


	@Autowired
	private ItemDetailIService itemDtailService;

	@ResponseBody
	@RequestMapping("/testCode")
	public int testCode(ItemDetailBean itemDetail) {
		System.out.println("获取分页时传入的数据时获取到的user:" + itemDetail);
		List<ItemDetailBean> list = itemDtailService.testCode(itemDetail);
		if (list != null && list.size() <= 0) {// 可以注册
			return 0;
		}
		return 1;
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(ItemDetailBean itemDetail) {
		System.out.println("获取分页时传入的数据时获取到的user:" + itemDetail);
		return itemDtailService.getCount(itemDetail);
	}

	@ResponseBody
	@RequestMapping("/getParentCode")
	public List<ItemBean> getParentCode(ItemBean item) {
		System.out.println("获取分页时传入的数据时获取到的user:" + item);
		return itemDtailService.getParentCode(item);
	}

	@ResponseBody
	@RequestMapping("/showData")
	public List<ItemDetailBean> showData(ItemDetailBean itemDetail, String code, String detail) {
		itemDetail.setCode("%" + code + "%");
		itemDetail.setDetail("%" + detail + "%");
		System.out.println("显示数据时传入的数据时获取到的user:" + itemDetail);
		List<ItemDetailBean> list = itemDtailService.showData(itemDetail);
		return list;
	}

	@ResponseBody
	@RequestMapping("/addItemDetail")
	public int addItemDetail(ItemDetailBean itemDetail,String parentCodeOne,String parentCodeTwo,String parentCodeThree) {
		if(parentCodeOne.equals("xxxx"))
			return 3;//未选择分类,返回3
		itemDetail.setItemCode(parentCodeThree);
		System.out.println("添加详细商品传入的数据时获取到的user:" + itemDetail);
		return itemDtailService.addItemDetail(itemDetail);
	}

	@ResponseBody
	@RequestMapping("/echo")
	public List<ItemDetailBean> echo(ItemDetailBean itemDetail) {
		System.out.println("回显商品分类时传入的数据时获取到的item:" + itemDetail);
		return itemDtailService.echo(itemDetail);
	}


	@ResponseBody
	@RequestMapping("/update")
	public int update(ItemDetailBean itemDetail,String parentCodeTwo) {
		itemDetail.setItemCode(parentCodeTwo);
		System.out.println("确定更改时传入的数据时获取到的user:" + itemDetail);
		return itemDtailService.update(itemDetail);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(ItemDetailBean itemDetail) {
		System.out.println("确定删除时传入的数据时获取到的user:" + itemDetail);
		return itemDtailService.delete(String.valueOf(itemDetail.getId()));
	}
	
	@ResponseBody
	@RequestMapping("/showItemDetail")
	public List<ItemDetailBean> showItemDetail(ItemDetailBean itemDetail) {
		return itemDtailService.showData(itemDetail);
	}
}
