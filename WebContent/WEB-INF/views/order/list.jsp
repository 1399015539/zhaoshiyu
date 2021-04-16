<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单信息</title>
		<link rel="stylesheet" href="../resources/css/styles.css"/>
		<link rel="stylesheet"  href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="../resources/easyui/easyui/1.3.4/themes/default/easyui.css" />
		<script type="text/javascript" src="../resources/easyui/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../resources/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>

	</head>
	<body>
		<div class="condition">
			用户名：<input id="search-name" type="text">
			<label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">待制作</option>
            	<option value="1">已制作，待上菜</option>
            	<option value="2">已上菜，待结账</option>
            	<option value="3">已结账</option>
            </select>
			<button id="search-btn">
				<i class="fa fa-search"></i>
				查询
			</button>
			<button onclick="openView()" plain="true">
				<i class="fa fa-th"></i>
				查看
			</button>
			<button onclick="openEdit()" plain="true">
				<i class="fa fa-edit"></i>
				修改
			</button>

		</div>
	<div class="easyui-layout" style="background-color：black;" data-options="fit:true"><div data-options="region:'center',border:false"><table id="data-datagrid" class="tablelist"></table></div></div>
<!-- 查看窗口 -->
<div id="view-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<table id="order-items" class="easyui-datagrid" style="width:425px;height:300;">
	<thead>
		<tr>
			<th field="foodImage" width="100">菜品图片</th>
			<th field="foodName" width="100">菜品名称</th>
			<th field="foodNum" width="70">菜品数量</th>
			<th field="price" width="70">菜品单价</th>
			<th field="money" width="70">总额</th>
		</tr>                          
	</thead>                           
	<tbody>                            
	</tbody>                           
</table>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
           <tr>
                <td align="right">联系人:</td>
                <td><input type="text" id="edit-recieveName" name="recieveName" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写联系人'" /></td>
            </tr>
            <tr>
                <td align="right">手机号:</td>
                <td><input type="text" id="edit-phone" name="phone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写联系人手机号码'" /></td>
            </tr>
            <tr>
                <td align="right">送货地址:</td>
                <td><input type="text" id="edit-address" name="address" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写送货地址'" /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
                	<select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		                <option value="0">待制作</option>
            			<option value="1">已制作，待上菜</option>
            			<option value="2">已上菜，待结账</option>
            			<option value="3">已结账</option>
		            </select>
                </td>
            </tr>
        </table>
    </form>
</div>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	
	
	
	
	/**
	*  编辑修改
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
					//$("#add-name").val('');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	
	/**
	* Name 打开查看窗口
	*/
	function openView(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要查看的数据！','info');
			return;
		}
		$('#view-dialog').dialog({
			closed: false,
			modal:true,
            title: "查看订单商品信息",
            buttons: [{
                text: '确定',
                iconCls: 'fa fa-check',
                handler: function () {
                    $('#view-dialog').dialog('close');                    
                }
            }, {
                text: '取消',
                iconCls: 'fa fa-remove',
                handler: function () {
                    $('#view-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$('#order-items').datagrid('loadData',{total:0,rows:[]})
            	for(var i=0;i<item.orderItems.length;i++){
            		$("#order-items").datagrid('appendRow',{
                		foodImage: '<img src="'+item.orderItems[i].foodImage+'" width="100px">',
                		foodName: item.orderItems[i].foodName,
                		foodNum: item.orderItems[i].foodNum,
                		price: item.orderItems[i].price,
                		money: item.orderItems[i].money
                		});
            	}
            }
        });
	}
	
	/**
	* Name 打开修改窗口
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改订单信息",
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
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.id);
            	$("#edit-recieveName").val(item.recieveName);
            	$("#edit-phone").val(item.phone);
            	$("#edit-address").val(item.address);
            	$("#edit-status").combobox('setValue',item.status);
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var status = $("#search-status").combobox('getValue')
		if(status != -1){
			option.status = status;
		}
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
	
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
			//	{ field:'chk',checkbox:true},
			{ field:'accountId',title:'用户名',width:100,formatter:function(value,row,index){
				return row.account.name;
			}},
			{ field:'money',title:'订单总额',width:50,sortable:true},
			{ field:'productNum',title:'商品数量',width:50,sortable:true},
			{ field:'status',title:'状态',width:50,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '待制作';	
					}
					case 1:{
						return '已制作，待上菜';	
					}
					case 2:{
						return '已上菜，待结账';	
					}
					case 3:{
						return '已结账';	
					}
				}
				return value;
			}},
			{ field:'recieveName',title:'联系人',width:100,sortable:true},
			{ field:'phone',title:'联系手机',width:100,sortable:true},
			{ field:'address',title:'桌号',width:200,sortable:true},
			{ field:'createTime',title:'下单时间',width:100,formatter:function(value,row,index){
				return format(value);
			}}
		]]
	});
</script>
</body>
</html>
