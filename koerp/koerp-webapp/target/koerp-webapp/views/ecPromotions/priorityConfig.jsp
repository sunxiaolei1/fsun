<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../headerJS.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<style type="text/css">

.toolbar{
	height:28px;
	overflow:hidden;
	border: 1px solid #D3D3D3;	
	background: #f3f3f3;
	padding-top:2px;
}
</style>
			
<div class="easyui-layout" fit=true  id='base_layout'>
	<div region="north" class="toolbar" >
		<a href="#" id="orderSaveBtn" class="easyui-linkbutton" iconCls="icon-disk" plain="true">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="parent.closeCurrTab()">取消</a>
	</div>
	<div region="center" style="height:39%;" >	
		<div id="prioritySearchbar" style="display:none;">
			<%@include file="./prioritySearchbar.jsp"%>
		</div>   	
	    <table id="proDataGrid"></table>
	</div>
</div>

<!-- 查询条件 -->
<%@include file="../ecCommon/companyToShopSelect.jsp"%>

<!-- datagrid可编辑单元格 -->
<%@include file="./promotionsEdatagridCellediting.jsp"%>

<script type="text/javascript">

var currDataGrid;
var currPromotionsData = [];

$.extend($.fn.datagrid.defaults.editors, {
     checkbox: {//调用名称
         init: function (container, options) {
           //container 用于装载编辑器 options,提供编辑器初始参数
             var input = $('<input type="checkbox" class="datagrid-editable-input">').appendTo(container);
            //这里我把一个 checkbox类型的输入控件添加到容器container中
            // 需要渲染成easyu提供的控件，需要时用传入options,我这里如果需要一个combobox，就可以 这样调用 input.combobox(options);
             return input;
         },
         getValue: function (target) {
            //datagrid 结束编辑模式，通过该方法返回编辑最终值
            //这里如果用户勾选中checkbox返回1否则返回0
             return $(target).prop("checked") ? 1 : 0;
         },
         setValue: function (target, value) {
            //datagrid 进入编辑器模式，通过该方法为编辑赋值
            //我传入value 为0或者1，若用户传入1则勾选编辑器
            if (value){
            	$(target).prop("checked", "checked")
            }               
         },
         resize: function (target, width) {
            //列宽改变后调整编辑器宽度
             var input = $(target);
             if ($.boxModel == true) {
                 input.width(width - (input.outerWidth() - input.width()));
             } else {
                 input.width(width);
             }
         }
    }
});

$(function () {
			
	currDataGrid = $("#proDataGrid");			
	
	initCompanyGrid(false);
	initShopGrid(false); 	
	shopOnChange();	
	
	currDataGrid.datagrid({		
		width:"auto",
	    height:"auto",
	    nowrap:false,
	    striped:true,
	    border:true,
	    collapsible:false,//是否可折叠的
	    fit:true,//自动大小	   
	    remoteSort:false,	    
	    idField:"promotionsid",
	    sortName:"startdatetime",
        sortOrder:"desc",	 
        toolbar:"#prioritySearchbar",
	    singleSelect:true,//是否单选   
	    rownumbers:true,//行号
	    fitColumns:true,
	    pagination:true,
        pageNumber:currPageNumber,
        pageSize: currPageSize,
	    pageList: GLOBAL_PAGE_SIZE_LIST,
	    showFooter:true,	   
	    columns: [[
			{field:'promotionsid',hidden:true},
			{field:"prioritycode",title:"优先级",width:80,align:'center',sortable:true,
				styler: function(value, rowData, rowIndex){
			    	return 'font-weight:bold;color:green;';
			    },
			    formatter:intNumBaseFormat,               
				editor:{
					type:'numberspinner',
					options:{
						required: true,
						min:0,
						precision:0
					}
				}
			},	
			{field:'promotionsname',title:'活动名称',width:200,align:'center',sortable:true},
			{field:'orderfrom',title:'订单来源',width:80,align:'center',sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.ecOrderFrom); 			
			}},
			{field:'promotionstype',title:'活动类型',width:80,align:'center',sortable:true, formatter:function(value, row){
				return formatter(value, window.parent.ecPromotionsType); 			
			}},			
			{field:"startdatetime",title:"开始时间",align:'center',sortable:true, width:130},
			{field:"enddatetime",title:"停止时间",align:'center',sortable:true, width:130},
			{field:'iscompatible',title:'是否兼容',align:'center',sortable:true, width:60,
				styler: function(value, rowData, rowIndex){
			    	return 'font-weight:bold;color:green;';
			    },
				formatter:function(value, row){
					return value==true?"是":"否"; 			
				},
				editor:{
					type:'checkbox',
					options:{  
			            on: "1",  
			            off: "0"			      
			        } 
				}
			}	       	               
	    ]],
	    loadMsg:"数据加载中请稍后……",
	    emptyMsg:"没有符合条件的记录",	    
	    onAfterEdit: function(rowIndex, rowData, changes){
	    		    		    	   	
	    },
	    loadFilter:function(data) {     		   		  		
    		//排序拦截器
    		sortFilter($(this), data);
    		//分页拦截器
    		return pagerFilter($(this), data);
        }
	});
	
	
	$("#orderSaveBtn").click(function(){						
		var isValid = currDataGrid.datagrid("isValid");				
		if (!isValid){
			$.messager.alert("错误", "提交的数据不正确!", "error");  
			return;
		}			
		currDataGrid.datagrid("acceptChanges");
		$.each(currPromotionsData, function(){
			delete this.shopname;
		});
		commonPost("${api}/ecpromotions/priorities", JSON.stringify(currPromotionsData), null);	
	});
     
});


/************************************       内部方法              *******************************************/

/**
 * 添加变更监听事件
 */
function shopOnChange(){
	$("#shopid").combogrid({
		onChange : function(newValue, oldValue) {
			$("#promotionsname").searchbox("clear");			
			if(newValue!=null && newValue!=''){
				var companycode = $("#companycode").combogrid("getValue");
				$.ajax({
					type : "GET",
					url : "${api}/ecpromotions/list",
					data:{
						"shopid": newValue,
						"instatusstr": "10,20,30",
						"companycode": companycode
					},
					contentType:"application/json;charset=utf-8",	   
					dataType : "json",
					success : function(result) {			
						if(result.status){
							currPromotionsData = result.entry; 
							currDataGrid.datagrid("loadData", currPromotionsData);
						}else{
							$.messager.alert("错误", result.message, "error", function(){
								currPromotionsData = [];
								currDataGrid.datagrid("loadData", currPromotionsData);
		            		});						
						}					
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						$.messager.alert("错误", errorThrown, "error");
					}
				}); 						
			}else{
				currPromotionsData = [];
				currDataGrid.datagrid("loadData", currPromotionsData);
			}												
		}
	});
}

/**
 *  判别当前是否已选门店
 */
function hasShopid(){
	var shopid = $("#shopid").combogrid("getValue");
	if(shopid==null || shopid==''){
		return null;
	}
	return shopid;
}

</script>