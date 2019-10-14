var con = {
	app : "/mall",
	jsp_login : "/mall/login.jsp",
	jsp_reg : "/mall/register.jsp"
}
var form = layui.form;
var $ = layui.jquery;
var layer = layui.layer;
var element = layui.element;
var laypage = layui.laypage;
var laytpl = layui.laytpl;
var laydate = layui.laydate;
var upload = layui.upload;

//进入某个页面
function toJsp(url) {
	location.href = con.app + url;
}

//进入登录页面
function goJspLogin(){
	location.href = "/mall/login.jsp";
}

//进入注册页面
function goJspReg(){
	location.href = "/mall/user/addUser.jsp";	
}

//弹出确认框,传入方法名和弹窗信息  第一个参数为函数,第二个参数为标题
function openConfirm(func,title){
	layer.confirm(title ? title : "确定进行该操作？", {
		icon : 3,
		title : '提示'
	}, func);
}

//注销方法
function goLogout(){
	openConfirm(function(index){
		layer.close(layer.index);
	},"确定注销?");
}

//表单提交监听,第一个参数:地址,第二个参数:提交的表单名,第三个参数:返回数据类型,第四个参数,啊炸克死成功方法
function formSubmit(url,submit,dataType,func){
		console.log(submit)
		console.log("进入表单提交方法")
		form.on(submit,function(data){			
				console.log(data.field)
				ajax(url,data.field,dataType,func);
				return false;			
			
		})		
}

//阿扎克斯方法
function ajax(url,data,dataType,func){
	console.log("进入ajax方法")
		$.ajax({
			type:"POST",
			url:url,
			data:data,
			dataType:dataType,
			success:func
		})
}

//弹出层方法
function openLayer(url,end){
	layer.open({
		type:2,
		area:['800px','550px'],
		fixed:false,
		maxmin:true,
		shadeClose:true,
		end:end,
		content:url
	})
}

//关闭方法
function closeThis(time){
	setTimeout(function(){
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);		
	},time?time:200)
}

//分页功能
function setPageInfo(elem,count,jump){
	laypage.render({
		elem:elem,
		count:count,
		curr:1,
		limit:10,
		limits:[10,20,30,40,50],
		layout:['count','prev','page','next','limit','refresh','skip'],
		jump:jump
	});
}

//好像是传入需要渲染的组件格式为 #+组件ID  data:好像是要渲染的东西()
function getlaytpl(sel,data){
	return laytpl($(sel).html()).render(data);
}


//渲染时间组件 传入时间组件ID,和需要的值
function renderLaydate(id,value){
	laydate.render({
		elem:'#'+id,
		type:'date',
		value: value?value:new Date(),
		trigger:'click'
	})
}

//渲染上传图片组件: 第一个参数:渲染的组件ID,路径,data:好像可以传函数或者数据,done:下面的注释
function renderUpload(id,url,data,done){
	var uploadInst = upload.render({
		elem:'#'+id,
		url:con.app+url,
		data:data,
		done:done
	});
}

//function(res, index, upload){
//    //假设code=0代表上传成功
//    if(res.code == 0){
//      //do something （比如将res返回的图片链接保存到表单的隐藏域）
//    }
//    
//    //获取当前触发上传的元素，一般用于 elem 绑定 class 的情况，注意：此乃 layui 2.1.0 新增
//    var item = this.item;
//    
//    //文件保存失败
//    //do something
//  }

