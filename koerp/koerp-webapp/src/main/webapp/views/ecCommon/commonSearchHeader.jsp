<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.easyui-textbox, .easyui-combogrid, .easyui-datebox, .easyui-combobox, .easyui-numberbox, .easyui-datetimebox {
	width: 162px;
}
</style>

<form id="queryForm">

<script type="text/javascript">

/**
 * 初始化下拉框的默认参数
 */
function initComboxParams(){
	
	$("#queryForm").find(".easyui-combobox").each(function(){				
		$(this).combobox({
			loadFilter: function(data){	
				var newData = [];
		 		$.each(data, function(){  
		 			newData.push(this.codeCode == ""?{"codeCode":"","codeName":"全部"}:this);									
		 		});
				return newData;
			}
		}); 
	});
}

/**
 * 获取查询参数
 */
function initQueryParams(){
	
	var queryParams = currDataGrid.datagrid("options").queryParams;
	var queryData = formJson($('#queryForm'));
	for(var key in queryData){
		queryParams[key] = queryData[key];
	}
	return queryParams;
}

//公用查询
function commonQuery(url){

	var queryParams = initQueryParams();
	clearDataGridSelections();
	currDataGrid.datagrid('options').url = url;  
	currDataGrid.datagrid("load");
}


//公用重置
function commonReset(childfuncname) {
	
	try{ 
	 	if(typeof(eval(childfuncname))=="function") {	 		
	 		eval(childfuncname)();	 		
	 	}
	}catch(e){
	 	console.log("重置内部方法不存在"); 
	} 

	$("#queryForm").find(".easyui-textbox").each(function(){
		$(this).textbox("setValue","");
	}); 
	
	$("#queryForm").find(".easyui-combobox").each(function(){
		$(this).combobox('clear');
		$(this).combobox("setValue","");
	}); 
	
	$("#queryForm").find(".easyui-combogrid").each(function(){
		$(this).combogrid('clear');
		$(this).combogrid("setValue","");
	}); 
	
	$("#queryForm").find(".easyui-datetimebox").each(function(){
		$(this).datetimebox("setValue","");
	}); 
	
	//$('#borderdatetime').datetimebox('setValue', initOrderDateTime);

	var queryParams = initQueryParams();
	clearDataGridSelections();
	currDataGrid.datagrid("reload");
	
}

//清除DataGrid选中的行
function clearDataGridSelections(){
	currDataGrid.datagrid("clearSelections");
}

</script>