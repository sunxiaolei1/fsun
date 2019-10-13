package com.fsun.biz.bus.manage;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.common.utils.DateUtil;
import com.fsun.dao.mapper.DocOrderHeaderMapper;
import com.fsun.domain.model.DocOrderHeader;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocOrderHeaderManage extends CrudManage<DocOrderHeaderMapper, DocOrderHeader>{

	/**
	 * 根据出库类型生成出库单号
	 * @param orderType
	 * @param shopCode
	 * @return
	 */
	public String initOrderNo(String orderType, String shopCode) {	
		//return this.getCheckCode();
		//String prefix = DateUtil.getNowDateStr().replace("-", "") + orderType + shopCode;
		String prefix = DateUtil.getNowShortDateStr() + orderType;
		List<String> list = mapper.getMaxNumber(prefix);
		if(list!=null && list.size()>0){
			String maxOrderNo = list.get(0);
			return (Long.parseLong(maxOrderNo) + 1) + "";
		}else{	
			//return prefix + "00001";
			return prefix + "01";
		}
	}
	
	private String getCheckCode() {
		String ZiMu = "123456789";
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			int index = random.nextInt(ZiMu.length());
			char c = ZiMu.charAt(index);
			result += c;
		}
		return result;

	}
	
}
