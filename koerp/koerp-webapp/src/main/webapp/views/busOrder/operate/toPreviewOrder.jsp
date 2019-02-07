<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("api", basePath);
%>

<div class="easyui-layout" fit=true  id='base_layout'>  		 	
   	 	<div data-options="region:'center'" >
   	 		<div class="fsun-wrap">
				<span class="title" style="top: 2px;">销售单(单号:<span id='orderId'></span>)</span>	
				<span class="title" style="top: 2px;left:50%"></span>	
	   	 		<form id="diffOrderfm" name="diffOrderfm">  
			   	 	<input id="sysorderid" name="sysorderid" hidden="true" />	
					<input id="companycode" name="companycode" hidden="true" />
					<input id="shopid" name="shopid" hidden="true" />	
					<div style="width:100%;height:140px;">
				   	 	<table class="nb-formTable" style="width:49%;float:left;">
					        <tr>			          
								<th width="12%">订单金额</th>
								<td>
									<input id="originalorderprice" name="originalorderprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">实付金额</th>
								<td>																	
									<input id="originalpayprice" name="originalpayprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>
					        <tr>				
								<th width="12%">积分数</th>
								<td>
									<input id="originalintegralamount" name="originalintegralamount" class="easyui-numberbox" 
										disabled data-options="formatter: intNumBaseFormat" />
								</td>
								<th width="12%">红包金额</th>
								<td>
									<input id="originalbonusamount" name="originalbonusamount" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>														
					        </tr>				        
					        <tr>
								<th width="12%">商品优惠</th>
								<td>
									<input id="originaldiscountprice" name="originaldiscountprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">商家优惠</th>
								<td>
									<input id="originalsellercouponprice" name="originalsellercouponprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />								
								</td>						
					        </tr>
					        <tr>
					        	<th width="12%">配送费用</th>
								<td>
									<input id="originalshippingprice" name="originalshippingprice" class="easyui-numberbox" 
										disabled data-options="min:0,precision:2,formatter:priceFormat" />								
								</td>			          								
								<th width="12%">已付金额</th>
								<td>	
									<input id="originalalreadyprice" name="originalalreadyprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>	 	
				   	 	</table>
				   	 	<table class="nb-formTable" style="width:50%;float:right;">
				   	 		<tr>			          
								<th width="12%">订单金额</th>
								<td>
									<input id="neworderprice" name="neworderprice" class="easyui-numberbox" 
										readonly data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">实付金额</th>
								<td>	
									<input id="newpayprice" name="newpayprice" class="easyui-numberbox" 
										readonly data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
							</tr>					        				       
					        <tr>
								<th width="12%">商品优惠</th>
								<td>
									<input id="discountprice" name="discountprice" class="easyui-numberbox"
										disabled data-options="min:0,precision:2,formatter: priceFormat" />
								</td>
								<th width="12%">商家优惠</th>
								<td>
									<input id="couponfee" name="couponfee" hidden=true />
									<input id="sellercouponprice" name="sellercouponprice" class="easyui-numberbox"
										 data-options="min:0,precision:2,formatter: priceFormat" />								
								</td>						
					        </tr>					        					         	
				   	 	</table>				   	 	
				   	 </div>				   	 
			   	 </form>			   	 
			</div>
   	 	</div>
   	 	<div data-options="region:'south'" style="height:50%;" >
   	 		<table id="diffOrderSkuDataGrid"></table>
   	 	</div>
   	 </div>	 