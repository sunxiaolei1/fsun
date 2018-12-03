package com.fsun.domain.entity;

import com.fsun.domain.common.SortCondition;

/**
 * 
 * @author sunxiaolei
 *
 */
public class BasCodesCondition extends SortCondition{
	
	/**
     * 代码id
     * 表字段 : bus_bas_codes.code_id
     */
    private String codeId;

    /**
     * 代码类别 字段名 temp_id
     * 表字段 : bus_bas_codes.code_type
     */
    private String codeType;

    /**
     * 代码
     * 表字段 : bus_bas_codes.code_code
     */
    private String codeCode;

    /**
     * 名称 
     * 表字段 : bus_bas_codes.code_name
     */
    private String codeName;

    /**
     * 排序号
     * 表字段 : bus_bas_codes.sort_code
     */
    private Integer sortCode;

    /**
     * 自定义1
     * 表字段 : bus_bas_codes.user_define1
     */
    private String userDefine1;

    /**
     * 自定义2
     * 表字段 : bus_bas_codes.user_define2
     */
    private String userDefine2;

    /**
     * 自定义3
     * 表字段 : bus_bas_codes.user_define3
     */
    private String userDefine3;

	private String updateCodeId;
	
	private String keyword;
	
	private String queryCodeType;

	public String getUpdateCodeId() {
		return updateCodeId;
	}

	public void setUpdateCodeId(String updateCodeId) {
		this.updateCodeId = updateCodeId;
	}

	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * @return the queryCodeType
	 */
	public String getQueryCodeType() {
		return queryCodeType;
	}

	/**
	 * @param queryCodeType the queryCodeType to set
	 */
	public void setQueryCodeType(String queryCodeType) {
		this.queryCodeType = queryCodeType;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getCodeCode() {
		return codeCode;
	}

	public void setCodeCode(String codeCode) {
		this.codeCode = codeCode;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public Integer getSortCode() {
		return sortCode;
	}

	public void setSortCode(Integer sortCode) {
		this.sortCode = sortCode;
	}

	public String getUserDefine1() {
		return userDefine1;
	}

	public void setUserDefine1(String userDefine1) {
		this.userDefine1 = userDefine1;
	}

	public String getUserDefine2() {
		return userDefine2;
	}

	public void setUserDefine2(String userDefine2) {
		this.userDefine2 = userDefine2;
	}

	public String getUserDefine3() {
		return userDefine3;
	}

	public void setUserDefine3(String userDefine3) {
		this.userDefine3 = userDefine3;
	}
	
	
}
