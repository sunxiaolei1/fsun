<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ include file="../../../headerJS.jsp" %>

<div class="easyui-layout" style="width:100%;height:100%;">
	<div title="领用出库报表" data-options="region:'center',split:true,collapsible:false" style="padding:5px">
		<!-- 查询条件 -->
		<%@include file="./searchbar.jsp"%>
		
		<!-- table -->
		<div id="gridDiv" data-options="region:'center'" style="height: 89%;">
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

$(function() {
		
	$.ajax({
		type : "GET",
		url : "${api}/base/header/field/sus",   
		dataType : "json",
		success : function(result) {
			if(result.status){
				var columns = result.entry.columns;	
				initColumns(columns);
				currDataGrid.datagrid({
					width:500,
					height:250,
				    nowrap:false,
				    striped:true,
				    border:true,
				    fit:true,//自动大小
				    queryParams:{},
				    remoteSort:true,
				    sortName:"sku",
			        sortOrder:"asc",
				    singleSelect:true,//是否单选
				    pagination:false,//分页控件
				    rownumbers:true,//行号
				    //remoteFilter:true,
				    showFooter:true,
				    fitColumns:false,
				    columns:columns,
				    loadMsg:"数据加载中请稍后……",
				    emptyMsg:"没有符合条件的记录",
				    toolbar:'#tools',
				    loadFilter:function(data) {   
				    	if(data!=null && data.entry!=null && data.entry.details!=null){
				    		return data.entry.details;  
				    	}
				    	return [];
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
	if(columnsArr){
		$.each(columnsArr, function(){
			var columns = this;
			if(columns && columns.length>0){
				$.each(columns, function(){
					var column = this;
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
}

</script>
</html>