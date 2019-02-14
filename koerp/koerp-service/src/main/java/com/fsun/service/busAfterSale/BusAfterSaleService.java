package com.fsun.service.busAfterSale;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusAfterSaleApi;
import com.fsun.biz.bus.manage.BusRefundManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.common.PageModel;
import com.fsun.domain.dto.BusBarterDto;
import com.fsun.domain.dto.BusRefundDto;
import com.fsun.domain.dto.BusUserDto;
import com.fsun.domain.entity.BusRefundCondition;
import com.fsun.domain.model.BusRefund;
import com.fsun.domain.model.SysUser;
import com.fsun.service.common.BaseOrderService;

/**
 * 售后单据操作
 * @author fsun
 * @date 2019年2月12日
 */
@Service
public class BusAfterSaleService extends BaseOrderService implements BusAfterSaleApi {
	
	@Autowired
	private BusRefundManage busRefundManage;

	@Override
	public HashMap<String, Object> findFooter(BusRefundCondition condition) {
		HashMap<String, Object> footer = busRefundManage.findFooter(condition);
		footer.put(condition.getFirstColumn(), "合计:");	
		return footer;
	}

	@Override
	public BusRefund load(String id) {
		return busRefundManage.load(id);
	}
	
	@Override
	public HashMap<String, Object> getInitData(String refundId, 
			String orderId, String refundType, BusUserDto currUser) {
		HashMap<String, Object> map = new HashMap<>();
		if(StringUtils.isEmpty(refundId)){			
			map = this.getInitEntity(orderId, refundType, currUser);
		}else{
			map = this.loadEntity(refundId, refundType);
		}
		return map;
	}

	@Override
	public List<BusRefund> list(BusRefundCondition condition) {
		return busRefundManage.list(condition);
	}

	@Override
	public PageModel findPage(BusRefundCondition condition) {
		return busRefundManage.findMapPage(condition);
	}

	@Override
	public String save(BusRefund domain, SysUser currentUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getRefundRemark(String refundId) {
		BusRefund busRefund = this.load(refundId);
		if(busRefund!=null && busRefund.getMemo()!=null){
			return busRefund.getMemo();
		}
		return "";
	}
	
	/**********************************  单据操作      *********************************/

	@Override
	public void createForRefund(BusRefundDto busRefundDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onekeyRefund(BusRefundDto busRefundDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createForBarter(BusBarterDto busBarterDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changeStatus(String[] split, String status, SysUser user, BusRefundCondition condition) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String updateRemark(BusRefundCondition condition, SysUser sysuser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void handleSign(String refundId, Short refundStatus, String memo, SysUser sysuser) {
		// TODO Auto-generated method stub
		
	}

	/**********************************     内部方法         ***************************************/
	
	/**
	 * 初始化实体对象
	 * @param orderId
	 * @param refundType
	 * @param currUser
	 * @return
	 */
	private HashMap<String, Object> getInitEntity(String orderId, String refundType, 
			BusUserDto currUser) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 获取单据实体对象
	 * @param refundId
	 * @param refundType
	 * @return
	 */
	private HashMap<String, Object> loadEntity(String refundId, String refundType) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
