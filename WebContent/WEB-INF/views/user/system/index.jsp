<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<link rel="stylesheet" href="../resources/css/styles.css"/>
		<link rel="stylesheet"  href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<link rel="stylesheet" type="text/css" href="../resources/easyui/easyui/1.3.4/themes/default/easyui.css" />
		<script type="text/javascript" src="../resources/easyui/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../resources/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('.menux p').click(function(){
					$(this).siblings('ul').slideUp(200);
					$(this).next('ul').slideToggle(200);
				});
				$('.menux ul a').click(function(){
					$('iframe').attr("src",$(this).attr("url"));
					$('.menu_title').html($(this).attr("title"));
				});
				$('.user ul a').click(function(){
					$('iframe').attr("src",$(this).attr("url"));
					$('.menu_title').html($(this).attr("title"));
				});
			})
		</script>
	</head>
	<body>
		<div class="header">
			<div class="logo">餐饮管理系统</div>
			<div class="user">
				<i class="fa fa-caret-down point"></i>
				<i class="fa fa-user"></i>
				${role.name}
				<ul>
					<li><a href="javascript:void(0)" url="Password.html" title="修改密码">修改密码</a></li>
					<li><a href="javascript:void(0)" url="userview.html" title="个人信息">个人信息</a></li>
					<li><a href="logout">退出登录</a></li>
				</ul>
			</div>
		</div>
		<div class="left">
			<div class="title">
				<i class="fa fa-home"></i>
				系统功能</div>
			<div class="menux">
				<p>
					<i class="fa fa-info-circle"></i>
					<i class="fa fa-angle-right point"></i>
					当前权限:
				</p>
				<ul class="sub-menu">
					<li><a href="javascript:void(0);" url="../role/list" title="用户管理">
						<i class="fa fa-caret-right"></i>
						角色管理</a>
					</li>
					<li><a href="javascript:void(0);" url="../user/list" title="用户管理">
						<i class="fa fa-caret-right"></i>
						用户管理</a>
					</li>
					<li><a href="javascript:void(0);" url="../food_category/list" title="菜品管理">
						<i class="fa fa-caret-right"></i>
						菜品分类管理</a>
					</li>
					<li><a href="javascript:void(0);" url="../food/list" title="菜品管理">
						<i class="fa fa-caret-right"></i>
						菜品管理</a>
					</li>
					<li><a href="javascript:void(0);" url="../account/list" title="客户管理">
						<i class="fa fa-caret-right"></i>
						客户管理</a>
					</li>
					<li><a href="javascript:void(0);" url="houselist.html" title="仓库管理">
						<i class="fa fa-caret-right"></i>
						仓库管理</a>
					</li>
					<li><a href="javascript:void(0);" url="../order/list" title="订单管理">
						<i class="fa fa-caret-right"></i>
						订单管理</a>
					</li>
					
				</ul>
				
			</div>
		</div>
		<div class="main">
			<div class="location">
				<i class="fa fa-home"></i>
				<span  class="menu_title">欢迎界面</span>
			</div>
			<iframe src="welcome" width="100%" height="100%" frameborder="0px"></iframe>
		</div>
		
	<script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});	
		})
		
		
		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/	
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
	</script>
	</body>
</html>