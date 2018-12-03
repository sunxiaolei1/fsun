package com.fsun.domain.model;

import java.util.Date;

public class BusBasCodes {
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

    /**
     * 创建人
     * 表字段 : bus_bas_codes.created_name
     */
    private String createdName;

    /**
     * 更新人
     * 表字段 : bus_bas_codes.updated_name
     */
    private String updatedName;

    /**
     * 创建时间
     * 表字段 : bus_bas_codes.created_time
     */
    private Date createdTime;

    /**
     * 更新时间
     * 表字段 : bus_bas_codes.updated_time
     */
    private Date updatedTime;

    public String getCodeId() {
        return codeId;
    }

    public void setCodeId(String codeId) {
        this.codeId = codeId == null ? null : codeId.trim();
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType == null ? null : codeType.trim();
    }

    public String getCodeCode() {
        return codeCode;
    }

    public void setCodeCode(String codeCode) {
        this.codeCode = codeCode == null ? null : codeCode.trim();
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName == null ? null : codeName.trim();
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
        this.userDefine1 = userDefine1 == null ? null : userDefine1.trim();
    }

    public String getUserDefine2() {
        return userDefine2;
    }

    public void setUserDefine2(String userDefine2) {
        this.userDefine2 = userDefine2 == null ? null : userDefine2.trim();
    }

    public String getUserDefine3() {
        return userDefine3;
    }

    public void setUserDefine3(String userDefine3) {
        this.userDefine3 = userDefine3 == null ? null : userDefine3.trim();
    }

    public String getCreatedName() {
        return createdName;
    }

    public void setCreatedName(String createdName) {
        this.createdName = createdName == null ? null : createdName.trim();
    }

    public String getUpdatedName() {
        return updatedName;
    }

    public void setUpdatedName(String updatedName) {
        this.updatedName = updatedName == null ? null : updatedName.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }
}