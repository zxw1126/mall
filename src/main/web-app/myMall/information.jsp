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


  <div class="content content-nav-base information-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
             <a href="/myMall/myMall/commodity.jsp" >所有商品</a>
            <a href="/myMall/myMall/buytody.jsp">今日团购</a>
            <a href="/myMall/myMall/information.jsp"  class="active">母婴资讯</a>
            <a href="/myMall/myMall/about.jsp">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="info-list-box">
      <div class="info-list w1200">
        <div class="item-box layui-clear" id="list-cont">
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new1.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="/myMall/common/img/new2.jpg" alt="">
            </div>
            <div class="text">
              <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
            </div>
          </div>
        </div>
        <div id="demo0" style="text-align: center;"></div>
      </div>
    </div>
  </div>
  <!-- 模版引擎导入 -->
  <!-- <script type="text/html" id="demo">
    {{# layui.each(d.listCont,function(index,item){}}
    <div class="item">
      <div class="img">
        <img src="../res/img/new1.jpg" alt="">
      </div>
      <div class="text">
        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
        <p class="data">2016-12-24 16:33:26</p>
        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
      </div>
    </div>
    {{# })}}
  </script> -->
<script>
  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage'],function(){
      var
      mm = layui.mm,laypage = layui.laypage;
      laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });
    // 模版引擎导入
     // var html = demo.innerHTML;
     // var listCont = document.getElementById('list-cont');
     //  mm.request({
     //    url: '../json/information.json',
     //    success : function(res){
     //      console.log(res)
     //      listCont.innerHTML = mm.renderHtml(html,res)
     //    },
     //    error: function(res){
     //      console.log(res);
     //    }
     //  })   
});

</script>


</body>
</html>