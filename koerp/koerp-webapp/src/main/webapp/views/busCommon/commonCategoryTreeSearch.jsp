<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui/tree_extend.js"></script>


<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',split:true" style="width:100%;height:45px;padding:5px" >
		检索: <input id="categorySearch" class="easyui-searchbox" style="width:70%;"
			  data-options="searcher:searchCategory,prompt:'输入分类...'"  />
	</div>
	<div data-options="region:'center',split:true" >
	  	<ul id="categoryTree" ></ul>
	</div>
</div>		

<script type="text/javascript" >
    
var currCategoryTree = $("#categoryTree");
	
/**
 * 初始化门店树
 * 参数  queryParams 查询变量对象
 * 参数  toDetailFunc 点击明细查看方法
 */
function initCategoryTree(queryParams, toDetailFunc){	
	currCategoryTree.tree({
 		    url:"${api}/sku/category/getCategoryTree",
 		    queryParams: queryParams,
		onSelect: function(node){		
			toDetailFunc(node);						
		},
		loadFilter:function(data) {
			var resultData = [data.entry];
			return resultData;
        },
		onLoadSuccess:function(data){							
			//默认选中部门的根节点
	  	 	$(this).tree('select', $(this).tree('getRoot').target);				
		}
	});	
}

//查询树
function searchCategory() {
	currCategoryTree.tree("search", $("#categorySearch").searchbox('getValue')); 
}

	
</script>