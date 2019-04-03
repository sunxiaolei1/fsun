package com.fsun.biz.bus.manage;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.DocPoDetailsMapper;
import com.fsun.dao.mapper.DocPoHeaderMapper;
import com.fsun.domain.enums.DocPoStatusEnum;
import com.fsun.domain.model.DocOrderDetails;
import com.fsun.domain.model.DocOrderHeader;
import com.fsun.domain.model.DocPoDetails;
import com.fsun.domain.model.DocPoHeader;
import com.fsun.exception.bus.DocOrderException;
import com.fsun.exception.enums.SCMErrorEnum;

/**
 * @author fsun
 * @date 2019年3月16日
 */
@Component
public class DocPoHeaderManage extends CrudManage<DocPoHeaderMapper, DocPoHeader>{

	@Autowired
	private DocPoDetailsMapper docPoDetailsMapper;
	 
	/**
	 * 初始化申请单号
	 * @param poType
	 * @param shopCode
	 * @return
	 */
	public String initPoNo(String poType, String shopCode) {
		String prefix = DateUtil.getNowDateStr().replace("-", "") + poType + shopCode;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String maxPoNo = list.get(0);
			return (Long.parseLong(maxPoNo) + 1) + "";
		}else{	
			return prefix + "00001";
		}
	}

	/**
	 * 审核调拨申请及更新明细
	 * @param header
	 * @param details
	 */
	public void auditAllotApply(DocOrderHeader header, List<DocOrderDetails> details) {
		String poNos = header.getPoNo();
		BigDecimal expectedQty = null;
		if(poNos!=null && !poNos.equals("")){			
			//遍历更新申请单据
			Date now = new Date();
			for (String poNo : poNos.split(",")) {
				HashMap<String, Object> entity = this.loadEntity(poNo);
				HashMap<String, Object> headerMap = (HashMap<String, Object>) entity.get("header");
				String oldPoStatus = (String)headerMap.get("poStatus");
				if(!DocPoStatusEnum.CREATE.getCode().equals(oldPoStatus)){
					throw new DocOrderException(SCMErrorEnum.BUS_ORDER_STATUS_INVALID);
				}
				//更新申请单明细
				List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) entity.get("details");
				for (HashMap<String, Object> detailMap : list) {
					expectedQty = BigDecimal.ZERO;	
					String poDetailId = (String) detailMap.get("poDetailId");
					for (DocOrderDetails docOrderDetails : details) {
						//明细主键匹配
						if(poDetailId.equals(docOrderDetails.getUserDefine1())){
							expectedQty = docOrderDetails.getShippedQty();
							break;
						}
					}
					DocPoDetails docPoDetails = new DocPoDetails();
					docPoDetails.setPoDetailId(poDetailId);
					docPoDetails.setExpectedQty(expectedQty);
					docPoDetails.setUpdatedTime(now);
					docPoDetailsMapper.updateByPrimaryKeySelective(docPoDetails);
				}
				//更新申请单状态
				DocPoHeader poHeader = new DocPoHeader();
				poHeader.setPoNo(poNo);
				poHeader.setUpdatedName(header.getUpdatedName());
				poHeader.setUpdatedTime(header.getUpdatedTime());				
				//审核信息
				poHeader.setPoStatus(DocPoStatusEnum.AUDIT_PASS.getCode());
				poHeader.setAuditTime(now);
				poHeader.setAuditorId(header.getiId());
				poHeader.setAuditor(header.getUpdatedName());
				poHeader.setRelationNo(header.getOrderNo());
				poHeader.setDeliveryTime(header.getDeliveryTime());
				poHeader.setExpectedTime(header.getExpectedTime());
				mapper.updateByPrimaryKeySelective(poHeader);
			}
		}
	}
}
