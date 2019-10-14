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

<input type="hidden" id="code" name="code" value="<%=request.getParameter("code") %>">
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
       <div class="login"><a href="/mall/login.jsp">登录</a></div>
        <div class="sp-cart"><a href="/mall/shopcart.jsp">购物车</a><span>2</span></div>
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


  <div class="content content-nav-base datails-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
              <a href="/myMall/myMall/commodity.jsp" class="active">所有商品</a>
            <a href="/myMall/myMall/buytody.jsp" >今日团购</a>
            <a href="/myMall/myMall/information.jsp">母婴资讯</a>
            <a href="/myMall/myMall/about.jsp" >关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="data-cont-wrap w1200">
      <div class="crumb">
        <a href="javascript:;">首页</a>
        <span>></span>
        <a href="javascript:;">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img id="itemImg" style="height:400px;width:380px" src=""></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4 id="itemName">男女宝宝秋冬装套装0一1岁婴儿衣服潮加厚连体衣保暖冬季外出抱衣 </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
            <!--   <p class="reference"><span>参考价</span> <del id="itemPrice">￥280.00</del></p> -->
              <p class="activity"><span>参考价</span><strong class="price"><i>￥</i><span id="itemPrice"></span></strong></p>
              <p class="activity"><span>存货</span><span id="inventory"></span>件</p>
              <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">内地</strong></p>
            </div>
            <div class="choose-attrs">
              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="itemNumber" value="1"><span class="add btn">+</span></div></div>
            </div>
            <div class="choose-btns">
              <button class="layui-btn layui-btn-primary purchase-btn" id="buyNow">立刻购买</button>
              <button class="layui-btn  layui-btn-danger car-btn" id="toCart"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  
            </div>
          </div>
        </div>
      </div>
      <div class="layui-clear">
        <div class="aside">
          <h4>热销推荐</h4>
          <div class="item-list">
            <div class="item">
              <img id="itemImg0" style="height:280px;width:280px" src="">
              <p><span id="itemName0"></span><span class="pric" id="price0"></span></p>
            </div>
            <div class="item">
              <img id="itemImg1" style="height:280px;width:280px"  src="">
              <p><span id="itemName1"></span><span class="pric" id="price1"></span></p>
            </div>
            
            <div class="item">
              <img id="itemImg2"  style="height:280px;width:280px" src="">
              <p><span id="itemName2"></span><span class="pric" id="price2"></span></p>
            </div>
            
            <div class="item">
              <img id="itemImg3" style="height:280px;width:280px"  src="/myMall/common/img/details_img2.jpg">
              <p><span id="itemName3" >可爱宝宝粉色连体秋裤</span><span  id="price3" class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img id="itemImg4"  style="height:280px;width:280px"  src="/myMall/common/img/details_img2.jpg">
              <p><span id="itemName4">可爱宝宝粉色连体秋裤</span><span  id="price4" class="pric">￥99.00</span></p>
            </div>
            <div class="item">
              <img id="itemImg5" style="height:280px;width:280px"   src="/myMall/common/img/details_img2.jpg">
              <p><span id="itemName5">可爱宝宝粉色连体秋裤</span><span  id="price5" class="pric">￥99.00</span></p>
            </div>
          </div>
        </div>
        <div class="detail">
          <h4>详情</h4>
          <div class="item">
            <img src="/myMall/common/img/details_imgbig.jpg">
          </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
var userInfo = <%=request.getSession().getAttribute("user")%>
console.log(userInfo)
  layui.config({
    base: '/myMall/common/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery'],function(){
      var mm = layui.mm,$ = layui.$;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur)
      })
      
  });
   
  var itemInfo=null;
  ajax("/myMall/itemDetail/showItemDetail.do",{"code":$("#code").val(),"pageIndex":-1},"JSON",function(data){
	  console.log(1)
	  console.log(data[0])
	  $("#itemPrice").html(data[0].price)	 
	  $("#inventory").html(data[0].inventory)
	  $("#itemName").html(data[0].name)
	  
	  details(data[0].itemCode)
	 
  }) 
  ajax("/myMall/itemImg/showItemDetailImg.do",{"itemDetailCode":$("#code").val(),"pageIndex":-1},"JSON",function(data){
	  console.log(2)
	  console.log(data)
	   $("#itemImg").attr("src","/myMall/Admin/itemImg/"+data[0].url)
	   $("#itemImg0").attr("src","/myMall/Admin/itemImg/"+data[1].url)
	   $("#itemImg1").attr("src","/myMall/Admin/itemImg/"+data[2].url)
	   $("#itemImg2").attr("src","/myMall/Admin/itemImg/"+data[3].url)
  })
  
  function details(itemCode){
  console.log(itemCode)
  ajax("/myMall/itemDetail/showItemDetail.do",{"itemCode":itemCode},"JSON",function(data){	 
	  console.log(111)
	  console.log(data)
	  for(var i=0;i<data.length;i++){
	  $("#itemName"+i).html(data[i].name)
	   $("#price"+i).html("￥"+data[i].price)		  
	  }

  })	  
  }
  
  $("#buyNow").click(function(){
	  if(userInfo==null){
		  if(confirm("尚未登录,是否登录"))
		  window.location.href="/myMall/myMall/login.jsp";
	  }else{
		  console.log("购买")
	  }
  })
  
  $("#toCart").click(function(){
/* 	  console.log($("input[name=itemNumber]").val())
	  console.log($("#itemPrice").html())
	  console.log(userInfo.code)
	  console.log($("#code").val()) */
	  var cartData={"userCode":userInfo.code,"itemDetailCode":$("#code").val(),"number":$("input[name=itemNumber]").val(),"price":$("#itemPrice").html()}
	  ajax("/myMall/cart/addCart.do",cartData,"text",function(data){
		  if(data=="1")
			  layer.msg("添加成功")
			  else
				  layer.msg("添加失败")
	  })
  })
  
  
</script>


</body>
</html>