<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
  <link rel="stylesheet" type="text/css" href="/myMall/common/css/main.css">
  <link rel="stylesheet" type="text/css" href="/myMall/layui/css/layui.css">
  <script type="text/javascript" src="/myMall/layui/layui.all.js"></script>
  <script type="text/javascript" src="/myMall/common/js/util/common.js"></script>
</head>
<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">信息维护系统</div>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
							贤心
						</a>
						<dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item"><a href="">退了</a></li>
				</ul>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">系统管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/myMall/Admin/userInfo/userInfo.jsp');">用户信息维护</a></dd>
							</dl>
						</li>
						
						<li class="layui-nav-item">
							<a href="javascript:;">商品管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/myMall/Admin/itemInfo/itemInfo.jsp');">商品分类维护</a></dd>
								<dd><a href="javascript:openUrl('/myMall/Admin/itemDetailInfo/itemDetailInfo.jsp');">商品信息维护</a></dd>
								<dd><a href="javascript:openUrl('/myMall/Admin/itemImgInfo/ImgInfo.jsp');">商品图片维护</a></dd>
							</dl>
						</li>
						
						<li class="layui-nav-item">
							<a href="javascript:;">订单管理</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:openUrl('/myMall/Admin/orderInfo/orderInfo.jsp');">订单信息维护</a></dd>
							</dl>
						</li>	
						
						<li class="layui-nav-item">
							<a href="javascript:;">项目二</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">维护</a></dd>
							</dl>
						</li>					
					</ul>
				</div>
			</div>

			<div class="layui-body">
				<iframe name="rightframe" width="99%" height="99%"></iframe>
				<div style="padding: 15px;">内容主体区域</div>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© zxw.com - 底部固定区域
			</div>
		</div>
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;

			});
			element.render();
			form.render();
			function openUrl(url) {
				window.open(url, "rightframe")
			}
			
			
		</script>
	</body>
</html>