package com.fsun.domain.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @ClassName: ReportHeaderTree 
 * @Description: 报表表头树 
 * @author fsun 
 * @date 2018年4月13日 下午5:32:30 
 *
 */
public class ReportHeaderTree {

    private String id;
    
    private String parentId;
    	
	private String ename;
	
	private String cname;
	
	private String sortCode;
	
	private Integer fieldLevel;
	
	private Boolean isLeaf;
	
	private String columnNo;
	
	private List<ReportHeaderTree> children;
	
	private HeaderFieldModel attributes;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSortCode() {
		return sortCode;
	}

	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	public Integer getFieldLevel() {
		return fieldLevel;
	}

	public void setFieldLevel(Integer fieldLevel) {
		this.fieldLevel = fieldLevel;
	}

	public Boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public List<ReportHeaderTree> getChildren() {
		return children;
	}

	public void setChildren(List<ReportHeaderTree> children) {
		this.children = children;
	}

	public HeaderFieldModel getAttributes() {
		return attributes;
	}

	public void setAttributes(HeaderFieldModel attributes) {
		this.attributes = attributes;
	}

	public String getColumnNo() {
		return columnNo;
	}

	public void setColumnNo(String columnNo) {
		this.columnNo = columnNo;
	}

	public Map<String, Object> toColumnMap() {
		Boolean checkbox = attributes.getCheckbox();	
		String ename = attributes.getEname();
		String cname = attributes.getCname();
		String width = attributes.getWidth();
		String align = attributes.getAlign();
		String styler = attributes.getStyler();
		String formatter = attributes.getFormatter();
		Boolean sortable = attributes.getSortable();
		Boolean mergeCell = attributes.getMergeCell();		
		Boolean mergeUnique = attributes.getMergeUnique();
		
		Map<String, Object> columnMap = new HashMap<>();
		if(checkbox!=null){
			columnMap.put("checkbox", checkbox);
		}
		if(ename!=null && !ename.equals("")){
			columnMap.put("field", ename);
		}
		if(cname!=null && !cname.equals("")){
			columnMap.put("title", cname);
		}
		if(styler!=null && !styler.equals("")){			
			columnMap.put("styler", styler);
		}
		if(formatter!=null && !formatter.equals("")){			
			columnMap.put("formatter", formatter);
		}
		if(mergeCell!=null && !mergeCell.equals("")){			
			columnMap.put("mergeCell", mergeCell);
		}
		if(mergeUnique!=null && !mergeUnique.equals("")){			
			columnMap.put("mergeUnique", mergeUnique);
		}
		columnMap.put("width", width!=null&&!width.equals("")?width:"100px");
		columnMap.put("align", align!=null&&!align.equals("")?align:"center");
		columnMap.put("sortable", sortable!=null?sortable:false);
		columnMap.put("currNode", this);
		/*String column = 
			"{ "
			+ (checkbox!=null?("checkbox:'"+ checkbox +"',"):"")
			+ (ename!=null&&!ename.equals("")?("field:'"+ ename +"',"):"")
		    + (cname!=null&&!cname.equals("")?("title:'"+ cname +"',"):"")
		    + "width:'"+ (width!=null&&!width.equals("")?width:"100px") +"',"
		    + "align:'"+ (align!=null&&!align.equals("")?align:"center") +"',"
		    + "sortable:'"+ (sortable!=null?sortable:"false") +"'"		    
		    + " }";*/
		System.out.println(columnMap);
		return columnMap;
	}

}
