package com.fsun.service.common;

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
 * 单据状态验证器
 * @author fsun
 * @date 2019年2月15日
 */
public abstract class BaseOrderValidatorService {
	
	/**
	 * 销售单状态验证
	 * @param ecRefundorders
	 * @param buttonsEnum
	 * @return
	 */
	protected boolean orderStatusValidator(BusOrder busOrder, OrderOperateButtonsEnum buttonsEnum) {
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
	protected boolean orderStatusValidator(BusRefund busRefund, OrderOperateButtonsEnum buttonsEnum) {
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
	protected boolean orderStatusValidator(DocOrderHeader header, OrderOperateButtonsEnum buttonsEnum) {
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
	protected boolean orderStatusValidator(DocAsnHeader header, OrderOperateButtonsEnum buttonsEnum) {
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