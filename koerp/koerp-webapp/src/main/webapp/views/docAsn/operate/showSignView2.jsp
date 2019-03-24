<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<!-- 收货明细确认 dialog -->
<div id="docAsnDetailsConfirmDataGrid"></div>
<!-- 收货明细确认 dialog -->



<!---------------------------------------------显示收货明细确认DataGrid代码---------------------------------------------->
<script type="text/javascript">
	//拒绝收货明细
	var rejectReceiptDetails = new Array();
	//部分收货明细
	var partialReceiptDetails = new Array();
	//完全收货明细
	var completeReceiptDetails = new Array();
	
	//设置要显示的列名
    var frozenDetailsConfirmColumns = 
    [[
    	{field:"skuId",hidden:true},
		{field:"sku",title:"sku",width:150,align:"center",
			styler:function (value, row, index){
	        	return setColumnStyle("sku", null);
           	}
		},
		{field:"goodsName",title:"名称",width:200,align:"center",
			styler:function (value, row, index){
	        	return setColumnStyle("goodsName", null);
           	}
		}
	]];
	
	
	//设置要显示的列名
    var detailsConfirmColumns = 
    [[	
		{field:"orderedQty",title:"采购数量",width:120,align:"center",formatter:formatNumber,
	        styler:function (value, row, index){
	        	return setColumnStyle("orderedQty", value);
           	}
		},
		{field:"expectedQty",title:"到货数量",width:120,align:"center",formatter:formatNumber,
	        styler:function (value, row, index){
	        	return setColumnStyle("expectedQty", value);
           	}
		},
		{field:"receiveQty",title:"签收数量",width:120,align:"center",formatter:formatNumber,
			editor:{
				type:"numberspinner",
				options:{
			        min:0,
			        precision:2
			    }
	        },
	        styler:function (value, row, index){
	        	return setColumnStyle("receiveQty", value);
           	}
		},
		{field:"damagedQty",title:"残次数量",width:120,align:"center",formatter:formatNumber,
			editor:{
				type:"numberspinner",
				options:{
			        min:0,
			        precision:2
			    }
	        },
	        styler:function (value, row, index){
	        	return setColumnStyle("damagedQty", value);
           	}
		},
		{field:"rejectedQty",title:"拒收数量",width:120,align:"center",formatter:formatNumber,
	        styler:function (value, row, index){
	        	return setColumnStyle("rejectedQty", value);
           	}
		},
		{field:"property",title:"规格",width:180,align:"center",
			styler:function (value, row, index){
	        	return setColumnStyle("property", null);
           	}
		},
		{field:"unit",title:"单位",width:120,align:"center",
			styler:function (value, row, index){
	        	return setColumnStyle("unit", null);
           	}
		},
		{field:"categoryName",title:"分类",width:180,align:"center",
			styler:function (value, row, index){
	        	return setColumnStyle("categoryName", null);
           	}
		},
		{field:"volume",title:"单位体积",width:100,align:"center",formatter:formatNumber},
		{field:"totalVolume",title:"体积",width:100,align:"center",formatter:formatNumber}
	]];
	
	//添加入库确认明细
	function appendDocAsnDetailsConfirm(dataGridId, detailsArray, info){
		var totalOrderedQty = 0;
	 	var totalExpectedQty = 0;
	 	var totalReceiveQty = 0;
	 	var totalDamagedQty = 0;
	 	var totalRejectedQty = 0;
	 	var totalVolume = 0;
	 	var totalDetailsVolume = 0;
		$("#"+dataGridId).datagrid("appendRow", {"sku":info});
        	for(var i = 0;i < detailsArray.length;i++){
        		var details = detailsArray[i];
        		totalOrderedQty = totalOrderedQty + parseFloat(details.orderedQty);
         		totalExpectedQty = totalExpectedQty + parseFloat(details.expectedQty);
         		totalReceiveQty = totalReceiveQty + parseFloat(details.receiveQty);
         		totalDamagedQty = totalDamagedQty + parseFloat(details.damagedQty);
         		totalRejectedQty = totalRejectedQty + parseFloat(details.rejectedQty);
         		totalVolume = totalVolume + parseFloat(details.volume);
         		totalDetailsVolume = totalDetailsVolume + parseFloat(details.totalVolume);
        		$("#"+dataGridId).datagrid("appendRow", detailsArray[i]);
        	}
        	$("#"+dataGridId).datagrid("appendRow", {
		        		    "goodsName":"合计：",
		        		    "orderedQty":totalOrderedQty,
		        		    "expectedQty":totalExpectedQty,
		        		    "receiveQty":totalReceiveQty,
		        		    "damagedQty":totalDamagedQty,
		        		    "rejectedQty":totalRejectedQty,
		        		    "volume":totalVolume,
		        		    "totalVolume":totalDetailsVolume
		        		});
	}
	
	//页面加载时，初始化datagrid
    $(function () {
    	initDetailConfirmDataGrid();
    	//获取正在编辑的行，并且结束datagrid中的单元格编辑状态
		endEditingRow("docAsnDetailsDataGrid");
		editIndex = undefined;
    	var detailsConfirmDataGrid = $("#docAsnDetailsDataGrid").datagrid("getRows");
    	if(detailsConfirmDataGrid != null && typeof(detailsConfirmDataGrid) != "undefined" && detailsConfirmDataGrid.length > 0){
        	for(var i = 0;i < detailsConfirmDataGrid.length - 1;i++){
        		var detailsRow = detailsConfirmDataGrid[i];
        		var expectedQty = detailsRow.expectedQty;
        		var receiveQty = detailsRow.receiveQty;
        		if(receiveQty == 0){
        			rejectReceiptDetails.push(detailsRow);
        		}else if(receiveQty < expectedQty){
        			partialReceiptDetails.push(detailsRow);
        		}else{
        			completeReceiptDetails.push(detailsRow);
        		}
        	}
        	
        	//添加入库拒绝收货确认明细
        	appendDocAsnDetailsConfirm("docAsnDetailsConfirmDataGrid", rejectReceiptDetails, 
        		"拒绝收货（共 <font color='red'>"+rejectReceiptDetails.length+"</font> 项）：");
        	//换行
        	$("#docAsnDetailsConfirmDataGrid").datagrid("appendRow", {"sku":""});
        	//添加入库部分收货确认明细
        	appendDocAsnDetailsConfirm("docAsnDetailsConfirmDataGrid", partialReceiptDetails, 
        		"部分收货（共 <font color='#009ACD'>"+partialReceiptDetails.length+"</font> 项）：");
        	//换行
        	$("#docAsnDetailsConfirmDataGrid").datagrid("appendRow", {"sku":""});
        	//添加入库完全收货确认明细
        	appendDocAsnDetailsConfirm("docAsnDetailsConfirmDataGrid", completeReceiptDetails, 
        		"完全收货（共 <font color='blue'>"+completeReceiptDetails.length+"</font> 项）：");
        	//换行
        	$("#docAsnDetailsConfirmDataGrid").datagrid("appendRow", {"sku":""});	
        }
    });
    
    function initDetailConfirmDataGrid(){
    	$("#docAsnDetailsConfirmDataGrid").datagrid({
            width:"auto",
            height:"auto",
            nowrap:true,
            striped:true,
            border:true,
            collapsible:false,//是否可折叠的
            fit:true,//自动大小
            remoteSort:true,
            idField:"skuId",
            singleSelect:true,//是否单选
            checkOnSelect:true,
            rownumbers:true,//行号
            remoteFilter:true,
            pageSize : GLOBAL_PAGE_SIZE,
            pageList : GLOBAL_PAGE_SIZE_LIST,
            fitColumns:false,
            showFooter:true,
            frozenColumns:frozenDetailsConfirmColumns,
            columns:detailsConfirmColumns,
            emptyMsg:"<font style='color:red;font-weight:bold;'>暂无任何入库明细确认信息...</font>"
        });
    }
</script>
<!---------------------------------------------显示收货明细确认DataGrid代码---------------------------------------------->