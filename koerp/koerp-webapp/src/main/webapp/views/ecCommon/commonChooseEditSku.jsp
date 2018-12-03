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
		data-options="searcher:querySku,prompt:'输入商品名称、货号、SKU筛选...'"  />
	</span>		
	<div style="height:24px;">
		<span class="skutitle" >
			商品列表[<span id="skutitle"></span>](<span style="color:red;">修改数量、金额之后并选中</span>)
		</span>
	</div>		
</div>

<script type="text/javascript">	

var currCheckedSkus = [];	
var currIsbuy = null;
var currDatagrid;

$(function() {
	
	//回显使用数据
	var obj = $('#chooseSkuDialog').dialog('options');		
	var queryParams = obj["view"];		
	if(typeof(queryParams) != "undefined") {
		currCheckedSkus = queryParams.checkedSkus;
		if(typeof(queryParams.isbuy) != "undefined"){
			currIsbuy = queryParams.isbuy;
		}		
	}
	
	currDatagrid = $("#skusDatagrid");
	
	//加载SKU
	currDatagrid.datagrid({			
		striped: true,
		fit: true, //自动大小		
		queryParams : {
			"hasstock": true,
			"isenable": 1
	    },
		pagination: true, //分页控件
		rownumbers: true, //行号			
		pageNumber: currPageNumber,		
		pageSize: currPageSize,
		pageList: GLOBAL_PAGE_SIZE_LIST,
		remoteSort:true,
	    sortName:"sku",
        sortOrder:"asc",
		idField: "skuid",
		fitColumns: true,
		selectOnCheck: true,
	    checkOnSelect: true,
		columns: [[
			//{field: 'skuid', checkbox: true},						
			{field: "sku", title: "SKU", width: 100, align: "center"},
			{field: "materialshortname", title: "名称", width: 200, align: "center"},
			{field: "materialcode", title: "货号", width: 140, align: "center"},
			{field: "price", title: "单价", width: 60, align: "center",formatter:numBaseFormat},			
			{field: "categoryname", title: "分类", width: 60, align: "center"},
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
			{field: "selected", title: "操作", width: 60, align: "center",
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
		showFooter: true,
		loadFilter: function(data){				
			$.each(data.rows, function(){					
				this.saleprice = this.price;	
				this.orderqty = 0.00;
				this.payprice = this.price;
				this.selected = false;
				var seletedSku = getSeletedSku(this.sku, currCheckedSkus);				
				if(seletedSku!=null){						
					this.orderqty = seletedSku.orderqty;
					this.payprice = seletedSku.payprice;
					if(currIsbuy!=null){						
						if(seletedSku.isbuy==currIsbuy){
							this.selected = true;
						}else{
							this.selected = null;
						}
					}else{
						this.selected = true;
					}
					
				}	
			});
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
	initCategoryTree({"isenabled": 1}, 
		function(node){			   
	    	var queryParams = currDatagrid.datagrid("options").queryParams;		
			queryParams.categoryid = node.id;
			$("#skutitle").html(node.text);
			currDatagrid.datagrid("clearSelections");
			currDatagrid.datagrid('options').url = "${api}/sku/findSkuPageList";  
			currDatagrid.datagrid("reload");	   			
		}
	);
});

//查询待选商品
function querySku() {		
	var vaguefield = trim($("#vaguefieldText").textbox("getValue"));	
	var queryParams = currDatagrid.datagrid("options").queryParams;		
	queryParams.vaguefield = vaguefield;		
	currDatagrid.datagrid("clearSelections");
	currDatagrid.datagrid("reload");
}


/**
 * 删除一个商品
 */
function delSkuOne(rowIndex){
	
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
	var rowData = currDatagrid.datagrid("getRows")[rowIndex];
	if(rowData.orderqty>=0){
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
 * 更新当前要删除的商品的商品类型(正品-1、赠品-0)
 */
function updateIsbuy(isbuy){
	currIsbuy = isbuy;
}

/**
 * 补发商品列表中是否存在该sku对应的商品
 */
function existSku(skuData, sku){	
	var orderlineid = skuData.orderlineid;
	var isbuy = skuData.isbuy;
	if(typeof orderlineid == 'undefined' && skuData.sku == sku) {
		if(currIsbuy!=null){
			if(isbuy==currIsbuy){
				return true;
			}
		}else{
			return true;
		}		
	}
	return false;
}


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


/**
 * 初始化新增商品
 */
function initAddSku(rowData){
	var skuDto = {};	
	/* 
	skuDto.orderlineid = undefined;
	skuDto.rowno = "";
	skuDto.companycode = "";
	skuDto.sysorderid = "";
	skuDto.extorderid = "";
	skuDto.giftsid = ""; */	
	skuDto.categoryid = rowData.categoryid;
	skuDto.categoryname = rowData.categoryname;        
	skuDto.bandid = rowData.bandid;//
	skuDto.bandname = rowData.bandname;
	skuDto.materialcode = rowData.materialcode;
	skuDto.materialname = rowData.materialshortname;
	skuDto.sku = rowData.sku;   
	skuDto.sizecode = rowData.sizecode; //
	skuDto.sizename = rowData.sizename;
	skuDto.materialproperty = rowData.suitattribute; //
	skuDto.orderqty = 1; 
	skuDto.occupyqty = 0; 
	skuDto.shipedqty = 0; 
	skuDto.retailprice = rowData.marketprice;
	skuDto.payprice = rowData.price;
	skuDto.saleprice = rowData.price;
	skuDto.totalprice = rowData.price;
	skuDto.discountprice = 0;
	skuDto.iscolor = 0; //是否差异标底色，默认是否	    
	skuDto.isbuy = (currIsbuy!=null?currIsbuy:1);   //bas_bsku中没有标识，默认正品
	skuDto.materialweight = rowData.weight;  //bas_bsku中没有标识，从bas_product取      //
	skuDto.invstatus = 0;
	skuDto.memo = "";      
	skuDto.aftersalestatus = 40;
	return skuDto;
}
	
</script>