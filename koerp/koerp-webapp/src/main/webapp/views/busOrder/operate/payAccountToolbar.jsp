<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('1')">银行卡</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('2')">现金</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('3')">支付宝</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('4')">微信</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('6')">挂账</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('7')">会员卡</a>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('100')">任意折扣</a>
<span style="float:right;margin-right:5px;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="saveData()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="$('#payAccountWin').window('close');">取消</a>  			  	 	
</span>		
<script type="text/javascript">

/**
 * 打开支付控件
 */
function addPayRow(payMode) {	
	 
	 var balancePrice = $("#balancePrice", $payAccountfm).val();
	 if(balancePrice==0){
		 $.messager.alert("提示", "已全额结算!", "info");
		 return ;
	 }
	 $("<div></div>").dialog({
        id: "payModeDialog",
        title: "支付信息",
        width: 600,
        height: 240,
        iconCls: "icon-edit",
        closed: false,
        cache: false,
        href: "${api}/bus/order/toPayModeView?payMode="+ payMode,	       
        modal: true,
        minimizable: false,
        maximizable: false,
        closable: true,
        collapsible: false,
        resizable: true,
        buttons:[
        	{
        		text:"确定",iconCls:"icon-disk",
                handler: function (data) {                     	             		
           			var row = formJson($paymodefm);  
           			if(row.payMode>=99){
           				row.discountAmount = row.payPrice;
           				row.payPrice = 0;
           			}
           			currPayAccountData.push(row);
           			currPayAccountDataGrid.datagrid("loadData", currPayAccountData);
           			$("#balancePrice", $payAccountfm).val($("#balancePrice", $payAccountfm).val()-row.receptPrice);
           			$('#payModeDialog').dialog("destroy");              		
                }
            },
            {
                text:"取消",
                iconCls:"icon-cancel",
                handler:function(){
                	$('#payModeDialog').dialog("destroy");
                }
            }
        ],
        onLoad:function(){
            $('#payModeDialog').window('center');              
            var balancePrice = $("#balancePrice", $payAccountfm).val();
            if(payMode!=2){
            	$("#payPrice", $paymodefm).numberbox({
            	   min: 0.1,
            	   precision:2,
             	   max: balancePrice
                 }).numberbox("setValue", balancePrice);
            }else{
            	$("#payPrice", $paymodefm).numberbox({
             	   min: 0.1,
             	   precision:2
                }).numberbox("setValue", balancePrice);
            }
            $("#payMode", $paymodefm).combobox("setValue", payMode);
            $("#receptPrice", $paymodefm).val(balancePrice);  
            
		},
        onClose: function () {
            $(this).dialog("destroy");
        }
    });
   
}

//删除一条账单
function delPayAccountOne(rowIndex){
	$("#balancePrice", $payAccountfm).val($("#balancePrice", $payAccountfm).val() + currPayAccountData[rowIndex].receptPrice);
	currPayAccountData.splice(rowIndex,1);
	currPayAccountDataGrid.datagrid("loadData", currPayAccountData);
	
}

</script>		