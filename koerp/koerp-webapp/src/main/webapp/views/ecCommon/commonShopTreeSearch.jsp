<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/tree_extend.js"></script>

<div region="west" split="true" title='门店树' style="width:280px;">	
    <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:true" style="width:80%;height:45px;padding:5px" >
			<label>店铺查询：</label>
			<input id="keyword" class="easyui-searchbox"  data-options="searcher:searchShops,prompt:'输入门店编码或名称检索...'"  style="width:180px"/>
		</div>
		<div data-options="region:'center',split:true">
		  <ul id="shopTree" class="easyui-tree"></ul>
		</div>
	</div>		
</div>


<script type="text/javascript" >
    
 	var currTree;
 
	/**
	 * 初始化门店树
	 * 参数  queryParams 查询变量对象
	 * 参数  toDetailFunc 点击明细查看方法
	 */
	function initShopTree(queryParams, toDetailFunc){
		currTree = $("#shopTree");
		currTree.tree({
  		    url:"${api}/shop/getShopTree",
  		    queryParams: queryParams,
			onSelect: function(node){
				if(node.shopType!=null){
					toDetailFunc(node);
				}				
			},
			loadFilter:function(data) {
				var resultData = [];
				if(data.status){
					resultData = data.entry;							
				}
				return resultData;
	        },
			onLoadSuccess:function(data){							
				//默认选中部门的根节点
		  	 	$(this).tree('select', $(this).tree('getRoot').target);				
			}
		});	
	}
	
	//查询树
	function searchShops() {
		var keyword = $("#keyword").searchbox('getValue');
		currTree.tree("search", keyword); 
	}

	
</script>