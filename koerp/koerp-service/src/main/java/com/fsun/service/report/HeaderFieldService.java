package com.fsun.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.springframework.stereotype.Service;

import com.fsun.api.report.HeaderFieldApi;
import com.fsun.domain.report.HeaderFieldModel;
import com.fsun.domain.report.ReportHeaderTree;
import com.fsun.service.common.BaseSummaryService;

/**
 * 表头信息操作接口实现
 * @author fsun
 * @date 2019年4月19日
 */
@Service
public class HeaderFieldService extends BaseSummaryService implements HeaderFieldApi {

	@Override
	public HashMap<String, Object> headerFieldMap(String queryType) {
		
		HashMap<String, Object> headerFieldMap = new HashMap<>();
		//获取对应的报表的字段集合
		List<HeaderFieldModel> models = super.getHeaderFields(queryType);
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
		//组装表头字段集合
		List<List<Map<String, Object>>> columnsList = new ArrayList<>();
		List<ReportHeaderTree> headerTree = super.getReportHeaderTree(models);
		//目录级数逐层遍历拼装表头列字段
		for (int i = 0; i < reportLevel; i++) {
			List<Map<String, Object>> columns = new ArrayList<>();
			for (ReportHeaderTree reportHeaderTree : headerTree) {
				List<List<Map<String, Object>>> list = this.levelOrder(reportHeaderTree);
				if(list!=null && list.size()>i){
					for (Map<String, Object> column : list.get(i)) {
						ReportHeaderTree attr = (ReportHeaderTree)column.get("currNode"); 
						if(attr.getIsLeaf()){
							column.put("rowspan", reportLevel-i);
						}else{
							List<ReportHeaderTree> leafs = new ArrayList<>();
							this.getAllLeafs(attr, leafs);
							column.put("colspan", leafs.size());
						}
						column.remove("currNode");
						columns.add(column);
					}				
				}
			}
			columnsList.add(columns);
		}					
		headerFieldMap.put("columns", columnsList);
		System.out.println(columnsList);
		return headerFieldMap;
	}
	
	/**
	 * 递归获取当前节点的所有叶子节点
	 * @param currNode
	 * @param leafs
	 */
	public void getAllLeafs(ReportHeaderTree currNode, List<ReportHeaderTree> leafs){		
		List<ReportHeaderTree> list = currNode.getChildren();
		if(list!=null){
			for (ReportHeaderTree childNode : list) {
				if(childNode.getIsLeaf()){
					leafs.add(childNode);
				}else{
					if(childNode.getChildren()!=null && childNode.getChildren().size()>0){
						getAllLeafs(childNode, leafs);
					}				
				}			
			}
		}		
	}

	
	// N叉树的层序遍历
    private List<List<Map<String, Object>>> levelOrder(ReportHeaderTree root) {
        List<List<Map<String, Object>>> lists = new ArrayList<>();
        if (root == null) {
        	return lists;
        }
        Queue<ReportHeaderTree> headerQueue = new LinkedList<>();
        headerQueue.add(root);
        List<Map<String, Object>> list = new ArrayList<>();
        ReportHeaderTree tempNode = null;
        while (!headerQueue.isEmpty()) {
            int levelSize = headerQueue.size();
            for (int i = 0; i < levelSize; i++) {
            	tempNode = headerQueue.poll();
                // 跟二叉树的层序遍历的区别在于，这里加入的是所有子树
                headerQueue.addAll(tempNode.getChildren());
                list.add(tempNode.toColumnMap());
            }
            lists.add(new ArrayList<>(list));
            list.clear();
        }
        return lists;
    }

	
}
