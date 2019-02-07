package com.fsun.service.category;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fsun.api.bus.BusCategoryApi;
import com.fsun.biz.common.BasCodesManage;
import com.fsun.domain.dto.CategoryTreeDto;
import com.fsun.domain.entity.BasCodesCondition;
import com.fsun.domain.model.BusBasCodes;

/**
 * @author fsun
 * @date 2018年12月18日
 */
@Service
public class CategoryService implements BusCategoryApi {

	@Autowired
	private BasCodesManage basCodesManage;
	
	@Override
	public CategoryTreeDto getCategoryTree() {
		
		BasCodesCondition condition = new BasCodesCondition();
		condition.setCodeType("CategoryCode");
		List<BusBasCodes> list = basCodesManage.list(condition);
		CategoryTreeDto rootNode = this.initRootNode();		
		this.addChildren(rootNode, list);		
		return rootNode;
	}
	

	/**************************      私有方法            *******************************/

	/**
	 * 获取根节点
	 * @return
	 */
	private CategoryTreeDto initRootNode() {
		CategoryTreeDto rootNode = new CategoryTreeDto();
		rootNode.setId("0");
		rootNode.setText("全部分类");
		rootNode.setIsleaf(false);
		rootNode.setIconCls("icon-chart_organisation");
		rootNode.setState("open");
		return rootNode;		
	}

	/**
	 * 递归获取子节点
	 * @param parentNode
	 * @param list
	 */
	private void addChildren(CategoryTreeDto parentNode, List<BusBasCodes> list) {
		List<CategoryTreeDto> childrenNode = new ArrayList<>();
		for (BusBasCodes treeDto : list) {
			if (treeDto.getUserDefine2() != null 
					&& treeDto.getUserDefine2().equals(parentNode.getId())) {
				CategoryTreeDto childNode = new CategoryTreeDto();
				childNode.setId(treeDto.getCodeCode());
				childNode.setText(treeDto.getCodeName());				
				childNode.setIsleaf(true);
				childNode.setIconCls("icon-bricks");
				childNode.setState("open");
				this.addChildren(childNode, list);
				childrenNode.add(childNode);
			}
		}		
		if(childrenNode.size()>0 && !"0".equals(parentNode.getId())){	
			parentNode.setIconCls("icon-rgb");
			parentNode.setState("closed");					
			parentNode.setIsleaf(false);			
		}	
		parentNode.setChildren(childrenNode);
	}
}
