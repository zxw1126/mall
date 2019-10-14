<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/myMall/common/css/main.css">
  <link rel="stylesheet" type="text/css" href="/myMall/layui/css/layui.css">
  <script type="text/javascript" src="/myMall/layui/layui.all.js"></script>
  <script type="text/javascript" src="/myMall/common/js/util/common.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title">
		<legend>重置密码</legend>
	</fieldset>
	
	<form class="layui-form" lay-filter="resetPwd" >
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type=hidden name="code" value="<%=request.getParameter("code") %>" id ="code"/>
					<input type="password" name="password" class="layui-input" id="password" lay-verify="required" />
				</div>
			</div>
		</div>
		
		<div class="layui-inline">
			<button class="layui-btn"  id="sub" lay-submit lay-filter="resetPwd">确定</button>
			<button type="button" onclick='javascript:closeOpen();'  class="layui-btn">取消</button>				
		</div>	
	</form>
<script type="text/javascript">
//关闭
function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}

$("#sub").click(function(){
	formSubmit('/myMall/user/resetPwd.do','submit(resetPwd)','text',function(resdata){
		if(resdata=="1"){
			layer.msg("修改成功");
			setTimeout(function(){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
			},1000);				
		}else{
			layer.msg("修改失败");
		}
	})
})
</script>
</body>
</html>