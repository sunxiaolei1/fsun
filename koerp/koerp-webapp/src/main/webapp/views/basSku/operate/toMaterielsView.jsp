<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div style="height:180px;" >
	<table id="list-detial-table-${param.currIndex}" ></table>
</div>
	
<script>
     var detailGird = null;
	 $(function() {
		 detailGird = $('#list-detial-table-${param.currIndex}');
		 detailGird.datagrid({
			nowrap: false, 
			pagination: false,
			idField: 'skuId',
			fit: true,
			rownumbers: true,
			fitColumns: true,
			singleSelect: false,
			loadMsg:'加载中，请稍等。。。',
			url:"${api}/bus/basSku/materiels/${param.skuId}",
			queryParams:{
				tradeType: '${param.tradeType}'
			},
			onBeforeLoad: function(param){				   		 				   
	        	$(this).datagrid('clearSelections');             		 
    		},
    		columns: [[
				{field: 'skuId', checkbox: true},						
				{field: "sku", title: "SKU", width: 80, align: "center"},
				{field: "goodsName", title: "名称", width: 160, align: "center"},
				{field:"productType",title:"类型", width:70,align:"center", formatter:function(value, row){
					return formatter(value, window.parent.productType); 
				}},
				{field:"categoryCode",title:"分类", width:90,align:"center", formatter:function(value, row){
					return formatter(value, window.parent.categoryCode); 
				}},
				//{field: "property", title: "规格", width: 120, align: "center"},			
				{field: "salePrice", title: "单价", width: 80, align: "center",formatter:numBaseFormat},						
				{field: "qty", title: "数量", width: 60, align: "center"},
				{field:"unit",title:"单位", width:50,align:"center", formatter:function(value, row){
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
				{field: "selected", title: "操作", width: 80, align: "center",
					formatter: function(value, row, index){	
						if(value!=null){
							if(value){						
								return commonAssemBottonHtml('delMaterielOne', index, '删除', 'icon-script_delete');
							}else{						
								return commonAssemBottonHtml('addMaterielOne', index, '添加', 'icon-script_add');						
							}
						}													
					}
				}
   			]],			
			onSelectAll: function(rows){					
				var isTrue = true;
				$.each(rows, function() {					
					if(this.qty==0){	
						isTrue = false;
						$.messager.alert("提示", "商品的数量必须大于零!", "warn");
						return;
					}					
				});	
				if(isTrue){
					$.each(rows, function() {
						var rowData = this;						
						var oldRow = getSeletedSku(rowData.sku, currCheckedSkus);
						if(oldRow == null){
							var newSku = initAddSku(rowData);
							currCheckedSkus.push(newSku);
							rowData.selected = true;														
						}										
					});	
					$(this).datagrid("reload");
					//刷新父页面商品列表
					skuListReLoad(true);
				}				
			},
			loadFilter: function(data){	
				if(typeof data != "undefined"){
					var rows = data.entry;	
					$.each(rows, function(){
						this.selected = false;
						var seletedSku = getSeletedSku(this.sku, currCheckedSkus);				
						if(seletedSku!=null){							
							this.qty = getSkuQty(seletedSku);
							this.salePrice = getSkuPrice(seletedSku);
							this.selected = true;				
						}	
					});
					return rows;
				}		
				return new Array();
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
			}
		});	

	});
	 
	 /**
	  * 删除一个商品
	  */
	 function delMaterielOne(rowIndex){	 	
	 	if (!detailGird.datagrid("isValid")){
	 		$.messager.alert("错误", "编辑行的数据不正确!", "error");  
	 		return null;
	 	}
	 	
	 	var rowData = detailGird.datagrid("getRows")[rowIndex];					
	 	for(var i in currCheckedSkus) {	
	 		if(existSku(currCheckedSkus[i], rowData.sku)) {
	 			currCheckedSkus.splice(i,1);
	 			rowData.selected = false;
	 			detailGird.datagrid("refreshRow", rowIndex);						
	 			//刷新父页面商品列表
	 			skuListReLoad();
	 			break;
	 		}
	 	}	
	 }


	 /**
	  * 添加一个商品
	  */
	 function addMaterielOne(rowIndex){	
	 	if (!detailGird.datagrid("isValid")){
	 		$.messager.alert("错误", "编辑行的数据不正确!", "error");  
	 		return null;
	 	}
	 	
	 	var rowData = detailGird.datagrid("getRows")[rowIndex];
	 	if(rowData.qty>=0){
	 		var oldRow = getSeletedSku(rowData.sku, currCheckedSkus);
	 		if(oldRow == null){
	 			var newSku = initAddSku(rowData);
	 			currCheckedSkus.push(newSku);
	 			rowData.selected = true;					
	 			detailGird.datagrid("refreshRow", rowIndex);
	 			
	 			//刷新父页面商品列表
	 			skuListReLoad(true);
	 		}
	 	}else{
	 		$.messager.alert("提示", "商品的数量必须大于零!", "warn");
	 	}	
	 	
	 }

</script>