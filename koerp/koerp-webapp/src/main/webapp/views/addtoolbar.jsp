<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  

<div id="addtoolbar" class="toolbar" data-options="region:'center'">	
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="saveData()">提交</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="cancel()">取消</a>			
</div> 

<script type="text/javascript">

/**
 * 保存单据
 */
function saveData(){
	//获取保存数据
	var saveData = getSaveData();
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