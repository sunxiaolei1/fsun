<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/datagrid-detailview.js"></script>

<table id="allotApplyTable"  data-options="nowrap:false"></table>

<%@include file="./allotApplyToolbar.jsp"%>

<script type="text/javascript">
	
	var lastExpandRowIndex = '';
	//展开过的订单id
	var expandedOrderIds = new Array();
	//订单明细id添加和删除
	var orderDetailIds = new Array();
	var selectedDetailRows = new Array();
	
	$(function(){	

		$('#allotApplyTable').datagrid({
			width:"auto",
            height:"auto",
            nowrap:false,
            striped:true,
            border:true,
            collapsible:false,//是否可折叠的
            fit:true,//自动大小
            url:"${api}/doc/po/findListForPage",
            queryParams:{
            	"fromShopId": "${currShopId}",
            	"poType":'20',
            	"poStatus":'00'
            },
            remoteSort:true,
            sortName:"po_no",
            sortOrder:"desc",
            singleSelect:true,//是否单选
            pagination:true,//分页控件
            rownumbers:true,//行号
            remoteFilter:true,
            pageSize : GLOBAL_PAGE_SIZE,
            pageList : GLOBAL_PAGE_SIZE_LIST,
            fitColumns:false,
            showFooter:true,
            loadMsg:"努力加载中。。。",
            emptyMsg:'没有符合条件的记录',
			columns:[[
				{field:"poNo",title:'单据编号',width:160,align:"center",sortable:true},					
				{field:'fromShopId',title:'出库店仓',width:160,align:'center',sortable:true, formatter:function(value, row){
					return row.fromShopName; 
				}},
				{field:'toShopId',title:'收货店仓',width:180,align:'center',sortable:true, formatter:function(value, row){
					return row.toShopName; 
				}}, 
				{field:"iContact",title:'联系人',width:100,align:"center"},
				{field:"iTel",title:'联系方式',width:100,align:"center"},
				{field:"createdTime",title:'申请时间',width:130,align:"center",sortable:true},
				{field:"memo",title:'备注',width:200,align:"center"}
           	]],
           	toolbar:"#allotApplyToolbar",	
            onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
       		}, 
       		onBeforeLoad: function (param){
       		 	expandedOrderIds = new Array();
       		},
       		onLoadSuccess:function(data){		       			
    			if(data.rows.length>0){         				 	
        			//调整行号的宽度
     	        	$(this).datagrid("fixRownumber");       	        	  					    						     			
        		}       					  					     			        			
       		},
       		view: detailview,
       		detailFormatter:function(index,row){  
	            return '<div id="detailForm-'+index+'"></div>';  
	        }, 
	        onExpandRow: function(index,row){ 
 		        if(lastExpandRowIndex!=index){
 		        	if(lastExpandRowIndex!=''){
 		        		$(this).datagrid('collapseRow', lastExpandRowIndex);
 		        	}	 		        	
 	 		    }		        			        	
   				if(!hasExpand(row.poNo)){
   					$('#detailForm-'+index).panel({  
    		                doSize:true,  
    		                border:false,  
    		                cache:false,  
    		               	href:'${api}/doc/po/toAllotApplyDetailView?currIndex='+ index +'&poNo='+ row.poNo+'&toShopId='+ row.toShopId,
    		                onLoad:function(){
    		                    $('#allotApplyTable').datagrid('selectRow',index);
    		                    $('#allotApplyTable').datagrid('fixDetailRowHeight',index);
    		                }  
    		            });
   				} 				
	            $('#allotApplyTable').datagrid('fixDetailRowHeight',index);
	            lastExpandRowIndex = index;
	        }
        })
	});
	
	
	
	/*******************************     私有方法             **************************************/
	
	//判别该订单是否展开过
	function hasExpand(poNo){			
		for(var i=0; i<expandedOrderIds.length; i++){
			if(expandedOrderIds[i]==poNo){					
				return true;
			}
		}
		expandedOrderIds.push(poNo);
		return false;
	}
	
	//新增一条明细
	function addSelectedDetail(detailRow){
		orderDetailIds.push(detailRow.poDetailId);	
		selectedDetailRows.push(detailRow);	
		if(!shopIsOne(selectedDetailRows)){
			//按钮变灰色
		}
	}
	
	//删除一条明细
	function delUnSelectedDetail(detailRow){
		for(var i=0; i<orderDetailIds.length; i++){
			if(orderDetailIds[i]==detailRow.poDetailId){
				orderDetailIds.splice(i,1);
				selectedDetailRows.splice(i,1);
				if(shopIsOne(selectedDetailRows)){
					//按钮恢复原来颜色
				}				
				break;
			}
		}		
	}
	
	//数组中是否含有多个门店
	function shopIsOne(selectedDetailRows){	
		if(selectedDetailRows.length==0){
			return false;
		}		
		var isOne = true;
		var currToShopId = selectedDetailRows[0].toShopId;
		var currPoNo = selectedDetailRows[0].poNo;
		for(var i=1; i<selectedDetailRows.length; i++){
			if(selectedDetailRows[i].poNo!=currPoNo && selectedDetailRows[i].toShopId!=currToShopId){
				$.messager.alert('提示',"已选多个收货店仓商品明细!",'info');
				isOne = false;
				break;
			}
		}	
		return isOne;
	}

	
</script>