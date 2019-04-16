package com.fsun.service.common;

import com.fsun.domain.enums.BusTakeStatusEnum;
import com.fsun.domain.enums.DocAsnStatusEnum;
import com.fsun.domain.enums.DocAsnTypeEnum;
import com.fsun.domain.enums.DocOrderStatusEnum;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.enums.FlowStatusEnum;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.enums.OrderStatusEnum;
import com.fsun.domain.enums.OrderTakeStatusEnum;
import com.fsun.domain.enums.OrderTypeEnum;
import com.fsun.domain.enums.RefundStatusEnum;
import com.fsun.domain.enums.TradeStatusEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.BusTake;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoHeader;

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
		Short refundStatus = busOrder.getRefundStatus();
		String tradeStatus = busOrder.getTradeStatus();
		Short orderType = busOrder.getOrderType();
		String takeStatus = busOrder.getTakeStatus();
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
	        				&& refundStatus==null){
	        		//如果是寄存单类型，只要寄提过就不能取消单据
	        		if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
	        			if(OrderTakeStatusEnum.UNTAKE.getCode().equals(takeStatus)){
	        				isEnable = true; 
	        			}
	        		}else{
	        			isEnable = true; 
	        		}        		
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
	        		//如果是寄存单类型，只要寄提过就不能创建退货单，可以一键退货
	        		/*if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)){
	        			if(OrderTakeStatusEnum.UNTAKE.getCode().equals(takeStatus)){
	        				isEnable = true; 
	        			}
	        		}else{
	        			isEnable = true; 
	        		}*/  
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
	        case ORDER_TAKE:
	        	//订单已退货或者提货完成状态则不可寄提
	        	if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)
	        		//&& (refundStatus==null || refundStatus.equals("")) 
        				&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
        					&& !OrderTakeStatusEnum.ALL_TAKE.getCode().equals(takeStatus)){
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
	        case CANCEL_REFUND: 
	        	if(RefundStatusEnum.RETURN_REFUND.getValue().equals(refundStatus) 
	        		|| RefundStatusEnum.RETURN_UNREFUND.getValue().equals(refundStatus)){
	        		isEnable = true;
	        	}
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
	 * 申请单状态验证
	 * @param header
	 * @param buttonsEnum
	 * @return
	 */
	protected boolean orderStatusValidator(DocPoHeader header, OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		String poStatus = header.getPoStatus();
		String poType = header.getPoType();
		switch (buttonsEnum){  	        
	        case REFRESH: 	
	        	isEnable = true; break;
	        case RETURN_ORDER: 	
	        	isEnable = true; break;	        	
	        case ADD_PO_REMARK:
	        	isEnable = true;break;	                
	        case CANCEL_DOC_PO: 	        	
	        	if(DocPoStatusEnum.CREATE.getCode().equals(poStatus) ||
	        			DocPoStatusEnum.AUDIT_REJECT.getCode().equals(poStatus)){
	        		isEnable = true;
	        	}      
	        	break;	
	        case UPDATE_DOC_PO:
	        	if(DocPoStatusEnum.CREATE.getCode().equals(poStatus) ||
	        			DocPoStatusEnum.AUDIT_REJECT.getCode().equals(poStatus)){
	        		isEnable = true;
	        	}      
	        	break;
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
	        case ADD_SO_REMARK:
	        	isEnable = true;break;	                
	        case CANCEL_DOC_ORDER: 	        	
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
	        case ADD_SI_REMARK:
	        	isEnable = true; break;	                       
	        case CANCEL_DOC_ASN: 
	        	if((DocAsnStatusEnum.SI_BFQS.getCode().equals(asnStatus) 
	        		|| DocAsnStatusEnum.SI_WQSH.getCode().equals(asnStatus))){
	        		//调拨签收入库及调退入库单据在签收之后不可撤销,采购入库在生成有效的采购退货单之后
	        		if(!DocAsnTypeEnum.PURCHASE_SI.getCode().equals(asnType) 
	        			&& !DocAsnTypeEnum.ALLOT_REFUND_SI.getCode().equals(asnType)
	        				&& !DocAsnTypeEnum.ALLOT_SI.getCode().equals(asnType)){
	        			isEnable = true;	        			
	        		}else{
	        			if(orderNo==null || orderNo.equals("")){
	        				isEnable = true;
	        			}
	        		}	        		
	        	}      
	        	break;
	        case SIGN_DOC_ASN:
	        	if(DocAsnStatusEnum.SI_DQS.getCode().equals(asnStatus)){
		        	isEnable = true;        		
		        }   
	        	break;
	        case CREATE_ASN_REFUND: 
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
	
	/**
	 * 寄提单状态验证
	 * @param header
	 * @param buttonsEnum
	 * @return
	 */
	protected boolean orderStatusValidator(BusTake header, BusOrder busOrder, 
			OrderOperateButtonsEnum buttonsEnum) {
		boolean isEnable = false;
		if(header!=null && busOrder!=null){
			//编辑操作
			String busTakeStatus = header.getTakeStatus();
			Short refundStatus = busOrder.getRefundStatus();
			String tradeStatus = busOrder.getTradeStatus();
			switch (buttonsEnum){  	        
		        case REFRESH: 	
		        	isEnable = true; break;     	
		        case ADD_TAKE_REMARK:
		        	isEnable = true; break;                      
		        case CANCEL_TAKE:
		        	//订单已退货或者提货完成状态则才可取消			        		        		
		        	/*if((refundStatus==null || refundStatus.equals("")) 
	        			&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
	        				&& BusTakeStatusEnum.TAKED.getCode().equals(busTakeStatus)){
				        isEnable = true;        		
				    }*/ 
	        		//订单提货完成状态则才可取消			        		        		
	        		if(TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
	        				&& BusTakeStatusEnum.TAKED.getCode().equals(busTakeStatus)){
				        isEnable = true;        		
				    } 
		        	break;
		        case RETURN_ORDER: 
		        	isEnable = true; break; 
		        case TAKE_OUT:
		        	break;
		        default:  
		        	isEnable = true;
		    }  						
		}else if(busOrder!=null){
			//新增操作
			String orderTakeStatus = busOrder.getTakeStatus();
			Short refundStatus = busOrder.getRefundStatus();
			String tradeStatus = busOrder.getTradeStatus();
			Short orderType = busOrder.getOrderType();
			switch (buttonsEnum){  	
				case REFRESH: 	
		        	break;     	
		        case ADD_TAKE_REMARK:
		        	break;	                       
		        case CANCEL_TAKE:
		        	break;  
		        case RETURN_ORDER: 
		        	isEnable = true; break;   
		        case TAKE_OUT:
		        	if(OrderTypeEnum.TAKE_ORDER.getValue().equals(orderType)
		        		//&& (refundStatus==null || refundStatus.equals("")) 
	        				&& TradeStatusEnum.COMPLETED.getCode().equals(tradeStatus)
	        					&& !OrderTakeStatusEnum.ALL_TAKE.getCode().equals(orderTakeStatus)){
				        isEnable = true;        		
				    }
		        	break; 
		        default:  
		        	isEnable = true;
		    }  
		}		
		return isEnable;
	}
}
