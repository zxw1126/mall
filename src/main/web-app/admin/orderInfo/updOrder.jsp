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
		<input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
		<div class="layui-form-item">
			<label class="layui-form-label">订单号</label>
			<div class="layui-inline">
				<input type="text" id="code" name="code" class="layui-input" disabled  />					
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">用户账号:</label>
			<div class="layui-inline">
				<input type="text" name="userCode" class="layui-input" lay-verify="required" placeholder="必填" />					
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">订单时间:</label>
			<div class="layui-inline">
				<input type="text" name="time"  lay-verify="required"  id="time" class="layui-input" />
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
				<label class="layui-form-label">状态:</label>
				<div class="layui-input-inline">
					<input type="radio" name="state" value="未发货" title="未发货" />
					<input type="radio" name="state" value="已发货" title="已发货" />
				</div>
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
var id = $("#id").val();
console.log(id)
var addrCode = null;
function echo(){
	var echodata = {"id":id}
	ajax('/myMall/order/echo.do',echodata,"JSON",function(data){
	console.log(1);
	console.log(data[0]);
	$("#code").val(data[0].code);
	$("input[name=userCode]").val(data[0].userCode);
	$("input[name=addrCode]").val(data[0].addrCode);
	addrCode = data[0].addrCode;
	$("input[name=state]").each(function(){
		if($(this).val()==data[0].state)
			$(this).prop("checked","true");
	})
	//进入回显三级下拉框方法
	echoOne(data[0].addrCode);
	renderLaydate('time',data[0].time);
	form.render();
})
}
echo();

//关闭方法
function closeOpen(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);		
}

$("#sub").click(function(){
	formSubmit('/myMall/order/update.do','submit(updateform)','text',function(resdata){
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

var maxCode = null;
var pCode = null;
var cCode =null;


//回显三级下拉框
function echoOne(addrCode){
	ajax("/myMall/item/getDistrictCode.do",{"code":addrCode},"JSON",function(datad){
		console.log("datad")
		console.log(datad[0])
		cCode = datad[0].parentCode
		echoTwo(cCode);
	})
}

function echoTwo(cCode){
	ajax("/myMall/item/getDistrictCode.do",{"code":cCode},"JSON",function(datac){
		console.log("datac")
		console.log(datac[0])
		pCode = datac[0].parentCode
		echoThree(pCode);
	})
}

function echoThree(pCode){
	ajax("/myMall/item/getDistrictCode.do",{"code":pCode},"JSON",function(datap){
		console.log("datap")
		console.log(datap[0])
		maxCode = datap[0].parentCode;
		echoFour(maxCode)
	})
}

function echoFour(maxCode){
	ajax("/myMall/item/getDistrictCode.do",{"parentCode":maxCode},"JSON",function(data){
		console.log("data")
		console.log(data)
		var ht = "";
		ht += "<option value='N'>*请选择*</option>";
		for(var i=0;i<data.length;i++){
			ht += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		}
		$("select[name=province]").html(ht)
		$("select[name=province]").val(pCode)
		form.render();
		echoFive(pCode);
	})
}

function echoFive(pCode){
	ajax("/myMall/item/getDistrictCode.do",{"parentCode":pCode},"JSON",function(data){
		console.log("data")
		console.log(data)
		var ht = "";
		ht += "<option value='N'>*请选择*</option>";
		for(var i=0;i<data.length;i++){
			ht += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		}
		$("select[name=city]").html(ht)
		$("select[name=city]").val(cCode)
		form.render();
		echoSix(cCode);
	})
}

function echoSix(cCode){
	ajax("/myMall/item/getDistrictCode.do",{"parentCode":cCode},"JSON",function(data){
		console.log("data")
		console.log(data)
		var ht = "";
		ht += "<option value='N'>*请选择*</option>";
		for(var i=0;i<data.length;i++){
			ht += "<option value='"+data[i].code+"'>"+data[i].name+"</option>";
		}
		$("select[name=district]").html(ht)
		$("select[name=district]").val(addrCode)
		form.render();
	})
}

</script>
</body>
</html>