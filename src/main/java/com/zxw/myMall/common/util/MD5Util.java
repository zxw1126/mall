package com.zxw.myMall.common.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Base64;

public class MD5Util {
	public static String MD5(String str) {
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			Base64 base64 = new Base64();
			return base64.encodeAsString((md5.digest(str.getBytes("utf-8"))));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
