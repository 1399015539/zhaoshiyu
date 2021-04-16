<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>菜单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../resources/layui/css/layui.css" media="all">
    <script src="../resources/layui/layui.js"></script>
    <script src="../resources/js/jquery.js"></script>
	<style>
        img{
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body > 
  <div class="layui-layout layui-layout-admin">
    <!-- 轮播图 -->
    <div class="layui-carousel header" id="test1">
        <div carousel-item>
          <div><img src="../resources/img/01.gif" alt="" style="margin-left: 5%; width: 90%; height: 120px"></div>
          <div><img src="../resources/img/02.gif" alt="" style= "margin-left: 5%; width: 90%; height: 120px"></div>
        </div>
      </div>
      
        <script>
            layui.use('carousel', function(){
                var carousel = layui.carousel;
                //动画类型，高度等
                carousel.render({
                    elem: '#test1',
                    width: '100%' ,   //设置容器宽度
                    height:'130px',
                    interval:3500,      //时间
                    anim: 'default' //切换动画方式
                    });
            }); 
        </script>

      <!-- 侧边框 -->
    <div class="layui-main layui-nav-side" >
    		
          <ul class="layui-nav layui-nav-tree layui-nav-side  layui-nav-itemed " lay-filter="test" style="display: block; margin-top: 130px; width:150px;height:auto;">
            <li class="layui-nav-item layui-nav-itemed  layui-show">
              <a href="javascript:;" data-id="1" data-title="锅底" data-url="guodi.html" style="display:block;"
              class="site-demo-active" data-type="tabAdd">锅底</a>           
            </li>

            <li class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" data-id="2" data-title="肉类" data-url="roulei.html"
              class="site-demo-active" data-type="tabAdd">肉类</a>      
            </li>

            <li class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" data-id="3" data-title="菜类" data-url="cailei.html"
              class="site-demo-active" data-type="tabAdd">菜类</a>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" data-id="4" data-title="小吃" data-url="xiaochi.html"
              class="site-demo-active" data-type="tabAdd">小吃</a>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" data-id="5" data-title="饮料" data-url="yinliao.html"
              class="site-demo-active" data-type="tabAdd">饮料</a>
            </li>

            <li class=" layui-nav-itemed layui-icon layui-icon-cart layui-btn layui-btn-fluid layui-btn-lg" style="font-size: 30px;color: orange;bottom: 0;position: absolute;">
              <a href="shoppingCart.html" data-id="6" data-title="购物车" 
              class="site-demo-active" data-type="tabAdd">购物车</a>
              <dl class="layui-nav-child">
              </dl>
            </li>
          </ul>
    </div>

     <!-- tab标签 -->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 180px;">
      <ul class="layui-tab-title"></ul>
      <div class="layui-tab-content">

      </div>
    </div>
  </div> 

    <script>
      layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;
        var $ = layui.$;
        // 配置tab实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
          var dataid = $(this);
          //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
          if ($(".layui-tab-title li[lay-id]").length <= 0) {
              //如果比零小，则直接打开新的tab项
              active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
          } else {
              //否则判断该tab项是否以及存在
              var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
              $.each($(".layui-tab-title li[lay-id]"), function () {
                  //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                  if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                      isData = true;
                  }
              })
            if (isData == false) {
                //标志为false 新增一个tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
              }
          }
          //最后不管是否新增tab，最后都转到要打开的选项页面上
          active.tabChange(dataid.attr("data-id"));
      });

      var active = {
          //在这里给active绑定几项事件，后面可通过active调用这些事件
          tabAdd: function (url, id, name) {
              //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
              //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
              element.tabAdd('demo', {
                  title: name,
                  content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                  id: id //规定好的id
              })
              FrameWH();  //计算ifram层的大小
          },
          tabChange: function (id) {
              //切换到指定Tab项
              element.tabChange('demo', id); //根据传入的id传入到指定的tab项
          },
          tabDelete: function (id) {
              element.tabDelete("demo", id);//删除
          }
      };
        function FrameWH() {
          var h = $(window).height();
          $("iframe").css("height",h+"px");
        }
      });
    </script>
    <!--
    要实现菜单原属的动态效果，我们必须对element元素进行初始化，同时需要把这段<script>脚本放到菜单布局的后面
    -->
    <!-- <script>
      layui.use('element', function(){
          //导航的hover效果、二级菜单等功能，需要依赖element模块
          var element = layui.element();
          element.init()
      });
    </script> -->
	<iframe data-frameid="0" scrolling="auto" frameborder="0" src="shouye.html" herf="javascript:FrameWH()" style="width:100%;height:85%;"></iframe>
</body>
</html>