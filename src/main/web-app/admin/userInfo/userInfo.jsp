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
		<legend>用户信息</legend>
	</fieldset>		
		
	<div class="layui-form-item">	
		<div class="layui-inline">
		
			<label class="layui-form-label">账号:</label>			
			<div class="layui-input-inline">
				<input type="text" name="selcode" class="layui-input" id="selcode" placeholder="请输入账号" />
			</div>
		
		<div class="layui-inline">		
			<div class="layui-form-item">
				<label class="layui-form-label">姓名:</label>			
				<div class="layui-input-inline">
					<input type="text" name="selusername" class="layui-input" id="selusername" placeholder="请输入姓名" />
				</div>
				
				<div class="layui-inline">
					<input type="reset" id="reset" class="layui-btn" value="重置" />
					<input type="button" id="selectuser" class="layui-btn" value="查询" />
					<input type="button" id="adduser" class="layui-btn" value="添加" />
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
				<col width="200">
				<col width="70">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>用户账号</td>
					<td>用户名</td>
					<td>是否为管理员</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
	
	<div id=pager></div>
	<script type="text/javascript">
	
	//弹出层添加方法
	$("#adduser").click(function(){
		openLayer('/myMall/Admin/userInfo/addUser.jsp',function(){				
			$("#selectuser").click();
		});		
		
	})
			
	//查询所有数据
	function selectAll(){
		ajax('/myMall/user/getCount.do',{"getCcount":"1"},'text',function(data){
			//分页方法
			console.log(data);
			setPageInfo('pager',data,function(obj,first){
			    showData(obj.curr,obj.limit);
			    if(!first){
			    	console.log("test first function");
			    }
			})
		});
	};
	
	//查询数据:
	function showData(curr,limit){
		var data = {"pageIndex":curr,"pageLimit":limit,"code":$("#selcode").val(),"username":$("#selusername").val()}
		ajax('/myMall/user/showData.do',data,'JSON',function(data){
			var html = "";
			for(var i=0;i<data.length;i++){
				html += "<tr id='"+data[i].id+"'>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].code+"</td>"+
				"<td>"+data[i].username+"</td>"+
				"<td>"+data[i].admin+"</td>"+
				"<td><div class='layui-input-inline'>"+
				"<button type='button' onclick='myupdate(\""+data[i].code+"\")' class='layui-btn layui-btn-sm'>修改</button>"+
				"<button type='button' onclick='myreset(\""+data[i].code+"\")' class='layui-btn layui-btn-sm'>重置密码</button>"+
				"<button type='button' onclick='mydelete("+data[i].id+")' class='layui-btn layui-btn-sm'>删除</button>"+
				"</div></td>"+
				"</tr>";
			}
			$("#tbody").html(html)
		})
	}
	//查询按钮方法:
	$("#selectuser").click(function(){
		selectAll();
	});	
	$("#selectuser").click();
	
	$("#reset").click(function(){
		$("#selcode").val("");
		$("#selusername").val("");
		$("#selectuser").click();
	})
	
	function myupdate(code){
		openLayer('/myMall/Admin/userInfo/updUser.jsp?code='+code,function(){				
			$("#selectuser").click();
		});
		
	}
	
	function mydelete(id){
		layer.confirm("确定进行该操作？", {icon : 3,	title : '提示'}, function(){
		var deldata = {"id":id}
		ajax('/myMall/user/delete.do',deldata,'text',function(data){
			if(data=="1"){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);	
				layer.msg("删除成功!");
				$("#selectuser").click();
			}else{
				layer.msg("删除失败!");			
				$("#selectuser").click();
			}
		})		
		});	
	}
	
	function myreset(code){
		openLayer('/myMall/Admin/userInfo/resetPwd.jsp?code='+code,function(){				
			$("#selectuser").click();
		});	
	}
	
</script>
	
	
</body>
</html>