<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="allotApplyToolbar"  style="padding:2px;display:none;" >
	<span style="float:right;margin-top:2px;">	
		<label>商品名称:</label>
		<input id="goodsCombo" style="width:200px" /> 
		<label>申请单号：</label>
		<input id="poNoText" class="easyui-textbox" style="width:200px"  />  
		<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="javascript:allotApplyQuery()">查询</a>
		<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="javascript:allotApplyReset()">重置</a>		         
	</span>
     <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-user_comment" plain="true" onclick="javascript:orderAudit()">审核</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton"	iconCls="icon-arrow_undo" plain="true" onclick="javascript:orderReject()">驳回</a>	 
</div>

<!-- 商品查询 -->
<%@include file="../../busCommon/commonGoodsSearch.jsp"%>
<%@include file="../../busCommon/commonOrderFunc.jsp"%>

<script type="text/javascript">	

//清空查询BasCodes条件
function allotApplyReset() {	   
    $("#goodsCombo").combogrid("clear");
    $('#poNoText').textbox('clear');
    var queryParams =  $("#allotApplyTable").datagrid("options").queryParams; 
    queryParams.poNo = "";
    queryParams.sku = "";
    $("#allotApplyTable").datagrid("reload");
    expandedOrderIds = new Array();
}

//根据条件查询BasCodes
function allotApplyQuery() {
	var poNo = $("#poNoText").textbox('getValue');
	var sku =  $('#goodsCombo').combogrid('getValue');
    var queryParams =  $("#allotApplyTable").datagrid("options").queryParams;
    queryParams.poNo = poNo;
    queryParams.sku = sku;
    $("#allotApplyTable").datagrid("reload");
    expandedOrderIds = new Array();
}

//驳回申请
function getRejectData(){
   var rows = $('#allotApplyTable').datagrid("getSelections");
   if(rows!=null && rows.length>0){
	   var poNos = [];
	   $.each(rows, function(){
		   poNos.push(this.poNo);
	   });
	   return {
		   "params": {},
		   "saveUrl": "${api}/doc/po/status/${rejectStatus}?poNos="+ poNos.join(",")
	   };
   }else{
	   $.messager.alert('提示','请选择至少一个单据');
   }
	 
}

//提交明细id并跳转至审核出库界面
function orderAudit(){
	if(orderDetailIds.length>0){
		if(poNoIsOne(selectedDetailRows)){
			window.parent.toStockOutAuditView(orderDetailIds,selectedDetailRows[0].toShopId);
		}				
	}
	$.messager.alert('提示',"请选择至少一个申请单商品明细!",'info');	
}


/**********************************        私有方法            *****************************************/
 
 
function afterSaveFunc(){
	$('#allotApplyTable').datagrid("reload");
}

//数组中是否含有多个申请单
function poNoIsOne(selectedDetailRows){	
	if(selectedDetailRows.length==0){
		return false;
	}		
	var isOne = true;
	var currPoNo = selectedDetailRows[0].poNo;
	for(var i=1; i<selectedDetailRows.length; i++){
		if(selectedDetailRows[i].poNo!=currPoNo){
			$.messager.alert('提示',"已选商品明细含有多个申请单,暂时只能是同一个申请单!",'info');
			isOne = false;
			break;
		}
	}	
	return isOne;
}

</script>