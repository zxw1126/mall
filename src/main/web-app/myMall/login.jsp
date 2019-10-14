<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/myMall/common/css/main.css">
  <link rel="stylesheet" type="text/css" href="/myMall/layui/css/layui.css">
  <script type="text/javascript" src="/myMall/layui/layui.all.js"></script>
  <script type="text/javascript" src="/myMall/common/js/util/common.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="/myMall/myMall/index.jsp">首页</a>
      </p>
      <div class="sn-quick-menu">
         <div class="login"><a href="/myMall/myMall/login.jsp">登录</a></div>
        <div class="sp-cart"><a href="/myMall/myMall/shopcart.jsp">购物车</a><span>2</span></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
            <img src="/myMall/common/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="/mall/commodity.jsp" class="active">所有商品</a>
            <a href="/mall/buytody.jsp">今日团购</a>
            <a href="/mall/information.jsp">母婴资讯</a>
            <a href="/mall/about.jsp">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form">
            <legend>用户登录</legend>
            
            <div class="layui-form-item">
              <div class="layui-inline">
                <div class="layui-input-inline">                
              	   账号: <input type="text" name="code" id="code" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
                </div>
              </div>
              
              <div class="layui-inline">
                <div class="layui-input-inline">                
                 	密码: <input type="password" name="password" id="password" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              
              <div class="layui-inline">
                <div class="layui-input-inline">
                <img src="/myMall/autoCode/produce.do" onclick="this.src='/myMall/autoCode/produce.do?'+Math.random()">
             	   验证码:<input id="pnum" type="text" name="pnum"  placeholder="请输入验证码" autocomplete="off" class="layui-input">       
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" >登录</button>              
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                 <button type="button" class="layui-btn" id="regsiter">注册</button>      
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">母婴资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
  </div>
  <script type="text/javascript">
 /*   layui.config({
      base: '../res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','form'],function(){
          var $ = layui.$,form = layui.form;


        $("#find").click(function() {
            if(!/^1\d{10}$/.test($("#phone").val())){
              layer.msg("请输入正确的手机号");
              return false;
            }
            var obj=this;
            $.ajax({
                type:"get",
                url:"../json/login.json",
                dataType:"json",//返回的
                success:function(data) {
                    
                    if(data.result){
                        $("#find").addClass(" layui-btn-disabled");
                        $('#find').attr('disabled',"true");
                        settime(obj);
                        $("#msg").text(data.msg);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(msg) {
                    console.log(msg);
                }
            }); 
        })
        var countdown=60; 
        function settime(obj) { 
        if (countdown == 0) { 
            obj.removeAttribute("disabled"); 
            obj.classList.remove("layui-btn-disabled")
            obj.value="获取验证码"; 
            countdown = 60; 
            return;
        } else { 
            
            obj.value="重新发送(" + countdown + ")"; 
            countdown--; 
        } 
        setTimeout(function() { 
            settime(obj) }
            ,1000) 
        }
    }) */
    
    //测试姓名是否存在
    $("#code").blur(function(){
    	var data = {"code":$("#code").val()}
    	ajax("/myMall/user/testName.do",data,"text",function(data){
    		console.log(data)
    		if(data=="1"){
    			console.log("行")
    		}else{
    			console.log("不行")
    			layer.msg("账号不存在")
    		}
    	})
    })
    
	//弹出层注册方法
    $("#regsiter").click(function(){
    	openLayer('/myMall/Admin/userInfo/addUser.jsp',function(){				
		});		
    })
    
    formSubmit("/myMall/user/login.do","submit(demo1)","text",function(data){
    	if(data=="NO"){
    		layer.msg("验证码输入错误")
    	} else{   		
    	window.location.href="/myMall/"+data;
    	}   	
    })	

  </script>

</body>
</html>