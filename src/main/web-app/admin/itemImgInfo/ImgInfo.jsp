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
		<legend>商品图片维护</legend>
	</fieldset>		
		
	<div class="layui-form-item">	
		<div class="layui-inline">
		
			<label class="layui-form-label">商品码:</label>			
			<div class="layui-input-inline">
				<input type="text" name="selitemcode" class="layui-input" id="selitemcode" placeholder="请输入商品码" />
			</div>
		
		<div class="layui-inline">
		
			<div class="layui-form-item">				
				<div class="layui-inline">
					<input type="reset" id="reset" class="layui-btn" value="重置" />
					<input type="button" id="selectItemImg" class="layui-btn" value="查询" />
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
				<col width="70">
				<col width="200">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>商品码</td>
					<td>路径</td>
					<td>类型</td>
					<td>图片</td>
					<td>操作</td>
					
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
	
	<div id=pager></div>
<script type="text/javascript">
	
/* 	//弹出层添加方法
	function myupload(){		
		openLayer('/myMall/Admin/itemImgInfo/addImg.jsp',function(){				
			$("#selectItemImg").click();
		});		
		
	} */
	
	
		
	//查询所有数据
	function selectAll(){
		ajax('/myMall/itemImg/getCount.do',{"getCount":"1"},'text',function(data){
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
		var data = {"pageIndex":curr,"pageLimit":limit,"itemDetailCode":$("#selitemcode").val()}
		ajax('/myMall/itemImg/showDataTwo.do',data,'JSON',function(data){
			var html = "";
			console.log(data);
			for(var i=0;i<data.length;i++){
				html += "<tr id='"+data[i].id+"'>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].itemDetailCode+"</td>"+
				"<td>"+data[i].url+"</td>"+
				"<td>"+data[i].type+"</td>"+
				"<td><img src='/myMall/Admin/itemImg/"+data[i].url+"'></td>"+
				"<td><div class='layui-input-inline'>"+
				"<button type='button' onclick='mydelete("+data[i].id+")' class='layui-btn layui-btn-sm'>删除</button>"+
				"</div></td>"+
				"</tr>";
			}
			$("#tbody").html(html)
		})
	}
	//查询按钮方法:
	$("#selectItemImg").click(function(){
		selectAll();
	});	
	$("#selectItemImg").click();
	
	$("#reset").click(function(){
		$("#selitemcode").val("");
		$("#selectItemImg").click();
	})
	
	
/* 	//修改方法
	function myupdate(id){
		openLayer('/myall/itemImg/updItemImg.jsp?id='+id,function(){				
			$("#selectItemImg").click();
		});
		
	} */
	
	//删除方法
	function mydelete(id){
		layer.confirm("确定进行该操作？", {icon : 3,	title : '提示'}, function(){
		var deldata = {"id":id}
		ajax('/myMall/itemImg/delete.do',deldata,'text',function(data){
			if(data=="1"){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
				layer.msg("删除成功!");
				$("#selectItemImg").click();
			}else{
				layer.msg("删除失败!");			
				$("#selectItemImg").click();
			}
		})		
		});	
	}			
	</script>
		
	
</body>
</html>