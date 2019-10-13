<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tableAllotHead" style="display:none;" >		 
	<table id="allotHead1" border=0 cellSpacing=0 cellPadding=2 width="100%" >	  			  
  	 	
  	</table>	
</div>

<div id="printTableAllot" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=1 width="100%" style="font-size:16px; border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="3%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>SKU</b></DIV></TD>
	    <TD width="23%">
	      <DIV align=center><b>商品名称</b></DIV></TD>
	    <TD width="10%">
	      <DIV align=center><b>规格</b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>单位</b></DIV></TD>
	    <TD width="8%">
	      <DIV align=center><b>发货数量</b></DIV></TD>		    	   
	    <TD width="8%">
	      <DIV align=center><b>签收数量</b></DIV></TD>
	    <TD width="9%">
	      <DIV align=center><b>备注</b></DIV></TD>   	   
	  </TR>	
	</thead>      
	  <TBODY id="tableAllotData">    
		  
	  </TBODY>
	</TABLE>
</div>
	
<script type="text/javascript">

/***************************************** 制作销售单的操作 *******************************************/

function madeAllotView(docOrderDto, afterPrintFunc){
	if(docOrderDto){
    	var LODOP=getLodop();  
		//LODOP.PRINT_INIT("送货单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"203mm","141mm","");		   			
		
		createOneAllotPage(LODOP,docOrderDto,0);
		
		initAllotPagePublicInfo(LODOP, docOrderDto);
		
		if (LODOP.CVERSION) {  //用CVERSION属性判断是否云打印
	        LODOP.On_Return=function(TaskID,Value){
               if (Value!=0) {
      			  $.ajax({
      				 type : "GET",
      	        	 url: '${api}/doc/order/signPrint/'+ docOrderDto.orderNo,
      	        	 dataType: "json",     	
      	        	 async:false,
      	        	 success:function(rowData){	
      	        		if(typeof afterPrintFunc === 'function'){
      	        			eval(afterPrintFunc)();		
      	        		}else{
      	        			reflushDataGrid();
      	        		}
      	        	 }
      	          });	
               }
	        };
	        LODOP.PREVIEWA();
	        return;
		};
		
		var prints = LODOP.PREVIEW();
		if(prints>0){
			$.ajax({
				type : "GET",
 	        	url: '${api}/doc/order/signPrint/'+ docOrderDto.orderNo,
	        	dataType: "json",
	        	async:false,
	        	success:function(rowData){	
	        		if(typeof afterPrintFunc === 'function'){
  	        			eval(afterPrintFunc)();		
  	        		}else{
  	        			reflushDataGrid();
  	        		}
	        	}
	        });	
		}
		
    }
}

function initAllotPagePublicInfo(LODOP, docOrderDto){
	
	var now = new Date();
 	LODOP.ADD_PRINT_HTM(14,"3%","50%",14,"打印时间："+now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate());
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"Horient",1);

	LODOP.SET_PRINT_STYLE("FontSize",19);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(20,"48%","90%",20,'${applicationScope.companyName}调拨单');
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
	LODOP.SET_PRINT_STYLE("FontSize",13);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(65,"45%","90%",19, "NO:"+docOrderDto.orderNo);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",9);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(424,"1%","90%",9,"注：1、以上货品请核对数量，如有质量问题，请在收货后3天内通知本公司，逾期恕不负责。");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
	LODOP.SET_PRINT_STYLE("FontSize", 9);
	LODOP.SET_PRINT_STYLE("Bold", 0);
	LODOP.ADD_PRINT_TEXT(440, "4%", "90%", 9, "2、本单据四联,白：存根, 红：客户, 黄：仓库, 蓝：回单 ");
	LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(460,"1%","90%",9,"发货单位及经办人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.SET_PRINT_STYLE("FontSize",12);
	LODOP.SET_PRINT_STYLE("Bold",0);
	LODOP.ADD_PRINT_TEXT(460,"50%","90%",9,"收货单位及经办人(盖章)：");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
}

function createOneAllotPage(LODOP,docOrderDto,currRow){

	if($("#allotHead1")){
		$("#allotHead1").empty();
	} 
	
	if($("#tableAllotData")){
		$("#tableAllotData").empty();
	} 

	if(currRow!=0){
		LODOP.NewPageA();	
	}
	
	var detailTop = 203;
	var detailHeight = 180;
	var headerTop = 90;
	var headerHeight = 170;
	
	var header = docOrderDto.header;
	CreateTableAllotContext(header, docOrderDto.details,8,"tableAllotData");
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
    var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
	LODOP.ADD_PRINT_TABLE(detailTop,"1%","99%",detailHeight,strStyle + document.getElementById("printTableAllot").innerHTML);

	createTableAllotHead("allotHead1", header); 
	var strStyle1 = '<style type="text/css"> input,span {border:none;border-bottom:black solid 1px;} input {font-family:Arial, Helvetica, sans-serif,"Microsoft YaHei";font-size:16px;}</style>';
	LODOP.ADD_PRINT_HTM(headerTop,"1%","99%",headerHeight,strStyle1 + document.getElementById("tableAllotHead").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);
	
};	

/******************************************    创建送货单的表头信息     ************************************/
function createTableAllotHead(div,header){
	 var fromShopName = header.fromShopName;
	 var toShopName = header.toShopName;
	 var iName = header.iName;		 	 
	 var deliveryTime = header.deliveryTime;
	 var carrierName = header.carrierName;
	 var customerName = header.onsignName;
	 var mobile = header.mobile;
	 var contacts = header.contacts;
	 var receiveAddress = header.receiveAddress;
	 var memo = header.memo;
	 
	 var tbody = $("#"+div);		 
     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td colspan='2' >出库店仓：<input style='width:260px;' value='"
 			+ (fromShopName != null ? fromShopName : "")
 			+ "' /></td>");	 
 	 td.appendTo(tr);
     td = $("<td>发货时间：<span>"+ (deliveryTime!=null?deliveryTime.substring(0,10):"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>审核人：<span>"+ (iName!=null?iName:"") +"</span></td>");			 
	 td.appendTo(tr);
	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td colspan='2' >收货店仓：<input style='width:260px;' value='"
			+ (toShopName != null ? toShopName : "")
			+ "' /></td>");	 
	 td.appendTo(tr);
	 td = $("<td colspan='2' >经 办 人：<input style='width:260px;' value='"
				+ (carrierName != null ? carrierName : "")
				+ "' /></td>");	 
	 td.appendTo(tr);	     
	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td colspan='2' >收货地址：<input style='width:260px;' value='"
			+ (receiveAddress != null ? receiveAddress : "")
			+ "' /></td>");	 
	 td.appendTo(tr);
     td = $("<td>联系方式：<span>"+ (mobile!=null?mobile:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>联系人：<span>"+ (contacts!=null?contacts:"") +"</span></td>");			 
	 td.appendTo(tr);	     	 

	 tr = $("<tr></tr>");
	 tr.appendTo(tbody);
	 td = $("<td colspan='4' >备注：<input style='width:600px;' value='"
			+ ((memo != null && memo.length > 0) ? memo: '暂无') + "' /></td>");
	 td.appendTo(tr);
	 
}

/************************************  创建送货单的主体内容  ********************************/
function CreateTableAllotContext(header, list,cellCount,div){ 
	
	 //过滤掉发货数量为空的商品
	 var newList = [];
	 $.each(list, function(){
		 if(this.shippedQty>0){
			 newList.push(this);
		 }
	 });
	 //组装新的发货商品
     var tbody = $("#"+div);
	 for(var i=0;i<newList.length;i++)
	 {
		
	    var tr=$("<tr></tr>");
		tr.appendTo(tbody);
		var obj= newList[i];
		var sku = obj.sku;
		var goodsName = (obj.goodsName!=null?formatStr((obj.goodsName.getLength()>26?obj.goodsName.getSub(23):obj.goodsName)):'');		
		var property = obj.property;
		var shippedQty = obj.shippedQty;
		var unit = formatter(obj.unit, parent.unitCode);
		var j=1;
		var td;		
		while(j<=cellCount){		
			switch (j) {
			  case 1: td = $("<td align='center'>"+ (i+1) +"</td>");
			    break;
			  case 2: td = $("<td align='center'>"+ sku +"</td>");
			    break;
			  case 3: td = $("<td align='center'>"+ goodsName +"</td>");
			    break;		  
			  case 4: td = $("<td align='center'>"+ property +"</td>");
			  	break;
			  case 5: td = $("<td align='center'>"+ unit +"</td>");
			    break;		    
			  case 6: td = $("<td align='center'>"+ shippedQty +"</td>");
			  	break;
			  case 7: td = $("<td align='center'></td>");				  
			    break;			  			    
			  case 8: td = $("<td align='center'></td>");				  				  
			    break;			 
			  default: break;
			}
			td.appendTo(tr);
			j++;
		}
	 }
}

</script>