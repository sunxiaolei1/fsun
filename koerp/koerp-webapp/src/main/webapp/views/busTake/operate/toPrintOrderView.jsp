<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="tableHead" style="display:none;" >		 
	<table id="head1" border=0 cellSpacing=0 cellPadding=2 width="100%" >	  			  
  	 	
  	</table>	
</div>

<div id="printTableOrder" style="display:none;" >
	<TABLE border=1 cellSpacing=0 cellPadding=1 width="100%" style="font-size:16px; border-collapse:collapse" bordercolor="#333333">
	<thead>
	  <TR>
	    <TD width="3%">
	      <DIV align=center><b></b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>SKU</b></DIV></TD>
	    <TD width="24%">
	      <DIV align=center><b>商品名称</b></DIV></TD>
	    <TD width="12%">
	      <DIV align=center><b>规格</b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>数量</b></DIV></TD>		    
	    <TD width="6%">
	      <DIV align=center><b>单位</b></DIV></TD>
	    <TD width="6%">
	      <DIV align=center><b>单价</b></DIV></TD>
	    <TD width="8%">
	      <DIV align=center><b>金额</b></DIV></TD>   	   
	  </TR>	
	</thead>      
	  <TBODY id="tableOrderData">    
		  
	  </TBODY>
	  <tfoot>
		  <tr>
		    <TD colspan="5" tdata="allSum" format="UpperMoney" align="left" tindex="8"><font>金额合计(大写)：###</font></TD> 
		    <TD colspan="3" tdata="allSum" format="#,##0.0" align="left" tindex="8"><font>小写金额 ￥###元</font></TD> 			   				  
		 </tr>
	  </tfoot>
	</TABLE>
</div>
	
<script type="text/javascript">

/***************************************** 制作销售单的操作 *******************************************/

function madeOrderView(busTakeDto, afterPrintFunc){
	if(busTakeDto){
    	var LODOP=getLodop();  
		//LODOP.PRINT_INIT("送货单打印");
		LODOP.SET_PRINT_PAGESIZE(1,"203mm","141mm","");		   			
		
		createOneOrderPage(LODOP,busTakeDto,0);
		
		initOrderPagePublicInfo(LODOP, busTakeDto);
		
		if (LODOP.CVERSION) {  //用CVERSION属性判断是否云打印
	        LODOP.On_Return=function(TaskID,Value){
               if (Value!=0) {
      			  $.ajax({
      				 type : "GET",
      	        	 url: '${api}/bus/take/signPrint/'+ busTakeDto.takeId,
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
 	        	url: '${api}/bus/take/signPrint/'+ busTakeDto.takeId,
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

function initOrderPagePublicInfo(LODOP, busTakeDto){
	
	var now = new Date();
 	LODOP.ADD_PRINT_HTM(14,"3%","50%",14,"打印时间："+now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate());
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);

	LODOP.ADD_PRINT_HTM(14,"80%","50%",14,"<font color='#0000ff'><span tdata='pageNO'>第##页</span>/<span tdata='pageCount'>共##页</span></font>");
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"Horient",1);

	LODOP.SET_PRINT_STYLE("FontSize",19);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(20,"26%","90%",20,'${applicationScope.companyName}寄提出库单');
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	
	LODOP.SET_PRINT_STYLE("FontSize",13);
	LODOP.SET_PRINT_STYLE("Bold",1);
	LODOP.ADD_PRINT_TEXT(65,"32%","90%",19, "NO:"+busTakeDto.takeId);
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

function createOneOrderPage(LODOP,busTakeDto,currRow){

	if($("#head1")){
		$("#head1").empty();
	} 
	
	if($("#tableOrderData")){
		$("#tableOrderData").empty();
	} 

	if(currRow!=0){
		LODOP.NewPageA();	
	}
	
	var detailTop = 170;
	var detailHeight = 210;
	var headerTop = 90;
	var headerHeight = 120;	
	var header = busTakeDto.header;    
	CreateTableOrderContext(header, busTakeDto.details,8,"tableOrderData");
	LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
    var strStyle='<style type="text/css"> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>';
	LODOP.ADD_PRINT_TABLE(detailTop,"1%","99%",detailHeight,strStyle + document.getElementById("printTableOrder").innerHTML);

	createTableOrderHead("head1", header); 
	var strStyle1 = '<style type="text/css"> input,span {border:none;border-bottom:black solid 1px;} input {font-family:Arial, Helvetica, sans-serif,"Microsoft YaHei";font-size:16px;}</style>';
	LODOP.ADD_PRINT_HTM(headerTop,"1%","99%",headerHeight,strStyle1 + document.getElementById("tableHead").innerHTML);
	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	LODOP.SET_PRINT_STYLEA(0,"LinkedItem",1+currRow);
	
};	

/******************************************    创建送货单的表头信息     ************************************/
function createTableOrderHead(div,header){
	 var orderId = header.orderId;
	 var shopName = header.shopName;
	 var customerName = header.buyerName;
	 var takeName = header.takeName;	 
	 var takeTime = header.takeTime;
	 var createdName = header.seller_name;	
	 var memo = header.memo;

	 var tbody = $("#"+div);		 
     var tr=$("<tr></tr>");
     tr.appendTo(tbody);
     var td = $("<td colspan='2' >出库店仓：<input style='width:260px;' value='"
 			+ (shopName != null ? shopName : "")
 			+ "' /></td>");	 
 	 td.appendTo(tr);
     td = $("<td>寄存单号：<span>"+ (orderId!=null?orderId:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>制单人：<span>"+ (createdName!=null?createdName:"") +"</span></td>");			 
	 td.appendTo(tr);
	 
	 tr=$("<tr></tr>");
     tr.appendTo(tbody);
     td = $("<td colspan='2' >客户名称：<input style='width:260px;' value='"
			+ (customerName != null ? customerName : "")
			+ "' /></td>");	 
	 td.appendTo(tr);
     td = $("<td>提货时间：<span>"+ (takeTime!=null?takeTime:"") +"</span></td>");			 
	 td.appendTo(tr);
	 td = $("<td>提货人：<span>"+ (takeName!=null?takeName:"") +"</span></td>");			 
	 td.appendTo(tr);	     

	 tr = $("<tr></tr>");
	 tr.appendTo(tbody);
	 td = $("<td colspan='4' >备注：<input style='width:600px;' value='"
			+ ((memo != null && memo.length > 0) ? memo: '暂无') + "' /></td>");
	 td.appendTo(tr);
	 
}

/************************************  创建送货单的主体内容  ********************************/
function CreateTableOrderContext(header, list,cellCount,div)
{ 
     var tbody = $("#"+div);
	 for(var i=0;i<list.length;i++)
	 {
	    var tr=$("<tr></tr>");
		tr.appendTo(tbody);
		var obj= list[i];
		var sku = obj.sku;
		var goodsName = (obj.goodsName!=null?formatStr((obj.goodsName.getLength()>26?obj.goodsName.getSub(23):obj.goodsName)):'');		
		var property = (typeof obj.property !='undefined') ? obj.property:"";
		var qty = obj.qty;
		var unit = formatter(obj.unit, parent.unitCode);
		var salePrice = 0;
		var totalPrice = Number(qty) * Number(salePrice);
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
			  case 5: td = $("<td align='center'>"+ qty +"</td>");
			    break;		    
			  case 6: td = $("<td align='center'>"+ unit +"</td>");
			  	break;
			  case 7: td = $("<td align='center'>"+ salePrice +"</td>");				  
			    break;			  			    
			  case 8: td = $("<td align='center'>"+ totalPrice +"</td>");				  				  
			    break;			 
			  default: break;
			}
			td.appendTo(tr);
			j++;
		}
	 }
}

</script>