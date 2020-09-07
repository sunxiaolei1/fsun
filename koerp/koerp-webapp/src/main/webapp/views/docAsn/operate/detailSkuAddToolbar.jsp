<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<span style="float:right;margin-top:2px;">	
	<input id="skuSearcher" class="easyui-searchbox" style="width:350px">
</span>
<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSkuRow()">添加商品</a> -->
<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="delSkus()">删除</a>
		
<script type="text/javascript">

$(function() {
	
	//初始化搜索框
	$('#skuSearcher').searchbox({
	     prompt: '扫描SKU添加商品...',
	     searcher: function (value, name) {	
	    	 value = value.trim();
	    	 if(value==''){
	    		 return;
	    	 }
	    	 $.ajax({
    			type : "POST",
    			url : "${api}/bus/basSku/findListForPage?sku="+ value,
    			contentType:"application/json;charset=utf-8",	   
    			dataType : "json",
    			success : function(result) {	
    				if(result.status){								 		
    					var rows = result.entry;	
    					if(rows!=null && rows.length>0){
    						var row = rows[0];
    						$.messager.show({ title: '提示', msg : 'SKU('+ value 
    								+')对应的商品('+ row.goodsName +')添加成功!'});
    						addLoadData(row);
    					}else{
    						$.messager.alert("错误", "SKU("+ value +")检索异常:无对应的商品", "error", function(){
    							$('#skuSearcher').searchbox("clear");
    							$('#skuSearcher').next().find(".textbox-text").focus();   							   							
    						});
    					}
    				}else{
    					$.messager.alert("错误", "SKU("+ value +")检索异常:" + result.message, "error",function(){
    						$('#skuSearcher').searchbox("clear");
    						$('#skuSearcher').next().find(".textbox-text").focus();   	
    					});
    				}		
    			},
    			error : function(XMLHttpRequest, textStatus, errorThrown) {
    				$.messager.alert("错误", "SKU("+ value +")检索异常:" + errorThrown, "error", function(){
						$('#skuSearcher').searchbox("clear");
						$('#skuSearcher').next().find(".textbox-text").focus();   	
					});
    			}
    		}); 	 
	     }
	 });

});

/**
 * 追加商品明细
 */
function addLoadData(newRow){
	if(currDetailData.length>0){	
		var sku = newRow.sku;
		var hasExist = false;
		$.each(currDetailData, function(){
			if(sku == this.sku){				
				this.receiveQty = (this.receiveQty + 1);
				this.totalPrice = CalcAmount.multiply(this.salePrice, this.receiveQty, 2);
				hasExist = true;
				return false;
			}
		});
		if(!hasExist){
			currDetailData.push(initAddSku(newRow));
		}		
	} else {
		var newSku = initAddSku(newRow);
		currDetailData = [newSku];
	}
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
	$('#skuSearcher').searchbox("clear");
}

//商品列表刷新
function skuListReLoad() {
	currOrderDetailDataGrid.datagrid("loadData", currDetailData);
}

/**
 * 打开商品选择控件
 */
function addSkuRow() {	
	
	var isValid0 = currOrderDetailDataGrid.datagrid("isValid");	
	if(!isValid0){
		$.messager.alert({title: '消息', msg: '数据验证未通过!'});
		return;
	}
	
	var toShopId = $("#toShopId").val();
	
    $("<div></div>").dialog({
        id: "chooseSkuDialog",
        title: "添加商品",
        width: "95%",
        height: "400px",
        iconCls: "icon-add",
        closed: false,
        cache: false,
        href: "${api}/bus/basSku/toChooseEditSku",
        view: {
            checkedSkus: currDetailData,
            currShopid: toShopId,
            tradeType: "${asnType}"
        },
        modal: true,
        minimizable: false,
        maximizable: false,
        closable: true,
        collapsible: false,
        resizable: true,
        onClose: function () {
            $(this).dialog("destroy");
        }
    });
}

/**
 * 删除商品
 */
function delSkus() {	
	
	$.messager.confirm("确认", "是否确认删除？", function (sure) {
        if (sure) {
        	var rows = currOrderDetailDataGrid.datagrid("getSelections");
        	if(rows.length>0){	
        		var skus = new Array(); 
        		$.each(rows, function(){
        			skus.push(this.sku);	
        		});
        		
        		var newDetailData = [];
        		$.each(currDetailData, function(){
        			if(!skus.contains(this.sku)){
        				newDetailData.push(this);
        			}
        		});
        		currDetailData = newDetailData;
        		currOrderDetailDataGrid.datagrid("loadData", currDetailData);
        	}
        }
    });	
}

</script>
		