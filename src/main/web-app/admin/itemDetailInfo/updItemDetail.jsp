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
			<label class="layui-form-label">商品编号:</label>
			<div class="layui-inline">
				<input type="text" id="code" name="code" class="layui-input" disabled  />					
			</div>		
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称:</label>
			<div class="layui-inline">
				<input type="text" name="name" class="layui-input" lay-verify="required" placeholder="请输入商品名称" />					
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品价格:</label>
			<div class="layui-inline">
				<input type="text" name="price" class="layui-input"  placeholder="请输入商品描述" />					
			</div>
		</div>
				
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">存货数量:</label>
				<div class="layui-input-inline">
					<input type="text" name="inventory" class="layui-input" id="inventory" placeholder="请输入商品详细"  />
				</div>
			</div>
		</div>
				
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品状态:</label>
				<div class="layui-input-inline">
					<input type="radio" name="state" value="已上架" title="已上架" checked /> 
					<input type="radio" name="state" value="未上架" title="未上架" />
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
				<label class="layui-form-label">商品具体:</label>
				<div class="layui-inline">
					<select name="parentCodeTwo">							
					</select>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item layui-form-text">
  		  <label class="layui-form-label">商品描述</label>
   			 <div class="layui-input-block">
    			  <textarea name="detail" placeholder="请输入描述" class="layui-textarea"></textarea>
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

function getParentCode(){
	var data={"parentCode":"xxxx"}
	ajax('/myMall/itemDetail/getParentCode.do',data,'JSON',function(data){
		console.log(data);		
		var htmlx = "";		
		htmlx += "<option value='xxxx'>*请选择*</option>"
		for(var i=0;i<data.length;i++){
			htmlx += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		}
		$("select[name=parentCodeOne]").html(htmlx);
		form.render();		
	})
	}
getParentCode(); 

form.on('select(parentCodeOne)', function(data){
//	  console.log(data.elem); //得到select原始DOM对象
//	  console.log(data.othis); //得到美化后的DOM对象
	  console.log(data.value); //得到被选中的值
	  var idata = {"parentCode":data.value}	 
	  ajax("/myMall/itemDetail/getParentCode.do",idata,"json",function(datax){		 
		  console.log(datax)
		  var htmlx = "";		  
		  for(var i=0;i<datax.length;i++){	
			  htmlx += "<option value='"+datax[i].code+"'>"+datax[i].name+"</option>";
		  }	
		  $("select[name=parentCodeTwo]").html(htmlx);
		  form.render();
	  })
	});  

var pOne = "xxxx";
var pTwo =null;
var pThree = null;

//回显数据
var code = "<%=request.getParameter("code")%>";
console.log(code)
function echo(){
	var echodata = {"code":code}
ajax('/myMall/itemDetail/echo.do',echodata,"JSON",function(data){
	console.log(data[0]);
	$("#code").val(data[0].code);
	$("input[name=name]").val(data[0].name);
	$("input[name=price]").val(data[0].price);
	$("input[name=inventory]").val(data[0].inventory);	
	$("input[name=state]").val(data[0].state);	
	$("textarea[name=detail]").val(data[0].detail);	
	pThree = data[0].itemCode;	
	console.log("pThree"+pThree)
	echoOne(pThree); 
	form.render();
	
})
}
echo();
//二级
function echoOne(pThree){
	ajax("/myMall/item/echo.do",{"code":pThree},"JSON",function(datai){
		console.log("datai:")
		console.log(datai[0])
		pTwo = datai[0].parentCode
		console.log("pTwo:"+pTwo)
		echoTwo(pTwo)
		var ht2 = "";
		for(var i=0;i<datai.length;i++){
			ht2 += "<option value='"+datai[i].code+"'>"+datai[i].name+"</option>";
		}
		$("select[name=parentCodeTwo]").html(ht2)
		$("select[name=parentCodeTwo]").val(pThree)
		form.render();
	})
} 

//一级
function echoTwo(pTwo){
	ajax("/myMall/item/echo.do",{"code":pTwo},"JSON",function(dataii){
		console.log("dataii:")
		console.log(dataii)
		echoThree(pOne)
	
	})
}

 function echoThree(pOne){
	ajax("/myMall/item/echo.do",{"parentCode":pOne},"JSON",function(dataiii){
		console.log("dataiii")
		console.log(dataiii)
		var ht1 = "";
		for(var i=0;i<dataiii.length;i++){
			ht1 += "<option value='"+dataiii[i].code+"'>"+dataiii[i].name+"</option>";
		}
		$("select[name=parentCodeOne]").html(ht1)
		$("select[name=parentCodeOne]").val(pTwo)
		form.render();		
	})
} 

//关闭方法
function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}


$("#sub").click(function(){
	formSubmit('/myMall/itemDetail/update.do','submit(updateform)','text',function(resdata){
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