package com.fsun.api.bus;

import com.fsun.domain.dto.ErpOrderDto;

/**
 * @author fsun
 * @date 2019年10月9日
 */
public interface ErpOrderApi {

	/**
	 * erp出库单转换成入库单（待签收审核）
	 * @param erpOrderDto
	 * @return
	 */
	public String transferAsnDto(ErpOrderDto erpOrderDto);

}
