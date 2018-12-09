package com.fsun.service.rulprice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusRulPriceApi;
import com.fsun.biz.bus.manage.BusRulPriceManage;
import com.fsun.domain.dto.RulPriceDto;
import com.fsun.domain.dto.RulPriceTreeDto;
import com.fsun.domain.entity.BusRulPriceCondition;
import com.fsun.domain.model.BusRulPrice;
import com.fsun.service.common.AbstractService;

/**
 * @author fsun
 * @date 2018年12月9日
 */
@Service
public class BusRulPriceService extends AbstractService implements BusRulPriceApi{
	
	@Autowired
	private BusRulPriceManage busRulPriceManage;

	@Override
	public HashMap<String, Object> loadEntity(String rulId) {
		return busRulPriceManage.loadEntity(rulId);
	}

	@Override
	public List<BusRulPrice> list(BusRulPriceCondition condition) {
		return busRulPriceManage.list(condition);
	}

	@Override
	public List<RulPriceTreeDto> getRulTree(BusRulPriceCondition condition) {
			
		/**
		 * 构建以公司为根节点、门店为叶子节点的二级目录树
		 */			
		RulPriceTreeDto rootNode = this.initRootNode();									
		if (rootNode != null) {
			List<RulPriceTreeDto> shopTree = new ArrayList<>();			
			List<BusRulPrice> list = busRulPriceManage.list(condition);
			this.addChildren(rootNode, list);
			shopTree.add(rootNode);
			return shopTree;
		}
			
		return new ArrayList<>();
	}
	
	/**
	 * 初始化根节点获取所有策略
	 * @return
	 */
	private RulPriceTreeDto initRootNode(){
				
		RulPriceTreeDto rootNode = new RulPriceTreeDto();
		rootNode.setId("0");
		rootNode.setText("所有策略");
		rootNode.setIconCls("icon-graph");
		return rootNode;		
	}

}
