<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<!-- BasSku dialog -->
<div id="chooseSkuDialog" class="alert">
	<div class="easyui-layout" style="height:100%;">
		<div data-options="region:'west',split:true,title:'待选商品',collapsible:false" style="width:520px;">
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
		<div data-options="region:'east',split:true,title:'已选商品',collapsible:false" style="width:540px;">
			<table id="checkedSKUDatagrid" ></table>
		</div>
	</div>
</div>
<!-- BasSku dialog -->

<div id="waitingSKUToolbar"  style="padding:2px;" >		 
		<label>分类：</label>
        <input id="categoryComboTree" class="easyui-combotree" style="width:110px;">
		<label>检索：</label>
		<input id="vaguefieldText" class="easyui-textbox" data-options="prompt:'输入商品名称、货号、SKU筛选...'" style="width:190px" />
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
			field: 'skuid',
			checkbox: true
		},{
			field: "sku",
			title: "SKU",
			width: 100,
			align: "center"
		},{
			field: "materialshortname",
			title: "名称",
			width: 200,
			align: "center"
		},{
			field: "materialcode",
			title: "货号",
			width: 140,
			align: "center"
		},{
			field: "categoryname",
			title: "分类",
			width: 60,
			align: "center"
		}]
	];
	
	var checkedSKUColumns = [
         	[{
   			field: 'skuid',
   			checkbox: true
   		},{
   			field: "sku",
   			title: "SKU",
   			width: 100,
   			align: "center"
   		},{
   			field: "materialname",
   			title: "名称",
   			width: 200,
   			align: "center"
   		},{
   			field: "materialcode",
   			title: "货号",
   			width: 140,
   			align: "center"
   		}/* ,{
   			field: "categoryname",
   			title: "分类",
   			width: 60,
   			align: "center"
   		} */]
   	];

	var currCheckedSkus = [];
	var currNotInSkus = [];
	var parentLoadFuncName;
	var definedInitNewSku;
	var currCompanycode;
	var currShopid;
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
			currCompanycode = queryParams.currCompanycode;
			currShopid = queryParams.currShopid;
		}
		
		//加载SKU
		waitingSKUDatagrid.datagrid({			
			striped: true,
			fit: true, //自动大小
			url: "${api}/invsku/findInvSkuPageList",	
			queryParams : {
				"nopage": true,
				"companycode": currCompanycode,
				"shopid": currShopid,
				"notinskus": currNotInSkus.join(",")
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
			    		if((row.materialname && row.materialname.match(opts.searchValue)!=null)
			        			|| (row.materialcode && row.materialcode.match(opts.searchValue)!=null)
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
			
			$("#categoryCombotree").combotree({
	            panelHeight: 250,
	            //url: "${api}/basCategory/findBasCategoryListByConditions?categoryType=0",
	            method: "post",
	            prompt: "请选择分类",
	            queryParams: {
	                "isEnabled": true,
	                "sort": "sortCode",
	                "order": "asc"
	            },
	            loadFilter: function (data) {
	                //转换为树型格式的json数据	 
	                if(data.status){
	                	 return convertTreeData(data.entry);
	                }	               
	            }
	        });
			
			//初始化搜索框
			$('#checkedSkuSearcher').searchbox({
		         prompt: '输入商品名称、货号、SKU筛选...',
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
		var categoryid = trim($("#categoryComboTree").combotree("getValue"));
		var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;		
		queryParams.q = vaguefield;	
		queryParams.categoryid = categoryid;	
		queryParams.notinskus = currNotInSkus.join(",");	
		waitingSKUDatagrid.datagrid("clearSelections");
		waitingSKUDatagrid.datagrid("reload");
	}
	
	//重置待选商品
	function resetSku(){
		$("#vaguefieldText").textbox("clear");
		$("#categoryComboTree").combotree("clear");
		var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;		
		queryParams.q = "";	
		queryParams.categoryid = "";	
		queryParams.notinskus = currNotInSkus.join(",");	
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
					var newSku = initNewSku(this);
					currCheckedSkus.push(newSku);
					currNotInSkus.push(this.sku);
				}
			});
			checkedSKUDatagrid.datagrid("loadData", currCheckedSkus);
			
			var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;					
			queryParams.notinskus = currNotInSkus.join(",");			
			waitingSKUDatagrid.datagrid("reload");
						
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
		var vaguefield = trim($("#vaguefieldText").textbox("getValue"));
		var categoryid = trim($("#categoryComboTree").combotree("getValue"));
	    $.ajax({
	        type: "POST",
	        url: "${api}/invsku/list",
	        contentType:"application/json;charset=utf-8",
			data: JSON.stringify({
				"companycode": currCompanycode,
				"shopid": currShopid,
				"notinskus": currNotInSkus.join(","),
				"q": vaguefield,
				"categoryid": categoryid
		    }),
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
			
			var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;					
			queryParams.notinskus = currNotInSkus.join(",");	
			waitingSKUDatagrid.datagrid("reload");

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
		var queryParams = waitingSKUDatagrid.datagrid("options").queryParams;					
		queryParams.notinskus = "";
		waitingSKUDatagrid.datagrid("reload");

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
		
		//后台添加
		/* sku.orderlineid = "";
		sku.rowno = "";
		sku.companycode = "";
		sku.sysorderid = "";
		sku.extorderid = "";
		sku.giftsid = ""; */
		
		sku.categoryid = checkedSku.categoryid;
        sku.categoryname = checkedSku.categoryname;        
        sku.bandid = checkedSku.bandid;
        sku.bandname = checkedSku.bandname;
        sku.materialcode = checkedSku.materialcode;
        sku.materialname = checkedSku.materialshortname;
        sku.sku = checkedSku.sku;   
	    sku.sizecode = checkedSku.sizecode;
	    sku.sizename = checkedSku.sizename;
	    sku.materialproperty = checkedSku.suitattribute; 
	    sku.orderqty = 1; 
	    sku.occupyqty = 0; 
	    sku.shipedqty = 0; 
	    sku.retailprice = checkedSku.marketprice;
	    sku.saleprice = checkedSku.price;
	    sku.payprice = checkedSku.price;
	    sku.totalprice = checkedSku.price;
	    sku.discountprice = 0;
	    sku.iscolor = 0; //是否差异标底色，默认是否	    
        sku.isbuy = 1;   //bas_bsku中没有标识，默认正品
        sku.materialweight = checkedSku.weight;  //bas_bsku中没有标识，从bas_product取      
        sku.invstatus = 0;
        sku.memo = "";      
        return sku;
	}

	/*************************************         下拉分类树转换器              ****************************************/
	
	//转换为树型格式的json数据
    function convertTreeData(rows) {
        //判断是否为根节点
        function exists(rows, parentId) {
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].categoryid == parentId) {
                    return true;
                }
            }
            return false;
        }

        var nodes = [];
        //遍历出所有最顶级的商品分类
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            //判断是否为根节点的商品分类
            if (!exists(rows, row.parentId)) {
                nodes.push({
                    id: row.categoryid,
                    text: row.categoryname
                });
            }
        }

        //存储所有根节点
        var rootNodes = [];
        for (var i = 0; i < nodes.length; i++) {
            rootNodes.push(nodes[i]);
        }

        //遍历并包装所有根节点下的子节点
        while (rootNodes.length) {
            var node = rootNodes.shift();
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (row.parentId == node.id) {
                    var child = {
                        id: row.categoryid,
                        text: row.categoryname
                    };
                    if (node.children) {
                        node.children.push(child);
                    } else {
                        node.children = [child];
                    }
                    rootNodes.push(child);
                }
            }
        }
        return nodes;
    }
</script>