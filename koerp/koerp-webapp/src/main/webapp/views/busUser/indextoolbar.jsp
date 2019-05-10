<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a href="#" class="easyui-linkbutton" iconCls="icon-house_link" plain="true" onclick="toAssignShopView()">绑定店仓</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reflushDataGrid()">刷新</a>	
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-20130406125647919_easyicon_net_16" plain="true" onclick="hide()">收起查询条件</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-20130406125519344_easyicon_net_16" plain="true" onclick="show()">展开查询条件</a>
 -->
<script type="text/javascript">

//跳转至绑定店仓界面
function toAssignShopView(){
	
	$("<div></div>").dialog({
		id:"codesDialog",
	    title:"&nbsp;店仓选择列表",
	    width:"90%",
	    height:"360px",
	    closed:false,
	    cache:false,
	    savefunc: function(row){	
	    	return assignShop(row);
		},
	    href: "${api}/bus/shop/toSelect?dialogName=codesDialog",		   
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
        maximizable:false,//定义是否显示最大化按钮
        closable:true,
        resizable:true,//定义对话框是否可调整尺寸
        //collapsible: true,//是否可折叠的	        
        onLoad:function(){
        	$(this).window('center');
		},
        onClose:function(){
        	$(this).dialog("destroy");
        }
	});	 
}


//刷新DataGrid
function reflushDataGrid(){
	query();
}


//隐藏查询条件
function hide() {
	commonHide("queryDiv", "gridDiv", "100%", currDataGrid);
}

//展开查询条件
function show() {
	commonShow("queryDiv", "gridDiv", "89%", currDataGrid);
}


//绑定门店
function assignShop(shopId){
	
	var resultData = {
		"success": false,
		"message":"操作未成功!"
	};

	var rows = currDataGrid.datagrid("getSelections");
	if(rows==null || rows.length==0){
		return result;
	}
	var ids = new Array();
	$.each(rows,function(){
		ids.push(this.id);
	});	

	$.ajax({
        type: "POST",
        dataType: "json",
        contentType:"application/json;charset=utf-8",
        async: false,
        url: "${api}/bus/user/assignShop/"+ shopId +"?ids="+ ids.join(","),
        beforeSend: function (jqXHR) {  		        	
        	$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});       	
        },
        success: function(result, textStatus) {       	
        	if(result.status){  
        		resultData.success = true;
        		resultData.message = "操作成功!";
       			$.messager.alert("提示", "操作成功！", "info", function(){      				
       				reflushDataGrid(result.entry);      			    
           		});        		      		     			        						
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
	return resultData;

}

</script>
