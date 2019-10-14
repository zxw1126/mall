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
		<legend>修改信息</legend>			
	</fieldset>
	
	<div class="layui-form" lay-filter="updateform" >
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-inline">
				<input type="text" id="code" name="code" class="layui-input" readonly  />					
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-inline">
				<input type="text" name="username" class="layui-input" lay-verify="required" placeholder="必填" />					
			</div>
		</div>		
		
		<div class="layui-form-item">
			<label class="layui-form-label"></label>
			<div class="layui-inline">
				<button class="layui-btn" lay-submit id="sub" lay-filter="updateform">确定</button>
				<button id="closeBtn" onclick="closeOpen();" class="layui-btn">取消</button>
			</div>
		</div>
	</div>

<script type="text/javascript">


//回显数据
var code = "<%=request.getParameter("code")%>";
console.log(code)
$("input[name=code]").val(code)
function echo(){
	var echodata = {"code":code}
ajax('/myMall/user/echo.do',echodata,"JSON",function(data){
	console.log(data);
	$("input[name=username]").val(data.username);		
})
}
echo();

//关闭方法
function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}

//测试用户名,貌似不需要
/* $("#a").blur(function(){
	console.log("进入测试姓名方法")
	var testdata = {"whichMethod":"testempId","empId":$("#empId").val()};
	ajax('/0906ProEE/EmpServletA', testdata,'text',function(data){
		if(data=="0"){
			$("#empId").val("");
			layer.msg("名字已存在");
		}
	})
	console.log("方法调用完毕")
}) */

$("#sub").click(function(){
	formSubmit('/myMall/user/update.do','submit(updateform)','text',function(resdata){
		if(resdata=="1"){
			layer.msg("修改成功");
			setTimeout(function(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);				
			},1000)
		}else{
			layer.msg("修改失败");
		}
	})
})
</script>
</body>
</html>