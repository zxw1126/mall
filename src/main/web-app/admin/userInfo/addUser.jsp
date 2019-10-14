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
		<legend>添加员工</legend>
	</fieldset>
	
	<form class="layui-form" lay-filter="regform" >
	
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">账号:</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input" id="code" lay-verify="required" placeholder="请输入账号" />
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="password" name="password" class="layui-input" id="password" lay-verify="required" />
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">确认密码:</label>
				<div class="layui-input-inline">
					<input type="password" class="layui-input" name="confpwd" id="confpwd" lay-verify="required" />
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-inline">
					<input type="text" name="username" class="layui-input" id="username" placeholder="请输入姓名" lay-verify="required" />
				</div>
			</div>
		</div>						
		
		<div class="layui-form-item">
			<label class="layui-form-label"></label>
			<div class="layui-inline">
				<button class="layui-btn"  id="sub" lay-submit lay-filter="regform">确定添加</button>
				<button type="reset"  class="layui-btn">重置</button>
				<button type="button" onclick='javascript:closeOpen();'  class="layui-btn">取消</button>				
			</div>
		</div>		
	</form>
<script type="text/javascript">

form.render();

//注册
$("#sub").click(function(){
	if($("#password").val()==$("#confpwd").val()){
		console.log("进入表单监听方法")
		formSubmit('/myMall/user/addUser.do','submit(regform)','text',function(resdata){
			if(resdata=="1"){
				$("#code").val("")
				layer.msg("注册成功");
				setTimeout(function(){
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);	
				},1000);				
			}else{
				layer.msg("注册失败");
			}
		})
	}else{
		form.on("submit(regform)",function(data){
			return false;
		})
			layer.msg("两次密码输入不一致");
	}

})

//测试姓名
$("#code").blur(function(){
	console.log("进入测试姓名方法")
	if($("#code").val()!=""){
	var testdata = {"code":$("#code").val()};
	ajax('/myMall/user/testName.do', testdata,'text',function(data){
		if(data=="1"){
			$("#code").val("");
			layer.msg("名字已存在");
		}
	})		
	}
})

function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}
</script>
</body>
</html>