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
  <script type="text/javascript" src="/myMall/common/js/util/mm.js"></script>
  <script type="text/javascript" src="/myMall/common/js/util/car.js"></script>
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


  <div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div class="list-box">
            <dl>
             <dt>奶粉辅食</dt>
             <dd><a href="javascript:userView('1100001001');">进口奶粉</a></dd>
             <dd><a href="javascript:userView('1100001002');">宝宝辅食</a></dd>
             <dd><a href="javascript:userView('1100001003');">营养品</a></dd>
            </dl>
            <dl>
             <dt>儿童用品</dt>
             <dd><a href="javascript:userView('1100002001');">纸尿裤</a></dd>
             <dd><a href="javascript:userView('1100002002');">婴儿湿巾</a></dd>
             <dd><a href="javascript:userView('1100002003');">婴儿车</a></dd>
             <dd><a href="javascript:userView('1100002004');">婴儿床</a></dd>
             <dd><a href="javascript:userView('1100002005');">儿童安全座椅</a></dd>
            </dl>
            <dl>
             <dt>儿童早教</dt>
             <dd><a href="javascript:userView('1100003001');">儿童玩具</a></dd>
             <dd><a href="javascript:userView('1100003002');">早教书籍</a></dd>
             <dd><a href="javascript:userView('1100003003');">孕产育儿书</a></dd>
            </dl>
            <dl>
             <dt>儿童服饰</dt>
             <dd><a href="javascript:userView('1100004001');">童装</a></dd>
             <dd><a href="javascript:userView('1100004002');">童鞋</a></dd>
             <dd><a href="javascript:userView('1100004003');">宝宝配饰</a></dd>
            </dl>
            <dl>
             <dt>孕妈专区</dt>
             <dd><a href="javascript:userView('1100005001');">孕妇装</a></dd>
             <dd><a href="javascript:userView('1100005002');">孕妇护肤</a></dd>
             <dd><a href="javascript:userView('1100005003');">孕妇用品</a></dd>
            </dl>
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a class="active" href="javascript:;" event = 'volume'>销量</a>
              <a href="javascript:;" event = 'price'>价格</a>
              <a href="javascript:;" event = 'newprod'>新品</a>
              <a href="javascript:;" event = 'collection'>收藏</a>
            </div>
            <div class="prod-number">
              <span id="itemNumber">200个</span>
            </div>
            
            <div class="cont-list layui-clear" id="list-cont">
            
            <!-- <div class="layui-body" style="margin-top:290px; margin-left:170px;height:2200px;overflow:hidden">
				<iframe name="rightframe" width="99%" height="99%"></iframe>
				<div style="padding: 15px;">内容主体区域</div>			
			 </div> -->
               
               <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img1.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img2.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="img">
                  <a href="javascript:;"><img src="/myMall/common/img/paging_img3.jpg"></a>
                </div>
                <div class="text">
                  <p class="title">森系小清新四件套</p>
                  <p class="price">
                    <span class="pri">￥200</span>
                    <span class="nub">1266付款</span>
                  </p>
                </div>
              </div>   
              
            </div>
            <!-- 模版引擎导入 -->
            <!-- <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}    
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script> -->
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script>

  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });


    // 模版引擎导入
    //  var html = demo.innerHTML;
    //  var listCont = document.getElementById('list-cont');
    //  // console.log(layui.router("#/about.html"))
    // mm.request({
    //     url: '../json/commodity.json',
    //     success : function(res){
    //       console.log(res)
    //       listCont.innerHTML = mm.renderHtml(html,res)
    //     },
    //     error: function(res){
    //       console.log(res);
    //     }
    //   })

    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    })
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }
    })

});
  
	function userView(itemCode) {
		ajax("/myMall/itemImg/userImgView.do",{"itemCode":itemCode},"JSON",function(data){
			console.log(data)
			var html="";
			html +="<div class='cont-list layui-clear' id='list-cont'>"
			for(var i=0;i<data.length;i++){
				html +='<div class="item"><div class="img" >'+
				'<a href="/myMall/myMall/details.jsp?code='+data[i].code+'">'+
				'<img style="width=300px;height:280px;" src="/myMall/Admin/itemImg/'+data[i].url+'"></a></div>'+
				'<div class="text">'+
				'<p class="title">'+data[i].name+'</p>'+
				'<p class="price"><span class="pri">￥'+data[i].price+'</span>&nbsp;&nbsp;'+
				'<span class="nub">'+data[i].inventory+'件存货</span></p></div></div>';
			}
			html += "</div>"
			$("#list-cont").html(html)
	})
	}
</script>


</body>
</html>