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
		<legend>商品信息</legend>
	</fieldset>		
		
	<div class="layui-form-item">	
		<div class="layui-inline">
		
			<label class="layui-form-label">编号:</label>			
			<div class="layui-input-inline">
				<input type="text" name="selcode" class="layui-input" id="selcode" placeholder="请输入编号" />
			</div>
		
		<div class="layui-inline">
		
			<div class="layui-form-item">
				<label class="layui-form-label">详细:</label>			
				<div class="layui-input-inline">
					<input type="text" name="seldetail" class="layui-input" id="seldetail" placeholder="请输入详细" />
				</div>
				
				<div class="layui-inline">
					<input type="reset" id="reset" class="layui-btn" value="重置" />
					<input type="button" id="selectItemDetail" class="layui-btn" value="查询" />
					<input type="button" id="additeminfo" class="layui-btn" value="添加" />
				</div>
			</div>
			
		</div>					
		</div>
	</div>		
	
	
	<fieldset class="layui-elem-field layui-field-title"></fieldset>
	
	<form class="layui-form">
		<table class="layui-table" id="table" lay-size="lg">
			<colgroup>
				<col width="60">
				<col width="150">
				<col width="100">
				<col width="70">
				<col width="200">
				<col width="60">
				<col width="30">
				<col width="120">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>商品信息编号</td>
					<td>商品名称</td>
					<td>商品价格</td>
					<td>商品详细</td>
					<td>存货</td>
					<td>状态</td>
					<td>商品码</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
	
	<div id=pager></div>
	<script type="text/javascript">
	
	//弹出层添加方法
	$("#additeminfo").click(function(){
		openLayer('/myMall/Admin/itemDetailInfo/addItemDetail.jsp',function(){				
			$("#selectItemDetail").click();
		});		
		
	})
	
	
		
	//查询所有数据
	function selectAll(){
		ajax('/myMall/itemDetail/getCount.do',{"getCount":"1"},'text',function(data){
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
		var data = {"pageIndex":curr,"pageLimit":limit,"code":$("#selcode").val(),"detail":$("#seldetail").val()}
		ajax('/myMall/itemDetail/showData.do',data,'JSON',function(data){
			var html = "";
			console.log(data);
			for(var i=0;i<data.length;i++){
				html += "<tr id='"+data[i].id+"'>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].code+"</td>"+
				"<td>"+data[i].name+"</td>"+
				"<td>"+data[i].price+"</td>"+
				"<td>"+data[i].detail+"</td>"+
				"<td>"+data[i].inventory+"</td>"+
				"<td>"+data[i].state+"</td>"+
				"<td>"+data[i].itemCode+"</td>"+
				"<td><div class='layui-input-inline'>"+
				"<button type='button' onclick='myupdate(\""+data[i].code+"\")' class='layui-btn layui-btn-sm'>修改</button>"+
				"<button type='button' onclick='mydelete("+data[i].id+")' class='layui-btn layui-btn-sm'>删除</button>"+
				"<button type='button' onclick='myupload(\""+data[i].code+"\")' class='layui-btn layui-btn-sm'>图片维护</button>"+				
				"</div></td>"+
				"</tr>";
			}
			$("#tbody").html(html)
		})
	}
	//查询按钮方法:
	$("#selectItemDetail").click(function(){
		selectAll();
	});	
	$("#selectItemDetail").click();
	
	$("#reset").click(function(){
		$("#selcode").val("");
		$("#seldetail").val("");
		$("#selectItemDetail").click();
	})
	
	function myupdate(code){
		openLayer('/myMall/Admin/itemDetailInfo/updItemDetail.jsp?code='+code,function(){				
			$("#selectItemDetail").click();
		});
		
	}
	
	function mydelete(id){
		layer.confirm("确定进行该操作？", {icon : 3,	title : '提示'}, function(){
		var deldata = {"id":id}
		ajax('/myMall/itemDetail/delete.do',deldata,'text',function(data){
			if(data=="1"){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
				layer.msg("删除成功!");
				$("#selectItemDetail").click();
			}else{
				layer.msg("删除失败!");			
				$("#selectItemDetail").click();
			}
		})		
		});	
	}	
	
 	function myupload(code){
		openLayer('/myMall/Admin/itemDetailInfo/itemDetailImg.jsp?itemDetailCode='+code,function(){				
			$("#selectItemDetail").click();
		});	
	} 
	
	</script>
</body>
</html>