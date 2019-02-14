package com.fsun.service.orderButtons;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.OrderButtonsApi;
import com.fsun.biz.bus.manage.BusOrderManage;
import com.fsun.biz.bus.manage.BusRefundManage;
import com.fsun.biz.bus.manage.DocAsnHeaderManage;
import com.fsun.biz.bus.manage.DocOrderHeaderManage;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.FlowStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.OrderStatusEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderHeader;

/**
 * @author fsun
 * @date 2019年2月13日
 */
@Service
public class OrderButtonsService implements OrderButtonsApi {
	
	@Autowired
	private BusRefundManage busRefundManage;
	
	@Autowired
	private BusOrderManage busOrderManage;
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;
		
	/**
	 * 获取要隐藏的按钮集合
	 * @param buttontype
	 * @param object
	 * @param orderId
	 * @return
	 */
	@Override
	public List<String> getHiddenButtonsMap(String buttontype, String orderId , String refundId) {
		List<String> hiddenbuttons = new ArrayList<>();
		List<OrderOperateButtonsEnum> allButtons = OrderOperateButtonsEnum.getAllMoods();		
		if("aftersaleRefund".equals(buttontype)){
			BusRefund busRefund = busRefundManage.load(refundId);
			this.appendHiddenButtons(busRefund, allButtons, hiddenbuttons);			
		}else if("aftersaleBarter".equals(buttontype)){
			//换退单
			BusRefund busRefund = busRefundManage.load(refundId);
			this.appendHiddenButtons(busRefund, allButtons, hiddenbuttons);			
			//换发单
			BusOrder busOrder = busOrderManage.load(orderId);
			this.appendHiddenButtons(busOrder, allButtons, hiddenbuttons);		
		}else if("docOrder".equals(buttontype)){
			DocOrderHeader header = docOrderHeaderManage.load(orderId);
			this.appendHiddenButtons(header, allButtons, hiddenbuttons);
		}else if("docAsn".equals(buttontype)){
			DocAsnHeader header = docAsnHeaderManage.load(orderId);
			this.appendHiddenButtons(header, allButtons, hiddenbuttons);
		}else if("busOrder".equals(buttontype)){
			BusOrder busOrder = busOrderManage.load(orderId);
			this.appendHiddenButtons(busOrder, allButtons, hiddenbuttons);
		}
		return hiddenbuttons;
	}
	
	
	

	/***********************************  私有方法     ************************************/

	/**
	 * 出库单追加需要隐藏的按钮
	 * @param header
	 * @param allButtons
	 * @param hiddenbuttons
	 */
	private void appendHiddenButtons(DocOrderHeader header, List<OrderOperateButtonsEnum> allButtons,
			List<String> hiddenbuttons) {
		boolean isValid = false;
		//遍历状态对应的按钮是否有效
		for (OrderOperateButtonsEnum buttonsEnum : allButtons) {
			isValid = this.orderStatusValidator(header, buttonsEnum);
			if(!isValid && !hiddenbuttons.contains(buttonsEnum.getCode())){
				hiddenbuttons.add(buttonsEnum.getCode());
			}
		}	
	}


	/**
	 * 入库单追加需要隐藏的按钮
	 * @param header
	 * @param allButtons
	 * @param hiddenbuttons
	 */
	private void appendHiddenButtons(DocAsnHeader header, List<OrderOperateButtonsEnum> allButtons,
			List<String> hiddenbuttons) {
		boolean isValid = false;
		//遍历状态对应的按钮是否有效
		for (OrderOperateButtonsEnum buttonsEnum : allButtons) {
			isValid = this.orderStatusValidator(header, buttonsEnum);
			if(!isValid && !hiddenbuttons.contains(buttonsEnum.getCode())){
				hiddenbuttons.add(buttonsEnum.getCode());
			}
		}	
	}
	
	
	/**
	 * 销售单追加需要隐藏的按钮
	 * @param busOrder
	 * @param allButtons
	 * @param hiddenbuttons
	 */
	private void appendHiddenButtons(BusOrder busOrder, List<OrderOperateButtonsEnum> allButtons,
			List<String> hiddenbuttons) {
		boolean isValid = false;
		//遍历状态对应的按钮是否有效
		for (OrderOperateButtonsEnum buttonsEnum : allButtons) {
			isValid = this.orderStatusValidator(busOrder, buttonsEnum);
			if(!isValid && !hiddenbuttons.contains(buttonsEnum.getCode())){
				hiddenbuttons.add(buttonsEnum.getCode());
			}
		}	
	}


	/**
	 * 退单追加需要隐藏的按钮
	 * @param ecOrders
	 * @param allButtons
	 * @param hiddenbuttons
	 */
	private void appendHiddenButtons(BusRefund busRefund, List<OrderOperateButtonsEnum> allButtons,
			List<String> hiddenbuttons){						
		boolean isValid = false;
		//遍历状态对应的按钮是否有效
		for (OrderOperateButtonsEnum buttonsEnum : allButtons) {
			isValid = this.orderStatusValidator(busRefund, buttonsEnum);
			if(!isValid && !hiddenbuttons.contains(buttonsEnum.getCode())){
				hiddenbuttons.add(buttonsEnum.getCode());
			}
		}		    
	}
	
	
	
	/***************************************************  单据状态验证器     ******************************************************/
	
	/**
	 * 销售单状态验证
	 * @param ecRefundorders
	 * @param buttonsEnum
	 * @return
	 */
	private boolean orderStatusValidator(BusOrder busOrder, OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		String flowStatus = busOrder.getFlowStatus();		
		String orderStatus = busOrder.getOrderStatus();
		String refundStatus = busOrder.getRefundStatus();
		String tradeStatus = busOrder.getTradeStatus();
		switch (buttonsEnum){  	        
	        case REFRESH: 	
	        	isEnable = true; break;
	        case RETURN_ORDER: 	
	        	isEnable = true; break;	        	
	        case ADD_ORDER_REMARK:
	        	isEnable = true; break;	                
	        case CANCEL_ORDER: 
	        	if(OrderStatusEnum.CONFIRMED.getCode().equals(orderStatus)
	        		&& FlowStatusEnum.STOCKOUT.getCode().equals(flowStatus)
	        			&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
	        				&& (refundStatus==null || refundStatus.equals(""))){
	        		isEnable = true; 
	        	}
	        	break;
	        case ONEKEY_REFUND:
	        	if(OrderStatusEnum.CONFIRMED.getCode().equals(orderStatus)
	        		&& FlowStatusEnum.STOCKOUT.getCode().equals(flowStatus)
	        			&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)	
	        				&& (refundStatus==null || refundStatus.equals(""))){
	        		isEnable = true; 
	        	}
	        	break;
	        case CREATE_REFUND:  
	        	if(OrderStatusEnum.CONFIRMED.getCode().equals(orderStatus)
	        		&& FlowStatusEnum.STOCKOUT.getCode().equals(flowStatus)
	        			&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)	
	        				&& (refundStatus==null || refundStatus.equals(""))){
	        		isEnable = true; 
	        	}
	        	break;
	        case CREATE_BARTER:  
	        	if(OrderStatusEnum.CONFIRMED.getCode().equals(orderStatus)
	        		&& FlowStatusEnum.STOCKOUT.getCode().equals(flowStatus)
	        			&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
	        				&& (refundStatus==null || refundStatus.equals(""))){
	        		isEnable = true; 
	        	}
	        	break;
	        default:  
	        	isEnable = true;
	    }  
		return isEnable;
	}
	
	/**
	 * 退货、换退单状态验证
	 * @param ecRefundorders
	 * @param buttonsEnum
	 * @return
	 */
	private boolean orderStatusValidator(BusRefund busRefund, OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		short refundStatus = busRefund.getRefundStatus();		
		short refundOrderStatus = busRefund.getRefundOrderStatus();		
		switch (buttonsEnum){  	        
		 	case REFRESH: 	
	        	isEnable = true; break; 
		 	case RETURN_ORDER: 	
	        	isEnable = true; break;	 
	        case CANCEL_ORDER: 	        	
	        	break;	        
	        case REPAIR_REFUND:  
	        	isEnable = true; break;
	        case COMPLETE_REFUND:  
	        	isEnable = true; break;
	        case ONEKEY_REFUND:  
	        	isEnable = true; break;
	        case ADD_REFUND_REMARK:  
	        	isEnable = true; break;
	        default:  
	        	isEnable = true;
	    }  
		return isEnable;
	}
	
	/**
	 * 出库单状态验证
	 * @param header
	 * @param buttonsEnum
	 * @return
	 */
	private boolean orderStatusValidator(DocOrderHeader header, OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		String releaseStatus = header.getReleaseStatus();
		String orderStatus = header.getOrderStatus();
		switch (buttonsEnum){  	        
	        case REFRESH: 	
	        	isEnable = true; break;
	        case RETURN_ORDER: 	
	        	isEnable = true; break;	        	
	        case ADD_ORDER_REMARK:
	        	isEnable = false;break;	                
	        case CANCEL_ORDER: 	        	
	        	if(DocOrderStatusEnum.SO_DDCK.getCode().equals(orderStatus)){
	        		isEnable = true;
	        	}      
	        	break;	        
	        default:  
	        	isEnable = true;
	    }  
		return isEnable;
	}


	/**
	 * 入库单状态验证
	 * @param header
	 * @param buttonsEnum
	 * @return
	 */
	private boolean orderStatusValidator(DocAsnHeader header, OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		String asnStatus = header.getAsnStatus();
		String checkStatus = header.getCheckStatus();
		String orderNo = header.getOrderNo();
		String asnType = header.getAsnType();
		switch (buttonsEnum){  	        
	        case REFRESH: 	
	        	isEnable = true; break;
	        case RETURN_ORDER: 	
	        	isEnable = true; break;	        	
	        case ADD_ORDER_REMARK:
	        	break;	                       
	        case CANCEL_ORDER: 	  
	        	if((DocAsnStatusEnum.SI_BFQS.getCode().equals(asnStatus) 
	        		|| DocAsnStatusEnum.SI_WQSH.getCode().equals(asnStatus))){
	        		if(!DocAsnTypeEnum.PURCHASE_SI.getCode().equals(asnType)){
	        			isEnable = true;
	        		}else{
	        			if(orderNo==null || orderNo.equals("")){
	        				isEnable = true;
	        			}
	        		}	        		
	        	}      
	        	break;
	        case CREATE_REFUND: 
	        	if((DocAsnStatusEnum.SI_BFQS.getCode().equals(asnStatus) 
	        		|| DocAsnStatusEnum.SI_WQSH.getCode().equals(asnStatus))
	        			&& DocAsnTypeEnum.PURCHASE_SI.getCode().equals(asnType)
	        				&& (orderNo==null || orderNo.equals(""))){
	        		isEnable = true;
	        	}
	        	break;
	        default:  
	        	isEnable = true;
	    }  
		return isEnable;
	}
}
