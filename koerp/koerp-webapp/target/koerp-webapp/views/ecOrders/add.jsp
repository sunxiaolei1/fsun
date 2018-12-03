<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<div id="bcOrdersDialog" class="alert">
	<form id="fm">
		<div class="easyui-tabs">
			<div title="基本信息" style="padding:10px;">	
				<table class="nb-formTable">
			        <tr>
			            <th width="12%">
			                <label>外部订单号</label>
			            </th>
			            <td>
			            	${entity.extorderid}
			            </td>
			            <th width="12%">
			                <label>订单类型</label>
			            </th>
			            <td>
			            	${entity.ordertype}
			            </td>
			            <th width="12%">
			                <label>交易状态</label>
			            </th>
			            <td>
			            	${entity.tradestatus}
			            </td>
			        	<th width="12%">
			                <label>系统状态</label>
			            </th>
			            <td>
			            	${entity.systemstatus}
			            </td>
			        </tr>
			        <tr>
			        	<th>
			                <label>仓储状态</label>
			            </th>
			            <td>
			            	${entity.stockstatus}
			            </td>
			            <th>
			                <label>配送状态</label>
			            </th>
			            <td>
			            <%-- 	${entity.shopbillno} --%>
			            </td>
			        	<th>
			                <label>退款状态</label>
			            </th>
			            <td>
			            	${entity.refundstatus}
			            </td>
			        	<th>
			                <label>售后状态</label>
			            </th>
			            <td>
			            	${entity.salestatus}
			            </td>
			        </tr>
			        <tr>
			            <th>
			                <label>待审原因</label>
			            </th>
			            <td>
			            	${entity.auditflag}
			            </td>
			            <th>
			                <label>仓库类型</label>
			            </th>
			            <td>
			            	<%-- ${entity.shopname} --%>
			            </td>
			            <th>
			                <label>订单来源</label>
			            </th>
			            <td>	
			            	${entity.channelcode}
			            </td>
			        </tr>
			        <tr>
			            <th>
			                <label>买家留言</label>
			            </th>
			            <td colspan="7">
			            	${entity.buyerremark}
			            </td>	
			        </tr>
			        <tr>
			            <th>
			                <label>客服备注</label>
			            </th>
			            <td colspan="7">
			            	${entity.sellerremark}
			            </td>	
			        </tr>
			        <tr>
			        	<th>
			                <label>系统订单号</label>
			            </th>
			            <td>
			            	${entity.sysorderid}
			            </td>
			            <th>
			                <label>下单时间</label>
			            </th>
			            <td>
			            	<fmt:formatDate pattern="yyyy-MM-dd" value="${entity.orderdatetime}" />
			            </td>
			            <th>
			                <label>用户名</label>
			            </th>
			            <td>
			            	${entity.username}
			            </td>
			        	<th>
			                <label>付款时间</label>
			            </th>
			            <td>
			            	<fmt:formatDate pattern="yyyy-MM-dd" value="${entity.paymentdatetime}" />
			            </td>
			        </tr>
			        <tr>
			        	<th>
			                <label>所属店铺</label>
			            </th>
			            <td>
			            	${entity.shopname}
			            </td>
			        	<th>
			                <label>发货时间</label>
			            </th>
			            <td colspan="5">
			            	<fmt:formatDate pattern="yyyy-MM-dd" value="${entity.deliverydatetime}" />
			            </td>
			        </tr>
				</table>
			</div>
			<div title="配送信息" closable="false" style="padding:10px;">
				<table class="nb-formTable">
					<%-- <tr>
			            <th>
			                <label>买家用户名</label>
			            </th>
			            <td>
			            	${entity.bcmembername}
			            </td>
			            <th>
			                <label>会员等级</label>
			            </th>
			            <td>
			            	${entity.bcmembercard}
			            </td>
			            <th>
			                <label>目的地代码</label>
			            </th>
			            <td>
			            	${entity.targetcityid}
			            </td>
			            <th>
			                <label>目的地名称</label>
			            </th>
			            <td>
			            	${entity.targetaddress}
			            </td>
			        </tr>
					<tr>
						<th>
			                <label>指定承运商</label>
			            </th>
			            <td>
			            	${entity.freightcompany}
			            </td>
			            <th>
			                <label>发货承运商</label>
			            </th>
			            <td>
			            	${entity.espExpresscode}
			            </td>
			            <th>
			                <label>快递单号</label>
			            </th>
			            <td>
			            	${entity.expressbillno}
			            </td>
			            <th>
			                <label>快递方式</label>
			            </th>
			            <td>
			            	${entity.expresstype}
			            </td>
			        </tr>
			        <tr>
			            <th>
			                <label>收件人姓名</label>
			            </th>
			            <td>
			            	${entity.consigneename}
			            </td>
			            <th>
			                <label>手机号码</label>
			            </th>
			            <td>
			            	${entity.buyermobiletel}
			            </td>
			            <th>
			                <label>收件人电话</label>
			            </th>
			            <td>
			            	${entity.buyertel}
			            </td>
			            <th>
			                <label>收件邮政编码</label>
			            </th>
			            <td>
			            	${entity.zipcode}
			            </td>
			        </tr>
			        <tr>
			        	<th>
			                <label>收件省</label>
			            </th>
			            <td>	
			            	${entity.province}
			            </td>
			            <th>
			                <label>收件市</label>
			            </th>
			            <td>
			            	${entity.city}
			            </td>
			            <th>
			                <label>收件区</label>
			            </th>
			            <td>
			            	${entity.area}
			            </td>
			            <th>
			                <label>地址</label>
			            </th>
			            <td>
			            	${entity.address}
			            </td>
			        </tr>
			        <tr>
			        	<th>
			                <label>寄件人姓名</label>
			            </th>
			            <td>
			            	${entity.sendcontact}
			            </td>
			            <th>
			                <label>寄件人电话</label>
			            </th>
			            <td>
			            	${entity.sendcontacttel}
			            </td>
			        	<th>
			                <label>寄件省</label>
			            </th>
			            <td>
			            	${entity.sendprovince}
			            </td>
			            <th>
			                <label>寄件市</label>
			            </th>
			            <td>
			            	${entity.sendcity}
			            </td>
			        </tr>   
			        <tr>    
			        	<th>
			                <label>寄件区</label>
			            </th>
			            <td>
			            	${entity.sendarea}
			            </td>
			        	<th>
			                <label>寄件地址</label>
			            </th>
			            <td>
			            	${entity.sendaddress}
			            </td>
			        	<th>
			                <label>原寄地</label>
			            </th>
			            <td>
			            	${entity.orgaddr}
			            </td>
			        	<th>
			                <label>集货地名</label>
			            </th>
			            <td>
			            	${entity.orgname}
			            </td>
			         </tr>   
			         <tr>   
			        	<th>
			                <label>集货地代码</label>
			            </th>
			            <td>
			            	${entity.orgcode}
			            </td>
			            <th>
			                <label>电子面单类型</label>
			            </th>
			            <td>
			            	${entity.ebtype}
			            </td>
			        	<th>
			                <label>重量</label>
			            </th>
			            <td>
			            	${entity.weight}
			            </td>
			        	<th>
			                <label>实际数量</label>
			            </th>
			            <td>
			            	${entity.shipedqty}
			            </td>
			         </tr>     
			         <tr>   
			        	<th>
			                <label>是否保价</label>
			            </th>
			            <td colspan="7">
				            <c:if test="${entity.supportprice == 1}">
			            	是
			            	</c:if>
			            	<c:if test="${entity.supportprice == 0}">
			            	否
			            	</c:if>
			            </td>
			        </tr> --%>
				</table>
			</div>
			<div title="支付信息" closable="false" style="padding:10px;">
				<table class="nb-formTable">
				</table>
			</div>
			<div title="信息" closable="false" style="padding:10px;">
				<table class="nb-formTable">
				</table>
			</div>
		</div>
		<div style="vertical-align: middle; height: 26px; line-height: 26px; text-align: center; color: blue; font-weight: bold">商品信息</div>
		<div style="height: 200px;width: 99%;">
			<table id="orderDetailDataGrid"></table>
		</div>
	</form>
</div>	

<script type="text/javascript">
$(function(){
	$('.readonlyInput').attr('readonly','readonly');
});
</script>