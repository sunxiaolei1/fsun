<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  

<style type="text/css">

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;
	border-top:0px;
	border-left:0px;
	border-right:0px;
	background: #f3f3f3;
	padding:2px 0px;
}

</style> 

<div id="addtoolbar" class="toolbar" data-options="region:'north'">	
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
		//该订单存在挂账消费记录,故先结款挂账金额
		if(isOpenShow){
			$("<div></div>").dialog({
				id:"payAccountDialog",
			    title:"&nbsp;退货结款",
			    width:"860px",
				height:"350px",
			    iconCls:"icon-script_delete",
			    closed:false,
			    cache:false,
			    href:"${api}/bus/payAccount/toRefundDetailView",
			    modal:true,
			    minimizable:false,//定义是否显示最小化按钮。
		     	maximizable:false,//定义是否显示最大化按钮
		     	closable:true,
		     	resizable:true,//定义对话框是否可调整尺寸
		     	collapsible: false,//是否可折叠的
		      	buttons:[
			      	  {
			      		text:"结算",iconCls:"icon-disk",
			              handler:function(data){	              	
			            	  if(typeof afterSaveFunc === 'function'){	
			      			  	commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
			      			  }else{
			      				commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
			      			  }	
			              }
			          },
			          {
			              text:"取消",
			              iconCls:"icon-cancel",
			              handler:function(){
			              	$('#payAccountDialog').dialog("destroy");
			              }
			          }
		      	],
				onLoad:function(){
		     		$('#payAccountDialog').window('center');
		     		currRefundPayAccountDataGrid.datagrid("loadData", saveData.params.payAccounts);    		
				},
		    	onClose:function(){
		      		$(this).dialog("destroy");
		      	}
			});	
		}else{
			if(typeof afterSaveFunc === 'function'){	
				commonPost(saveData.saveUrl, JSON.stringify(saveData.params), null, afterSaveFunc);
			}else{
				commonPost(saveData.saveUrl, JSON.stringify(saveData.params), cancel);
			}	
		}	
	}	
}


/**
 * 取消
 */
function cancel(){
	parent.closeCurrTab("parent.refreshCurrTab");
}

</script>