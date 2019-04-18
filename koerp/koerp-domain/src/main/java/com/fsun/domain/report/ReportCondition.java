package com.fsun.domain.report;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @ClassName: ReportCondition 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author fsun 
 * @date 2018年4月14日 上午8:56:23 
 *
 */
public class ReportCondition extends ReportBaseModel{
	
	/**
	 * 下单结束日期
	 */
	private String startDate;
	
	/**
	 * 下单开始日期
	 */
	private String endDate;

	/**
	 * 下单开始时间
	 */
	private String startTime;
		
	/**
	 * 下单结束时间
	 */
	private String endTime;
	
	/**
	 * 查询类型{
	 *     领用出库报表:sus
	 * }
	 *  
	 */
	private String queryType;

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
		if(isDate(startDate)){			
			this.startTime = (startDate + " 00:00:00");
		}
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
		if(isDate(endDate)){			
			this.endTime = (endDate + " 23:59:59");
		}
	}
	
	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	
	/**
     * 功能：判断字符串是否为日期格式(2018-04-09)
     * 
     * @param str
     * @return
     */
    public static boolean isDate(String strDate) {
    	if(strDate==null || strDate.length()!=10){
    		return false;
    	}
		Pattern pattern = Pattern.compile(
				"^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
		Matcher m = pattern.matcher(strDate);
		return m.matches();
    }
    
    /**
     * 
     * @Title: isYearAndMonth 
     * @Description: 判断字符串是否是年月格式(2018-04)
     * @param @param strDate
     * @param @return 
     * @return boolean
     */
    public static boolean isYearAndMonth(String strDate){
    	if(strDate==null || strDate.length()!=7){
    		return false;
    	}  	
    	Pattern pattern = Pattern.compile(
				"([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-((0[13578]|1[02])|(0[469]|11)|02)");
		Matcher m = pattern.matcher(strDate);
		return m.matches();
    }
	
    public static void main(String[] args) {
    	String str = "2018-03";
    	System.out.println(isDate(str));
    	System.out.println(isYearAndMonth(str));
	}
}
