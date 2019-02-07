<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style type="text/css"> 

.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	background: #f3f3f3;
	padding-top:2px;
}

.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}

.fsun-wrap {
	border: 1px solid #ccc;
	padding: 15px 5px 5px 5px;
	margin-top: 10px;
}

.fsun-wrap .title {
	position: absolute;
	color: #416AA3;
	font-weight: bold;
	left: 2%;
	line-height: 2em;
	padding: 0 1em;
	background-color: #fff;
}

</style> 

<div id="addtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="orderCancel()">取消订单</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancel()">返回</a>			
</div> 

<script type="text/javascript">

/**
 * 取消订单
 */
function orderCancel(){
	//获取保存数据
	var saveData = getOrderCancelData();
	if(saveData!=null){		
		if(typeof afterSaveFunc === 'function'){	
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
		}else{
			commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
		}		
	}	
}


/**
 * 取消
 */
function cancel(){
	parent.closeCurrTab();
}

</script>