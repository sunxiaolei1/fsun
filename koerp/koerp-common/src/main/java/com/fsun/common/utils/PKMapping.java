package com.fsun.common.utils;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;


/**
 * @ClassName: PKMapping
 * @Description:
 * @Author:Golden Zhang
 * @Date:2017-2-10
 * @Version:1.0.0
 */
public class PKMapping {

  public static int bus_access_log = 1001;
  public static int bus_bas_codes = 1002;
  public static int bus_bas_sku = 1003;
  public static int bus_customer = 1004;
  public static int bus_goods = 1005;
  public static int bus_inv_sku = 1006;
  public static int bus_inv_sku_details = 1007;
  public static int bus_order = 1009;
  public static int bus_pay_account = 1010;
  public static int bus_rul_price = 1011;
  public static int bus_rul_shop = 1012;
  public static int bus_rul_sku = 1013;
  public static int bus_shop = 1014;
  public static int bus_take_goods = 1015;
  public static int bus_vip = 1016;
  public static int bus_vip_unpaid = 1017;
  public static int doc_asn_details = 1018;
  public static int doc_asn_header = 1019;
  public static int doc_order_details = 1020;
  public static int doc_order_header = 1021;
  public static int doc_po_details = 1022;
  public static int doc_po_header = 1023;
 
  /**
   *
   */
  static SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
  static ThreadLocalRandom r=ThreadLocalRandom.current();
  final static String ZERO = "000000";
  static int size=0;
  static HashSet<String> set=new HashSet<String>();

  /**
   * @param code
   * @return
   * @throws
   * @Title: GUUID
   * @Description: 生成表的PK
   */

  public static String GUUID(int code) {
    if (code < 1) {
      return null;
    }

      int hashCodeV = UUID.randomUUID().toString().hashCode();

    

             if(hashCodeV < 0) {//负转正
                 hashCodeV = - hashCodeV;
             }
		    String subHashcodeV=ZERO+hashCodeV;
		    subHashcodeV=subHashcodeV.substring(subHashcodeV.length() - 6, subHashcodeV.length());
		    Date d = new Date();
		    String s = sdf.format(d);
		    //System.out.println(s + code + subHashcodeV);
		    set.add(s + code + subHashcodeV);
			    if(set.size()==size||set.size()%500000==0){//出现数据重复或者set容器达500000，时间加1毫秒，set清空
			    	long addS=Long.parseLong(s)+2;
			    	String newtest=String.valueOf(addS)+code+subHashcodeV;
			    	set.clear();
			    	//System.out.println("set内存已清空++++++++++++++++++++++++++++++++++++++++++++++++++++++"+set.size());
			    	set.add(newtest);
			    	size=set.size(); 
			    	return newtest;
			    }else{
			    	
			    	size=set.size(); 
			    }
		    //System.out.println("hashset的长度"+set.size());
        return s + code + subHashcodeV;
  }
}
