<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>客户管理</title>
		<link rel="stylesheet" href="../resources/css/styles.css"/>
		<link rel="stylesheet"  href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="../resources/easyui/easyui/1.3.4/themes/default/easyui.css" />
		<script type="text/javascript" src="../resources/easyui/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../resources/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>

	</head>
	<body>
		<div class="condition">
			用户名：<input id="search-name" type="text">
			<button id="search-btn">
				<i class="fa fa-search"></i>
				查询
			</button>
			<button onclick="openAdd()" plain="true">
				<i class="fa fa-plus"></i>
				新增
			</button>
			<button onclick="openEdit()" plain="true">
				<i class="fa fa-edit"></i>
				修改
			</button>
			<button onclick="remove()" plain="true">
				<i class="fa fa-remove"></i>
				删除
			</button>

		</div>
		<div class="easyui-layout" style="background-color：black;" data-options="fit:true"><div data-options="region:'center',border:false"><table id="data-datagrid" class="tablelist"></table></div></div>
<!-- 新增窗口 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">用户名:</td>
                <td><input type="text" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">密码:</td>
                <td><input type="password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写密码'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">真实姓名:</td>
                <td><input type="text" name="realName" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td width="60" align="right">手机号:</td>
                <td><input type="text" maxlength="11" name="phone" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td width="60" align="right">地址:</td>
                <td><input type="text" name="address" class="wu-text easyui-validatebox" /></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td width="60" align="right">用户名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">密码:</td>
                <td><input type="password" id="edit-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写密码'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">真实姓名:</td>
                <td><input type="text" id="edit-realName" name="realName" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td width="60" align="right">手机号:</td>
                <td><input type="text" maxlength="11" id="edit-phone" name="phone" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td width="60" align="right">地址:</td>
                <td><input type="text" id="edit-address" name="address" class="wu-text easyui-validatebox" /></td>
            </tr>
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	
	
	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* Name 修改记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加用户信息",
            buttons: [{
                text: '确定',
                iconCls: 'fa fa-check',
                handler: add
            }, {
                text: '取消',
                iconCls: 'fa fa-remove',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            }
        });
	}
	
	/**
	* 打开修改窗口
	*/
	function openEdit(){
		//$('#edit-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请选择一条数据进行修改！','info');
			return;
		}
		item = item[0];
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改用户信息",
            buttons: [{
                text: '确定',
                iconCls: 'fa fa-check',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'fa fa-remove',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.id);
            	$("#edit-name").val(item.name);
            	$("#edit-password").val(item.password);
            	$("#edit-realName").val(item.realName);
            	$("#edit-phone").val(item.phone);
            	$("#edit-address").val(item.address);
            }
        });
	}	
	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		$('#data-datagrid').datagrid('reload',option);
	});
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			//{ field:'chk',checkbox:true},
			{ field:'name',title:'用户名',width:100,sortable:true},
			{ field:'password',title:'密码',width:100},
			{ field:'realName',title:'真实姓名',width:100},
			{ field:'phone',title:'手机号',width:100},
			{ field:'address',title:'地址',width:200}
		]],
		onLoadSuccess:function(data){  
			//$('.authority-edit').linkbutton({text:'编辑权限',plain:true,iconCls:'icon-edit'});  
		 }  
	});
</script>