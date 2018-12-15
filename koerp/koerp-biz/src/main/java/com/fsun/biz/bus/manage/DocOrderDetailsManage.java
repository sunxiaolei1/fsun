package com.fsun.biz.bus.manage;

import org.springframework.stereotype.Component;

import com.fsun.biz.common.CrudManage;
import com.fsun.dao.mapper.DocOrderDetailsMapper;
import com.fsun.domain.model.DocOrderDetails;

/**
 * @author fsun
 * @date 2018年12月15日
 */
@Component
public class DocOrderDetailsManage extends CrudManage<DocOrderDetailsMapper, DocOrderDetails>{

}
