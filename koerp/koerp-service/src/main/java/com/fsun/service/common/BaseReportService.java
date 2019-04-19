package com.fsun.service.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.fsun.biz.bus.report.manage.HeaderFieldManage;
import com.fsun.biz.common.BaseReportManage;
import com.fsun.common.utils.StringUtils;
import com.fsun.domain.enums.ReportConditionFieldEnum;
import com.fsun.domain.enums.ReportFieldTypeEnum;
import com.fsun.domain.enums.ReportQueryTypeEnum;
import com.fsun.domain.report.HeaderFieldCondition;
import com.fsun.domain.report.HeaderFieldModel;
import com.fsun.domain.report.ReportCondition;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.exception.bus.ReportServiceException;
import com.fsun.exception.enums.SCMErrorEnum;


/**
 * 
 * @ClassName: BaseServiceImpl 
 * @Description: 报表接口基类
 * @author fsun
 * @date 2018年4月13日 下午12:52:14 
 *
 */
public abstract class BaseReportService<T extends ReportCondition>{
	
	@Autowired
	private HeaderFieldManage headerFieldManage;
	
	/**
	 * 
	 * @return
	 */
	protected abstract BaseReportManage getDefaultManage();
	
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
	
	/**
	 * 
	 * @Title: queryInit 
	 * @Description: 查询初始化
	 * @param @param where
	 * @param @param condition
	 * @param @param headerFieldModels
	 * @param @param unionTotal 
	 * @return void
	 */
	protected void queryInit(StringBuffer where, T condition, 
			List<HeaderFieldModel> headerFieldModels, StringBuffer unionTotal){
		this.queryInit(where, null, condition, headerFieldModels, unionTotal);
	}
	
	/**
	 * 
	 * @Title: queryInit 
	 * @Description: 查询初始化
	 * @param @param where
	 * @param @param orderBy
	 * @param @param condition
	 * @param @param headerFieldModels
	 * @param @param unionTotal 
	 * @return void
	 */
	protected void queryInit(StringBuffer where, StringBuffer orderBy, T condition, 
			List<HeaderFieldModel> headerFieldModels, StringBuffer unionTotal){
		
		if(where==null){
			where = new StringBuffer(" WHERE　1 = 1 ");		
		}
		String startTime = condition.getStartTime();
		String endTime = condition.getEndTime();
		String query_date_time = ReportConditionFieldEnum.QUERY_DATE_TIME.getName();
		
		if(!StringUtils.isEmpty(startTime)){
			where.append(" AND "+ query_date_time + ">='"+ startTime +"' ");
		}
		if(!StringUtils.isEmpty(endTime)){
			where.append(" AND "+ query_date_time + "<='"+ endTime +"' ");
		}	
		
		String tableName = ReportQueryTypeEnum.getByCode(condition.getQueryType()).getName();
		if(!StringUtils.isEmpty(tableName)){
			throw new ReportServiceException(SCMErrorEnum.INVALID_PARAMS);
		}	
		String from = " FROM "+ tableName;
		
		//叶子节点顺序排序,排序在sql中做
		List<String> leafs = new ArrayList<>();
		List<String> totalLeafs = new ArrayList<>();
	    for (HeaderFieldModel headerFieldModel : headerFieldModels) {
	    	if(headerFieldModel.getIsLeaf()){	    		
	    		leafs.add(headerFieldModel.getEname());
	    		
	    		/************************************  需要算合计行    ************************************/
	    		if(unionTotal!=null){
	    			String fieldType = headerFieldModel.getFieldType();
		    		//字段类型是字符型
		    		if(ReportFieldTypeEnum.FIELD_STRING.getCode().equals(fieldType)){
		    			//判别是不是第一列
		    			if(headerFieldModel.getColumnNo().equals("1")){
		    				totalLeafs.add("'合计' as "+ headerFieldModel.getEname());
		    			}else{
		    				totalLeafs.add("'' as "+ headerFieldModel.getEname());
		    			}
		    		}else if(ReportFieldTypeEnum.FIELD_LONG.getCode().equals(fieldType) 
		    			|| ReportFieldTypeEnum.FIELD_DOUBLE.getCode().equals(fieldType)){
		    			totalLeafs.add("SUM("+ headerFieldModel.getEname()+") as "+ headerFieldModel.getEname());
		    		}else{
		    			totalLeafs.add("'' as "+ headerFieldModel.getEname());
		    		}
	    		}
	    		/************************************  需要算合计行    ************************************/
	    	}
		}	 
	    if(leafs.size()==0){
	    	throw new ReportServiceException(SCMErrorEnum.INVALID_PARAMS);
	    }	    
	    StringBuffer select = new StringBuffer(" SELECT ");    
	    if(unionTotal==null){ 
	    	select.append(StringUtils.join(leafs, ",")).append(from).append(where);
	    	if(orderBy!=null){
	    		select.append(orderBy);
	    	}
	    }else{
	    	/************************************  需要算合计行    ************************************/
	    	
	    	select.append(" 1 as ID,").append(StringUtils.join(leafs, ",")).append(from).append(where);	
	    	if(unionTotal.length()==0){
	    		unionTotal = new StringBuffer(" UNION SELECT 2 as ID, "); 		
	    		unionTotal.append(StringUtils.join(totalLeafs, ",")).append(from).append(where);	
	    	}
	    	select.append(unionTotal);	 
	    	
	    	/************************************  需要算合计行    ************************************/
	    } 
	    
	    condition.setSelect(select.toString());
	}
	
	
	/**
	 * 
	 * @Title: getMapReport 
	 * @Description: 公用的获取报表对象Map 
	 * @param @param condition
	 * @param @param where
	 * @param @param unionTotal
	 * @param @return 
	 * @return Map<String,Object>
	 */
	protected Map<String, Object> getMapReport(T condition, StringBuffer where, StringBuffer unionTotal){
		return this.getMapReport(condition, where, null, unionTotal);
	}

	
	/**
	 * 
	 * @Title: getMapReport 
	 * @Description: 公用的获取报表对象Map 
	 * @param @param condition
	 * @param @param where
	 * @param @param orderBy
	 * @param @param unionTotal
	 * @param @return 
	 * @return Map<String,Object>
	 */
	protected Map<String, Object> getMapReport(T condition, StringBuffer where,  
			StringBuffer orderBy, StringBuffer unionTotal){
		Map<String, Object> reportMap = new HashMap<String, Object>();
		String queryType = condition.getQueryType();
		Integer reportLevel = 1;
        if(StringUtils.isEmpty(queryType)){
        	reportMap.put("headers", new HashMap<>());
        	reportMap.put("reportLevel", reportLevel);
        	reportMap.put("details", new ArrayList<>());
        	return reportMap;
        }
        //获取表头字段
		List<HeaderFieldModel> headerFieldModels = this.getHeaderFields(queryType);	
		//获取表头目录级数
		for (HeaderFieldModel headerFieldModel : headerFieldModels) {
			Integer fieldLevel = headerFieldModel.getFieldLevel();
			if(fieldLevel!=null && fieldLevel>reportLevel){
				reportLevel = fieldLevel;
			}
		}
		reportMap.put("reportLevel", reportLevel);
		//组装多表头字段目录结构
		List<ReportHeaderTree> headers = this.getReportHeaderTree(headerFieldModels);		
		//获取报表明细
		List<Map<String,Object>> details = new ArrayList<>();
		
		int sqlType = ReportQueryTypeEnum.getByCode(queryType).getSqlType();
		BaseReportManage defaultManage = getDefaultManage();
		switch (sqlType) {
			case 1:	
				this.queryInit(where, orderBy, condition, headerFieldModels, unionTotal);
				details = defaultManage.query(condition);
				break;
			case 2:	
				HashMap<String, Object> paramsMap = this.queryCallInit(where, orderBy, condition, headerFieldModels);
				details = defaultManage.queryCall(paramsMap);
				break;
			case 3:	
				break;
			case 4:	
				break;
			default:
				break;
		}
		reportMap.put("headers", headers);
		reportMap.put("details", details);
 		return reportMap;
	}

	/**
	 * 储存过程调用条件初始化
	 * @param where
	 * @param orderBy
	 * @param condition
	 * @param headerFieldModels
	 */
	protected abstract HashMap<String, Object> queryCallInit(StringBuffer where, StringBuffer orderBy, ReportCondition condition,
			List<HeaderFieldModel> headerFieldModels);
	
}
