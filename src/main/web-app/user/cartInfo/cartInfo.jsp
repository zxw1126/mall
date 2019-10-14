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
		<legend>收货地址</legend>
	</fieldset>		
		
	<div class="layui-form-item">	
		<div class="layui-inline">
		
			<label class="layui-form-label">描述:</label>			
			<div class="layui-input-inline">
				<input type="text" name="selitemCode" class="layui-input" id="selitemCode" placeholder="请输入物品描述" />
			</div>
		
		<div class="layui-inline">
		
			<div class="layui-form-item">								
				<div class="layui-inline">
					<input type="reset" id="reset" class="layui-btn" value="重置" />
					<input type="button" id="selectcart" class="layui-btn" value="查询" />
					<!-- <input type="button" id="addaddr" class="layui-btn" value="添加" /> -->
				</div>
			</div>
			
		</div>					
		</div>
	</div>		
	
	
	<fieldset class="layui-elem-field layui-field-title"></fieldset>
	
	<form class="layui-form">
		<table class="layui-table" id="table" lay-size="lg">
			<colgroup>
				<col width="30">
				<col width="50">
				<col width="200">
				<col width="200">
				<col width="70">
				<col width="200">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>用户码</td>
					<td>物品名称</td>
					<td>物品数量</td>
					<td>物品单价</td>
					<td>总价</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
	<div id=pager></div>
	<script type="text/javascript">
<%-- 	
	//弹出层添加方法
	$("#addaddr").click(function(){
		var userId = <%=request.getParameter("id")%>;
		console.log(userId);
		openLayer("/mall/address/addAddr.jsp?id="+userId,function(){				
			$("#selectaddr").click();
		});				
	})
	  --%>
	var userInfo = <%=request.getSession().getAttribute("user")%>
	console.log(userInfo)
	var userCode = userInfo.code
	//查询所有数据
	function selectAll(){
		ajax('/myMall/cart/getCount.do',{"getCcount":"1"},'text',function(data){
			//分页方法
			console.log(data);
			setPageInfo('pager',data,function(obj,first){
				console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			    console.log(obj.limit); //得到每页显示的条数
			    showData(obj.curr,obj.limit);
			    if(!first){
			    	console.log("test first function");
			    }
			})
		});
	};
	
	//查询数据:
	function showData(curr,limit){
		var data = {"pageIndex":curr,"pageLimit":limit,"userCode":userCode}
		ajax('/myMall/cart/showData.do',data,'JSON',function(data){
			var html = "";
			console.log(data);
			for(var i=0;i<data.length;i++){
				html += "<tr id='"+data[i].id+"'>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].userCode+"</td>"+
				"<td>"+data[i].name+"</td>"+
			/* 	"<td><button type='button' class='cut btn'>-</button>"+data[i].number+"<button type='button' class='add btn'>+</button></td>"+ */
				"<td><button type='button' name='cutBtn"+data[i].itemDetailCode+"' class='layui-btn layui-btn-sm'><i class='layui-icon'>&#8722;</i></button><span name='myNum"+data[i].itemDetailCode+"'>"+data[i].number+"</span><button type='button' name='addBtn"+data[i].itemDetailCode+"'  class='layui-btn layui-btn-sm'><i class='layui-icon'>&#xe654;</i></button></td>"+
				"<td><span id='price"+data[i].itemDetailCode+"'>"+data[i].price+"</span></td>"+
				"<td><span id='total"+data[i].itemDetailCode+"'>"+data[i].price*data[i].number+"</span></td>"+
				"<td><div class='layui-input-inline'>"+
				/* "<button type='button' onclick='myupdate("+data[i].id+")' class='layui-btn layui-btn-sm'>修改数量</button>"+ */
				"<button type='button' onclick='mydelete("+data[i].id+")' class='layui-btn layui-btn-sm'>删除</button>"+
				"</div></td>"+
				"</tr>";
			}
			$("#tbody").html(html)
			numberChange();
		})
	}
	//查询按钮方法:
	$("#selectcart").click(function(){
		selectAll();
	});	
	$("#selectcart").click();
	
	$("#reset").click(function(){
		$("#selitemCode").val("");
		$("#selectcart").click();
	})
	
	function myupdate(id){
		openLayer('/myMall/cart/updCart.jsp?id='+id,function(){				
			$("#selectcart").click();
		});
		
	}
	
	function mydelete(id){
		layer.confirm("确定进行该操作？", {icon : 3,	title : '提示'}, function(){
		var deldata = {"id":id}
		ajax('/myMall/cart/delete.do',deldata,'text',function(data){
			if(data=="1"){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
				layer.msg("删除成功!");
				$("#selectaddr").click();
			}else{
				layer.msg("删除失败!");			
				$("#selectaddr").click();
			}
		})		
		});	
	}
	

	
	function myupload(id){
		openLayer('/myMall/cart/uploadCart.jsp?id='+id,function(){				
			$("#selectcart").click();
		});	
	}
	

	function numberChange(){
	$("button[name^=cutBtn]").click(function(){
		console.log(1)
		console.log($(this).attr("name"))
		var names = $(this).attr("name");
		var name = names.slice(6)
		console.log(name)
		var number = $("span[name=myNum"+name+"]").html()
		console.log(number)
		if(number>1){
			var ii =  parseInt($("#price"+name).html())*(number-1);
			$("#total"+name).html(ii)
		$("span[name=myNum"+name+"]").html(number-1)
			ajax("/myMall/cart/updateNum.do",{"itemDetailCode":name,"userCode":userCode,"number":number-1},"text",function(data){
				if(data=="0"){
					layer.msg("操作失败")
				}
			})
		}
		else
		layer.msg("商品已到最低数量")
	})
	
	$("button[name^=addBtn]").click(function(){
		console.log(1)
		console.log($(this).attr("name"))
		var names = $(this).attr("name");
		var name = names.slice(6)
		console.log(name)
		var number = $("span[name=myNum"+name+"]").html()
		console.log(number)
		if(number>1000){
			layer.msg("商品已到最大数量")
		}
		var numbers = parseInt(number)+1
		var ii =  parseInt($("#price"+name).html())*(numbers);
		$("#total"+name).html(ii)
		$("span[name=myNum"+name+"]").html(numbers)
		ajax("/myMall/cart/updateNum.do",{"itemDetailCode":name,"userCode":userCode,"number":numbers},"text",function(data){
				if(data=="0"){
					layer.msg("操作失败")
				}
			})
	})
		
	}

	
	</script>
	
	
</body>
</html>