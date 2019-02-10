package com.fsun.domain.entity;

import java.util.Date;

import com.fsun.domain.common.SortCondition;

/**
 * @author fsun
 * @date 2019年2月10日
 */
public class BusAccessLogCondition extends SortCondition{
	
	/**
     * id
     * 表字段 : bus_access_log.id
     */
    private String id;

    /**
     * 请求流水号
     * 表字段 : bus_access_log.request_id
     */
    private String requestId;

    /**
     * 请求参数
     * 表字段 : bus_access_log.request_json
     */
    private String requestJson;

    /**
     * 系统返回的异常信息
     * 表字段 : bus_access_log.error_msg
     */
    private String errorMsg;

    /**
     * 请求状态码
     * 表字段 : bus_access_log.request_status
     */
    private Short requestStatus;

    /**
     * 0、内部系统；1、外部接口
     * 表字段 : bus_access_log.request_type
     */
    private Short requestType;

    /**
     * 接口耗时
     * 表字段 : bus_access_log.spend_time
     */
    private Short spendTime;

    /**
     * ip
     * 表字段 : bus_access_log.ip
     */
    private String ip;

    /**
     * Extended field
     * 表字段 : bus_access_log.ext_0
     */
    private String ext0;

    /**
     * Extended field
     * 表字段 : bus_access_log.ext_1
     */
    private String ext1;

    /**
     * Extended field
     * 表字段 : bus_access_log.ext_2
     */
    private String ext2;

    /**
     * Extended field
     * 表字段 : bus_access_log.ext_3
     */
    private String ext3;

    /**
     * Extended field
     * 表字段 : bus_access_log.ext_4
     */
    private String ext4;

    /**
     * 请求发起时间
     * 表字段 : bus_access_log.created_time
     */
    private Date createdTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId == null ? null : requestId.trim();
    }

    public String getRequestJson() {
        return requestJson;
    }

    public void setRequestJson(String requestJson) {
        this.requestJson = requestJson == null ? null : requestJson.trim();
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg == null ? null : errorMsg.trim();
    }

    public Short getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(Short requestStatus) {
        this.requestStatus = requestStatus;
    }

    public Short getRequestType() {
        return requestType;
    }

    public void setRequestType(Short requestType) {
        this.requestType = requestType;
    }

    public Short getSpendTime() {
        return spendTime;
    }

    public void setSpendTime(Short spendTime) {
        this.spendTime = spendTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getExt0() {
        return ext0;
    }

    public void setExt0(String ext0) {
        this.ext0 = ext0 == null ? null : ext0.trim();
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1 == null ? null : ext1.trim();
    }

    public String getExt2() {
        return ext2;
    }

    public void setExt2(String ext2) {
        this.ext2 = ext2 == null ? null : ext2.trim();
    }

    public String getExt3() {
        return ext3;
    }

    public void setExt3(String ext3) {
        this.ext3 = ext3 == null ? null : ext3.trim();
    }

    public String getExt4() {
        return ext4;
    }

    public void setExt4(String ext4) {
        this.ext4 = ext4 == null ? null : ext4.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
