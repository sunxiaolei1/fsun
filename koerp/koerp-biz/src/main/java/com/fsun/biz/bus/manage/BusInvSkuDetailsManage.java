package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusInvSkuDetailsMapper;
import com.fsun.domain.model.BusInvSkuDetails;

/**
 * 库存明细操作接口
 * @author fsun
 * @date 2018年12月19日
 */
@Component
public class BusInvSkuDetailsManage extends CrudManage<BusInvSkuDetailsMapper, BusInvSkuDetails>{

}
