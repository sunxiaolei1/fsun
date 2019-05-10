<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<div class="fsun-wrap">
	<form id="setGiftsfm">
	    <input name="isGift" value="true" hidden=true />
		<span class="title" style="top: 30px;">配置商品(<span id="goodsName"></span>)信息</span>			
		<table class="nb-formTable" style="width:100%;margin-top:2px;">
	        <tr>
	            <th width="12%">SKU</th>
				<td>
					<input id="sku" name="sku" class="easyui-textbox" readOnly />
				</td>
				<th width="12%">赠送类型<span style="color:red;">*</span></th>
				<td>
					<input id="goodsType" name="goodsType" class="easyui-combobox" 
						editable="false" required/>								
				</td>																					
	        </tr>
	        <tr>	        	
	        	<th width="12%">当前数量</th>
				<td>
					<input id="qty" name="qty" class="easyui-numberbox" readOnly
						data-options="formatter: intNumBaseFormat"/>									
				</td>
	        	<th width="12%">赠送数量<span style="color:red;">*</span></th>
				<td>
					<input id="giftCount" name="giftCount" class="easyui-numberspinner" required />									
				</td>	        						        		        	
	        </tr>        
		</table>
	</form>			
</div>	

<script type="text/javascript">

var $setGiftsfm = $("#setGiftsfm");   

$(function () { 
	
	$('#goodsType', $setGiftsfm).combobox({  
		prompt: '请选择...',
		panelHeight: 'auto',
   	 	valueField: 'codeCode',
   	  	textField: 'codeName',
   	  	data: window.parent.busGoodsTypeData
   	});	
	
	//去除默认的请选择项
	editInitComboxParams($setGiftsfm, "");
     
});


</script>


