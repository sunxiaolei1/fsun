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
import com.fsun.biz.bus.manage.DocPoHeaderManage;
import com.fsun.domain.enums.OrderOperateButtonsEnum;
import com.fsun.domain.model.BusOrder;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.DocAsnHeader;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.service.common.BaseOrderValidatorService;

/**
 * @author fsun
 * @date 2019年2月13日
 */
@Service
public class OrderButtonsService extends BaseOrderValidatorService implements OrderButtonsApi {
	
	@Autowired
	private BusRefundManage busRefundManage;
	
	@Autowired
	private BusOrderManage busOrderManage;
	
	@Autowired
	private DocOrderHeaderManage docOrderHeaderManage;
	
	@Autowired
	private DocAsnHeaderManage docAsnHeaderManage;
	
	@Autowired
	private DocPoHeaderManage docPoHeaderManage;
		
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
		}else if("docPo".equals(buttontype)){
			DocPoHeader header = docPoHeaderManage.load(orderId);
			this.appendHiddenButtons(header, allButtons, hiddenbuttons);
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
	private void appendHiddenButtons(DocPoHeader header, List<OrderOperateButtonsEnum> allButtons,
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
	
}
