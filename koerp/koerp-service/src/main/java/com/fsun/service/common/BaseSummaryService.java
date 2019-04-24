package com.fsun.service.common;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.biz.bus.report.manage.HeaderFieldManage;
import com.fsun.common.dto.ColumnDto;
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
	 * 初始化集合中所有的叶子节点map
	 * @param models
	 * @param headerFieldMap
	 * @return
	 */
	protected int initLeafsMap(List<HeaderFieldModel> models, Map<String, Object> headerFieldMap){
		//获取所有子节点队列
		LinkedHashMap<String, String> fieldsMap = new LinkedHashMap<String, String>();
		int reportLevel = 0;
		for (HeaderFieldModel model : models) {
			if(model.getIsLeaf()){
				fieldsMap.put(model.getEname(), model.getEname());
			}
			Integer fieldLevel = model.getFieldLevel();
			if(fieldLevel!=null && fieldLevel>reportLevel){
				reportLevel = fieldLevel;
			}
		}
		//获取表头目录级数
		headerFieldMap.put("reportLevel", reportLevel);
		headerFieldMap.put("fields", fieldsMap);
		return reportLevel;
	}
	
	/**
	 * 递归获取列表树下的所有子节点
	 * @param headersTree
	 * @param fieldsMap
	 */
	protected void getLeafsMap(List<ReportHeaderTree> headersTree, LinkedHashMap<String, String> fieldsMap) {
		if(headersTree!=null){
			for (ReportHeaderTree reportHeaderTree : headersTree) {
				List<ReportHeaderTree> children = reportHeaderTree.getChildren();
				if(children!=null && children.size()>0){
					this.getLeafsMap(children, fieldsMap);
				}else{
					fieldsMap.put(reportHeaderTree.getEname(), reportHeaderTree.getCname());
				}
			}
		}	
	}
	
	/**
	 * 初始化excel表头单元格
	 * @param headersTree
	 * @param columnDtos
	 */
	protected void getExcelColumns(List<ReportHeaderTree> parentsTree, List<ColumnDto> columnDtos) {
		if(parentsTree!=null){
			for (ReportHeaderTree parentTree : parentsTree) {
				ColumnDto columnDto = new ColumnDto();
				columnDto.setParent(parentTree.getParentId());
				columnDto.setContent(parentTree.getCname());
				columnDto.setFieldName(parentTree.getEname());
				columnDto.setCellLevel(parentTree.getFieldLevel());
				columnDto.setMergeCell(parentTree.getAttributes().getMergeCell());
				columnDto.setMergeUnique(parentTree.getAttributes().getMergeUnique());
				List<ReportHeaderTree> children = parentTree.getChildren();
				if(children!=null && children.size()>0){
					List<ColumnDto> childrenColumns = new ArrayList<>();
					this.getExcelColumns(children, childrenColumns);
					columnDto.setChildren(childrenColumns);
				}else{
					//columnDto.setChildren(null);
				}
				columnDtos.add(columnDto);
			}
		}	
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
