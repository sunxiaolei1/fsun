<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- BasSku dialog -->
<div id="chooseSkuDialog" class="alert">
	<div class="easyui-layout" style="height:100%;">
		<div data-options="region:'west',split:true,title:'待选商品',collapsible:false" style="width:48%;">
			<div class="easyui-layout" data-options="fit:true" >	
				<div data-options="region:'center',border:false" >
					<table id="waitingSKUDatagrid"></table>
				</div>					
			</div>			
		</div>
		<div data-options="region:'center',collapsible:false">
			<table border="0" width="100%" height="auto" align="center" valign="middle">          	    			        	
		        <tr>                  
	                <a style="margin:100 10 20 10;" class="easyui-linkbutton" data-options="plain:true" onclick="removeAllSkus()" ><<全部</a>  	                		                			         		             
		        </tr> 
		        <tr>                  
	               &nbsp;&nbsp;<a style="margin:20 10 20 10; width:35px;" class="easyui-linkbutton" data-options="plain:true" onclick="removeSkus()" ><<</a>               		                			         		             
		        </tr> 
		        <tr>                  
	               &nbsp;&nbsp;&nbsp;<a style="margin:20 10 20 10;width:35px;" class="easyui-linkbutton" data-options="plain:true" onclick="addSkus()" >>></a>  	                		                			         		             
		        </tr>  
		        <tr>                  
	                <a style="margin:20 10 80 10;" class="easyui-linkbutton" data-options="plain:true" onclick="addAllSkus()" >全部>></a>   		                		                			         		             
		        </tr> 		   
			 </table>     
		</div>
		<div data-options="region:'east',split:true,title:'已选商品',collapsible:false" style="width:45%;">
			<table id="checkedSKUDatagrid" ></table>
		</div>
	</div>
</div>
<!-- BasSku dialog -->

<div id="waitingSKUToolbar"  style="padding:2px;" >		 
		<label>分类：</label>
        <input id="categoryCombo" class="easyui-combobox" style="width:110px;">
		<label>检索：</label>
		<input id="vaguefieldText" class="easyui-textbox" data-options="prompt:'输入商品名称、SKU筛选...'" style="width:170px" />
		<a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012092109942'" onclick="querySku()">查询</a>
		<a id="resetBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-2012080412301'" onclick="resetSku()">重置</a>		 
</div>


<div id="checkedSKUToolbar"  style="padding:2px;" >   
   	<span style="float:right;">	
		<input id="checkedSkuSearcher" class="easyui-searchbox" style="width:250px;">
	</span>	
	<div style="height:24px;">&nbsp;</div>
</div>

<script type="text/javascript">

	var waitingSKUColumns = [
      	[{
			field: 'skuId',
			checkbox: true
		},{
			field: "sku",
			title: "SKU",
			width: 80,
			align: "center"
		},{
			field: "goodsName",
			title: "名称",
			width: 180,
			align: "center"
		},{
			field: "categoryCode",
			title: "分类",
			width: 80,
			align: "center", 
			formatter:function(value, row){
				return formatter(value, window.parent.categoryCode); 
			}			
		}]
	];
	
	var checkedSKUColumns = [
		[{
			field: 'skuId',
			checkbox: true
		},{
			field: "sku",
			title: "SKU",
			width: 80,
			align: "center"
		},{
			field: "goodsName",
			title: "名称",
			width: 180,
			align: "center"
		},{
			field: "categoryCode",
			title: "分类",
			width: 80,
			align: "center", 
			formatter:function(value, row){
				return formatter(value, window.parent.categoryCode); 
			}			
		}]
   	];

	var currCheckedSkus = [];
	var currNotInSkus = [];
	var parentLoadFuncName;
	var definedInitNewSku;
	var waitingSKUDatagrid = $("#waitingSKUDatagrid");
	var checkedSKUDatagrid = $("#checkedSKUDatagrid");

	$(function() {
		
		//回显使用数据
		var obj = $('#chooseSkuDialog').dialog('options');		
		var queryParams = obj["view"];		
		if(typeof(queryParams) != "undefined") {
			currCheckedSkus = queryParams.checkedSkus;
			currNotInSkus = queryParams.notInSkusArr;	
			parentLoadFuncName = queryParams.loadFuncName;
			definedInitNewSku = queryParams.initNewSku
		}
		
		//加载SKU
		waitingSKUDatagrid.datagrid({			
			striped: true,
			fit: true, //自动大小
			url: "${api}/bus/basSku/findListForPage",	
			queryParams : {
				"enabled": true,
				"notInSkusStr": currNotInSkus.join(",")
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
			columns: waitingSKUColumns,
			showFooter: true,
			toolbar: "#waitingSKUToolbar",
			loadMsg: "数据加载中请稍后……"
		});
		
		checkedSKUDatagrid.datagrid({			
			striped: true,
			fit: true, //自动大小					
			pagination: true, //分页控件
			rownumbers: true, //行号			
			pageNumber: currPageNumber,
			pageSize: currPageSize,
			pageList: GLOBAL_PAGE_SIZE_LIST,
			idField: "sku",
			remoteSort:false,
		    sortName:"sku",
	        sortOrder:"asc",
			fitColumns: true,
			selectOnCheck: true,
		    checkOnSelect: true,
			columns: checkedSKUColumns,
			showFooter: true,
			toolbar: "#checkedSKUToolbar",
			loadMsg: "数据加载中请稍后……",
			loadFilter: function(data){
				if (typeof data.length == 'number' && typeof data.splice == 'function'){
			        data = {
			            total: data.length,
			            rows: data,
			            originalTotal: data.length
			        }
			    }      			
				var $currGrid = $(this);
			    if (!data.originalRows){ data.originalRows = data.rows; }
			    var opts = $currGrid.datagrid('options'); 
			    if (opts.searchValue) {      
			    	data.currOriginalRows = [];
			    	$.each(data.originalRows,function(){
			    		var row = this;
			    		if((row.goodsName && row.goodsName.match(opts.searchValue)!=null)
			    	    	|| (row.sku && row.sku.match(opts.searchValue)!=null)) {
			        			data.currOriginalRows.push(row);
			        		}
			    	});			    	  	
			    	//获取首页的数据(需要初始化分页数据，即回到第一页)
			    	data.total = data.currOriginalRows.length;   	
			        data.rows = data.currOriginalRows.slice(0, 30);			        
			    } else {			    	
			    	//获取下一页的数据
			    	data.currOriginalRows = data.originalRows;
			    	data.total = data.originalTotal;			    	
			        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
			        var end = start + parseInt(opts.pageSize);			       
			        data.rows = data.currOriginalRows.slice(start, end);
			    }
			    
			    //初始化下一页的翻页监听事件
			    var pager = $currGrid.datagrid('getPager');
			    pager.pagination({   	
			        onSelectPage:function(pageNum, pageSize){
		                //刷新到下一页的分页参数
		                opts.pageNumber = pageNum;
		                opts.pageSize = pageSize;                               
		                pager.pagination('refresh',{
		                    pageNumber:pageNum,
		                    pageSize:pageSize
		                });
		                $currGrid.datagrid('loadData',data);		        	    	
			        }
			    });    
			    return data;
			}   
		});
		
		window.setTimeout(function(){
			
			checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
			
			$("#categoryCombo").combobox({
				panelHeight:'auto',
		   	 	valueField: 'codeCode',
		   	  	textField: 'codeName',  	  
		   	  	data: window.parent.categoryCodeData,
		   	    loadFilter: function(data){	
					var newData = [];
			 		$.each(data, function(){  
			 			newData.push(this.codeCode == ""?{"codeCode":"","codeName":"全部"}:this);									
			 		});
					return newData;
				}
	        });
			
			
			
			//初始化搜索框
			$('#checkedSkuSearcher').searchbox({
		         prompt: '输入商品名称、SKU筛选...',
		         searcher: function (value, name) {
		        	 checkedSKUDatagrid.datagrid("clearSelections");
		        	 checkedSKUDatagrid.datagrid({searchValue: value}).datagrid("loadData", currCheckedSkus);
		         }
		     });
			
        }, 100);
	
	});

	//查询待选商品
	function querySku() {
		
		var vaguefield = trim($("#vaguefieldText").textbox("getValue"));
		var categoryCode = trim($("#categoryCombo").combobox("getValue"));
		var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;		
		queryParams.q = vaguefield;	
		queryParams.categoryCode = categoryCode;		
		waitingSKUDatagrid.datagrid("clearSelections");
		waitingSKUDatagrid.datagrid("reload");
	}
	
	//重置待选商品
	function resetSku(){
		$("#vaguefieldText").textbox("clear");
		$("#categoryCombo").combobox("clear");
		var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;		
		queryParams.q = "";	
		queryParams.categoryCode = "";		
		waitingSKUDatagrid.datagrid("clearSelections");
		waitingSKUDatagrid.datagrid("reload");
	}
	
	/**********************************************          菜品添加与去除操作          *************************************************/

	//添加选中的菜品(去重)到价格策略
	function addSkus() {
		var selectedSkus = waitingSKUDatagrid.datagrid('getSelections');
		if(selectedSkus.length>0){
			$.each(selectedSkus,function(){
				var exist = false;		
				for(var i in currCheckedSkus) {					
					if(this.sku == currCheckedSkus[i].sku) {
						exist = true;
						break;
					}
				}
				if(!exist) {	
					console.log(this);
					var newSku = initNewSku(this);
					currCheckedSkus.push(newSku);
					currNotInSkus.push(this.sku);
				}
			});
			checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
			waitingSKUDatagrid.datagrid("reload",{"notInSkusStr": currNotInSkus.join(",")});
						
			if(typeof(parentLoadFuncName) != "undefined") {					
				eval(parentLoadFuncName)();				
			}else{
				skuListReLoad();
			}			
		}	
	}
	
	//添加所有的菜品到价格策略
	function addAllSkus(){
		
		$.messager.progress({title: '请等待',msg: '保存中...',text: '',interval: 700});
	    $.ajax({
	        type: "POST",
	        url: "${api}/bus/basSku/findListForPage",	
			data : {
				"ebabled": true,
				"notInSkusStr": currNotInSkus.join(",")
		    },
	        async: true,	
	        dataType: "json",
	        success: function (data) {  
	        	$.messager.progress('close');
	            if (data.status) {           		                
	            	$.each(data.entry, function(){
	            		var row = this;
	            		var isExist = false;
	            		$.each(currCheckedSkus,function(){
	            			if(row.sku == this.sku){
	            				isExist = true;
	            				return;
	            			}
	            		});	            		
	            		if(!isExist){	            			
	            			var newSku = initNewSku(row);	            			
	            			currCheckedSkus.push(newSku);
	            			currNotInSkus.push(this.sku);	            				            			
	            		}
	            	});	            		            		        		
	        		checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
	        		waitingSKUDatagrid.datagrid("loadData",[]);
	        		
	        		if(typeof(parentLoadFuncName) != "undefined") {					
	    				eval(parentLoadFuncName)();				
	    			}else{
	    				skuListReLoad();
	    			}	
	            }
	        }
	    });
	}
	
	//去除选中的商品
	function removeSkus() {
		var selectedSkus = checkedSKUDatagrid.datagrid('getSelections');
		if(selectedSkus.length>0){
			$.each(selectedSkus,function(){	
				for(var i in currCheckedSkus) {					
					if(this.sku == currCheckedSkus[i].sku) {
						currCheckedSkus.splice(i,1);
						currNotInSkus.splice(i,1);
						break;
					}
				}
			});
			checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
			waitingSKUDatagrid.datagrid("reload",{"notInSkusStr": currNotInSkus.join(",")});

			if(typeof(parentLoadFuncName) != "undefined") {					
				eval(parentLoadFuncName)();				
			}else{
				skuListReLoad();
			}		
		}	
	}
	
	//去除所有的商品
	function removeAllSkus(){
		
		currCheckedSkus.splice(0,currCheckedSkus.length);
		currNotInSkus.splice(0,currNotInSkus.length);	
		checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
		waitingSKUDatagrid.datagrid("reload",{"notInSkusStr": ""});

		if(typeof(parentLoadFuncName) != "undefined") {					
			eval(parentLoadFuncName)();				
		}else{
			skuListReLoad();
		}		
	}
	
	/*********************************                   内部方法                  **************************************/
	
	//初始化一个商品
	function initNewSku(checkedSku){
		
		if(checkedSku==null){
			return null;
		}
		
		if(typeof(definedInitNewSku)!="undefined"){
			return eval(definedInitNewSku)(checkedSku);		
		}
		
		var sku = new Object();		
		
		sku.skuId = checkedSku.skuId;		
		sku.categoryCode = checkedSku.categoryCode;      
		sku.productType = checkedSku.productType;
		sku.sku = checkedSku.sku; 
        sku.brandCode = checkedSku.brandCode;
        sku.goodsName = checkedSku.goodsName;
        sku.enName = checkedSku.enName;
	    sku.property = checkedSku.property;     
	    sku.marketPrice = checkedSku.marketPrice;
	    sku.salePrice = checkedSku.salePrice;
	    sku.supplyPrice = checkedSku.marketPrice;
	    sku.vipPrice = checkedSku.salePrice;
	    sku.unit = checkedSku.unit;
	    sku.unitName = checkedSku.unitName;
	    sku.keywords = checkedSku.keywords;     
        return sku;
	}

	
</script>