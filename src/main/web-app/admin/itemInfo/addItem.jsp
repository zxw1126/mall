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
		<legend>添加商品</legend>
	</fieldset>
	
	<form class="layui-form" lay-filter="regform" >
	
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品码:</label>
				<div class="layui-input-inline">
					<input type="text" name="code" class="layui-input" id="code" lay-verify="required" placeholder="请输入商品码" />
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input" id="name" placeholder="请输入商品名称"  lay-verify="required" />
				</div>
			</div>
		</div>
			
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品描述:</label>
				<div class="layui-input-inline">
					<textarea type="textarea" name="descr" class="layui-textarea" id="descr" placeholder="请输入商品描述" /></textarea>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品父级:</label>
				<div class="layui-inline">
					<select name="parentCodeOne" lay-filter="parentCodeOne">							
					</select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品类别:</label>
				<div class="layui-inline">
					<select name="parentCodeTwo" >							
					</select>
				</div>
			</div>
		</div>
		
<!-- 		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品具体:</label>
				<div class="layui-inline">
					<select name="parentCodeThree">							
					</select>
				</div>
			</div>
		</div> -->
	
		<div class="layui-form-item">
			<label class="layui-form-label"></label>
			<div class="layui-inline">
				<button class="layui-btn"  id="sub" lay-submit lay-filter="regform">确定注册</button>
				<button type="reset"  class="layui-btn">重置</button>
				<button type="button" onclick='javascript:closeOpen();'  class="layui-btn">取消</button>				
			</div>
		</div>		
	</form>
	
<script type="text/javascript">

//商品父级码回显
function getParentCode(){
	ajax("/myMall/item/getParentCode.do",{"ParentCode":"xxxx"},"json",function(data){
		console.log(data)
		var htmlx = "";
		htmlx +="<option value='xxxx'>*添加一个父级分类*</option>" 
		for(var i=0;i<data.length;i++){
			htmlx += "<option value="+data[i].code+">"+data[i].name+"</option>";
		}
		$("select[name=parentCodeOne]").html(htmlx);
		form.render();		
	})
}
getParentCode();

//监听一级下拉框
form.on('select(parentCodeOne)', function(data){
//	  console.log(data.elem); //得到select原始DOM对象
	  console.log(data.value); //得到被选中的值
//	  console.log(data.othis); //得到美化后的DOM对象
	  var idata = {"parentCode":data.value}	 
	  ajax("/myMall/item/getParentCode.do",idata,"json",function(datax){		 
		  console.log(datax)
		  var htmlx = "";
		  htmlx +="<option value='"+data.value+"'>*添加一个二级分类*</option>" 
		  for(var i=0;i<datax.length;i++){	
			  htmlx += "<option value='"+datax[i].code+"'>"+datax[i].name+"</option>";
		  }	
		  $("select[name=parentCodeTwo]").html(htmlx);
		  $("select[name=parentCodeThree]").html("");
		  form.render();
	  })
	});	





//注册
$("#sub").click(function(){
		console.log("进入表单监听方法")
		formSubmit('/myMall/item/addItem.do','submit(regform)','text',function(resdata){
			if(resdata=="1"){
				$("#code").val("")
				layer.msg("添加成功");
				setTimeout(function(){
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);	
				},1000);				
			}else{
				layer.msg("添加失败");
			}
		})
})



//测试商品码
$("#code").blur(function(){
	console.log("进入测试商品码方法")
	if($("#code").val()!=""){
		var testdata = {"code":$("#code").val()};
		ajax('/myMall/item/testCode.do', testdata,'text',function(data){
			if(data=="1"){
				$("#code").val("");
				layer.msg("商品码已存在");
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