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
		<legend>添加地址</legend>
	</fieldset>
	
	<form class="layui-form" lay-filter="regform" >
	
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">收件人:</label>
				<div class="layui-input-inline">
				
					<input type="hidden" name="userCode" value=""/>
					<input type="text" name="recipient" class="layui-input" id="recipient" lay-verify="required" placeholder="请输入账号" />
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">电话:</label>
				<div class="layui-input-inline">
					<input type="text" name="phone" class="layui-input" id="password" lay-verify="required" />
				</div>
			</div>
		</div>
		
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">省:</label>
				<div class="layui-inline">
					<select name="province" lay-filter="province">							
					</select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">市:</label>
				<div class="layui-inline">
					<select name="city" lay-filter="city">							
					</select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">区:</label>
				<div class="layui-inline">
					<select name="district" lay-filter="district">							
					</select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">地区编号:</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input" name="addrCode" id="addrCode" lay-verify="required" readonly/>
				</div>
			</div>
		</div>
							
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">详细地址:</label>
				<div class="layui-input-inline">
					<input type="text" name="detail" class="layui-input" id="username" placeholder="请输入详细地址" lay-verify="required" />
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
var userInfo = <%=request.getSession().getAttribute("user")%>
console.log(userInfo)
$("input[name=userCode]").val(userInfo.code)
form.render();

//注册
$("#sub").click(function(){
	
		console.log("进入表单监听方法")
		formSubmit('/myMall/addr/addAddr.do','submit(regform)','text',function(resdata){
			if(resdata=="1"){
				layer.msg("注册成功");
				setTimeout(function(){
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);	
				},1000);				
			}else{
				layer.msg("注册失败");
			}
		})


})

/* ajax('/myMall/addr/echoUserCode.do',{"id":$("input[name=id]").val()},"text",function(data){
	console.log(data)
	$("input[name=userCode]").val(data)
}) */
/* //测试姓名
$("#account").blur(function(){
	console.log("进入测试姓名方法")
	if($("#account").val()!=""){
	var testdata = {"account":$("#account").val()};
	ajax('/mall/login/testName.do', testdata,'text',function(data){
		if(data=="1"){
			$("#account").val("");
			layer.msg("名字已存在");
		}
	})		
	}
}) */

//回显省编码
function getProvinceCode(){
	ajax("/myMall/item/getProvinceCode.do",{"getProvinceCode":"1"},"json",function(data){
		console.log(data)
		var html = "";
		html += "<option value='N'>*请选择*</option>"
		for(var i=0;i<data.length;i++){
			html += "<option value="+data[i].code+">"+data[i].name+"</option>";
		}
		 $("select[name=province]").html(html);
		form.render();
	})
}
getProvinceCode();


//监听省下拉框
form.on('select(province)', function(data){
//	  console.log(data.elem); //得到select原始DOM对象
	  console.log(data.value); //得到被选中的值
//	  console.log(data.othis); //得到美化后的DOM对象
	  var idata = {"parentCode":data.value}	 
	  ajax("/myMall/item/getCityCode.do",idata,"json",function(data){		 
		  console.log(data)
		  var htmlx = "";
		  htmlx += "<option value='N'>*请选择*</option>"
		  for(var i=0;i<data.length;i++){	
			  htmlx += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		  }	
		  $("select[name=city]").html(htmlx);
		  $("select[name=district]").html("");
		  form.render();
	  })
}); 

//监听市下拉框
form.on('select(city)', function(data){
//	  console.log(data.elem); //得到select原始DOM对象
	  console.log(data.value); //得到被选中的值
//	  console.log(data.othis); //得到美化后的DOM对象
	  var idata = {"parentCode":data.value}	 
	  ajax("/myMall/item/getDistrictCode.do",idata,"json",function(data){		 
		  console.log(data)
		  var htmli = "";
		  htmli += "<option value='N'>*请选择*</option>"
		  for(var i=0;i<data.length;i++){	
			  htmli += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		  }	
		  $("select[name=district]").html(htmli);
		  form.render();
	  })
});

//监听区下拉框
form.on('select(district)', function(data){
//	  console.log(data.elem); //得到select原始DOM对象
	  console.log(data.value); //得到被选中的值
//	  console.log(data.othis); //得到美化后的DOM对象
	  var idata = {"code":data.value}	 
	  ajax("/myMall/item/getPostCode.do",idata,"json",function(data){		 
		  console.log(data)
		  $("#addrCode").val(data[0].code);
		  form.render();
	  })
});

function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}
</script>
</body>
</html>