<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<style>
.toolbar{
	height:30px;
	overflow:hidden;
	border: 1px solid #D3D3D3;	
	background: #f3f3f3;
	padding-top:2px;
}
</style>

<div id="detailtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" class="easyui-linkbutton" iconCls="icon-disk" plain="true" onclick="saveRulPrice()">保存</a>	
	<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="refreshRulPrice()">刷新</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddView()">添加店仓</a>	
</div>

<script type="text/javascript">

/**
 * 保存订单配置信息
 */
function saveRulPrice(){	

	//获取参数
	var rulPriceDto = getRulPriceInfo();
	if(rulPriceDto==null){
		return;
	}
 	
	$.ajax({
        type: "POST",
        dataType: "json",
        contentType:"application/json;charset=utf-8",
        async:false,
        url: "${api}/bus/rule/price/updateEntity",
        data: JSON.stringify(rulPriceDto),
        beforeSend: function (jqXHR) {  
        	$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});       	
        },
        success: function(result, textStatus) {       	
        	if(result.status){
        		$.messager.show({ title: '提示信息', msg : "操作成功!" });
        		refreshRulPrice();
        	}else{
        		$.messager.alert("错误", result.message, "error");        		          	
        	}    			                				                															                	
        },
        error: function(jqXHR, textStatus, errorThrown) {         	
        	$.messager.alert("错误", errorThrown, "error"); 
		},
		complete: function (jqXHR, textStatus) {
			$.messager.progress('close');
	    }
    });
}

/**
 * 刷新配置页面
 */
function refreshRulPrice(){
	//加载数据
	definedLoadData(currRulId,  $("#fm"));	
}
</script>