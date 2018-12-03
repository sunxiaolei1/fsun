
//自定义可编辑单元格(支持批量删除、textbox单元格回车到下一个单元格，支持搜索功能)

$.extend($.fn.datagrid.defaults, {
	clickToEdit: true,
	dblclickToEdit: false,
	onBeforeCellEdit: function(index, field){},
	onCellEdit: function(index, field, value){
		var input = $(this).datagrid('input', {index:index, field:field});
		if (input){
			if (value != undefined){
				input.val(value);
			}
		}
	},
	onSelectCell: function(index, field){},
	onUnselectCell: function(index, field){},
	onClickCell: function(index, field){
		$(this).datagrid('editCell', {index:index,field:field});
	},
	onClickRow: function(rowIndex, rowData){
		
		var opts = $(this).datagrid('options');		
		if(opts.editCellIndex!= undefined){
			$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow", opts.editCellIndex); 
		}else{
			$(this).datagrid("unselectAll");
			$(this).datagrid("selectRow", rowIndex); 
		}		
	}

});

$.extend($.fn.datagrid.methods, {
	editCell: function(jq,param){
		return jq.each(function(){
			
			var opts = $(this).datagrid('options');
			//如不可编辑则返回
			if (!$(this).datagrid('endEditing', param.field)){	
				return;
			}                      
			var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field){
					col.editor = null;
				}
			}
			$(this).datagrid('beginEdit', param.index);
			
			var editor = $(this).datagrid('getEditor', param);	
			$that = $(this);
			$(editor.target).next().children("input:first-child").focus();
			$(editor.target).next().children("input:first-child").keyup(function(e){
				param.keyCode = e.keyCode;
				param.fields = fields;
				param.datagrid = $that;
				$that.datagrid("navHandler", param);
			});
							
			//记录被编辑的单元格索引
			opts.editCellIndex = param.index;
			opts.editCellField = param.field;
			
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
				
		});
	},
	navHandler: function(jq, param){
		var keyCode = param.keyCode;
		switch (keyCode){
		//回车键
		case 13:		  
		  var fields = param.fields;
		  var datagrid = param.datagrid; 
		  var toEdit = false;
		  for(var i=0;i<fields.length;i++){
			  if(toEdit){				 
				  var param0 = {"index": param.index,"field": fields[i]};
				  var col = datagrid.datagrid('getColumnOption', fields[i]);				  
				  if(col.editor!=null){
					  datagrid.datagrid('editCell', param0); 				 					  
					  break;
				  }				 
			  }			  
			  if(fields[i]==param.field && datagrid.datagrid('validateRow', param.index)){				  
				  toEdit = true;
			  }
		  }
		  break;
		default:
		  break;
		}
	},
	//是否可编辑
    isCellEditable: function (jq, param) {
        var col = jq.datagrid('getColumnOption', param);
        return col.editor != null && col.editor != undefined;
    },    
    //判别可编辑的grid中的可编辑行是否通过验证
    isValid: function(jq){
    	//获取可编辑行
    	var editIndex = jq.datagrid('options')["editCellIndex"];
    	//可编辑行存在
    	if("undefined" != typeof editIndex){
    		if (jq.datagrid('validateRow', editIndex)){  		
    			jq.datagrid('acceptChanges'); 	
    			return true;
            }else{       	
            	return false;
            }
    	}else{
    		return true;
        }
    },
    endEditing: function(jq, field){

    	if (jq.datagrid('isCellEditable', field)) {
    		//上一个在编辑的单元格			
    		var editCellIndex = jq.datagrid('options')["editCellIndex"];
    		if(editCellIndex == undefined){
    			jq.datagrid('options').editCellIndex = undefined;
    			jq.datagrid('options').editCellField = undefined;
    			return true;
    		}else{
    			if (jq.datagrid('validateRow', editCellIndex)){
    				jq.datagrid('endEdit', editCellIndex);
    				jq.datagrid('loadData',jq.datagrid("getData"));	
    				jq.datagrid('options').editCellIndex = undefined;
    				jq.datagrid('options').editCellField = undefined;
    				return true;
    			}else{
    				return false;
    			}
    		}    
        }else{
        	var editCellIndex = jq.datagrid('options')["editCellIndex"];
    		if(editCellIndex != undefined){
    			if (jq.datagrid('validateRow', editCellIndex)){
    				jq.datagrid('endEdit', editCellIndex);	
    				jq.datagrid('loadData',jq.datagrid("getData"));	
    				jq.datagrid('options').editCellIndex = undefined;		
    				jq.datagrid('options').editCellField = undefined;
    			}			
    		}
        	return false;
        }	   	
    },
    scrollToCell: function (jq, param) {
        return jq.each(function () {       	
            var body2 = $(this).data('datagrid').dc.body2;

            var fields = $(this).datagrid('getColumnFields', true).concat($(this).datagrid('getColumnFields'));
            var _width = 0;
            var IsStart = false;
            for (var i = 0; i < fields.length; i++) {

                if (fields[i] != param.startfield && IsStart == false) {
                    continue;
                }
                IsStart = true;
                var col = $(this).datagrid('getColumnOption', fields[i]);
                _width += col.width;
                
                if (fields[i] == param.endfield) {
                    break;
                }
            }
            body2.animate({ scrollLeft: _width + 'px' }, 800);
        });
    }
});
