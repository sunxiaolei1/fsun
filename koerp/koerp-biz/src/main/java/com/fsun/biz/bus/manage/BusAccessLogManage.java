package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.BusAccessLogMapper;
import com.fsun.domain.model.BusAccessLog;

/**
 * @author fsun
 * @date 2019年2月10日
 */
@Component
public class BusAccessLogManage extends CrudManage<BusAccessLogMapper, BusAccessLog>{

}
