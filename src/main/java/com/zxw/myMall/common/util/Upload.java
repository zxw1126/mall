package com.zxw.myMall.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
public class Upload {

    public static Map<String, Object> upload(HttpServletRequest request) throws FileUploadException, IOException, Exception {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> filenames = new ArrayList<String>();
        for (FileItem item : items) {
            if (item.isFormField()) {// 非文件域表单元素
                // System.out.println("1--" + item.getFieldName());
            	System.out.println("上传图片时没有进入else方法");
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                // System.out.println("2--" + value);
                map.put(item.getFieldName(), value);
            } else {// 文件域表单元素--复制文件
                InputStream is = item.getInputStream();   
                BufferedInputStream bis =  new BufferedInputStream(is);
                String filename =  getFName();
                String filepath = getFPath()+"";
                String fUrl = filepath+"\\"+filename;
                OutputStream fos = new FileOutputStream(fUrl); 
                System.out.println("文件路径加文件名:"+fUrl);
                filenames.add(filename);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				int i = -1;
				while((i=bis.read()) != -1){
					bos.write(i);
				}
				fos.close();
				is.close();
				map.put("list", filenames);
            }
        }
        System.out.println("获取到上传到的文件:"+map.toString());
        return map;
    }
    
    @SuppressWarnings("unused")
	private static String getUrlAAA() {
    	String url = null;
    	url += getFPath() +"\\"+getFName();
    	return url;
    }

    private static String getFName() {
        // 根据时间戳创建图片文件名
        // String filename = System.currentTimeMillis() + ".jpg";
        String filename = UUID.randomUUID().toString() + ".jpg";
        System.out.println("文件名:"+filename);
        // 03bc08c1-e771-4641-9e3f-16e5e2f858ed
        return filename;
    }

    // D:/DxOffice/workspace/image/1234567890.jpg
    public static File getFPath() {
        // linux下的路径分割符是斜杠 /
        // windows下的路径分隔符是反斜杠 \
        File f = new File("F:\\situwork\\myMall\\src\\main\\webapp\\Admin\\itemImg");
        if (!f.exists()) {
            f.mkdir();
        }
        System.out.println("文件路径"+f.toString());
        return f;
    }

    public static void delFile(String filename) {
        if (filename==null||filename.equals(""))
            return;
        File file = new File(filename);
        file.delete();
    }

}
