<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>
<style type="text/css">

.skutitle{
	margin: 0px 18px 0px 4px;
    padding-top: 0px;
    padding-bottom: 0px;
    height: 22px;
    line-height: 22px;
    width: 182px;
    font-size: 12px;
    font-weight: bold;
    color: #575765;
}

</style>

<!-- BasSku dialog -->
<div id="chooseSkuDialog" class="alert">
	<div class="easyui-layout" style="height:100%;">		
		<div data-options="region:'west',split:true,border:false"  style="width:230px;">
			<%@include file="./commonCategoryTreeSearch.jsp"%>
		</div>			
		<div data-options="region:'center',border:false">			
			<table id="skusDatagrid"> 
			</table>
		</div>		
	</div>
</div>
<!-- BasSku dialog -->

<div id="skuToolbar" style="dispaly:none;" >	
	<span style="float:right;">	
		<input id="vaguefieldText" class="easyui-searchbox" style="width:300px"
		data-options="searcher:querySku,prompt:'输入商品名称、SKU筛选...'"  />
	</span>		
	<div style="height:24px;">
		<span class="skutitle" >
			商品列表[<span id="skutitle"></span>](<span style="color:red;">修改数量、金额之后并选中</span>)
		</span>
	</div>		
</div>

<script type="text/javascript">	

var currCheckedSkus = [];	
var currDatagrid;
var currCustomerCode;
var currShopId;

$(function() {
	
	//回显使用数据
	var obj = $('#chooseSkuDialog').dialog('options');		
	var queryParams = obj["view"];		
	if(typeof(queryParams) != "undefined") {
		currCheckedSkus = queryParams.checkedSkus;
		currCustomerCode = queryParams.customerCode;
		currShopId = queryParams.currShopId;			
	}
	
	currDatagrid = $("#skusDatagrid");
	
	//加载SKU
	currDatagrid.datagrid({			
		striped: true,
		fit: true, //自动大小		
		queryParams : {
			"shopId": currShopId,
			"customerCode": currCustomerCode
	    },
		pagination: true, //分页控件
		rownumbers: true, //行号			
		pageNumber: currPageNumber,		
		pageSize: currPageSize,
		pageList: GLOBAL_PAGE_SIZE_LIST,
		remoteSort:true,
	    sortName:"sku",
        sortOrder:"asc",
		idField: "skuId",
		fitColumns: true,
		selectOnCheck: true,
	    checkOnSelect: true,
		columns: [[
			{field: 'skuId', hidden: true},						
			{field: "sku", title: "SKU", width: 80, align: "center"},
			{field: "goodsName", title: "名称", width: 160, align: "center"},
			{field:"categoryCode",title:"商品分类", width:100,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.categoryCode); 
			}},
			{field: "property", title: "规格", width: 120, align: "center"},
			{field: "stockQty", title: "库存", width: 60, align: "center"},
			{field: "originSalePrice", title: "原价", width: 60, align: "center",formatter:numBaseFormat},
			{field: "salePrice", title: "单价", width: 60, align: "center",formatter:numBaseFormat},
			{field: "qty", title: "数量", width: 60, align: "center"},
			{field:"unit",title:"单位", width:60,align:"center", formatter:function(value, row){
				return formatter(value, window.parent.unitCode); 
			}},
			{field: "operatestatus", title: "状态", width: 60, align: "center",
				formatter:function(value, row){	
					if(row.selected==null){
						return '<span style="font-weight:bold;color:red;">不可选</span>';	
					}else {
						if(row.selected){
							return '<span style="font-weight:bold;color:green;">已选</span>';
						}
						return '<span style="font-weight:bold;color:#FF6600;">待选</span>';
					}								
				}	
			},
			{field: "selected", title: "操作", width: 70, align: "center",
				formatter: function(value, row, index){	
					if(value!=null){
						if(value){						
							return commonAssemBottonHtml('delSkuOne', index, '删除', 'icon-script_delete');
						}else{						
							return commonAssemBottonHtml('addSkuOne', index, '添加', 'icon-script_add');						
						}
					}
													
				}
			}
		]],
		onBeforeLoad:function(param){
			
			var columnOption = $(this).datagrid("getColumnOption", "qty");
    		columnOption.editor = {
    			type:'numberbox',
    			options:{					
    				min:1,
    				precision:0,
    				required: true
    			}
    		};
	    	columnOption.styler = function(value, rowData, rowIndex){
    	    	return 'font-weight:bold;color:green;';
    	    };
	    	if('1' == '${hasEditPricePower}'){
	    		var columnOption = $(this).datagrid("getColumnOption", "salePrice");
	    		columnOption.editor = {
	    			type:'numberbox',
	    			options:{					
	    				min:0,
	    				precision:2,
	    				required: true
	    			}
	    		};
		    	columnOption.styler = function(value, rowData, rowIndex){
	    	    	return 'font-weight:bold;color:green;';
	    	    };	    
	    	}  	
	    },	
	    onAfterEdit: function(rowIndex, rowData, changes){
	    	$.each(currCheckedSkus, function(){	    		
	    		if(rowData.sku == this.sku){
	    			this.qty = rowData.qty;	    			
	    			this.salePrice = rowData.salePrice;
	    			debugger
	    			if(typeof this.giftCount!="undefined" && typeof this.giftPrice!="undefined"){
	    				var receptQty = Number(this.qty)-Number(this.giftCount);
		    			this.totalPrice = Number(this.salePrice) * receptQty;
		    			this.couponPrice = Number(this.giftPrice) + receptQty*(Number(this.originSalePrice)-Number(this.salePrice));
	    			}else{
		    			this.totalPrice = Number(this.salePrice) * Number(this.qty);
		    			this.couponPrice =  Number(this.qty)*(Number(this.originSalePrice)-Number(this.salePrice));
	    			}	    			
	    			//currDatagrid.datagrid("refreshRow", rowIndex);
	    			//刷新父页面商品列表
	    			skuListReLoad(true);
	    			return;
	    		}
	    	});	    	    	
	    },
		showFooter: true,
		loadFilter: function(data){	
			if(typeof data != "undefined"){
				$.each(data.rows, function(){				
					this.selected = false;
					var seletedSku = getSeletedSku(this.sku, currCheckedSkus);				
					if(seletedSku!=null){						
						this.qty = getSkuQty(seletedSku);	
						this.salePrice = getSkuSalePrice(seletedSku);	
						this.selected = true;				
					}	
				});
			}			
			return data;
		},
		rowStyler:function(index, row){	
			var rowStyle = "";
       		$.each(currCheckedSkus,function(){
       			if(existSku(this, row.sku)){
       				rowStyle = "background-color:#FF9933;";
       				return;
       			}
           	});        	   	
        	return rowStyle;
		},
		toolbar: "#skuToolbar",
		loadMsg: "数据加载中请稍后……"
	});
		
	//初始化门店树
	initCategoryTree({"enabled": 1}, 
		function(node){			   
	    	var queryParams = currDatagrid.datagrid("options").queryParams;	
	    	if("0"==node.id){
	    		queryParams.categoryCode = null;
	    	}else{
	    		queryParams.categoryCode = node.id;
	    	}			
			$("#skutitle").html(node.text);
			currDatagrid.datagrid("clearSelections");
			currDatagrid.datagrid('options').url = "${api}/bus/invSku/findListForPage";  
			currDatagrid.datagrid("reload");	   			
		}
	);
});

//查询待选商品
function querySku() {		
	var vaguefield = trim($("#vaguefieldText").textbox("getValue"));	
	var queryParams = currDatagrid.datagrid("options").queryParams;		
	queryParams.q = vaguefield;		
	currDatagrid.datagrid("clearSelections");
	currDatagrid.datagrid("reload");
}


/**
 * 删除一个商品
 */
function delSkuOne(rowIndex){
	
	if (!currDatagrid.datagrid("isValid")){
		$.messager.alert("错误", "编辑行的数据不正确!", "error");  
		return null;
	}
	
	var rowData = currDatagrid.datagrid("getRows")[rowIndex];					
	for(var i in currCheckedSkus) {	
		if(existSku(currCheckedSkus[i], rowData.sku)) {
			currCheckedSkus.splice(i,1);
			rowData.selected = false;
			currDatagrid.datagrid("refreshRow", rowIndex);
			
			//刷新父页面商品列表
			skuListReLoad();
			break;
		}
	}	
}


/**
 * 添加一个商品
 */
function addSkuOne(rowIndex){
	
	if (!currDatagrid.datagrid("isValid")){
		$.messager.alert("错误", "编辑行的数据不正确!", "error");  
		return null;
	}
	
	var rowData = currDatagrid.datagrid("getRows")[rowIndex];
	if(rowData.qty>=0){		
		if('${hasEditPricePower}'=='0' && rowData.salePrice==0){
			$.messager.alert("提示", "该商品在该渠道下不可使用!", "warn");
			return ;
		}
		var oldRow = getSeletedSku(rowData.sku, currCheckedSkus);
		if(oldRow == null){
			var newSku = initAddSku(rowData);
			currCheckedSkus.push(newSku);
			rowData.selected = true;			
			currDatagrid.datagrid("refreshRow", rowIndex);

			//刷新父页面商品列表
			skuListReLoad(true);
		}
	}else{
		$.messager.alert("提示", "商品的数量必须大于零!", "warn");
	}	
	
}



/**********************************    公共方法        ******************************************/


/**
 * 获取存在于被补发的商品中的sku
 */
function getSeletedSku(sku, currCheckedSkus){
	var skuData = null;
	$.each(currCheckedSkus,function(){
		var that = this;
		if(existSku(that, sku)){
			skuData = that;
			return;
		}
	});
	return skuData;
}

</script>