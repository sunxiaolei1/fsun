/**
 * 组装基本的combox
 * @param id
 * @param url
 * @param data
 * @param value
 * @param text
 * @param onSelectFunc 选中是触发
 */
function createCombox(id, url, data, value, text, onSelectFunc){
	$.ajax({
       	url:url,	
       	dataType: "json",
        async:false,
        data:data,
       	success:function(result){
        	if(result && result.entry){
        		$('#'+id).combobox({   	
        	   	 	valueField: value,
        	   	  	textField: text,
        	   	  	data: result.entry,
	        	   	onSelect:function(record){
	     	       		if(onSelectFunc && typeof(onSelectFunc)=="function"){
	     	       			onSelectFunc(record);
	     	       		}
	     	       	}
        	   	});	 
        	}
       	}
	});
}

/**
 * 省选择时触发
 * @param node 选中项
 */
function lcoal_onChangeProvince(node) {
	if(node && node.regionId) {
		$("#province").val(node.regionName);
		createCombox("cityCombo", API_PATH + "/region/findRegionList", {"parentId":node.regionId},
			'regionId', 'regionName', lcoal_onChangeCity);
	}
}

/**
 * 市选择时触发
 * @param node 选中项
 */
function lcoal_onChangeCity(node) {
	if(node && node.regionId) {
		$("#city").val(node.regionName);
		createCombox("districtCombo", API_PATH + "/region/findRegionList", {"parentId":node.regionId},
			'regionId', 'regionName', lcoal_onChangeDistrict);
	}
}

/**
 * 地区选择时触发
 * @param node 选中项
 */
function lcoal_onChangeDistrict(node) {
	if(node && node.regionId) {
		$("#district").val(node.regionName);
	}
}

/**
 * 从bascodes中转换的值
 * @param url
 * @param data
 * @param val
 * @returns
 */
function formatterUrl(url, data, val){
	var formatterVal;
	$.ajax({
       	url:url,	
       	dataType: "json",
        async:false,
        data:data,
       	success:function(result){
        	if(result && result.entry){
        		var typeMap = {};
        		for(var i = 0; i<result.entry.length; i++) {
        			typeMap[result.entry[i].codeCode] = result.entry[i].codeName;
        		}
        	}
       		
       		if(typeMap[val])
       			formatterVal = typeMap[val];
       		else
       			formatterVal = val;
       	}
	});
	
	return formatterVal; 
}


/**
 * 转换部门树型结构数据
 * @param rows
 * @returns {Array}
 */
function convertDeptTreeData(rows){
	//判断是否为根节点
	function exists(rows, parentId){
		for(var i=0;i<rows.length;i++){
			if (rows[i].deptId == parentId){
				return true;
			}
		}
		return false;
	}
	
	var nodes = [];
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		//判断是否为根节点
		if (!exists(rows, row.parentId)){
			nodes.push(row);
		}
	}
	
	//存储所有根节点
	var rootNodes = [];
	for(var i=0;i<nodes.length;i++){
		var node = nodes[i];
		node["id"] = node.deptId;
		node["text"] = node.deptName;
		rootNodes.push(node);
	}
	
	//遍历并包装所有根节点下的子节点
	while(rootNodes.length){
		var node = rootNodes.shift();
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
			if (row.parentId == node.deptId){
				var child = row;
				child["id"] = child.deptId;
				child["text"] = child.deptName;
				if (node.children){
					node.children.push(child);
				}else{
					node.children = [child];
				}
				rootNodes.push(child);
			}
		}
	}
	
	return nodes;
}

/**
 * 初始化门店下拉框
 * @param id
 * @param title
 * @param shopId
 */
function initShopComboGrid(id){
	$("#" + id).combogrid({
        panelWidth: 400,
        panelHeight: 420,
        idField: 'shopId',
        textField: 'shopName',
        url: "${api}/shop/findShopPageList",
        queryParams: {"clientType": clientType},
        multiple: true,
        fitColumns: true,
        striped: true,
        editable: false,
        pagination: true,//是否分页
        rownumbers: true,//序号
        collapsible: false,//是否可折叠的
        pageSize: GLOBAL_PAGE_SIZE,
        pageList: GLOBAL_PAGE_SIZE_LIST,
        method: 'post',
        mode:'remote',
        columns: [[
            {field: 'ck', checkbox: true},
            {field: "shopId", hidden:true},
            {field: "shopCode", hidden:true, title: "店铺编号", width: 80},
            {field: "shopName", title: "店铺名称", width: 220}
        ]],
        onChange:function(newValue, oldValue){
		},
		keyHandler: {
            up: function() {},
            down: function() {},
            enter: function() {},
            query: function(q) {
                $('#' + id).combogrid("grid").datagrid("reload", { 'keyword': q });
                $('#' + id).combogrid("setValue", q);
            }
        },
        loadMsg: "数据加载中请稍后……",
        emptyMsg: "没有符合条件的记录"
    });
}
