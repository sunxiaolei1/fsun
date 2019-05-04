<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../headerJS.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="数据字典列表" border="false" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<div class="easyui-layout" data-options="fit:true">			
			<!--条件查询-->		  
			<div data-options="region:'north',split:true" style="height:50px">					
				<div style="height:30px;line-height:30px;padding:5px;">
					<label>数据类别：</label>
					<input name="codeType" id="codeType" class="easyui-combobox" style="width:150px"/>&nbsp;
					<label>关键字：</label>
					<input name="keywordText" id="keywordText" data-options="prompt:'名称,备注'" 
						class="easyui-textbox" style="width:250px"/>&nbsp;
					<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="query()">查询</a>
					<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="reset()">重置</a>
				</div>				
			</div>
	
			<div data-options="region:'center'">
				<table id="codesDataGrid"> 
				</table>
			</div>

		</div>
	</div>
</div>

<div id="tools" style="display:none;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>  
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update()">修改</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cross" plain="true" onclick="del()">删除</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-20130406015709810_easyicon_net_16" plain="true" onclick="reflushDataGrid()">刷新</a>
</div>
	
<script type="text/javascript">
$(function () {
	
	initCodeTypeCombox();
	
	initDataGrid();
	
});

var columns = 
   [[
	{field:'ck',checkbox:true},
	{field:"code_id",hidden: true},
	{field:"code_type",title:"数据类别",width:100,align:"center",sortable:true},
	{field:"code_code",title:"编码",width:100,align:"center",sortable:true},
	{field:"code_name",title:"名称",width:180,align:"center",sortable:true},
	{field:"sort_code",title:"排序",width:80,align:"center",sortable:true},	
	{field:"user_define2",title:"自定义2",width:100,align:"center",sortable:true},
	{field:"user_define3",title:"自定义3",width:100,align:"center",sortable:true},
	{field:"user_define1",title:"备注",width:200,align:"center",sortable:true}
]];
 
function initDataGrid() {
	$("#codesDataGrid").datagrid({
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小
	    //url:'${api}/sys/codes/findCodesPageList',
	    //queryParams:{"nofilterSort":true},
	    remoteSort:true,
	    sortName:"code_type",
        sortOrder:"desc",
	    idField:"code_id",
	    singleSelect:true,//是否单选
	    pagination:true,//分页控件
	    rownumbers:true,//行号
	    remoteFilter:true,
	    pageSize: GLOBAL_PAGE_SIZE,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    fitColumns:true,
	    showFooter:true,
	    columns:columns,
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",
	    toolbar:'#tools',
	    singleSelect: false,
	    selectOnCheck: true,
	    checkOnSelect: true
	});
}

//查询
function query(){
	clearDataGridSelections();
	
	var codeType = trim($("#codeType").combobox("getValue"));
	var keyword = trim($("#keywordText").textbox("getValue"));
	var queryParams = $("#codesDataGrid").datagrid("options").queryParams;
	
	queryParams.queryCodeType = codeType;
	queryParams.keyword = keyword;
	$("#codesDataGrid").datagrid('options').url = '${api}/sys/codes/findPage';
	$("#codesDataGrid").datagrid("load");
}

//清空
function reset() {
	var codeType = $("#codeType").combobox("setValue","");
	var keyword = $("#keywordText").textbox("setValue","");
	var queryParams = $("#codesDataGrid").datagrid("options").queryParams;
	
	queryParams.queryCodeType = "";
	queryParams.keyword = "";
	$("#codesDataGrid").datagrid("load");
}

//刷新DataGrid
function reflushDataGrid(){
	query();
	clearDataGridSelections();
}

//清除DataGrid选中的行
function clearDataGridSelections(){
	$("#codesDataGrid").datagrid("clearSelections");
}

function add(){
	$("<div></div>").dialog({
		id:"codesDialog",
	    title:"&nbsp;维护字典信息",
	    width:"345px",
	    height:"340px",
	    iconCls:"icon-add",
	    closed:false,
	    cache:false,
	    href:"${api}/sys/codes/addCode",
	    modal:true,
	    minimizable:false,//定义是否显示最小化按钮。
        maximizable:false,//定义是否显示最大化按钮
        closable:true,
        resizable:true,//定义对话框是否可调整尺寸
        collapsible: false,//是否可折叠的
        buttons:[
        	{
        		text:"保存",iconCls:"icon-disk",
                handler:function(data){
                	var fm = $('#fm');
                	if (fm.form('validate')) {
                		var data = formJson(fm);
                		save(data);
                	}
                }
            },
            {
                text:"取消",
                iconCls:"icon-cancel",
                handler:function(){
                	$('#codesDialog').dialog("destroy");
                }
            }
        ],
        onLoad:function(){
        	$('#codesDialog').window('center');
		},
        onClose:function(){
        	$(this).dialog("destroy");
        }
	});	 
}

function update() {
	var rows = $('#codesDataGrid').datagrid('getSelections');
	if (rows.length > 1) {
		$.messager.alert("提示","只能选择一行数据！");
		return;
	}
	var row = $('#codesDataGrid').datagrid('getSelected');
	if (row) {
		$("<div></div>").dialog({
			id:"codesDialog",
			title:"&nbsp;维护字典信息",
			width:"345px",
			height:"340px",
		    iconCls:"icon-edit",
		    closed:false,
		    cache:false,
		    href:"${api}/sys/codes/addCode",
		    modal:true,
		    minimizable:false,
            maximizable:false,
            resizable:true,//定义对话框是否可调整尺寸
            collapsible: false,//是否可折叠的
            buttons:[
            	{
            		text:"保存",iconCls:"icon-disk",
                    handler: function (data) {
                    	var fm = $('#fm');
                    	if (fm.form('validate')) {
                    		var data = formJson(fm);
                    		save(data);
                    	}
                    }
                },
                {
                    text:"取消",
                    iconCls:"icon-cancel",
                    handler:function(){
                    	$('#codesDialog').dialog("destroy");
                    }
                }
            ],
            onLoad:function(){
            	$('#codesDialog').window('center');
            	var data = {
            		"codeId": row.code_id,	
            		"codeType": row.code_type,	
            		"codeCode": row.code_code,	
            		"codeName": row.code_name,	
            		"sortCode": row.sort_code,	
            		"userDefine2": row.user_define2,	
            		"userDefine3": row.user_define3,
            		"userDefine1": row.user_define1
            	}
            	$('#fm').form('load', data);
			},
			onClose:function(){
        		$(this).dialog("destroy");
        	}
		});
	}else{
		$.messager.alert("提示","请选择一行要编辑的数据！");
	}
}

function del() {
	var rows = $('#codesDataGrid').datagrid('getSelections');
	if(rows) {
		var ids = '';
		for(var i=0;i< rows.length;i++){
			ids += rows[i].code_id + ",";			
	    }
		ids = ids.substring(0,ids.length-1); 
		
		$.messager.confirm("确认","是否确认要删除数据？",function(sure){
			if(sure) {
				$.ajax({  
			    	async:false,  
			        cache:false,  
			        type:'get', 
			        data:{"ids": ids},
			        dataType: "json",  
			        url:"${api}/sys/codes/deletes",
			        error: function () {//请求失败处理函数  
			            alert('请求失败');  
			        },  
			        success:function(result) { //请求成功后处理函数。  
			        	if (result.status) {
							$.messager.alert("提示","操作成功！","info", function(){
								reflushDataGrid();
							});
						} else {
							$.messager.alert("错误",result.message,"error");
						}
			        }
				});
			}
		});
	}else{
		$.messager.alert("提示","请选择一行要删除的用户组！");
	}
	
	clearDataGridSelections();
}

function save(data) {
	$.ajax({
		type : "POST",
		url : "${api}/sys/codes/save",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(data),
		dataType : "json",
		success : function(result) {
			if (result.status) {
				$.messager.alert("提示","操作成功！","info", function(){
					reflushDataGrid();
				});
			} else {
				$.messager.alert("错误",result.message,"error");
			}
		},
		error: function(message) {
			alert("提交数据失败！");
		}
	}); 
	
	$("#codesDialog").dialog("close");
}

function initCodeTypeCombox() {
	$.ajax({
		url: "${api}/sys/codes/codeTypes",
       	dataType: "json",
        async:false,
       	success:function(result){
        	if(result && result.entry){
        		var items = $.map(result.entry, function(item,index){
					return {id: item, text: item};
				});
				items.unshift({
					id:"",
					text:"全部"
				})
        		
        		$('#codeType').combobox({   	
        	   	 	valueField: "id",
        	   	  	textField: "text",
        	   	  	data: items
        	   	});	 
        	}
       	}
	});
}
</script>
</html>