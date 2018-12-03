<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script type="text/javascript">

/**
 *  数据初始化
 */
function dataFilter(rows, prompt){
	var data = [];
	if(rows!=null && rows.length>0){
		data = rows;	   	
	}
	data.unshift({regionId:"",regionName: prompt});
   	return data;
}

/**
 * 初始化省份下拉框
 */
function initProvinceCombo(prompt){
	
	$('#regionCombo').combobox({
		prompt:prompt,
		disabled:true
	});
	
	$('#cityCombo').combobox({
		prompt:prompt,
		disabled:true
	});		
	
	$('#provinceCombo').combobox({		
   	 	valueField: 'regionId',
   	  	textField: 'regionName',
   	  	url: "${api}/region/findRegionList?parentId=1",
   	  	editable:false,  
   	 	loadFilter: function(result){   	    	
   	    	return dataFilter(result.entry, prompt);
   	    },
	   	onSelect:function(row){  	   		
	   		initCityCombo(row.regionId, prompt);
	   	}   
   	});
	
	
}

/**
 * 初始化城市下拉框(省变化时触发)
 * @param provinceId 选中项
 */
function initCityCombo(provinceId, prompt) {
	
	//省份选择为空时，清空城市和区县下拉框	
	if(provinceId==null || provinceId==''){		
		$('#cityCombo').combobox({
			prompt:prompt,
			disabled:true
		});	
	}else{
		$('#cityCombo').combobox({
	   	 	valueField: 'regionId',
	   	  	textField: 'regionName',
	   	  	url: "${api}/region/findRegionList?parentId="+ provinceId,  	 	
	   	  	editable:false, 
	   	 	disabled:false,
	   	 	loadFilter: function(result){   	    	
		    	return dataFilter(result.entry, prompt);
		    },  
		   	onSelect:function(row){     		
		   		initRegionCombo(row.regionId, prompt);
		   	}   
	   	});
	}
}

/**
 * 初始化区县下拉框(城市变化时触发)
 * @param cityId 选中项
 */
function initRegionCombo(cityId, prompt) {
	
	//省份选择为空时，清空城市和区县下拉框		
	if(cityId==null || cityId==''){			
		$('#regionCombo').combobox({
			prompt:prompt,
			disabled:true
		});				
	}else{
		$('#regionCombo').combobox({		
	   	 	valueField: 'regionId',
	   	  	textField: 'regionName',
	   	  	url: "${api}/region/findRegionList?parentId="+ cityId,   	 	
	   	  	editable:false, 
	   	 	disabled:false,
	   	 	loadFilter: function(result){   	    	
		    	return dataFilter(result.entry, prompt);
		    }
	   	});	
	}
	$('#regionCombo').combobox('clear');
}


</script>