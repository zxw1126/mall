package com.zxw.myMall.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxw.myMall.admin.bean.ItemDetailBean;
import com.zxw.myMall.admin.bean.ItemImgBean;
import com.zxw.myMall.admin.service.ItemDetailIService;
import com.zxw.myMall.admin.service.ItemImgIService;
import com.zxw.myMall.common.util.Upload;

@Controller
@RequestMapping("/itemImg")
public class ItemImgController {

	@Autowired
	private ItemImgIService imgService;
	
	@Autowired
	private ItemDetailIService itemDetailService;

	@ResponseBody
	@RequestMapping("/showData")
	public List<ItemImgBean> showData(ItemImgBean img) {
		System.out.println("显示图片时收到的img:" + img);
		return imgService.showData(img);
	}

	@ResponseBody
	@RequestMapping("/getCount")
	public int getCount(ItemImgBean img) {
		return imgService.getCount(img);
	}
	
	@ResponseBody
	@RequestMapping("/showDataTwo")
	public List<ItemImgBean> showDataTwo(ItemImgBean img) {
		System.out.println("显示图片时收到的img:" + img);
		return imgService.showDataTwo(img);
	}
	
	@ResponseBody
	@RequestMapping("/showItemDetailImg")
	public List<ItemImgBean> showItemDetailImg(ItemImgBean img) {
		System.out.println("显示图片时收到的img:" + img);
		return imgService.showItemDetailImg(img);
	}
	
	@ResponseBody
	@RequestMapping("/userImgView")
	public List<ItemDetailBean> userImgView(String itemCode) {
		ItemDetailBean itemDetail = new ItemDetailBean();
		itemDetail.setItemCode(itemCode);
		itemDetail.setPageIndex(-1);
		System.out.println("显示图片时收到的itemDetail:" + itemDetail);
		List<ItemDetailBean> list = itemDetailService.showData(itemDetail);
		ItemImgBean img = new ItemImgBean();
		img.setPageIndex(-1);
		for(int i=0;i<list.size();i++) {
			img.setItemDetailCode(list.get(i).getCode());
			list.get(i).setUrl(imgService.findImg(img).getUrl());
		}
		return list;
	}

	@ResponseBody
	@RequestMapping("/addImg")
	public String addImg(ItemImgBean img, HttpServletRequest request) {
		System.out.println("添加图片时收到的img信息:" + img);
		Upload upload = new Upload();
		try {
			@SuppressWarnings("static-access")
			Map<String, Object> upRes = upload.upload(request);
			@SuppressWarnings("unchecked")
			List<Object> list = (List<Object>) upRes.get("list");
			img.setUrl((String) list.get(0));
			img.setType("1");
			return imgService.insert(img) + "";
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("/setMain")
	public int setMain(ItemImgBean img, String itemDetailCode, String url) {
		img.setItemDetailCode(itemDetailCode);
		img.setType("1");
		int res1 = imgService.setMain(img);
		System.out.println("res1:"+res1);
		img.setUrl(url);
		img.setType("2");
		img.setItemDetailCode(null);
		return imgService.setMainTwo(img);
	}
	
	@SuppressWarnings("static-access")
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(ItemImgBean img) {
		Upload upload = new Upload();
		String url = "F:\\situwork\\myMall\\src\\main\\webapp\\Admin\\itemImg\\"+img.getUrl();
		System.out.println("url:"+url);
		upload.delFile(url);
		return imgService.delete(img);

	}
}
