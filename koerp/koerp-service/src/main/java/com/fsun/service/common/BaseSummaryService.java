package com.fsun.service.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.biz.bus.report.manage.HeaderFieldManage;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.HeaderFieldCondition;
import com.fsun.domain.report.HeaderFieldModel;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.exception.bus.ReportServiceException;
import com.fsun.exception.enums.SCMErrorEnum;

/**	
 * 汇总-表头操作公共方法
 * @author fsun
 * @date 2019年4月19日
 */
public abstract class BaseSummaryService {

	@Autowired
	private HeaderFieldManage headerFieldManage;
	
	/**
	 * 
	 * @Title: getHeaderFields 
	 * @Description: 获取对应类型的表头信息
	 * @param @param queryType
	 * @param @return 
	 * @return List<HeaderFieldModel>
	 */
	public List<HeaderFieldModel> getHeaderFields(String queryType){
		
		HeaderFieldCondition headerFieldCondition = new HeaderFieldCondition();
		headerFieldCondition.setReportType(ReportQueryTypeEnum.getByCode(queryType).getName());
		List<HeaderFieldModel> models = headerFieldManage.queryHeaderFields(headerFieldCondition);
		if(models==null || models.size()==0){
	    	throw new ReportServiceException(SCMErrorEnum.INVALID_PARAMS);
	    }
		return models;
	}

	/**
	 * 
	 * @Title: getHeaderMap 
	 * @Description: 将数组转化成map(表头嵌套) 
	 * @param @param headerArr
	 * @param @return 
	 * @return Map
	 */
	protected List<ReportHeaderTree> getReportHeaderTree(List<HeaderFieldModel> headerFieldModels){
		
		List<ReportHeaderTree> headerTree = new ArrayList<>();
		if(headerFieldModels==null || headerFieldModels.size()==0){
			return headerTree;
		}
		for (HeaderFieldModel headerFieldModel : headerFieldModels) {
			if(headerFieldModel.getParentId()==null){			
				ReportHeaderTree currTree = new ReportHeaderTree();
				currTree.setAttributes(headerFieldModel);
				currTree.setId(headerFieldModel.getId());
				currTree.setParentId(headerFieldModel.getParentId());
				currTree.setCname(headerFieldModel.getCname());
				currTree.setEname(headerFieldModel.getEname());
				currTree.setFieldLevel(headerFieldModel.getFieldLevel());
				currTree.setSortCode(headerFieldModel.getSortCode());
				currTree.setIsLeaf(headerFieldModel.getIsLeaf());	
				currTree.setColumnNo(headerFieldModel.getColumnNo());
				
				currTree.setChildren(this.getCurrNodeChildren(headerFieldModel.getId(), headerFieldModels));
				headerTree.add(currTree);
			}	
		}
		return headerTree;
	}
	
	/**
	 * 
	 * @Title: getCurrNodeChildren 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param ename
	 * @param @param headerFieldModels 
	 * @return void
	 */
	private List<ReportHeaderTree> getCurrNodeChildren(String nodeId,  List<HeaderFieldModel> models){
		
		List<ReportHeaderTree> children = new ArrayList<>();
		for (HeaderFieldModel model : models) {
			String parentId = model.getParentId();
			if(nodeId.equals(parentId)){
				ReportHeaderTree child = new ReportHeaderTree();
				child.setAttributes(model);
				child.setId(model.getId());
				child.setParentId(model.getParentId());
				child.setCname(model.getCname());
				child.setEname(model.getEname());
				child.setFieldLevel(model.getFieldLevel());
				child.setSortCode(model.getSortCode());
				child.setIsLeaf(model.getIsLeaf());	
				child.setColumnNo(model.getColumnNo());
				if(!model.getIsLeaf()){
					child.setChildren(this.getCurrNodeChildren(model.getId(), models));
				}else{
					child.setChildren(new ArrayList<ReportHeaderTree>());
				}
				children.add(child);
			}
		}
		return children;
	}
}
