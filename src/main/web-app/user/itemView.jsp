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
<body id="tbody" style="float:left">


<script type="text/javascript">
var itemCode = "<%=request.getParameter("itemCode")%>"
console.log(itemCode)

ajax("/myMall/itemImg/userImgView.do",{"itemCode":itemCode},"JSON",function(data){
	console.log(data)
	var html="";
	html +="<div class='cont-list layui-clear' id='list-cont'>"
	for(var i=0;i<data.length;i++){
		html +='<div class="item"><div class="img" >'+
		'<a href="javascript:#;">'+
		'<img style="width=300px;height:280px;" src="/myMall/Admin/itemImg/'+data[i].url+'"></a></div>'+
		'<div class="text">'+
		'<p class="title">'+data[i].name+'</p>'+
		'<p class="price"><span class="pri">￥'+data[i].price+'</span>&nbsp;&nbsp;'+
		'<span class="nub">'+data[i].inventory+'件存货</span></p></div></div>';
	}
	html += "</div>"
	$("#tbody").html(html)
})
</script>
</body>
</html>