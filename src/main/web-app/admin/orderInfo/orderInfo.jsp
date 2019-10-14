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
		<legend>订单信息</legend>
	</fieldset>		
		
	<div class="layui-form-item">	
		<div class="layui-inline">
		
			<label class="layui-form-label">订单号:</label>			
			<div class="layui-input-inline">
				<input type="text" name="selcode" class="layui-input" id="selcode" placeholder="请输入订单号" />
			</div>
		
		<div class="layui-inline">
		
			<div class="layui-form-item">
				<label class="layui-form-label">用户账号:</label>			
				<div class="layui-input-inline">
					<input type="text" name="seluserCode" class="layui-input" id="seluserCode" placeholder="请输入用户吗" />
				</div>
				
				<div class="layui-inline">
					<input type="reset" id="reset" class="layui-btn" value="重置" />
					<input type="button" id="selectorder" class="layui-btn" value="查询" />
					<input type="button" id="addorder" class="layui-btn" value="添加" />
				</div>
			</div>
			
		</div>					
		</div>
	</div>		
	
	
	<fieldset class="layui-elem-field layui-field-title"></fieldset>
	
	<form class="layui-form">
		<table class="layui-table" id="table" lay-size="lg">
			<colgroup>
				<col width="70">
				<col width="150">
				<col width="100">
				<col width="200">
				<col width="70">
				<col width="70">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>订单号</td>
					<td>用户账号</td>
					<td>时间</td>
					<td>地区编号</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
	
	<div id=pager></div>
	<script type="text/javascript">
	
	//弹出层添加方法
	$("#addorder").click(function(){
		openLayer('/myMall/Admin/orderInfo/addOrder.jsp',function(){				
			$("#selectorder").click();
		});		
		
	})
			
	//查询所有数据
	function selectAll(){
		ajax('/myMall/order/getCount.do',{"getCount":"1"},'text',function(data){
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
		var data = {"pageIndex":curr,"pageLimit":limit,"code":$("#selcode").val(),"userCode":$("#seluserCode").val()}
		ajax('/myMall/order/showData.do',data,'JSON',function(data){
			var html = "";
			console.log(data);
			for(var i=0;i<data.length;i++){
				html += "<tr id='"+data[i].id+"'>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].code+"</td>"+
				"<td>"+data[i].userCode+"</td>"+
				"<td>"+data[i].time+"</td>"+
				"<td>"+data[i].addrCode+"</td>"+
				"<td>"+data[i].state+"</td>"+
				"<td><div class='layui-input-inline'>"+
				"<button type='button' onclick='myupdate("+data[i].id+")' class='layui-btn layui-btn-sm'>修改</button>"+
				"<button type='button' onclick='mydelete("+data[i].id+")' class='layui-btn layui-btn-sm'>删除</button>"+
				"<button type='button' onclick='myitem("+data[i].id+")' class='layui-btn layui-btn-sm'>订单商品</button>"+
				"</div></td>"+
				"</tr>";
			}
			$("#tbody").html(html)
		})
	}
	//查询按钮方法:
	$("#selectorder").click(function(){
		selectAll();
	});	
	$("#selectorder").click();
	
	$("#reset").click(function(){
		$("#selcode").val("");
		$("#seluserCode").val("");
		$("#selectorder").click();
	})
	
	function myupdate(id){
		openLayer('/myMall/Admin/orderInfo/updOrder.jsp?id='+id,function(){				
			$("#selectorder").click();
		});
		
	}
	
	function mydelete(id){
		layer.confirm("确定进行该操作？", {icon : 3,	title : '提示'}, function(){
		var deldata = {"id":id}
		ajax('/myMall/order/delete.do',deldata,'text',function(data){
			if(data=="1"){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
				layer.msg("删除成功!");
				$("#selectorder").click();
			}else{
				layer.msg("删除失败!");			
				$("#selectorder").click();
			}
		})		
		});	
	}
		
 	function myitem(id){
		openLayer('/myMall/user/orderDetail/orderDetailInfo.jsp?id='+id,function(){				
			$("#selectorder").click();
		});	
	} 
	
	</script>
	
	
</body>
</html>