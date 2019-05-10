<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<a href="#" id="unoinPayBtn" class="easyui-linkbutton" iconCls="icon-zoom" plain="true" onclick="addPayRow('1')">扫码</a>
<a href="#" id="cashBtn" class="easyui-linkbutton" iconCls="icon-money_yen" plain="true" onclick="addPayRow('2')">现金</a>
<a href="#" id="aliBtn" class="easyui-linkbutton" iconCls="icon-tag_red" plain="true" onclick="addPayRow('3')">支付宝</a>
<a href="#" id="wechatBtn" class="easyui-linkbutton" iconCls="icon-tag_green" plain="true" onclick="addPayRow('4')">微信</a>
<a href="#" id="unPayBtn" class="easyui-linkbutton" iconCls="icon-people" plain="true" onclick="addPayRow('6')">挂账</a>
<a href="#" id="vipPayBtn" class="easyui-linkbutton" iconCls="icon-memu_visa" plain="true" onclick="addPayRow('7')">会员卡</a>
<a href="#" id="transferPayBtn" class="easyui-linkbutton" iconCls="icon-ipod" plain="true" onclick="addPayRow('8')">转账</a>
<a href="#" id="reservePayBtn" class="easyui-linkbutton" iconCls="icon-money" plain="true" onclick="addPayRow('9')">备用金</a>
<a href="#" id="discountBtn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPayRow('100')">任意折扣</a>
<span style="float:right;margin-right:5px;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-cog_add" plain="true" onclick="saveData()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-2012080412301" plain="true" onclick="$('#payAccountWin').window('close');">取消</a>  			  	 	
</span>		
<script type="text/javascript">

/**
 * 打开支付控件
 */
function addPayRow(payMode) {	
	 
	 var balancePrice0 = Number($("#balancePrice", $payAccountfm).val());
	 if(balancePrice0==0){
		 $.messager.alert("提示", "已全额结算!", "info");
		 return ;
	 }
	 if(payMode=='6'){
		 currPayAccountData.push({
			 payMode: payMode,
			 receptPrice: balancePrice0,
			 payPrice: balancePrice0,
			 discountAmount: 0,
			 dibPrice: 0
		 });
		 console.log(currPayAccountData);
		currPayAccountDataGrid.datagrid("loadData", currPayAccountData);
		$("#balancePrice", $payAccountfm).val(0);
		 return ;
	 }	 
	 
	 var dialogHeight = '280px';
	 if(payMode=='1' || payMode=='3' || payMode=='4' || payMode=='8' || payMode=='100'){
		 dialogHeight = '320px'; 
	 }
	 $("<div></div>").dialog({
        id: "payModeDialog",
        title: "支付信息",
        width: "600px",
        height: dialogHeight,
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
           			var payMode = row.payMode;
           			var receptPrice = Number(row.receptPrice);
           			var payPrice = Number(row.payPrice);
           			var balancePrice = Number($("#balancePrice", $payAccountfm).val());           			
           			//实付金额小于应付金额
           			if(payPrice<receptPrice){            					
       					row.receptPrice = payPrice;
       				}   
           			//商家优惠逻辑
           			if(payMode>=99){           				
           				row.discountAmount = payPrice;
           				row.payPrice = 0;
           			} 
           			//应收金额大于0时进行记账
           			if(Number(row.receptPrice)>0){
           				currPayAccountData.push(row);
               			currPayAccountDataGrid.datagrid("loadData", currPayAccountData);
               			//$("#balancePrice", $payAccountfm).val(balancePrice - row.receptPrice);
               			$("#balancePrice", $payAccountfm).val(CalcAmount.subtract(balancePrice, row.receptPrice, 2));
               			$('#payModeDialog').dialog("destroy");   
           			}          			
           			           		
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
            $("#payModeDialog").window('center');              
            var balancePrice = Number($("#balancePrice", $payAccountfm).val());
            $("#payMode", $paymodefm).combobox("setValue", payMode);
            $("#receptPrice", $paymodefm).numberbox("setValue", balancePrice);
            if(payMode!=2){
            	//当支付方式是会员卡时初始化信息
            	if(payMode==7){ 
            		initVipInfo(balancePrice0);               	                    
            	}else if(payMode==9){
            		initReserveInfo(balancePrice0);
            	}else{
            		$("#payPrice", $paymodefm).numberbox({           	   
                  	   max: balancePrice
                    }).numberbox("setValue", balancePrice);
            	}
            }
            $("#payPrice", $paymodefm).numberbox("setValue", balancePrice);                                 
		},
        onClose: function () {
            $(this).dialog("destroy");
        }
    });
   
}

//删除一条账单
function delPayAccountOne(rowIndex){
	var receptPrice = Number(currPayAccountData[rowIndex].receptPrice);
	var balancePrice = Number($("#balancePrice", $payAccountfm).val());
	//$("#balancePrice", $payAccountfm).val(balancePrice + receptPrice);
	$("#balancePrice", $payAccountfm).val(CalcAmount.add(balancePrice, receptPrice, 2));
	currPayAccountData.splice(rowIndex,1);
	currPayAccountDataGrid.datagrid("loadData", currPayAccountData);
	
}

//初始化信息
function initVipInfo(balancePrice){
	
	$("#payPrice", $paymodefm).numberbox({           	   
 	   	max: 0
   	}).numberbox("setValue", 0);
	
	var buyerId = $("#buyerId", $payAccountfm).val();
	$.ajax({
		type : "GET",
		url : "${api}/bus/vip/list?customerCode="+ buyerId,
		dataType : "json",
		success : function(result) {		
			var cardNoList = result.entry;
			if(cardNoList!=null && cardNoList.length>0){
				$.each(cardNoList,function(){
					this.name = this.cardNo +"[余额:"+ this.enablePrice +"元]"
				});
				$("#cardNo", $paymodefm).combobox({  
					width: "260px",
               		panelHeight: 'auto',
               	 	valueField: 'cardNo',
               	  	textField: 'name',
               	  	data: cardNoList,
               	  	onSelect:function(data){
               	  		var enablePrice = data.enablePrice;
               	  		if(enablePrice!=null){
               	  			if(enablePrice>=balancePrice){               	  		
	               	  			$("#payPrice", $paymodefm).numberbox({           	   
	                       	   		max: balancePrice
	                         	}).numberbox("setValue", balancePrice);
               	  			}else{
    	               	  		$("#payPrice", $paymodefm).numberbox({           	   
    	                   	   		max: enablePrice
    	                     	}).numberbox("setValue", enablePrice);
                   	  		}
               	  		}              	  		
               	  	}
                }).combobox("setValue", cardNoList[0].cardNo);
			}          				 	           		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
}

//初始化信息
function initReserveInfo(balancePrice){
	
	$("#payPrice", $paymodefm).numberbox({           	   
 	   	max: 0
   	}).numberbox("setValue", 0);
	
	var buyerId = $("#buyerId", $payAccountfm).val();
	$.ajax({
		type : "GET",
		url : "${api}/bus/reserve/"+ buyerId,
		dataType : "json",
		success : function(result) {		
			var busReserve = result.entry;
			if(busReserve){			
				var enableReserve = busReserve.enableReserve;
				$("#enableReserve").textbox("setValue", busReserve.customerName +"[余额:"+ enableReserve +"元]");
				if(enableReserve>=balancePrice){               	  		
       	  			$("#payPrice", $paymodefm).numberbox({           	   
               	   		max: balancePrice
                 	}).numberbox("setValue", balancePrice);
   	  			}else{
           	  		$("#payPrice", $paymodefm).numberbox({           	   
               	   		max: enableReserve
                 	}).numberbox("setValue", enableReserve);
       	  		}
			}          				 	           		
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			$.messager.alert("错误", errorThrown, "error");
		}
	});  	
}

</script>		