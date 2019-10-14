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
		<legend>添加商品图片</legend>
	</fieldset>	
	
	<div class="layui-upload">
  		<button type="button" class="layui-btn layui-btn-normal" id="testList">选择文件</button>
		<div class="layui-upload-list">
			<table class="layui-table">
				<thead>
					<tr>
						<th>文件名</th>
						<th>大小</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="demoList">
				</tbody>
			</table>
		</div>
		<button type="button" class="layui-btn" id="testListAction">开始上传</button>
	</div> 
 <script type="text/javascript">
 

 var itemDetailCode = "<%=request.getParameter("itemDetailCode")%>";
 console.log(itemDetailCode);
 var demoListView = $('#demoList')
 ,uploadListIns = upload.render({
   elem: '#testList'
   ,url: '/myMall/itemImg/addImg.do?itemDetailCode='+itemDetailCode
   ,accept: 'image'
   ,multiple: true
   ,auto: false
   ,bindAction: '#testListAction'
   ,choose: function(obj){   
     var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
     //读取本地文件
     obj.preview(function(index, file, result){
       var tr = $(['<tr id="upload-'+ index +'">'
         ,'<td>'+ file.name +'</td>'
         ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
         ,'<td>等待上传</td>'
         ,'<td>'
           ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
           ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
         ,'</td>'
       ,'</tr>'].join(''));
       
       //单个重传
       tr.find('.demo-reload').on('click', function(){
         obj.upload(index, file);
       });
       
       //删除
       tr.find('.demo-delete').on('click', function(){
         delete files[index]; //删除对应的文件
         tr.remove();
         uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
       });
       
       demoListView.append(tr);
     });
   }
   ,done: function(res, index, upload){
 	  console.log("上传成功")
 	  console.log(res)
 	  console.log(index)
 	  console.log(upload)
     if(res == "1"){ //上传成功
     	console.log("进入成功if方法")
       var tr = demoListView.find('tr#upload-'+ index)
       ,tds = tr.children();
       tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
       tds.eq(3).html(''); //清空操作
       return delete this.files[index]; //删除文件队列已经上传成功的文件
     }
     this.error(index, upload);
   }
   ,error: function(index, upload){
 	  console.log("上传失败")
 	  console.log(index)
 	  console.log(upload)
     var tr = demoListView.find('tr#upload-'+ index)
     ,tds = tr.children();
     tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
     tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
   }
 });
 
 function closeOpen(){
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);		
	}
 </script> 
		
</body>
</html>