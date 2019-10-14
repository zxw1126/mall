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
<fieldset class="layui-elem-field layui-field-title"> 商品图片</fieldset>
	<button type="button" id="addImg" class='layui-btn layui-btn-sm' >添加图片</button>
	<form class="layui-form">
	<input type="hidden" id = "itemDetailCode" name = "itemDetailCode" value="<%=request.getParameter("itemDetailCode") %>">
		<table class="layui-table" id="table" lay-size="lg">
			<colgroup>
				<col width="70">
				<col width="100">
				<col width="70">
				<col width="200">
			</colgroup>
		
			<thead>
				<tr>
					<td>ID</td>
					<td>路径</td>
					<td>图片</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<tbody id="tbody"></tbody>
		</table>
	</form>
<script type="text/javascript">
var itemDetailCode = $("#itemDetailCode").val()
console.log(itemDetailCode)
function showData(code){
	ajax("/myMall/itemImg/showData.do",{"itemDetailCode":itemDetailCode},"JSON",function(data){
		console.log(data)
		var ht="";
		for(var i=0;i<data.length;i++){
			if(data[i].type=="1"){
				ht +="<tr><td>"+data[i].id+"</td>"+
				"<td>"+data[i].url+"</td>"+
				"<td><img src='/myMall/Admin/itemImg/"+data[i].url+"'></td>"+
				"<td><button type='button' onclick='setMain(\""+data[i].url+"\",\""+data[i].itemDetailCode+"\")' class='layui-btn layui-btn-sm'>设为主图</button>"+
				"<button type='button' onclick='mydelete(\""+data[i].id+"\")' class='layui-btn layui-btn-sm'>删除</button></td></tr>";				
			}else{
				ht +="<tr><td>"+data[i].id+"</td>"+
				"<td>"+data[i].url+"</td>"+
				"<td><img src='/myMall/Admin/itemImg/"+data[i].url+"'></td>"+
				"<td><button type='button' class='layui-btn layui-btn-sm'>主图</button>"+
				"<button type='button' onclick='mydelete(\""+data[i].id+"\")' class='layui-btn layui-btn-sm'>删除</button></td></tr>";		
			}
		}
		$("#tbody").html(ht)
	})
}

showData(itemDetailCode);

$("#addImg").click(function(){
	openLayer("/myMall/Admin/itemImgInfo/addImg.jsp?itemDetailCode="+itemDetailCode,function(){
		
	})
})

function setMain(url,code){
	ajax("/myMall/itemImg/setMain.do",{"url":url,"itemDetailCode":code},"JSON",function(data){		
		if (data != "0")
			showData(itemDetailCode)
		else
			layer.msg("设置失败")	
		})
	}

function mydelete(id){
	ajax("/myMall/itemImg/delete.do",{"id":id},"JSON",function(data){		
		if(data=="1"){
			layer.msg("删除成功");
			showData(itemDetailCode)
		}		
		else
			layer.msg("删除失败");
	})
}
</script>
</body>
</html>