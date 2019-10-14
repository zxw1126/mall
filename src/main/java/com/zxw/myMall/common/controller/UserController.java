package com.zxw.myMall.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.common.bean.UserBean;
import com.zxw.myMall.common.service.UserIService;
import com.zxw.myMall.common.util.MD5Util;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserIService userService;

	@ResponseBody
	@RequestMapping("/testName")
	public String testName(UserBean user) {
		System.out.println("测试姓名时获取到的user:" + user);
		String res = userService.testName(user);
		System.out.println("测试姓名时返回到前端的数据res(可以注册是0,不可以注册是1):" + res);
		return res;

	}

	@ResponseBody
	@RequestMapping("/login")
	public String login(UserBean user, String password, String pnum, HttpServletRequest request) {
		user.setPassword(MD5Util.MD5(password));
		user.setPageIndex(-1);
		System.out.println("登录时获取到的user:" + user);
		List<UserBean> list = userService.login(user);
		if (list != null && list.size() <= 0) {// list为空说明密码输入错误,返回0
			return "0";
		}
		if (!pnum.equals(request.getSession().getAttribute("authCode")))
			return "NO";
		String  userInfo = "{\"userName\":\""+list.get(0).getUsername()+"\",\"code\":\""+list.get(0).getCode()+"\",\"password\":\""+list.get(0).getPassword()+"\"}";
		request.getSession().setAttribute("user", userInfo);
		if (list.get(0).getAdmin() != null)
			return "myMall/admin.jsp";
		System.out.println("登录返回到前端的数据res(可以注册是0,不可以注册是1):1");
		return "myMall/index.jsp";
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(UserBean user) {
		System.out.println("获取分页时传入的数据时获取到的user:" + user);
		return userService.getCount(user);
	}

	@ResponseBody
	@RequestMapping("/showData")
	public List<UserBean> showData(UserBean user, String code, String username) {
		user.setCode("%" + code + "%");
		user.setUsername("%" + username + "%");
		System.out.println("显示数据时传入的数据时获取到的user:" + user);
		List<UserBean> list = userService.showData(user);
		return list;
	}

	@ResponseBody
	@RequestMapping("/addUser")
	public int addUser(UserBean user, String password) {
		user.setPassword(MD5Util.MD5(password));
		System.out.println("添加用户时传入的数据时获取到的user:" + user);
		return userService.addUser(user);
	}

	@ResponseBody
	@RequestMapping("/resetPwd")
	public int resetPwd(UserBean user, String password) {
		user.setPassword(MD5Util.MD5(password));
		System.out.println("重置密码时传入的数据时获取到的user:" + user);
		return userService.update(user);
	}

	@ResponseBody
	@RequestMapping("/echo")
	public UserBean echo(String code) {
		System.out.println("回显用户时传入的数据时获取到的code:" + code);
		return userService.echo(code);
	}

	@ResponseBody
	@RequestMapping("/update")
	public int update(UserBean user) {
		System.out.println("确定更改时传入的数据时获取到的user:" + user);
		return userService.update(user);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(UserBean user) {
		System.out.println("确定更改时传入的数据时获取到的user:" + user);
		return userService.delete(user);
	}

}
