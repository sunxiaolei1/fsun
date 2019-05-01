<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="售后单汇总" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 84%;">
			<table id="ordersDataGrid"> 
			</table>
		</div>
	</div>
</div>

<div id="tools" style="display: none;">
    <!-- 操作按钮及事件  -->
	<%@include file="./indextoolbar.jsp"%>
</div>

<script type="text/javascript">

var currDataGrid = $("#ordersDataGrid");
var currPayAccountDataGrid = $("#payAccountDataGrid");
var mergeUnique = null;
var footerFirstColumn = "refund_id";

var refundTypeFormatter = function(value, row){
	return formatter(value, window.parent.refundType); 
};

var refundReasonFormatter = function(value, row){
	return formatter(value, window.parent.refundReason); 
};

var allReturnFormatter = function(value, row){
	if(typeof(value) != "undefined"){
		var allReturn = "<b style='color:green;'>否</b>";
   		if(value==true){
   			allReturn = "<b style='color:red;'>是</b>";
   		}
   		return allReturn;
	} 	
};

var refundStatusFormatter = function(value, row){
	var refundStatus = formatter(value, window.parent.refundStatus);
	return refundStatus!=null?"<b style='color:red;'>"+ refundStatus +"</b>":"--";
};

$(function() {
		
	$.ajax({
		type : "GET",
		url : "${api}/base/header/field/${queryType}",   
		dataType : "json",
		success : function(result) {
			if(result.status){
				var columns = result.entry.columns;
				var mergeCells = initColumns(columns);
				currDataGrid.datagrid({
					view:footerStyleView,
					width:500,
					height:250,
				    nowrap:false,
				    striped:true,
				    border:true,
				    fit:true,//自动大小
				    queryParams:{
				    	"notInCustomerTypes": "",  ///"SK",
				    	"firstColumn": footerFirstColumn
				    },
				    remoteSort:true,
				    sortName:"refund_id desc, sku",
			        sortOrder:"asc",
				    singleSelect:true,//是否单选
				    pagination:true,//分页控件
				    pageSize: GLOBAL_PAGE_SIZE + GLOBAL_PAGE_SIZE,
				    pageList: GLOBAL_PAGE_SIZE_LIST,
				    showFooter:true,
				    rownumbers:true,//行号
				    remoteFilter:true,
				    showFooter:true,
				    fitColumns:false,
				    columns:columns,
				    loadMsg:"数据加载中请稍后……",
				    emptyMsg:"没有符合条件的记录",
				    toolbar:'#tools',
				    rowStyler:function(index,row){
			        	var rowStyle = "";        	
			        	if (row[footerFirstColumn]=="合计:"){//这里是判断哪些行
			        		rowStyle = 'font-weight:bold;';  
			            }
			        	return rowStyle;
					},
			        onLoadSuccess: function(data){						
			        	autoMergeCells(data.rows, mergeCells);
			        },
				    onDblClickRow:function(rowIndex, rowData){
				    	toDetailView(rowData);
				    }    
				});
			}			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	

	
});

function initColumns(columnsArr){
	var mergeCells = [];
	if(columnsArr){
		$.each(columnsArr, function(){
			var columns = this;
			if(columns && columns.length>0){
				$.each(columns, function(){
					var column = this;
					//如果是要进行相同行合并的列字段
					if(column.mergeCell){
						if(column.mergeUnique){
							mergeUnique = column.field;
						}
						mergeCells.push(column.field);
					}				
					if(column.styler){
						var styler = eval(column.styler);
						if (typeof styler === 'function'){
							column.styler = styler;
					    } 						
					}
					if(column.formatter){
						var formatter = eval(column.formatter);
						if (typeof formatter === 'function'){
							column.formatter = formatter;
					    } 						
					}
				});
			}
		})
	}
	return mergeCells;
}

/**
 * 合并相同行数据
 */
function autoMergeCells(rows, mergeCells){
	//只有相同行合并唯一性字段和是否支持相同行单元格合并同时满足才可进行合并		        	
	if(mergeCells && mergeUnique){
		//data是默认的表格加载数据，包括rows和Total
   		var mark=1;                                                 
    	//这里涉及到简单的运算，mark是计算每次需要合并的格子数
    	for (var i=1; i <rows.length; i++) {     
    		//这里循环表格当前的数据
    		if (rows[i][mergeUnique] == rows[i-1][mergeUnique]) {   
    			//后一行的值与前一行的值做比较，相同就需要合并
   				mark += 1; 
    			$.each(mergeCells, function(){
    				var field = this;
    				currDataGrid.datagrid('mergeCells',{ 
        				//datagrid的index，表示从第几行开始合并；紫色的内容需是最精髓的，就是记住最开始需要合并的位置
						index: i+1-mark,
        				//合并单元格的区域，就是clomun中的filed对应的列
        				field: field, 
        				//纵向合并的格数，如果想要横向合并，就使用colspan：mark
        				rowspan:mark                   
        			});
    			});   			 
    		}else{
    			//一旦前后两行的值不一样了，那么需要合并的格子数mark就需要重新计算
   				mark=1;                                         
    		}
    	}
	}
}

</script>
</html>