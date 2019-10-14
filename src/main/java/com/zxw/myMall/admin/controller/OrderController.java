package com.zxw.myMall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.admin.bean.OrderBean;
import com.zxw.myMall.admin.service.OrderIService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderIService orderService;

	@ResponseBody
	@RequestMapping("/testCode")
	public int testCode(OrderBean order) {
		System.out.println("获取分页时传入的数据时获取到的order:" + order);
		List<OrderBean> list = orderService.testCode(order);
		if (list != null && list.size() <= 0) {// 可以注册
			return 0;
		}
		return 1;
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(OrderBean order) {
		System.out.println("获取分页时传入的数据时获取到的user:" + order);
		return orderService.getCount(order);
	}
	
	@ResponseBody
	@RequestMapping("/showData")
	public List<OrderBean> showData(OrderBean order, String code, String descr) {
		order.setCode("%" + code + "%");
//		order.setDescr("%" + descr + "%");
		System.out.println("显示数据时传入的数据时获取到的user:" + order);
		List<OrderBean> list = orderService.showData(order);
		return list;
	}

	@ResponseBody
	@RequestMapping("/addOrder")
	public int addOrder(OrderBean order, String parentCodeOne, String parentCodeTwo) {
//		System.out.println("添加商品分类时获得的商品码和商品父级码:one:" + parentCodeOne + ",Two:" + parentCodeTwo);
//		if (parentCodeTwo == null || parentCodeTwo.equals("") || parentCodeTwo.equals("xxxx"))
//			item.setParentCode("xxxx");
//		else
//			item.setParentCode(parentCodeTwo);
		System.out.println("添加商品分类时传入的数据时获取到的user:" + order);
		return orderService.addOrder(order);
	}

	@ResponseBody
	@RequestMapping("/echo")
	public List<OrderBean> echo(OrderBean order) {
		System.out.println("回显商品分类时传入的数据时获取到的item:" + order);
		return orderService.echo(order);
	}


	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderBean order) {
		System.out.println("确定更改时传入的数据时获取到的user:" + order);
		return orderService.update(order);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderBean order) {
		System.out.println("确定删除时传入的数据时获取到的user:" + order);
		return orderService.delete(String.valueOf(order.getId()));
	}
}
