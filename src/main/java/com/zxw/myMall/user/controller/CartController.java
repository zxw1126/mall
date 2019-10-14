package com.zxw.myMall.user.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.admin.bean.ItemDetailBean;
import com.zxw.myMall.admin.service.ItemDetailIService;
import com.zxw.myMall.user.bean.CartBean;
import com.zxw.myMall.user.service.CartIService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartIService cartService;

	@Autowired
	private ItemDetailIService itemDetailService;
	@ResponseBody
	@RequestMapping("/testCode")
	public String testCode(CartBean cart) {
		System.out.println("测试商品信息时数量时获取到的user:" + cart);
		List<CartBean> list = cartService.testCode(cart);
		if(list.size()>7) {
			return "0";
		}
		return "1";
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(CartBean cart) {
		return cartService.getCount(cart);

	}
	
	@ResponseBody
	@RequestMapping("/showData")
	public List<CartBean> showData(CartBean cart) {
		System.out.println("显示购物车数据时获取到的user:" + cart);
		List<CartBean> list = cartService.showData(cart);
		if(list!=null&&list.size()>0) {
			ItemDetailBean item = new ItemDetailBean();
			for(int i =0;i<list.size();i++) {
				item.setCode(list.get(i).getItemDetailCode());
				List<ItemDetailBean> itemList = itemDetailService.showData(item);
				list.get(i).setName(itemList.get(0).getName());
			}
		}
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/addCart")
	public int addAddr(CartBean cart,String number) {
		System.out.println("添加购物车功能时收到的cart:"+cart);
		cart.setNumber(new BigDecimal(0));
		List<CartBean> list = cartService.showData(cart);
		if(list!=null&&list.size()<=0) {
			cart.setNumber(new BigDecimal(Integer.parseInt(number)));
			return cartService.addCart(cart);
		}else {
			BigDecimal number1 = list.get(0).getNumber();
			number1.add(new BigDecimal(Integer.parseInt(number)));
			return cartService.updateCart(cart);
		}				
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(CartBean cart) {
		System.out.println("删除购物车时获取到的user:" + cart);
		return cartService.delete(cart);		
	}
	
	@ResponseBody
	@RequestMapping("/updateNum")
	public int updateNum(CartBean cart) {
		System.out.println("修改购物车数量时获取到的user:" + cart);
		return cartService.updateNum(cart);		
	}
	
}
