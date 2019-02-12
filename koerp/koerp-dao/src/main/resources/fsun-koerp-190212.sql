/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : fsun-koerp

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-02-12 11:36:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_access_log
-- ----------------------------
DROP TABLE IF EXISTS `bus_access_log`;
CREATE TABLE `bus_access_log` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'id',
  `request_id` varchar(256) DEFAULT NULL COMMENT '请求流水号',
  `request_json` text COMMENT '请求参数',
  `error_msg` varchar(1024) DEFAULT NULL COMMENT '系统返回的异常信息',
  `request_status` smallint(6) DEFAULT NULL COMMENT '请求状态码',
  `request_type` smallint(6) DEFAULT NULL COMMENT '0、内部系统；1、外部接口',
  `spend_time` smallint(6) DEFAULT NULL COMMENT '接口耗时',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `ext_0` varchar(256) DEFAULT NULL COMMENT 'Extended field-交易类型',
  `ext_1` varchar(256) DEFAULT NULL COMMENT 'Extended field--操作人',
  `ext_2` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_3` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_4` varchar(256) DEFAULT NULL COMMENT 'Extended field--请求流水号是否是主键',
  `created_time` datetime DEFAULT NULL COMMENT '请求发起时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口访问日志';

-- ----------------------------
-- Records of bus_access_log
-- ----------------------------
INSERT INTO `bus_access_log` VALUES ('1902102250130761001347940', '2019021001100100002', '{\"currentUser\":{\"enabled\":true,\"id\":\"402882be46404313014640b7eb1c000f\",\"issys\":true,\"realname\":\"超级管理员\",\"shopCode\":\"1001\",\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"updateManId\":\"402882be46404313014640b7eb1c000f\",\"updateTime\":1417156209000,\"username\":\"super\"},\"details\":[{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-52°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"52°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1004\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-52°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1006\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"}],\"header\":{\"address\":\"\",\"buyerId\":\"VIP100086\",\"buyerName\":\"邹贺良\",\"carrierId\":\"\",\"carrierName\":\"\",\"cashId\":\"402882be46404313014640b7eb1c000f\",\"cashName\":\"超级管理员\",\"couponPrice\":40.00,\"dibPrice\":0.00,\"discountPrice\":0.00,\"isSettlemented\":true,\"memo\":\"\",\"mobile\":\"13645835318\",\"orderId\":\"2019021001100100002\",\"orderPrice\":216.00,\"orderType\":1,\"payPrice\":216.00,\"payType\":1,\"receiveName\":\"邹贺良\",\"receptPrice\":216.00,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"toZeroPrice\":0.00},\"orderId\":\"2019021001100100002\",\"payAccounts\":[{\"cardNo\":\"13645835318\",\"dibPrice\":0,\"discountAmount\":0,\"payMode\":7,\"payPrice\":216.00,\"receptPrice\":216.00}]}', null, '200', '0', '12', '0:0:0:0:0:0:0:1', '销售订单', null, null, null, null, '2019-02-10 22:50:00');
INSERT INTO `bus_access_log` VALUES ('1902102251405271001598651', '2019021001100100003', '{\"currentUser\":{\"enabled\":true,\"id\":\"402882be46404313014640b7eb1c000f\",\"issys\":true,\"realname\":\"超级管理员\",\"shopCode\":\"1001\",\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"updateManId\":\"402882be46404313014640b7eb1c000f\",\"updateTime\":1417156209000,\"username\":\"super\"},\"details\":[{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-42°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"42°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1001\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-52°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"52°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1002\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-42°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"42°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1003\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-52°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"52°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1004\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-42°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1005\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-52°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1006\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-42°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1007\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-52°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1008\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍酿8号-52°\",\"isGift\":false,\"marketPrice\":148,\"memo\":\"\",\"originSalePrice\":238,\"property\":\"52°\",\"qty\":1,\"salePrice\":208,\"sku\":\"1009\",\"totalPartPrice\":208,\"totalPrice\":208,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-42°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"42°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1010\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-52°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"52°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1011\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天合-42°\",\"isGift\":false,\"marketPrice\":158,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"42°\",\"qty\":1,\"salePrice\":248,\"sku\":\"1012\",\"totalPartPrice\":248,\"totalPrice\":248,\"unit\":\"20\"}],\"header\":{\"address\":\"\",\"buyerId\":\"VIP100086\",\"buyerName\":\"邹贺良\",\"carrierId\":\"\",\"carrierName\":\"\",\"cashId\":\"402882be46404313014640b7eb1c000f\",\"cashName\":\"超级管理员\",\"couponPrice\":306.00,\"dibPrice\":0.00,\"discountPrice\":0.00,\"isSettlemented\":true,\"memo\":\"\",\"mobile\":\"13645835318\",\"orderId\":\"2019021001100100003\",\"orderPrice\":1916.00,\"orderType\":1,\"payPrice\":1916.00,\"payType\":1,\"receiveName\":\"邹贺良\",\"receptPrice\":1916.00,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"toZeroPrice\":0.00},\"orderId\":\"2019021001100100003\",\"payAccounts\":[{\"cardNo\":\"\",\"dibPrice\":0,\"discountAmount\":0,\"payMode\":1,\"payPrice\":1916.00,\"receptPrice\":1916.00,\"tradeNo\":\"\"}]}', null, '200', '0', '5', '0:0:0:0:0:0:0:1', '销售订单', null, null, null, null, '2019-02-10 22:51:34');
INSERT INTO `bus_access_log` VALUES ('1902102317012601001851924', '2019021001100100004', '{\"currentUser\":{\"enabled\":true,\"id\":\"402882be46404313014640b7eb1c000f\",\"issys\":true,\"realname\":\"超级管理员\",\"shopCode\":\"1001\",\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"updateManId\":\"402882be46404313014640b7eb1c000f\",\"updateTime\":1417156209000,\"username\":\"super\"},\"details\":[{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-42°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"42°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1001\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-52°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"52°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1002\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-42°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"42°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1003\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-52°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"52°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1004\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-42°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1005\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-52°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1006\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-42°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1007\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-52°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1008\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍酿8号-52°\",\"isGift\":false,\"marketPrice\":148,\"memo\":\"\",\"originSalePrice\":238,\"property\":\"52°\",\"qty\":1,\"salePrice\":208,\"sku\":\"1009\",\"totalPartPrice\":208,\"totalPrice\":208,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-42°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"42°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1010\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-52°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"52°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1011\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天合-42°\",\"isGift\":false,\"marketPrice\":158,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"42°\",\"qty\":1,\"salePrice\":248,\"sku\":\"1012\",\"totalPartPrice\":248,\"totalPrice\":248,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天合-60°\",\"isGift\":false,\"marketPrice\":158,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"60°\",\"qty\":1,\"salePrice\":248,\"sku\":\"1013\",\"totalPartPrice\":248,\"totalPrice\":248,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天顺-46°\",\"isGift\":false,\"marketPrice\":268,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"46°\",\"qty\":1,\"salePrice\":348,\"sku\":\"1014\",\"totalPartPrice\":348,\"totalPrice\":348,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天顺-60°\",\"isGift\":false,\"marketPrice\":268,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"60°\",\"qty\":1,\"salePrice\":348,\"sku\":\"1015\",\"totalPartPrice\":348,\"totalPrice\":348,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":70,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康特调VIP品鉴酒-46°\",\"isGift\":false,\"marketPrice\":138,\"memo\":\"\",\"originSalePrice\":268,\"property\":\"46°\",\"qty\":1,\"salePrice\":198,\"sku\":\"1016\",\"totalPartPrice\":198,\"totalPrice\":198,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康特酿-38°\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":178,\"property\":\"38°\",\"qty\":1,\"salePrice\":128,\"sku\":\"1017\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏1973-38°\",\"isGift\":false,\"marketPrice\":228,\"memo\":\"\",\"originSalePrice\":328,\"property\":\"38°\",\"qty\":1,\"salePrice\":298,\"sku\":\"1018\",\"totalPartPrice\":298,\"totalPrice\":298,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康贵宾-41.8°\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1019\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康贵宾-50.8°\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"50.8°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1020\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年品鉴-41.8°\",\"isGift\":false,\"marketPrice\":156,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":268,\"sku\":\"1021\",\"totalPartPrice\":268,\"totalPrice\":268,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年-41.8°\",\"isGift\":false,\"marketPrice\":166,\"memo\":\"\",\"originSalePrice\":318,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":288,\"sku\":\"1022\",\"totalPartPrice\":288,\"totalPrice\":288,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年-50.8°\",\"isGift\":false,\"marketPrice\":166,\"memo\":\"\",\"originSalePrice\":318,\"property\":\"50.8°\",\"qty\":1,\"salePrice\":288,\"sku\":\"1023\",\"totalPartPrice\":288,\"totalPrice\":288,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏年份小酒-52°\",\"isGift\":false,\"marketPrice\":36,\"memo\":\"\",\"originSalePrice\":68,\"property\":\"52°\",\"qty\":1,\"salePrice\":48,\"sku\":\"1024\",\"totalPartPrice\":48,\"totalPrice\":48,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":220,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"南湖壹号\",\"isGift\":false,\"marketPrice\":288,\"memo\":\"\",\"originSalePrice\":618,\"property\":\"--\",\"qty\":1,\"salePrice\":398,\"sku\":\"1901\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒(木盒2支装)\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":580,\"property\":\"木盒2支装\",\"qty\":1,\"salePrice\":380,\"sku\":\"1903\",\"totalPartPrice\":380,\"totalPrice\":380,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒(皮盒2支装)\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":780,\"property\":\"皮盒2支装\",\"qty\":1,\"salePrice\":580,\"sku\":\"1904\",\"totalPartPrice\":580,\"totalPrice\":580,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"100\",\"categoryName\":\"辅料\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"精品皮盒\",\"isGift\":false,\"marketPrice\":35,\"memo\":\"\",\"originSalePrice\":50,\"property\":\"--\",\"qty\":1,\"salePrice\":40,\"sku\":\"1905\",\"totalPartPrice\":40,\"totalPrice\":40,\"unit\":\"10\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":68,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":213,\"property\":\"单支\",\"qty\":1,\"salePrice\":145,\"sku\":\"1906\",\"totalPartPrice\":145,\"totalPrice\":145,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"100\",\"categoryName\":\"辅料\",\"costPrice\":0,\"couponPrice\":-8,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒6支装木盒\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":2,\"property\":\"盒子\",\"qty\":1,\"salePrice\":10,\"sku\":\"1907\",\"totalPartPrice\":10,\"totalPrice\":10,\"unit\":\"10\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":70,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克金章318干红\",\"isGift\":false,\"marketPrice\":106,\"memo\":\"\",\"originSalePrice\":248,\"property\":\"--\",\"qty\":1,\"salePrice\":178,\"sku\":\"2001\",\"totalPartPrice\":178,\"totalPrice\":178,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克金章708干红\",\"isGift\":false,\"marketPrice\":86,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"--\",\"qty\":1,\"salePrice\":128,\"sku\":\"2002\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克金章干白\",\"isGift\":false,\"marketPrice\":60,\"memo\":\"\",\"originSalePrice\":158,\"property\":\"--\",\"qty\":1,\"salePrice\":108,\"sku\":\"2003\",\"totalPartPrice\":108,\"totalPrice\":108,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":260,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族红干红\",\"isGift\":false,\"marketPrice\":258,\"memo\":\"\",\"originSalePrice\":658,\"property\":\"--\",\"qty\":1,\"salePrice\":398,\"sku\":\"2004\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":140,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族金干红\",\"isGift\":false,\"marketPrice\":136,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"--\",\"qty\":1,\"salePrice\":258,\"sku\":\"2005\",\"totalPartPrice\":258,\"totalPrice\":258,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":90,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族银干红\",\"isGift\":false,\"marketPrice\":116,\"memo\":\"\",\"originSalePrice\":298,\"property\":\"--\",\"qty\":1,\"salePrice\":208,\"sku\":\"2006\",\"totalPartPrice\":208,\"totalPrice\":208,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克风车干红\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":118,\"property\":\"--\",\"qty\":1,\"salePrice\":78,\"sku\":\"2007\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克赤霞珠干红\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"--\",\"qty\":1,\"salePrice\":58,\"sku\":\"2008\",\"totalPartPrice\":58,\"totalPrice\":58,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红(3L装)2016\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":598,\"property\":\"(3L装)2016\",\"qty\":1,\"salePrice\":398,\"sku\":\"2010\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红(3L装)2015\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":798,\"property\":\"(3L装)2015\",\"qty\":1,\"salePrice\":598,\"sku\":\"2011\",\"totalPartPrice\":598,\"totalPrice\":598,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":48,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克男爵干红(红标)\",\"isGift\":false,\"marketPrice\":34,\"memo\":\"\",\"originSalePrice\":118,\"property\":\"红标\",\"qty\":1,\"salePrice\":70,\"sku\":\"2014\",\"totalPartPrice\":70,\"totalPrice\":70,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克红标小教堂\",\"isGift\":false,\"marketPrice\":32,\"memo\":\"\",\"originSalePrice\":108,\"property\":\"--\",\"qty\":1,\"salePrice\":68,\"sku\":\"2016\",\"totalPartPrice\":68,\"totalPrice\":68,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":70,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克康萨城堡干红\",\"isGift\":false,\"marketPrice\":98,\"memo\":\"\",\"originSalePrice\":238,\"property\":\"--\",\"qty\":1,\"salePrice\":168,\"sku\":\"2017\",\"totalPartPrice\":168,\"totalPrice\":168,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克酒庄干红\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":128,\"property\":\"--\",\"qty\":1,\"salePrice\":88,\"sku\":\"2018\",\"totalPartPrice\":88,\"totalPrice\":88,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克波尔多干红\",\"isGift\":false,\"marketPrice\":38,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"--\",\"qty\":1,\"salePrice\":58,\"sku\":\"2019\",\"totalPartPrice\":58,\"totalPrice\":58,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红\",\"isGift\":false,\"marketPrice\":70,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"--\",\"qty\":1,\"salePrice\":128,\"sku\":\"2020\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":400,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克尚宝龙城堡\",\"isGift\":false,\"marketPrice\":225,\"memo\":\"\",\"originSalePrice\":980,\"property\":\"--\",\"qty\":1,\"salePrice\":580,\"sku\":\"2021\",\"totalPartPrice\":580,\"totalPrice\":580,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":60,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克传奇2015干红\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":198,\"property\":\"--\",\"qty\":1,\"salePrice\":138,\"sku\":\"2022\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"}],\"header\":{\"address\":\"\",\"buyerId\":\"VIP100086\",\"buyerName\":\"邹贺良\",\"carrierId\":\"\",\"carrierName\":\"\",\"cashId\":\"402882be46404313014640b7eb1c000f\",\"cashName\":\"超级管理员\",\"couponPrice\":3294.00,\"dibPrice\":0.00,\"discountPrice\":0.00,\"isSettlemented\":true,\"memo\":\"\",\"mobile\":\"13645835318\",\"orderId\":\"2019021001100100004\",\"orderPrice\":9793.00,\"orderType\":1,\"payPrice\":9793.00,\"payType\":1,\"receiveName\":\"邹贺良\",\"receptPrice\":9793.00,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"toZeroPrice\":0.00},\"orderId\":\"2019021001100100004\",\"payAccounts\":[{\"cardNo\":\"\",\"dibPrice\":0,\"discountAmount\":0,\"payMode\":3,\"payPrice\":9793.00,\"receptPrice\":9793.00,\"tradeNo\":\"\"}]}', null, '200', '0', '1', '0:0:0:0:0:0:0:1', '销售订单', null, null, null, null, '2019-02-10 23:17:00');
INSERT INTO `bus_access_log` VALUES ('1902102335355121001386185', '10011902102335353531017445004', '{\"details\":[{\"customerCode\":\"VIP100086\",\"giftPrice\":100,\"memo\":\"\",\"payMode\":2,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"tradePrice\":1000,\"tradeType\":2},{\"cardNo\":\"13645835318\",\"customerCode\":\"VIP100086\",\"giftPrice\":0,\"memo\":\"\",\"payMode\":2,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"tradePrice\":0,\"tradeType\":4}],\"header\":{\"cardNo\":\"13645835318\",\"customerCode\":\"VIP100086\",\"customerName\":\"邹贺良\",\"giftPrice\":100,\"payMode\":2,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"tradePrice\":1000}}', null, '200', '0', '0', '0:0:0:0:0:0:0:1', '挂账充值交易记录', null, null, null, null, '2019-02-10 23:35:35');
INSERT INTO `bus_access_log` VALUES ('1902102339291861001984480', '2019021001100100005', '{\"currentUser\":{\"enabled\":true,\"id\":\"402882be46404313014640b7eb1c000f\",\"issys\":true,\"realname\":\"超级管理员\",\"shopCode\":\"1001\",\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"updateManId\":\"402882be46404313014640b7eb1c000f\",\"updateTime\":1417156209000,\"username\":\"super\"},\"details\":[{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-42°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"42°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1001\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":18,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏15号-52°\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":56,\"property\":\"52°\",\"qty\":1,\"salePrice\":38,\"sku\":\"1002\",\"totalPartPrice\":38,\"totalPrice\":38,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-42°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"42°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1003\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏2号-52°\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":88,\"property\":\"52°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1004\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-42°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1005\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏5号-52°\",\"isGift\":false,\"marketPrice\":88,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":138,\"sku\":\"1006\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-42°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"42°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1007\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏6号-52°\",\"isGift\":false,\"marketPrice\":108,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"52°\",\"qty\":1,\"salePrice\":148,\"sku\":\"1008\",\"totalPartPrice\":148,\"totalPrice\":148,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍酿8号-52°\",\"isGift\":false,\"marketPrice\":148,\"memo\":\"\",\"originSalePrice\":238,\"property\":\"52°\",\"qty\":1,\"salePrice\":208,\"sku\":\"1009\",\"totalPartPrice\":208,\"totalPrice\":208,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-42°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"42°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1010\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆8号-52°\",\"isGift\":false,\"marketPrice\":168,\"memo\":\"\",\"originSalePrice\":368,\"property\":\"52°\",\"qty\":1,\"salePrice\":328,\"sku\":\"1011\",\"totalPartPrice\":328,\"totalPrice\":328,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天合-42°\",\"isGift\":false,\"marketPrice\":158,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"42°\",\"qty\":1,\"salePrice\":248,\"sku\":\"1012\",\"totalPartPrice\":248,\"totalPrice\":248,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天合-60°\",\"isGift\":false,\"marketPrice\":158,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"60°\",\"qty\":1,\"salePrice\":248,\"sku\":\"1013\",\"totalPartPrice\":248,\"totalPrice\":248,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天顺-46°\",\"isGift\":false,\"marketPrice\":268,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"46°\",\"qty\":1,\"salePrice\":348,\"sku\":\"1014\",\"totalPartPrice\":348,\"totalPrice\":348,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏原浆天顺-60°\",\"isGift\":false,\"marketPrice\":268,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"60°\",\"qty\":1,\"salePrice\":348,\"sku\":\"1015\",\"totalPartPrice\":348,\"totalPrice\":348,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":70,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康特调VIP品鉴酒-46°\",\"isGift\":false,\"marketPrice\":138,\"memo\":\"\",\"originSalePrice\":268,\"property\":\"46°\",\"qty\":1,\"salePrice\":198,\"sku\":\"1016\",\"totalPartPrice\":198,\"totalPrice\":198,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康特酿-38°\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":178,\"property\":\"38°\",\"qty\":1,\"salePrice\":128,\"sku\":\"1017\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏1973-38°\",\"isGift\":false,\"marketPrice\":228,\"memo\":\"\",\"originSalePrice\":328,\"property\":\"38°\",\"qty\":1,\"salePrice\":298,\"sku\":\"1018\",\"totalPartPrice\":298,\"totalPrice\":298,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康贵宾-41.8°\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1019\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康贵宾-50.8°\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"50.8°\",\"qty\":1,\"salePrice\":78,\"sku\":\"1020\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年品鉴-41.8°\",\"isGift\":false,\"marketPrice\":156,\"memo\":\"\",\"originSalePrice\":288,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":268,\"sku\":\"1021\",\"totalPartPrice\":268,\"totalPrice\":268,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年-41.8°\",\"isGift\":false,\"marketPrice\":166,\"memo\":\"\",\"originSalePrice\":318,\"property\":\"41.8°\",\"qty\":1,\"salePrice\":288,\"sku\":\"1022\",\"totalPartPrice\":288,\"totalPrice\":288,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":30,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"中华杜康10年-50.8°\",\"isGift\":false,\"marketPrice\":166,\"memo\":\"\",\"originSalePrice\":318,\"property\":\"50.8°\",\"qty\":1,\"salePrice\":288,\"sku\":\"1023\",\"totalPartPrice\":288,\"totalPrice\":288,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"10\",\"brandName\":\"杜康\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":20,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"杜康珍藏年份小酒-52°\",\"isGift\":false,\"marketPrice\":36,\"memo\":\"\",\"originSalePrice\":68,\"property\":\"52°\",\"qty\":1,\"salePrice\":48,\"sku\":\"1024\",\"totalPartPrice\":48,\"totalPrice\":48,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"10\",\"categoryName\":\"白酒\",\"costPrice\":0,\"couponPrice\":220,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"南湖壹号\",\"isGift\":false,\"marketPrice\":288,\"memo\":\"\",\"originSalePrice\":618,\"property\":\"--\",\"qty\":1,\"salePrice\":398,\"sku\":\"1901\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒(木盒2支装)\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":580,\"property\":\"木盒2支装\",\"qty\":1,\"salePrice\":380,\"sku\":\"1903\",\"totalPartPrice\":380,\"totalPrice\":380,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"冰酒(皮盒2支装)\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":780,\"property\":\"皮盒2支装\",\"qty\":1,\"salePrice\":580,\"sku\":\"1904\",\"totalPartPrice\":580,\"totalPrice\":580,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"99\",\"brandName\":\"--\",\"categoryCode\":\"100\",\"categoryName\":\"辅料\",\"costPrice\":0,\"couponPrice\":10,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"精品皮盒\",\"isGift\":false,\"marketPrice\":35,\"memo\":\"\",\"originSalePrice\":50,\"property\":\"--\",\"qty\":1,\"salePrice\":40,\"sku\":\"1905\",\"totalPartPrice\":40,\"totalPrice\":40,\"unit\":\"10\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克金章708干红\",\"isGift\":false,\"marketPrice\":86,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"--\",\"qty\":1,\"salePrice\":128,\"sku\":\"2002\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":50,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克金章干白\",\"isGift\":false,\"marketPrice\":60,\"memo\":\"\",\"originSalePrice\":158,\"property\":\"--\",\"qty\":1,\"salePrice\":108,\"sku\":\"2003\",\"totalPartPrice\":108,\"totalPrice\":108,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":260,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族红干红\",\"isGift\":false,\"marketPrice\":258,\"memo\":\"\",\"originSalePrice\":658,\"property\":\"--\",\"qty\":1,\"salePrice\":398,\"sku\":\"2004\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":140,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族金干红\",\"isGift\":false,\"marketPrice\":136,\"memo\":\"\",\"originSalePrice\":398,\"property\":\"--\",\"qty\":1,\"salePrice\":258,\"sku\":\"2005\",\"totalPartPrice\":258,\"totalPrice\":258,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":90,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克贵族银干红\",\"isGift\":false,\"marketPrice\":116,\"memo\":\"\",\"originSalePrice\":298,\"property\":\"--\",\"qty\":1,\"salePrice\":208,\"sku\":\"2006\",\"totalPartPrice\":208,\"totalPrice\":208,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克风车干红\",\"isGift\":false,\"marketPrice\":46,\"memo\":\"\",\"originSalePrice\":118,\"property\":\"--\",\"qty\":1,\"salePrice\":78,\"sku\":\"2007\",\"totalPartPrice\":78,\"totalPrice\":78,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克赤霞珠干红\",\"isGift\":false,\"marketPrice\":28,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"--\",\"qty\":1,\"salePrice\":58,\"sku\":\"2008\",\"totalPartPrice\":58,\"totalPrice\":58,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红(3L装)2016\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":598,\"property\":\"(3L装)2016\",\"qty\":1,\"salePrice\":398,\"sku\":\"2010\",\"totalPartPrice\":398,\"totalPrice\":398,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":200,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红(3L装)2015\",\"isGift\":false,\"marketPrice\":0,\"memo\":\"\",\"originSalePrice\":798,\"property\":\"(3L装)2015\",\"qty\":1,\"salePrice\":598,\"sku\":\"2011\",\"totalPartPrice\":598,\"totalPrice\":598,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":48,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克男爵干红(红标)\",\"isGift\":false,\"marketPrice\":34,\"memo\":\"\",\"originSalePrice\":118,\"property\":\"红标\",\"qty\":1,\"salePrice\":70,\"sku\":\"2014\",\"totalPartPrice\":70,\"totalPrice\":70,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克红标小教堂\",\"isGift\":false,\"marketPrice\":32,\"memo\":\"\",\"originSalePrice\":108,\"property\":\"--\",\"qty\":1,\"salePrice\":68,\"sku\":\"2016\",\"totalPartPrice\":68,\"totalPrice\":68,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":70,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克康萨城堡干红\",\"isGift\":false,\"marketPrice\":98,\"memo\":\"\",\"originSalePrice\":238,\"property\":\"--\",\"qty\":1,\"salePrice\":168,\"sku\":\"2017\",\"totalPartPrice\":168,\"totalPrice\":168,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克酒庄干红\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":128,\"property\":\"--\",\"qty\":1,\"salePrice\":88,\"sku\":\"2018\",\"totalPartPrice\":88,\"totalPrice\":88,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克波尔多干红\",\"isGift\":false,\"marketPrice\":38,\"memo\":\"\",\"originSalePrice\":98,\"property\":\"--\",\"qty\":1,\"salePrice\":58,\"sku\":\"2019\",\"totalPartPrice\":58,\"totalPrice\":58,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":40,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克城堡干红\",\"isGift\":false,\"marketPrice\":70,\"memo\":\"\",\"originSalePrice\":168,\"property\":\"--\",\"qty\":1,\"salePrice\":128,\"sku\":\"2020\",\"totalPartPrice\":128,\"totalPrice\":128,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":400,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克尚宝龙城堡\",\"isGift\":false,\"marketPrice\":225,\"memo\":\"\",\"originSalePrice\":980,\"property\":\"--\",\"qty\":1,\"salePrice\":580,\"sku\":\"2021\",\"totalPartPrice\":580,\"totalPrice\":580,\"unit\":\"20\"},{\"barCode\":\"\",\"brandCode\":\"20\",\"brandName\":\"科乐克\",\"categoryCode\":\"20\",\"categoryName\":\"葡萄酒\",\"costPrice\":0,\"couponPrice\":60,\"giftCount\":0,\"giftPrice\":0,\"goodsName\":\"科乐克传奇2015干红\",\"isGift\":false,\"marketPrice\":48,\"memo\":\"\",\"originSalePrice\":198,\"property\":\"--\",\"qty\":1,\"salePrice\":138,\"sku\":\"2022\",\"totalPartPrice\":138,\"totalPrice\":138,\"unit\":\"20\"}],\"header\":{\"address\":\"\",\"buyerId\":\"VIP100086\",\"buyerName\":\"邹贺良\",\"carrierId\":\"\",\"carrierName\":\"\",\"cashId\":\"402882be46404313014640b7eb1c000f\",\"cashName\":\"超级管理员\",\"couponPrice\":3164.00,\"dibPrice\":0.00,\"discountPrice\":0.00,\"isSettlemented\":true,\"memo\":\"\",\"mobile\":\"13645835318\",\"orderId\":\"2019021001100100005\",\"orderPrice\":9460.00,\"orderType\":1,\"payPrice\":9460.00,\"payType\":1,\"receiveName\":\"邹贺良\",\"receptPrice\":9460.00,\"shopId\":\"1812091925576891014843595\",\"shopName\":\"沈荡店仓\",\"toZeroPrice\":0.00},\"orderId\":\"2019021001100100005\",\"payAccounts\":[{\"cardNo\":\"\",\"dibPrice\":0,\"discountAmount\":0,\"payMode\":1,\"payPrice\":9460.00,\"receptPrice\":9460.00,\"tradeNo\":\"\"}]}', null, '200', '0', '87', '0:0:0:0:0:0:0:1', '销售订单', null, null, null, null, '2019-02-10 23:38:01');

-- ----------------------------
-- Table structure for bus_bas_codes
-- ----------------------------
DROP TABLE IF EXISTS `bus_bas_codes`;
CREATE TABLE `bus_bas_codes` (
  `code_id` varchar(32) NOT NULL COMMENT '代码id',
  `code_type` varchar(32) DEFAULT NULL COMMENT '代码类别 字段名 temp_id',
  `code_code` varchar(32) DEFAULT NULL COMMENT '代码',
  `code_name` varchar(32) DEFAULT NULL COMMENT '名称 ',
  `sort_code` int(11) DEFAULT '999999' COMMENT '排序号',
  `user_define1` varchar(32) DEFAULT NULL COMMENT '自定义1',
  `user_define2` varchar(256) DEFAULT NULL COMMENT '自定义2',
  `user_define3` varchar(512) DEFAULT NULL COMMENT '自定义3',
  `created_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updated_name` varchar(32) DEFAULT NULL COMMENT '更新人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据字典';

-- ----------------------------
-- Records of bus_bas_codes
-- ----------------------------
INSERT INTO `bus_bas_codes` VALUES ('062380926FCF412F9F1D4ED193A96DA7', 'BusCustomerType', 'VIP', 'VIP会员', '2', '客户类型', '', '', 'super', null, '2018-12-02 22:37:08', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072056156751002374180', 'CategoryCode', '10', '白酒', '1', '商品分类', '0', '', 'super', null, '2018-12-07 20:56:15', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072056347771002567905', 'CategoryCode', '20', '葡萄酒', '3', '商品分类', '0', '', 'super', 'super', '2018-12-07 20:56:34', '2019-01-15 01:14:31');
INSERT INTO `bus_bas_codes` VALUES ('1812072056544911002451407', 'CategoryCode', '30', '啤酒', '5', '商品分类', '0', '', 'super', null, '2018-12-07 20:56:54', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072057391891002884556', 'CategoryCode', '110', '香烟', '100', '商品分类', '0', '', 'super', null, '2018-12-07 20:57:39', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072058133821002701653', 'CategoryCode', '40', '饮料', '7', '商品分类', '0', '', 'super', null, '2018-12-07 20:58:13', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072101147361002240555', 'BrandCode', '10', '杜康', '10', '品牌名称', '', '', 'super', null, '2018-12-07 21:01:14', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072102092351002701370', 'BrandCode', '20', '科乐克', '20', '品牌名称', '', '', 'super', null, '2018-12-07 21:02:09', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072103537261002598960', 'UnitCode', '10', '个', '10', '单位', '', '', 'super', 'super', '2018-12-07 21:03:53', '2018-12-07 21:07:22');
INSERT INTO `bus_bas_codes` VALUES ('1812072104428921002933473', 'UnitCode', '20', '瓶', '20', '单位', '', '', 'super', null, '2018-12-07 21:04:42', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072105013181002583376', 'UnitCode', '30', '只', '30', '单位', '', '', 'super', null, '2018-12-07 21:05:01', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072109588221002526860', 'ProductType', '0', '单品', '10', '商品类型', '', '', 'super', 'super', '2018-12-07 21:09:58', '2018-12-07 21:45:22');
INSERT INTO `bus_bas_codes` VALUES ('1812072110463181002907186', 'ProductType', '1', '套餐', '20', '商品类型', '', '', 'super', 'super', '2018-12-07 21:10:46', '2018-12-07 21:45:32');
INSERT INTO `bus_bas_codes` VALUES ('1812140207531181002944309', 'RackNo', '1', '1号', '1', '机架号', '', '', 'super', 'super', '2018-12-14 02:07:53', '2018-12-14 02:09:38');
INSERT INTO `bus_bas_codes` VALUES ('1812140208225621002642242', 'RackNo', '2', '2号', '2', '机架号', '', '', 'super', 'super', '2018-12-14 02:08:22', '2018-12-14 02:09:32');
INSERT INTO `bus_bas_codes` VALUES ('1812140208427551002641478', 'RackNo', '3', '3号', '3', '机架号', '', '', 'super', null, '2018-12-14 02:08:42', null);
INSERT INTO `bus_bas_codes` VALUES ('1812140209075041002322094', 'RackNo', '4', '4号', '4', '机架号', '', '', 'super', null, '2018-12-14 02:09:07', null);
INSERT INTO `bus_bas_codes` VALUES ('1812140209239011002070377', 'RackNo', '5', '5号', '5', '机架号', '', '', 'super', null, '2018-12-14 02:09:23', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141242050921002227960', 'OrderType', '1', '销售出库单', '1', '单据类型', '', '', 'super', null, '2018-12-14 12:42:05', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141243067211002598870', 'OrderType', '2', '销售寄存单', '3', '单据类型', '', '', 'super', null, '2018-12-14 12:43:06', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141246206201002709090', 'PayMode', '1', '银行卡', '1', '支付方式', '', '', 'super', 'super', '2018-12-14 12:46:20', '2018-12-14 12:49:08');
INSERT INTO `bus_bas_codes` VALUES ('1812141248583661002360596', 'PayMode', '2', '现金', '3', '支付方式', '', '', 'super', null, '2018-12-14 12:48:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141249302601002553054', 'PayMode', '3', '支付宝', '5', '支付方式', '', '', 'super', null, '2018-12-14 12:49:30', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141250021541002914825', 'PayMode', '4', '微信', '7', '支付方式', '', '', 'super', null, '2018-12-14 12:50:02', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141250265351002697501', 'PayMode', '6', '挂账', '9', '支付方式', '', '', 'super', 'super', '2018-12-14 12:50:26', '2019-01-19 00:14:55');
INSERT INTO `bus_bas_codes` VALUES ('1812141250585371002694195', 'PayMode', '7', '会员卡', '11', '支付方式', '', '', 'super', null, '2018-12-14 12:50:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141251226411002686734', 'PayMode', '100', '商家优惠', '13', '支付方式', '', '', 'super', 'super', '2018-12-14 12:51:22', '2019-01-07 00:32:04');
INSERT INTO `bus_bas_codes` VALUES ('1812141251459491002636306', 'PayMode', '900', '抹零', '15', '支付方式', '', '', 'super', null, '2018-12-14 12:51:45', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141304213621002791331', 'OrderStatus', '0', '未确认', '1', '订单状态', '', '', 'super', null, '2018-12-14 13:04:21', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141304589231002049382', 'OrderStatus', '1', '已确认', '3', '订单状态', '', '', 'super', null, '2018-12-14 13:04:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141305396321002278444', 'OrderStatus', '2', '已接配送', '5', '订单状态', '', '', 'super', null, '2018-12-14 13:05:39', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141306077591002415640', 'OrderStatus', '3', '已取货', '7', '订单状态', '', '', 'super', null, '2018-12-14 13:06:07', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141306466281002092335', 'OrderStatus', '4', '已配送成功', '9', '订单状态', '', '', 'super', null, '2018-12-14 13:06:46', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141307166751002373362', 'OrderStatus', '5', '已完结', '11', '订单状态', '', '', 'super', null, '2018-12-14 13:07:16', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141307523301002921649', 'OrderStatus', '6', '已取消', '13', '订单状态', '', '', 'super', null, '2018-12-14 13:07:52', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141308444061002199689', 'TradeStatus', '00', '已下单', '1', '交易状态', '', '', 'super', null, '2018-12-14 13:08:44', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141309208251002740722', 'TradeStatus', '10', '已付款', '3', '交易状态', '', '', 'super', null, '2018-12-14 13:09:20', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141309493831002613169', 'TradeStatus', '20', '已发货', '5', '交易状态', '', '', 'super', null, '2018-12-14 13:09:49', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141310195601002924355', 'TradeStatus', '30', '交易成功', '7', '交易状态', '', '', 'super', null, '2018-12-14 13:10:19', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141310407351002935683', 'TradeStatus', '40', '订单取消', '9', '交易状态', '', '', 'super', null, '2018-12-14 13:10:40', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141311134801002230197', 'TradeStatus', '60', '交易关闭', '11', '交易状态', '', '', 'super', null, '2018-12-14 13:11:13', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141619559781002320289', 'FlowStatus', '00', '创建完成', '1', '流转状态', '', '', 'super', null, '2018-12-14 16:19:55', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141620446761002472629', 'FlowStatus', '30', '已出库', '3', '流转状态', '', '', 'super', null, '2018-12-14 16:20:44', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141621346271002495761', 'FlowStatus', '40', '交易完成', '5', '流转状态', '', '', 'super', null, '2018-12-14 16:21:34', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141622061821002669432', 'FlowStatus', '99', '已回传', '7', '流转状态', '', '', 'super', null, '2018-12-14 16:22:06', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141628399041002906171', 'TradeFrom', 'pc', 'PC端', '1', '交易来源', '', '', 'super', null, '2018-12-14 16:28:39', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141629147651002015060', 'TradeFrom', 'app', '客户端', '3', '交易来源', '', '', 'super', null, '2018-12-14 16:29:14', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160030076821002232983', 'TradeType', '1', '挂账消费', '1', '交易类型', '', '', 'super', 'super', '2018-12-16 00:30:07', '2018-12-16 00:32:03');
INSERT INTO `bus_bas_codes` VALUES ('1812160031582811002302500', 'TradeType', '2', '挂账结款', '3', '交易类型', '', '', 'super', null, '2018-12-16 00:31:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160032283971002991944', 'TradeType', '3', '会员卡消费', '5', '交易类型', '', '', 'super', null, '2018-12-16 00:32:28', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160032547291002952251', 'TradeType', '4', '会员卡充值', '7', '交易类型', '', '', 'super', null, '2018-12-16 00:32:54', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160039020941002383344', 'DocAsnStatus', 'A00', '待签收', '1', '入库单状态', '', '', 'super', null, '2018-12-16 00:39:02', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160039434241002035318', 'DocAsnStatus', 'A10', '部分收货', '3', '入库单状态', '', '', 'super', 'super', '2018-12-16 00:39:43', '2018-12-16 00:40:30');
INSERT INTO `bus_bas_codes` VALUES ('1812160040240421002031401', 'DocAsnStatus', 'A20', '完全收货', '5', '入库单状态', '', '', 'super', null, '2018-12-16 00:40:24', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160040577701002051278', 'DocAsnStatus', 'A30', '收货完成', '7', '入库单状态', '', '', 'super', null, '2018-12-16 00:40:57', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160041313261002624266', 'DocAsnStatus', 'A90', '收货取消', '11', '入库单状态', '', '', 'super', null, '2018-12-16 00:41:31', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160042027481002648139', 'DocAsnStatus', 'A91', '拒绝收货', '13', '入库单状态', '', '', 'super', null, '2018-12-16 00:42:02', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160042298021002833764', 'DocAsnType', '21', '调拨入库', '1', '入库单类型', '', '', 'super', null, '2018-12-16 00:42:29', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160043034821002698043', 'DocAsnType', '22', '盘盈入库', '3', '入库单类型', '', '', 'super', null, '2018-12-16 00:43:03', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160043239741002502366', 'DocAsnType', '23', '采购入库', '5', '入库单类型', '', '', 'super', null, '2018-12-16 00:43:23', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160043433211002284925', 'DocAsnType', '24', '销退入库', '7', '入库单类型', '', '', 'super', null, '2018-12-16 00:43:43', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160044060761002140752', 'DocAsnType', '25', '杂收入库', '9', '入库单类型', '', '', 'super', null, '2018-12-16 00:44:06', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160044430731002271858', 'DocOrderMode', '10', '样品', '1', '领用出库事由', '', '', 'super', null, '2018-12-16 00:44:43', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160045104161002569026', 'DocOrderMode', '20', '品鉴', '3', '领用出库事由', '', '', 'super', null, '2018-12-16 00:45:10', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160045272351002716481', 'DocOrderMode', '30', '试饮', '5', '领用出库事由', '', '', 'super', null, '2018-12-16 00:45:27', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160045476681002912054', 'DocOrderMode', '40', '赠送', '7', '领用出库事由', '', '', 'super', null, '2018-12-16 00:45:47', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160046071431002799801', 'DocOrderMode', '50', '礼品', '9', '领用出库事由', '', '', 'super', null, '2018-12-16 00:46:07', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160046251431002295628', 'DocOrderMode', '60', '其他', '11', '领用出库事由', '', '', 'super', null, '2018-12-16 00:46:25', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160046530601002859340', 'DocOrderStatus', 'B00', '出库待审核', '1', '出库单状态', '', '', 'super', null, '2018-12-16 00:46:53', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160047271601002290241', 'DocOrderStatus', 'B10', '出库审核完成', '3', '出库单状态', '', '', 'super', null, '2018-12-16 00:47:27', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160047471331002843828', 'DocOrderStatus', 'B20', '订单出库', '5', '出库单状态', '', '', 'super', null, '2018-12-16 00:47:47', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160048106431002973097', 'DocOrderStatus', 'B30', '出库单完成', '7', '出库单状态', '', '', 'super', 'super', '2018-12-16 00:48:10', '2018-12-16 00:58:15');
INSERT INTO `bus_bas_codes` VALUES ('1812160048330411002904621', 'DocOrderStatus', 'B90', '出库取消', '9', '出库单状态', '', '', 'super', 'super', '2018-12-16 00:48:33', '2018-12-16 00:58:22');
INSERT INTO `bus_bas_codes` VALUES ('1812160049054031002420442', 'DocOrderType', '11', '调拨出库', '1', '出库单类型', '', '', 'super', null, '2018-12-16 00:49:05', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160049202601002320591', 'DocOrderType', '12', '盘亏出库', '3', '出库单类型', '', '', 'super', null, '2018-12-16 00:49:20', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160049522261002478765', 'DocOrderType', '13', '采购退货', '5', '出库单类型', '', '', 'super', null, '2018-12-16 00:49:52', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160050130841002836866', 'DocOrderType', '15', '报损出库', '7', '出库单类型', '', '', 'super', null, '2018-12-16 00:50:13', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160050314091002190161', 'DocOrderType', '16', '领用出库', '9', '出库单类型', '', '', 'super', null, '2018-12-16 00:50:31', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160051016311002104476', 'DocPoStatus', '00', '待审核', '1', '要货单状态', '', '', 'super', null, '2018-12-16 00:51:01', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160051326861002861950', 'DocPoStatus', '10', '审核通过', '3', '要货单状态', '', '', 'super', null, '2018-12-16 00:51:32', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160051500841002561463', 'DocPoStatus', '20', '审核拒绝', '5', '要货单状态', '', '', 'super', null, '2018-12-16 00:51:50', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160052091751002391587', 'DocPoStatus', '90', '订单取消', '7', '要货单状态', '', '', 'super', null, '2018-12-16 00:52:09', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160052403021002262926', 'DocPoType', '10', '采购申请', '1', '要货单类型', '', '', 'super', null, '2018-12-16 00:52:40', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160053110201002606393', 'DocPoType', '20', '调拨申请', '3', '要货单类型', '', '', 'super', null, '2018-12-16 00:53:11', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160053378641002344215', 'DocTradeStatus', 'A00', '待签收', '1', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:53:37', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160054011291002818110', 'DocTradeStatus', 'A10', '部分收货', '3', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:54:01', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160054208901002570401', 'DocTradeStatus', 'A20', '完全收货', '5', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:54:20', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160054410931002612509', 'DocTradeStatus', 'A90', '收货取消', '7', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:54:41', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160055012821002008412', 'DocTradeStatus', 'A91', '拒绝收货', '9', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:55:01', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160055322011002545389', 'DocTradeStatus', 'B00', '出库待审核', '11', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:55:32', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160055501631002200095', 'DocTradeStatus', 'B10', '出库审核完成', '13', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:55:50', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160056197811002191365', 'DocTradeStatus', 'B20', '订单出库', '15', 'B20', '', '', 'super', null, '2018-12-16 00:56:19', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160059083481002316454', 'DocTradeStatus', 'B30', '出库单完成', '17', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:59:08', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160059582161002729248', 'DocTradeStatus', 'B90', '出库取消', '19', '商品库存交易状态', '', '', 'super', null, '2018-12-16 00:59:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160100238481002444397', 'DocTradeStatus', '30', '交易成功', '21', '商品库存交易状态', '', '', 'super', null, '2018-12-16 01:00:23', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160100452271002048084', 'DocTradeStatus', '40', '交易取消', '23', '商品库存交易状态', '', '', 'super', null, '2018-12-16 01:00:45', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160101198621002918335', 'DocTradeType', '11', '调拨出库', '1', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:01:19', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160101413201002006534', 'DocTradeType', '12', '盘亏出库', '3', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:01:41', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160101590261002090169', 'DocTradeType', '13', '采购退货', '5', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:01:59', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160102151101002162938', 'DocTradeType', '14', '销售出库', '7', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:02:15', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160102340811002602160', 'DocTradeType', '15', '报损出库', '9', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:02:34', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160102592491002894089', 'DocTradeType', '16', '领用出库', '11', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:02:59', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160103164871002847181', 'DocTradeType', '21', '调拨入库', '13', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:03:16', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160103452321002833052', 'DocTradeType', '22', '盘盈入库', '15', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:03:45', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160104081391002145382', 'DocTradeType', '23', '采购入库', '17', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:04:08', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160104245831002962318', 'DocTradeType', '24', '销退入库', '19', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:04:24', null);
INSERT INTO `bus_bas_codes` VALUES ('1812160104462031002809631', 'DocTradeType', '25', '杂收入库', '21', '商品库存交易类型', '', '', 'super', null, '2018-12-16 01:04:46', null);
INSERT INTO `bus_bas_codes` VALUES ('1812241632471911002086476', 'BusGoodsType', '2', '随货', '3', '销售商品类型', '', '', 'super', null, '2018-12-24 16:32:47', null);
INSERT INTO `bus_bas_codes` VALUES ('1812241633074381002479479', 'BusGoodsType', '3', '赠品', '5', '销售商品类型', '', '', 'super', null, '2018-12-24 16:33:07', null);
INSERT INTO `bus_bas_codes` VALUES ('1901142342396671002434352', 'BusCustomerType', 'NG', '餐饮客户', '1', '客户类型', '', '', 'super', 'super', '2019-01-14 23:42:39', '2019-01-30 09:24:29');
INSERT INTO `bus_bas_codes` VALUES ('1901150101364611002436453', 'BrandCode', '99', '--', '99', '品牌名称', '', '', 'super', null, '2019-01-15 01:01:36', null);
INSERT INTO `bus_bas_codes` VALUES ('1901150104263351002375806', 'BrandCode', '30', '剑南春', '30', '品牌名称', '', '', 'super', null, '2019-01-15 01:04:26', null);
INSERT INTO `bus_bas_codes` VALUES ('1901150141051411002915336', 'CategoryCode', '50', '黄酒', '9', '商品分类', '0', '', 'super', 'super', '2019-01-15 01:41:05', '2019-01-15 01:41:39');
INSERT INTO `bus_bas_codes` VALUES ('1901152207133721002605765', 'CategoryCode', '100', '辅料', '15', '商品分类(自定义2标记为1-说明价格为0可直接售卖)', '1', '', 'super', 'super', '2019-01-15 22:07:13', '2019-01-15 22:08:55');
INSERT INTO `bus_bas_codes` VALUES ('1901152212352091002536670', 'UnitCode', '40', '盒', '40', '单位', '', '', 'super', null, '2019-01-15 22:12:35', null);
INSERT INTO `bus_bas_codes` VALUES ('1901152213507661002370705', 'UnitCode', '50', '条', '50', '单位', '', '', 'super', null, '2019-01-15 22:13:50', null);
INSERT INTO `bus_bas_codes` VALUES ('1901152214272621002506262', 'UnitCode', '60', '包', '60', '单位', '', '', 'super', null, '2019-01-15 22:14:27', null);
INSERT INTO `bus_bas_codes` VALUES ('1901152215010461002044211', 'UnitCode', '70', '支', '70', '单位', '', '', 'super', null, '2019-01-15 22:15:01', null);
INSERT INTO `bus_bas_codes` VALUES ('1901281349325231002417016', 'VipUnpaidPayMode', '1', '银行卡', '1', '会员卡、挂账支付方式', '', '', 'super', null, '2019-01-28 13:49:32', null);
INSERT INTO `bus_bas_codes` VALUES ('1901281350170261002367422', 'VipUnpaidPayMode', '2', '现金', '2', '会员卡、挂账支付方式', '', '', 'super', null, '2019-01-28 13:50:17', null);
INSERT INTO `bus_bas_codes` VALUES ('1901281350507121002764591', 'VipUnpaidPayMode', '3', '支付宝', '3', '会员卡、挂账支付方式', '', '', 'super', null, '2019-01-28 13:50:50', null);
INSERT INTO `bus_bas_codes` VALUES ('1901281351137821002116758', 'VipUnpaidPayMode', '4', '微信', '4', '会员卡、挂账支付方式', '', '', 'super', null, '2019-01-28 13:51:13', null);
INSERT INTO `bus_bas_codes` VALUES ('1902121055041801002365931', 'BusPayType', '1', '消费', '1', '账单支付类型', '', '', 'sj', null, '2019-02-12 10:55:04', null);
INSERT INTO `bus_bas_codes` VALUES ('1902121056097021002814109', 'BusPayType', '2', '退款', '3', '账单支付类型', '', '', 'sj', null, '2019-02-12 10:56:09', null);
INSERT INTO `bus_bas_codes` VALUES ('1902121056293971002516118', 'BusPayType', '3', '补款', '5', '账单支付类型', '', '', 'sj', null, '2019-02-12 10:56:29', null);
INSERT INTO `bus_bas_codes` VALUES ('412288B0BBA94331993434FD407DF0D8', 'VipCardType', '2', '会员银卡', '2', '会员卡级别', '', '', 'super', null, '2018-12-04 02:31:46', null);
INSERT INTO `bus_bas_codes` VALUES ('441D3AAA41004B67932D2406286548A6', 'BusCustomerType', 'JXS', '经销商', '6', '客户类型', '', '', 'super', null, '2018-12-02 22:36:21', null);
INSERT INTO `bus_bas_codes` VALUES ('59D0292D74CB41E7A2F4C59DF7F639B3', 'BusCustomerType', 'GYS', '供应商', '8', '客户类型', '', '', 'super', null, '2018-12-02 22:35:45', null);
INSERT INTO `bus_bas_codes` VALUES ('74B2AB07D6D44F1CB38CFD3AC9EC66C6', 'VipCardType', '1', '普通卡', '1', '会员卡级别', '', '', 'super', null, '2018-12-04 02:30:23', null);
INSERT INTO `bus_bas_codes` VALUES ('7C0BD48AEA9D475EA5FA50ACDECC5437', 'BusCustomerType', 'YWY', '业务员', '10', '客户类型', '', '', 'super', null, '2018-12-02 22:35:19', null);
INSERT INTO `bus_bas_codes` VALUES ('816358A5C538498ABCC12AEF7D7242E7', 'BusCustomerType', 'SK', '散客', '99', '客户类型', '', '', 'super', null, '2018-12-02 22:33:51', null);
INSERT INTO `bus_bas_codes` VALUES ('917B839F2CE84FF9BA7D6D4FEEFCC8AB', 'BusCustomerType', 'GZ', '挂账单位', '4', '客户类型', '', '', 'super', null, '2018-12-02 22:36:47', null);
INSERT INTO `bus_bas_codes` VALUES ('AD5470C071014553B9965220123A63D4', 'VipCardType', '3', '会员金卡', '3', '会员卡级别', '', '', 'super', null, '2018-12-04 02:32:06', null);
INSERT INTO `bus_bas_codes` VALUES ('C38398B7DBF24891BEA67EC088E9DFD5', 'IsEnable', 'true', '启用', '1', '是否启用', '', '', 'super', null, '2018-12-02 22:42:38', null);
INSERT INTO `bus_bas_codes` VALUES ('E7712D39B9924921B988BB2EDE3B91E0', 'IsEnable', 'false', '禁用', '2', '是否启用', '', '', 'super', null, '2018-12-02 22:42:58', null);

-- ----------------------------
-- Table structure for bus_bas_sku
-- ----------------------------
DROP TABLE IF EXISTS `bus_bas_sku`;
CREATE TABLE `bus_bas_sku` (
  `sku_id` varchar(32) NOT NULL COMMENT 'sku_id',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku` varchar(32) NOT NULL COMMENT 'sku',
  `parent_sku_id` varchar(32) DEFAULT NULL COMMENT '上级skuId',
  `category_code` varchar(32) DEFAULT NULL COMMENT '产品分类编码',
  `product_type` smallint(6) DEFAULT NULL COMMENT '产品类型 0 单品，1 组合',
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `assist_id` varchar(32) DEFAULT NULL COMMENT '辅助编码',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `en_name` varchar(128) DEFAULT NULL COMMENT '英文名称',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `market_price` decimal(18,2) DEFAULT '0.00' COMMENT '市场价（作为批发价使用）',
  `cost_price` decimal(18,2) DEFAULT '0.00' COMMENT '成本价',
  `origin_sale_price` decimal(18,2) DEFAULT '0.00' COMMENT '原销售价',
  `warning_qty` int(11) DEFAULT '0' COMMENT '库存预警值',
  `qty` decimal(18,2) DEFAULT NULL COMMENT '数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `keywords` varchar(256) DEFAULT NULL COMMENT '商品关键字',
  `memo` varchar(1024) DEFAULT NULL COMMENT '备注',
  `descr` varchar(256) DEFAULT NULL COMMENT '详情',
  `status` smallint(6) DEFAULT NULL COMMENT '状态 1 待审核，2 仓库中，3 已上架，4 已下架',
  `is_recommend` bit(1) DEFAULT b'0' COMMENT '是否推荐商品',
  `on_shelf_time` datetime DEFAULT NULL COMMENT '上架时间',
  `off_shelf_time` datetime DEFAULT NULL COMMENT '下架时间',
  `sort_code` int(11) DEFAULT '999999' COMMENT '排序号',
  `is_enabled` bit(1) DEFAULT b'1' COMMENT '状态,1启用,-0 禁用',
  `ext_0` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_1` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `rate_precent` decimal(18,2) DEFAULT NULL COMMENT '税率',
  `settle_type` int(11) DEFAULT NULL COMMENT '0，非直接结算；1直接结算',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `updated_id` varchar(32) DEFAULT NULL COMMENT '更新人id',
  `is_vip_appoint` bit(1) DEFAULT b'0' COMMENT '是否是普通会员指定vip价商品,1是,-0 否',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺产品';

-- ----------------------------
-- Records of bus_bas_sku
-- ----------------------------
INSERT INTO `bus_bas_sku` VALUES ('1901150024113591003526488', '', '1001', null, '10', '0', '10', null, '杜康珍藏15号-42°', '', '42°', '28.00', '0.00', '56.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '1', '', null, null, null, null, '2019-01-15 00:24:11', '2019-01-15 00:25:41', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150028285831003317629', '', '1002', null, '10', '0', '10', null, '杜康珍藏15号-52°', '', '52°', '28.00', '0.00', '56.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '2', '', null, null, null, null, '2019-01-15 00:28:28', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150030127851003564612', '', '1003', null, '10', '0', '10', null, '杜康珍藏2号-42°', '', '42°', '48.00', '0.00', '88.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '3', '', null, null, null, null, '2019-01-15 00:30:12', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150030469841003447694', '', '1004', null, '10', '0', '10', null, '杜康珍藏2号-52°', '', '52°', '48.00', '0.00', '88.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '4', '', null, null, null, null, '2019-01-15 00:30:46', '2019-01-15 00:56:36', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150032042641003952351', '', '1005', null, '10', '0', '10', null, '杜康珍藏5号-42°', '', '42°', '88.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '5', '', null, null, null, null, '2019-01-15 00:32:04', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150032469881003670598', '', '1006', null, '10', '0', '10', null, '杜康珍藏5号-52°', '', '52°', '88.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '6', '', null, null, null, null, '2019-01-15 00:32:46', '2019-01-15 00:33:03', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150034084571003041973', '', '1007', null, '10', '0', '10', null, '杜康珍藏6号-42°', '', '42°', '108.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '7', '', null, null, null, null, '2019-01-15 00:34:08', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150036468771003275031', '', '1008', null, '10', '0', '10', null, '杜康珍藏6号-52°', '', '52°', '108.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '8', '', null, null, null, null, '2019-01-15 00:36:46', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150037527971003294152', '', '1009', null, '10', '0', '10', null, '杜康珍酿8号-52°', '', '52°', '148.00', '0.00', '238.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '9', '', null, null, null, null, '2019-01-15 00:37:52', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150039553561003585210', '', '1010', null, '10', '0', '10', null, '杜康珍藏原浆8号-42°', '', '42°', '168.00', '0.00', '368.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '11', '', null, null, null, null, '2019-01-15 00:39:55', '2019-01-15 00:57:24', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150040589961003847890', '', '1011', null, '10', '0', '10', null, '杜康珍藏原浆8号-52°', '', '52°', '168.00', '0.00', '368.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '12', '', null, null, null, null, '2019-01-15 00:40:58', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150042456261003172780', '', '1012', null, '10', '0', '10', null, '杜康珍藏原浆天合-42°', '', '42°', '158.00', '0.00', '288.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '13', '', null, null, null, null, '2019-01-15 00:42:45', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150043478961003447157', '', '1013', null, '10', '0', '10', null, '杜康珍藏原浆天合-60°', '', '60°', '158.00', '0.00', '288.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '15', '', null, null, null, null, '2019-01-15 00:43:47', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150044473851003420519', '', '1014', null, '10', '0', '10', null, '杜康珍藏原浆天顺-46°', '', '46°', '268.00', '0.00', '398.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '17', '', null, null, null, null, '2019-01-15 00:44:47', '2019-01-15 00:46:01', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150045464831003901701', '', '1015', null, '10', '0', '10', null, '杜康珍藏原浆天顺-60°', '', '60°', '268.00', '0.00', '398.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '18', '', null, null, null, null, '2019-01-15 00:45:46', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150047169851003378405', '', '1016', null, '10', '0', '10', null, '杜康特调VIP品鉴酒-46°', '', '46°', '138.00', '0.00', '268.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '19', '', null, null, null, null, '2019-01-15 00:47:16', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150049130011003174196', '', '1017', null, '10', '0', '10', null, '杜康特酿-38°', '', '38°', '0.00', '0.00', '178.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '21', '', null, null, null, null, '2019-01-15 00:49:13', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150050599841003231843', '', '1018', null, '10', '0', '10', null, '杜康珍藏1973-38°', '', '38°', '228.00', '0.00', '328.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '23', '', null, null, null, null, '2019-01-15 00:50:59', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150053039451003011518', '', '1019', null, '10', '0', '10', null, '中华杜康贵宾-41.8°', '', '41.8°', '46.00', '0.00', '98.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '25', '', null, null, null, null, '2019-01-15 00:53:03', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150053454551003547728', '', '1020', null, '10', '0', '10', null, '中华杜康贵宾-50.8°', '', '50.8°', '46.00', '0.00', '98.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '26', '', null, null, null, null, '2019-01-15 00:53:45', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150054400361003353248', '', '1021', null, '10', '0', '10', null, '中华杜康10年品鉴-41.8°', '', '41.8°', '168.00', '0.00', '288.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '28', '', null, null, null, null, '2019-01-15 00:54:40', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150058197541003514726', '', '1022', null, '10', '0', '10', null, '中华杜康10年-41.8°', '', '41.8°', '188.00', '0.00', '318.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '30', '', null, null, null, null, '2019-01-15 00:58:19', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150059039881003194115', '', '1023', null, '10', '0', '10', null, '中华杜康10年-50.8°', '', '50.8°', '188.00', '0.00', '318.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '31', '', null, null, null, null, '2019-01-15 00:59:03', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150059462051003821889', '', '1024', null, '10', '0', '10', null, '杜康珍藏年份小酒-52°', '', '52°', '36.00', '0.00', '68.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '33', '', null, null, null, null, '2019-01-15 00:59:46', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150103328581003593427', '', '1901', null, '10', '0', '99', null, '南湖壹号', '', '--', '288.00', '0.00', '618.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '36', '', null, null, null, null, '2019-01-15 01:03:32', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150107281071003947337', '', '1301', null, '10', '0', '30', null, '剑南春-38°', '', '38°', '0.00', '0.00', '0.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '37', '', null, null, null, null, '2019-01-15 01:07:28', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150108013841003895522', '', '1302', null, '10', '0', '30', null, '剑南春-52°', '', '52°', '0.00', '0.00', '0.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '38', '', null, null, null, null, '2019-01-15 01:08:01', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150109417701003903794', '', '2001', null, '20', '0', '20', null, '科乐克金章318干红', '', '--', '106.00', '0.00', '248.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '40', '', null, null, null, null, '2019-01-15 01:09:41', '2019-01-15 01:09:56', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150111440811003699285', '', '2002', null, '20', '0', '20', null, '科乐克金章708干红', '', '--', '86.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '41', '', null, null, null, null, '2019-01-15 01:11:44', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150115498221003648009', '', '2003', null, '20', '0', '20', null, '科乐克金章干白', '', '--', '60.00', '0.00', '158.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '43', '', null, null, null, null, '2019-01-15 01:15:49', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150116452691003841398', '', '2004', null, '20', '0', '20', null, '科乐克贵族红干红', '', '--', '258.00', '0.00', '658.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '45', '', null, null, null, null, '2019-01-15 01:16:45', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150117315221003619952', '', '2005', null, '20', '0', '20', null, '科乐克贵族金干红', '', '--', '136.00', '0.00', '398.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '47', '', null, null, null, null, '2019-01-15 01:17:31', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150118113401003956120', '', '2006', null, '20', '0', '20', null, '科乐克贵族银干红', '', '--', '116.00', '0.00', '298.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '49', '', null, null, null, null, '2019-01-15 01:18:11', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150121495351003668549', '', '2007', null, '20', '0', '20', null, '科乐克风车干红', '', '--', '46.00', '0.00', '118.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '50', '', null, null, null, null, '2019-01-15 01:21:49', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150122293581003529410', '', '2008', null, '20', '0', '20', null, '科乐克赤霞珠干红', '', '--', '28.00', '0.00', '98.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '51', '', null, null, null, null, '2019-01-15 01:22:29', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150123444341003726098', '', '2009', null, '20', '0', '20', null, '科乐克城堡干红(3L简装)2016', '', '(3L简装)2016', '0.00', '0.00', '0.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '52', '', null, null, null, null, '2019-01-15 01:23:44', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150125066101003686969', '', '2010', null, '20', '0', '20', null, '科乐克城堡干红(3L装)2016', '', '(3L装)2016', '0.00', '0.00', '598.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '54', '', null, null, null, null, '2019-01-15 01:25:06', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150125569031003360168', '', '2011', null, '20', '0', '20', null, '科乐克城堡干红(3L装)2015', '', '(3L装)2015', '0.00', '0.00', '798.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '55', '', null, null, null, null, '2019-01-15 01:25:56', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150126373931003852335', '', '2012', null, '20', '0', '20', null, '科波拉金钻干红', '', '--', '40.00', '0.00', '0.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '56', '', null, null, null, null, '2019-01-15 01:26:37', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150127333321003184702', '', '2013', null, '20', '0', '20', null, '科乐克男爵干红(金标)', '', '金标', '34.00', '0.00', '118.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '58', '', null, null, null, null, '2019-01-15 01:27:33', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150128238791003507434', '', '2014', null, '20', '0', '20', null, '科乐克男爵干红(红标)', '', '红标', '34.00', '0.00', '118.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '60', '', null, null, null, null, '2019-01-15 01:28:23', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150129134981003230910', '', '2015', null, '20', '0', '99', null, '索罗金干红', '', '--', '30.00', '0.00', '0.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '61', '', null, null, null, null, '2019-01-15 01:29:13', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150129558781003827037', '', '2016', null, '20', '0', '20', null, '科乐克红标小教堂', '', '--', '32.00', '0.00', '108.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '62', '', null, null, null, null, '2019-01-15 01:29:55', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150130377671003555543', '', '2017', null, '20', '0', '20', null, '科乐克康萨城堡干红', '', '--', '98.00', '0.00', '238.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '64', '', null, null, null, null, '2019-01-15 01:30:37', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150131191061003454626', '', '2018', null, '20', '0', '20', null, '科乐克酒庄干红', '', '--', '33.00', '0.00', '128.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '66', '', null, null, null, null, '2019-01-15 01:31:19', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150131590911003396129', '', '2019', null, '20', '0', '20', null, '科乐克波尔多干红', '', '--', '19.00', '0.00', '98.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '68', '', null, null, null, null, '2019-01-15 01:31:59', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150132396041003638387', '', '2020', null, '20', '0', '20', null, '科乐克城堡干红', '', '--', '70.00', '0.00', '168.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '70', '', null, null, null, null, '2019-01-15 01:32:39', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150133179791003615606', '', '2021', null, '20', '0', '20', null, '科乐克尚宝龙城堡', '', '--', '225.00', '0.00', '980.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '72', '', null, null, null, null, '2019-01-15 01:33:17', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150133535181003092740', '', '2022', null, '20', '0', '20', null, '科乐克传奇2015干红', '', '--', '48.00', '0.00', '198.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '75', '', null, null, null, null, '2019-01-15 01:33:53', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150135296141003111632', '', '1902', null, '20', '0', '99', null, '冰酒(木盒6支装)', '', '木盒6支装', '0.00', '0.00', '1280.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '76', '', null, null, null, null, '2019-01-15 01:35:29', '2019-01-15 21:24:48', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150137373491003308678', '', '1903', null, '20', '0', '99', null, '冰酒(木盒2支装)', '', '木盒2支装', '0.00', '0.00', '580.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '77', '', null, null, null, null, '2019-01-15 01:37:37', '2019-01-15 21:25:08', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150138226781003970840', '', '1904', null, '20', '0', '99', null, '冰酒(皮盒2支装)', '', '皮盒2支装', '0.00', '0.00', '780.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '78', '', null, null, null, null, '2019-01-15 01:38:22', '2019-01-15 21:25:16', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150139049211003244546', '', '1905', null, '100', '0', '99', null, '精品皮盒', '', '--', '35.00', '0.00', '50.00', null, '1.00', '10', '个', null, null, null, '', '', null, '\0', null, null, '80', '', null, null, null, null, '2019-01-15 01:39:04', '2019-01-15 22:15:40', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150142562401003824152', '', '3001', null, '50', '0', '99', null, '沈荡黄酒-8年足陈(小红坛)', '', '8年足陈', '0.00', '0.00', '38.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '84', '', null, null, null, null, '2019-01-15 01:42:56', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150145304301003592583', '', '3002', null, '50', '0', '99', null, '沈荡黄酒-5年足陈(小陶坛)', '', '5年足陈', '0.00', '0.00', '18.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '86', '', null, null, null, null, '2019-01-15 01:45:30', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901150146380751003837599', '', '3003', null, '50', '0', '99', null, '沈荡黄酒-窖藏花雕', '', '--', '0.00', '0.00', '98.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '88', '', null, null, null, null, '2019-01-15 01:46:38', null, '402882be46404313014640b7eb1c000f', null, '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901291215460821003657765', '', '1906', null, '20', '0', '20', null, '冰酒', '', '单支', '145.00', '0.00', '213.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '1', '', null, null, null, null, '2019-01-29 12:15:46', '2019-01-29 12:21:05', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1901291216422681003562607', '', '1907', null, '100', '0', '99', null, '冰酒6支装木盒', '', '盒子', '10.00', '0.00', '10.00', null, '1.00', '10', '个', null, null, null, '', '', null, '\0', null, null, '1', '', null, null, null, null, '2019-01-29 12:16:42', '2019-01-29 12:20:14', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `customer_code` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `customer_type` varchar(32) DEFAULT NULL COMMENT '客户类型(SK:散客, YWY:业务员,GYS:供应商, JXS:经销商, GZ 挂账单位, VIP会员)',
  `customer_name` varchar(64) DEFAULT NULL COMMENT '客户名称',
  `contacts` varchar(64) DEFAULT NULL COMMENT '联系人',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `tel` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `salesman` varchar(32) DEFAULT NULL COMMENT '所属销售代表',
  `credit_price` decimal(18,2) DEFAULT '0.00' COMMENT '信用额度',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否可用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `updated_id` varchar(32) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂账信息';

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', 'YWY100001', 'YWY', '测试业务员', null, null, '18848384467', null, null, '0.00', '', null, null, null, null);
INSERT INTO `bus_customer` VALUES ('1901230052275281004263739', 'VIP100001', 'VIP', '包劲松', '包劲松', '', '13806736549', '', '', '0.00', '', '2019-01-23 00:52:27', '2019-01-23 00:54:57', 'super', 'super');
INSERT INTO `bus_customer` VALUES ('1901230052442741004926840', 'VIP100002', 'VIP', '鲍峰', '鲍峰', '', '620290', '', '', '0.00', '', '2019-01-23 00:52:44', '2019-01-23 00:54:38', 'super', 'super');
INSERT INTO `bus_customer` VALUES ('1901230052595631004781314', 'VIP100003', 'VIP', '曹飞', '曹飞', '', '650510', '', '', '0.00', '', '2019-01-23 00:52:59', '2019-01-23 00:54:24', 'super', 'super');
INSERT INTO `bus_customer` VALUES ('1901230053087691004021969', 'VIP100004', 'VIP', '曹伟', '曹伟', '', '13216335589', '', '', '0.00', '', '2019-01-23 00:53:08', '2019-01-23 00:53:58', 'super', 'super');
INSERT INTO `bus_customer` VALUES ('1901230053428891004418488', 'VIP100005', 'VIP', '陈朝辉', '陈朝辉', '', '18006730777', '', '', '0.00', '', '2019-01-23 00:53:42', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230055246071004724579', 'VIP100006', 'VIP', '陈红旗', '陈红旗', '', '', '', '', '0.00', '', '2019-01-23 00:55:24', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230055425581004691435', 'VIP100007', 'VIP', '陈明甫', '陈明甫', '', '638000', '', '', '0.00', '', '2019-01-23 00:55:42', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230056090601004725489', 'VIP100008', 'VIP', '崔强英', '崔强英', '', '622890', '', '', '0.00', '', '2019-01-23 00:56:09', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230056290791004496308', 'VIP100009', 'VIP', '戴国军', '戴国军', '', '13905739681', '', '', '0.00', '', '2019-01-23 00:56:29', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230056569691004369017', 'VIP100010', 'VIP', '方国民', '方国民', '', '13706585213', '', '', '0.00', '', '2019-01-23 00:56:56', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230057139091004727705', 'VIP100011', 'VIP', '方志坚', '方志坚', '', '18805730005', '', '', '0.00', '', '2019-01-23 00:57:13', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230057311291004985753', 'VIP100012', 'VIP', '冯法军', '冯法军', '', '677777', '', '', '0.00', '', '2019-01-23 00:57:31', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230057464731004077830', 'VIP100013', 'VIP', '冯惠松', '冯惠松', '', '639025', '', '', '0.00', '', '2019-01-23 00:57:46', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230058018481004110893', 'VIP100014', 'VIP', '高红光', '高红光', '', '18357331155', '', '', '0.00', '', '2019-01-23 00:58:01', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230058149671004642825', 'VIP100015', 'VIP', '黄伟康', '黄伟康', '', '15857301888', '', '', '0.00', '', '2019-01-23 00:58:14', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230058257861004894081', 'VIP100016', 'VIP', '蒋马飞', '蒋马飞', '', '', '', '', '0.00', '', '2019-01-23 00:58:25', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230058400601004862460', 'VIP100017', 'VIP', '蒋敏峰', '蒋敏峰', '', '', '', '', '0.00', '', '2019-01-23 00:58:40', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230058519811004904172', 'VIP100018', 'VIP', '李家生', '李家生', '', '13906833683', '', '', '0.00', '', '2019-01-23 00:58:51', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230059161751004483973', 'VIP100019', 'VIP', '李进', '李进', '', '679772', '', '', '0.00', '', '2019-01-23 00:59:16', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230059281391004084116', 'VIP100020', 'VIP', '李荣光', '李荣光', '', '', '', '', '0.00', '', '2019-01-23 00:59:28', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230059362361004357832', 'VIP100021', 'VIP', '林加生', '林加生', '', '', '', '', '0.00', '', '2019-01-23 00:59:36', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230059483001004448493', 'VIP100022', 'VIP', '刘海', '刘海', '', '15824361111', '', '', '0.00', '', '2019-01-23 00:59:48', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230100005171004061509', 'VIP100023', 'VIP', '刘其武', '刘其武', '', '13586308888', '', '', '0.00', '', '2019-01-23 01:00:00', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230100140201004846609', 'VIP100024', 'VIP', '陆成中', '陆成中', '', '13957399099', '', '', '0.00', '', '2019-01-23 01:00:14', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230100315651004169873', 'VIP100025', 'VIP', '陆建中', '陆建中', '', '635878', '', '', '0.00', '', '2019-01-23 01:00:31', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230100442131004296211', 'VIP100026', 'VIP', '陆小平', '陆小平', '', '15824361111', '', '', '0.00', '', '2019-01-23 01:00:44', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230100579931004338852', 'VIP100027', 'VIP', '马德祥', '马德祥', '', '699688', '', '', '0.00', '', '2019-01-23 01:00:57', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230101106141004449553', 'VIP100028', 'VIP', '马品术', '马品术', '', '15067334567', '', '', '0.00', '', '2019-01-23 01:01:10', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230101232921004393379', 'VIP100029', 'VIP', '马永华', '马永华', '', '13757370877', '', '', '0.00', '', '2019-01-23 01:01:23', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230101383841004049562', 'VIP100030', 'VIP', '毛建明', '毛建明', '', '13004210088', '', '', '0.00', '', '2019-01-23 01:01:38', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230101469861004586951', 'VIP100031', 'VIP', '缪伟明', '缪伟明', '', '', '', '', '0.00', '', '2019-01-23 01:01:46', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230102012351004658056', 'VIP100032', 'VIP', '潘海峰', '潘海峰', '', '689121', '', '', '0.00', '', '2019-01-23 01:02:01', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230102136061004383790', 'VIP100033', 'VIP', '潘建中', '潘建中', '', '13967320111', '', '', '0.00', '', '2019-01-23 01:02:13', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230102288621004044904', 'VIP100034', 'VIP', '钱燕飞', '钱燕飞', '', '217206', '', '', '0.00', '', '2019-01-23 01:02:28', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230102432721004803596', 'VIP100035', 'VIP', '秦荣亮', '秦荣亮', '', '13867366006', '', '', '0.00', '', '2019-01-23 01:02:43', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230102539671004491290', 'VIP100036', 'VIP', '沈建军', '沈建军', '', '13844843866', '', '', '0.00', '', '2019-01-23 01:02:53', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103045311004446286', 'VIP100037', 'VIP', '盛利华', '盛利华', '', '13655730011', '', '', '0.00', '', '2019-01-23 01:03:04', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103161011004682526', 'VIP100038', 'VIP', '唐佳祥', '唐佳祥', '', '18057319777', '', '', '0.00', '', '2019-01-23 01:03:16', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103237651004795985', 'VIP100039', 'VIP', '唐金炎', '唐金炎', '', '', '', '', '0.00', '', '2019-01-23 01:03:23', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103324591004226704', 'VIP100040', 'VIP', '童小军', '童小军', '', '', '', '', '0.00', '', '2019-01-23 01:03:32', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103439141004040824', 'VIP100041', 'VIP', '王福生', '王福生', '', '13656725555', '', '', '0.00', '', '2019-01-23 01:03:43', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230103545061004651270', 'VIP100042', 'VIP', '王高飞', '王高飞', '', '18157349999', '', '', '0.00', '', '2019-01-23 01:03:54', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230104104991004846781', 'VIP100043', 'VIP', '王建军', '王建军', '', '00000632488', '', '', '0.00', '', '2019-01-23 01:04:10', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230104236501004571165', 'VIP100044', 'VIP', '王李平', '王李平', '', '15257323788', '', '', '0.00', '', '2019-01-23 01:04:23', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230104328251004322567', 'VIP100045', 'VIP', '王连才', '王连才', '', '', '', '', '0.00', '', '2019-01-23 01:04:32', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230104435561004767408', 'VIP100046', 'VIP', '王伟', '王伟', '', '13305735524', '', '', '0.00', '', '2019-01-23 01:04:43', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230104528961004603640', 'VIP100047', 'VIP', '王永军', '王永军', '', '', '', '', '0.00', '', '2019-01-23 01:04:52', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230105034241004123380', 'VIP100048', 'VIP', '王中林', '王中林', '', '13906837345', '', '', '0.00', '', '2019-01-23 01:05:03', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230105123001004928636', 'VIP100049', 'VIP', '吴其明', '吴其明', '', '', '', '', '0.00', '', '2019-01-23 01:05:12', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230105224681004387769', 'VIP100050', 'VIP', '夏高其', '夏高其', '', '13511325888', '', '', '0.00', '', '2019-01-23 01:05:22', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230105363761004124224', 'VIP100051', 'VIP', '徐金平', '徐金平', '', '664444', '', '', '0.00', '', '2019-01-23 01:05:36', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230105483861004503967', 'VIP100052', 'VIP', '徐永新', '徐永新', '', '669308', '', '', '0.00', '', '2019-01-23 01:05:48', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230106038011004774832', 'VIP100053', 'VIP', '徐有良', '徐有良', '', '668038', '', '', '0.00', '', '2019-01-23 01:06:03', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230106155381004109950', 'VIP100054', 'VIP', '许加生', '许加生', '', '13906830133', '', '', '0.00', '', '2019-01-23 01:06:15', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230106276981004484843', 'VIP100055', 'VIP', '许立峰', '许立峰', '', '18657300000', '', '', '0.00', '', '2019-01-23 01:06:27', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230106419031004855114', 'VIP100056', 'VIP', '许伟', '许伟', '', '231031', '', '', '0.00', '', '2019-01-23 01:06:41', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230106522671004800720', 'VIP100057', 'VIP', '许卫星', '许卫星', '', '18911261428', '', '', '0.00', '', '2019-01-23 01:06:52', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230107036581004643252', 'VIP100058', 'VIP', '薛海珍', '薛海珍', '', '13806739127', '', '', '0.00', '', '2019-01-23 01:07:03', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230107160581004151309', 'VIP100059', 'VIP', '杨易才', '杨易才', '', '15906836666', '', '', '0.00', '', '2019-01-23 01:07:16', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230107289191004459385', 'VIP100060', 'VIP', '杨志顺', '杨志顺', '', '', '', '', '0.00', '', '2019-01-23 01:07:28', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230107467441004585388', 'VIP100061', 'VIP', '姚伟明', '姚伟明', '', '15397266888', '', '', '0.00', '', '2019-01-23 01:07:46', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230107585241004832647', 'VIP100062', 'VIP', '姚伟强', '姚伟强', '', '13706830998', '', '', '0.00', '', '2019-01-23 01:07:58', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230108107461004747328', 'VIP100063', 'VIP', '郁旭峰', '郁旭峰', '', '15157355888', '', '', '0.00', '', '2019-01-23 01:08:10', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230108236391004806262', 'VIP100064', 'VIP', '张杰', '张杰', '', '13305732633', '', '', '0.00', '', '2019-01-23 01:08:23', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230108352261004391447', 'VIP100065', 'VIP', '张平', '张平', '', '13819066693', '', '', '0.00', '', '2019-01-23 01:08:35', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230108478891004074553', 'VIP100066', 'VIP', '张松华', '张松华', '', '630388', '', '', '0.00', '', '2019-01-23 01:08:47', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230109023931004493322', 'VIP100067', 'VIP', '张小松', '张小松', '', '13311602923', '', '', '0.00', '', '2019-01-23 01:09:02', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230109155531004990576', 'VIP100068', 'VIP', '张一舟', '张一舟', '', '13806739002', '', '', '0.00', '', '2019-01-23 01:09:15', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230109270621004404956', 'VIP100069', 'VIP', '张增辉', '张增辉', '', '18267312568', '', '', '0.00', '', '2019-01-23 01:09:27', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230109407531004019932', 'VIP100070', 'VIP', '赵利斌', '赵利斌', '', '658551', '', '', '0.00', '', '2019-01-23 01:09:40', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230109501341004534617', 'VIP100071', 'VIP', '赵锡军', '赵锡军', '', '', '', '', '0.00', '', '2019-01-23 01:09:50', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230110051311004008095', 'VIP100072', 'VIP', '郑利明', '郑利明', '', '13356006868', '', '', '0.00', '', '2019-01-23 01:10:05', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230110163041004450510', 'VIP100073', 'VIP', '郑晓龙', '郑晓龙', '', '15157309100', '', '', '0.00', '', '2019-01-23 01:10:16', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230110281631004859432', 'VIP100074', 'VIP', '钟铮', '钟铮', '', '13758065060', '', '', '0.00', '', '2019-01-23 01:10:28', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230110414381004343079', 'VIP100075', 'VIP', '周江峰', '周江峰', '', '', '', '', '0.00', '', '2019-01-23 01:10:41', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230110540141004812144', 'VIP100076', 'VIP', '周平', '周平', '', '13575333000', '', '', '0.00', '', '2019-01-23 01:10:54', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230111046641004191558', 'VIP100077', 'VIP', '周武', '周武', '', '', '', '', '0.00', '', '2019-01-23 01:11:04', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230111163011004592966', 'VIP100078', 'VIP', '周云泉', '周云泉', '', '18857366828', '', '', '0.00', '', '2019-01-23 01:11:16', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230111292771004654324', 'VIP100079', 'VIP', '朱惠明', '朱惠明', '', '13857390280', '', '', '0.00', '', '2019-01-23 01:11:29', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230111442771004788751', 'VIP100080', 'VIP', '朱祥飞', '朱祥飞', '', '13456335918', '', '', '0.00', '', '2019-01-23 01:11:44', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230111569821004204556', 'VIP100081', 'VIP', '朱月忠', '朱月忠', '', '13906830111', '', '', '0.00', '', '2019-01-23 01:11:56', '2019-01-31 12:49:59', 'super', '402882be46404313014640b7eb1c000f');
INSERT INTO `bus_customer` VALUES ('1901230112096181004737643', 'VIP100082', 'VIP', '朱云伟', '朱云伟', '', '13505735167', '', '', '0.00', '', '2019-01-23 01:12:09', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230112257141004917694', 'VIP100083', 'VIP', '朱周良', '朱周良', '', '636619', '', '', '0.00', '', '2019-01-23 01:12:25', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230112369371004471012', 'VIP100084', 'VIP', '祝海忠', '祝海忠', '', '13625738888', '', '', '0.00', '', '2019-01-23 01:12:36', '2019-01-31 12:49:59', 'super', '402882be46404313014640b7eb1c000f');
INSERT INTO `bus_customer` VALUES ('1901230112495071004223356', 'VIP100085', 'VIP', '祝元军', '祝元军', '', '609273', '', '', '0.00', '', '2019-01-23 01:12:49', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('1901230113015351004851292', 'VIP100086', 'VIP', '邹贺良', '邹贺良', '', '13645835318', '', '', '0.00', '', '2019-01-23 01:13:01', '2019-01-31 12:49:59', 'super', '402882be46404313014640b7eb1c000f');
INSERT INTO `bus_customer` VALUES ('1902120226087841004000363', 'GYS100001', 'GYS', '红酒供应商测试', '测试小王', '测试地址', '18812345671', '', '', '0.00', '', '2019-02-12 02:26:08', null, 'sj', null);
INSERT INTO `bus_customer` VALUES ('2', 'JXS100001', 'JXS', '测试经销商', '', '', '13645736015', '', 'YWY100001', '1000.00', '', null, '2019-02-12 02:58:08', null, '402881ea68bcaece0168bcb03d150002');
INSERT INTO `bus_customer` VALUES ('2E759B37865A4AE883B6D1B0EA39662E', 'JXS100002', 'JXS', '小王1', '', '', '13645736016', '', 'YWY100001', '0.00', '\0', '2018-12-03 02:49:52', '2019-01-23 01:13:57', 'super', '402882be46404313014640b7eb1c000f');
INSERT INTO `bus_customer` VALUES ('3', 'SK100001', 'SK', '散客', null, null, null, null, null, '0.00', '', null, null, null, null);

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT 'goods_id',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `goods_type` smallint(6) DEFAULT NULL COMMENT '商品类型',
  `category_name` varchar(64) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(64) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `product_type` smallint(6) DEFAULT NULL COMMENT '产品类型 1 单品，2 组合',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `parent_sku` varchar(32) DEFAULT NULL COMMENT 'parent_sku',
  `sku_id` varchar(32) DEFAULT NULL COMMENT '原SKU ID',
  `parent_sku_id` varchar(32) DEFAULT NULL COMMENT '原父SKU ID',
  `en_unit` varchar(32) DEFAULT NULL COMMENT '英文单位简称',
  `total_part_price` decimal(18,2) DEFAULT NULL COMMENT '总分摊价',
  `rate_type` varchar(32) DEFAULT NULL COMMENT '税种',
  `qty` decimal(18,2) DEFAULT NULL COMMENT '购买数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `market_price` decimal(18,2) NOT NULL COMMENT '市场价',
  `origin_sale_price` decimal(18,2) NOT NULL COMMENT '原销售价',
  `sale_price` decimal(18,2) NOT NULL COMMENT '实际销售价(销售价、会员价)',
  `part_price` decimal(18,4) DEFAULT '0.0000' COMMENT '商品分摊价',
  `coupon_price` decimal(18,2) DEFAULT NULL,
  `discount_price` decimal(18,4) DEFAULT '0.0000' COMMENT '商品折价 销售价-分摊价=折扣价',
  `total_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '商品销售总金额',
  `cost_price` decimal(18,4) DEFAULT '0.0000' COMMENT '成本价',
  `rate_precent` decimal(18,2) DEFAULT '17.00' COMMENT '税率',
  `is_gift` bit(1) DEFAULT b'0' COMMENT '是否为赠品 1 赠品，0 非赠品',
  `gift_count` decimal(18,2) DEFAULT NULL COMMENT '赠送数量',
  `gift_price` decimal(18,2) DEFAULT NULL COMMENT '赠送金额',
  `is_show` bit(1) DEFAULT NULL COMMENT '点单界面是否显示，不显示用于组合商品',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易商品表';

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1901291004087161005086458', '2019012901100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '31.67', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '31.6700', '18.00', '6.3300', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-29 10:04:08', null);
INSERT INTO `bus_goods` VALUES ('1901291203529381005644397', '2019012901100100002', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '2202.99', null, '100.00', '20', null, null, '168.00', '368.00', '328.00', '22.0300', '4000.00', '30597.0100', '32800.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-29 12:03:52', null);
INSERT INTO `bus_goods` VALUES ('1901291203530451005163033', '2019012901100100002', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '1397.01', null, '100.00', '20', null, null, '148.00', '238.00', '208.00', '13.9700', '3000.00', '19402.9900', '20800.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-29 12:03:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823523221005837247', '2019013001100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-42°', '', '1012', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823524111005628590', '2019013001100100001', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823524311005118872', '2019013001100100001', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-42°', '', '1007', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823524511005828479', '2019013001100100001', '4', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-42°', '', '1003', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823524731005238712', '2019013001100100001', '5', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823524941005433176', '2019013001100100001', '6', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823525191005409517', '2019013001100100001', '7', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823525421005195133', '2019013001100100001', '8', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823525671005804179', '2019013001100100001', '9', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-42°', '', '1010', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823525861005101184', '2019013001100100001', '10', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300823526071005085046', '2019013001100100001', '11', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '208.00', null, '1.00', '20', null, null, '148.00', '238.00', '208.00', '208.0000', '30.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:23:52', null);
INSERT INTO `bus_goods` VALUES ('1901300847186741005330478', '2019013001100100002', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '685.84', null, '10.00', '20', null, null, '28.00', '56.00', '38.00', '68.5800', '180.00', '-305.8400', '380.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847187521005634338', '2019013001100100002', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-42°', '', '1007', null, null, null, null, '267.12', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '267.1200', '20.00', '-119.1200', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847187721005645684', '2019013001100100002', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '375.41', null, '1.00', '20', null, null, '148.00', '238.00', '208.00', '375.4100', '30.00', '-167.4100', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847187911005509828', '2019013001100100002', '4', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-42°', '', '1010', null, null, null, null, '591.99', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '591.9900', '40.00', '-263.9900', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188111005961564', '2019013001100100002', '5', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '140.78', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '140.7800', '10.00', '-62.7800', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188291005297370', '2019013001100100002', '6', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '591.97', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '591.9700', '40.00', '-263.9700', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188441005881677', '2019013001100100002', '7', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '249.07', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '249.0700', '30.00', '-111.0700', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188591005425482', '2019013001100100002', '8', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-42°', '', '1003', null, null, null, null, '140.78', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '140.7800', '10.00', '-62.7800', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188771005855040', '2019013001100100002', '9', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '267.12', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '267.1200', '20.00', '-119.1200', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847188951005488899', '2019013001100100002', '10', '2', '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '-101.07', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '-101.0700', '56.00', '101.0700', '0.00', '0.0000', null, '', '1.00', '56.00', null, '52°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1901300847189101005629814', '2019013001100100002', '11', '2', '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '-823.01', null, '10.00', '20', null, null, '88.00', '168.00', '138.00', '-82.3000', '1128.00', '1375.0100', '552.00', '0.0000', null, '', '6.00', '1008.00', null, '42°', '', '2019-01-30 08:47:18', null);
INSERT INTO `bus_goods` VALUES ('1902011239268081005955122', '2019020101100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '380.00', null, '10.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '180.00', '0.0000', '380.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-01 12:39:26', null);
INSERT INTO `bus_goods` VALUES ('1902021347217371005268450', '2019020201100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '3800.00', null, '100.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '1800.00', '0.0000', '3800.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-02 13:47:21', null);
INSERT INTO `bus_goods` VALUES ('1902081025344031005855088', '2019020801100200001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 10:25:34', null);
INSERT INTO `bus_goods` VALUES ('1902081025344651005505670', '2019020801100200001', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 10:25:34', null);
INSERT INTO `bus_goods` VALUES ('1902081025344771005604162', '2019020801100200001', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-08 10:25:34', null);
INSERT INTO `bus_goods` VALUES ('1902081102018241005971829', '2019020801100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 11:02:01', null);
INSERT INTO `bus_goods` VALUES ('1902081102018851005043552', '2019020801100100001', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 11:02:01', null);
INSERT INTO `bus_goods` VALUES ('1902081102019031005192896', '2019020801100100001', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 11:02:01', null);
INSERT INTO `bus_goods` VALUES ('1902082218291021005301635', '2019020801100100002', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '3800.00', null, '100.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '1800.00', '0.0000', '3800.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-08 22:18:28', null);
INSERT INTO `bus_goods` VALUES ('1902082218291621005092875', '2019020801100100002', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-08 22:18:28', null);
INSERT INTO `bus_goods` VALUES ('1902102247082021005867689', '2019021001100100001', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '137.41', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '137.4100', '30.00', '0.5900', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:47:08', null);
INSERT INTO `bus_goods` VALUES ('1902102247082701005522887', '2019021001100100001', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '147.36', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '147.3600', '20.00', '0.6400', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:47:08', null);
INSERT INTO `bus_goods` VALUES ('1902102250102561005899721', '2019021001100100002', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '77.66', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '77.6600', '10.00', '0.3400', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:50:09', null);
INSERT INTO `bus_goods` VALUES ('1902102250107721005423437', '2019021001100100002', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '137.41', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '137.4100', '30.00', '0.5900', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:50:09', null);
INSERT INTO `bus_goods` VALUES ('1902102251402891005418482', '2019021001100100003', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '208.00', null, '1.00', '20', null, null, '148.00', '238.00', '208.00', '208.0000', '30.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403071005336726', '2019021001100100003', '2', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-42°', '', '1010', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403251005910237', '2019021001100100003', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403401005222570', '2019021001100100003', '4', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403561005357248', '2019021001100100003', '5', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-42°', '', '1012', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403731005556607', '2019021001100100003', '6', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251403891005768207', '2019021001100100003', '7', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251404041005467463', '2019021001100100003', '8', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-42°', '', '1007', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251404261005880428', '2019021001100100003', '9', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251404441005742776', '2019021001100100003', '10', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-42°', '', '1003', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251404691005759521', '2019021001100100003', '11', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102251404911005960743', '2019021001100100003', '12', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 22:51:40', null);
INSERT INTO `bus_goods` VALUES ('1902102317005321005503069', '2019021001100100004', '1', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天顺-46°', '', '1014', null, null, null, null, '348.00', null, '1.00', '20', null, null, '268.00', '398.00', '348.00', '348.0000', '50.00', '0.0000', '348.00', '0.0000', null, '\0', '0.00', '0.00', null, '46°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317005911005612596', '2019021001100100004', '2', null, '白酒', '10', '杜康', '10', null, '中华杜康贵宾-50.8°', '', '1020', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '98.00', '78.00', '78.0000', '20.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '50.8°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006041005799222', '2019021001100100004', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天顺-60°', '', '1015', null, null, null, null, '348.00', null, '1.00', '20', null, null, '268.00', '398.00', '348.00', '348.0000', '50.00', '0.0000', '348.00', '0.0000', null, '\0', '0.00', '0.00', null, '60°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006171005111101', '2019021001100100004', '4', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克传奇2015干红', '', '2022', null, null, null, null, '138.00', null, '1.00', '20', null, null, '48.00', '198.00', '138.00', '138.0000', '60.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006301005541858', '2019021001100100004', '5', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红', '', '2020', null, null, null, null, '128.00', null, '1.00', '20', null, null, '70.00', '168.00', '128.00', '128.0000', '40.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006441005360687', '2019021001100100004', '6', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克男爵干红(红标)', '', '2014', null, null, null, null, '70.00', null, '1.00', '20', null, null, '34.00', '118.00', '70.00', '70.0000', '48.00', '0.0000', '70.00', '0.0000', null, '\0', '0.00', '0.00', null, '红标', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006581005879916', '2019021001100100004', '7', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006691005968221', '2019021001100100004', '8', null, '葡萄酒', '20', '--', '99', null, '冰酒(皮盒2支装)', '', '1904', null, null, null, null, '580.00', null, '1.00', '20', null, null, '0.00', '780.00', '580.00', '580.0000', '200.00', '0.0000', '580.00', '0.0000', null, '\0', '0.00', '0.00', null, '皮盒2支装', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006811005814081', '2019021001100100004', '9', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317006971005462165', '2019021001100100004', '10', null, '白酒', '10', '杜康', '10', null, '中华杜康贵宾-41.8°', '', '1019', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '98.00', '78.00', '78.0000', '20.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007141005325106', '2019021001100100004', '11', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红(3L装)2015', '', '2011', null, null, null, null, '598.00', null, '1.00', '20', null, null, '0.00', '798.00', '598.00', '598.0000', '200.00', '0.0000', '598.00', '0.0000', null, '\0', '0.00', '0.00', null, '(3L装)2015', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007291005916991', '2019021001100100004', '12', null, '白酒', '10', '杜康', '10', null, '杜康特酿-38°', '', '1017', null, null, null, null, '128.00', null, '1.00', '20', null, null, '0.00', '178.00', '128.00', '128.0000', '50.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '38°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007431005765284', '2019021001100100004', '13', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007591005891184', '2019021001100100004', '14', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族红干红', '', '2004', null, null, null, null, '398.00', null, '1.00', '20', null, null, '258.00', '658.00', '398.00', '398.0000', '260.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007751005061593', '2019021001100100004', '15', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317007911005304704', '2019021001100100004', '16', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克酒庄干红', '', '2018', null, null, null, null, '88.00', null, '1.00', '20', null, null, '48.00', '128.00', '88.00', '88.0000', '40.00', '0.0000', '88.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317008271005432855', '2019021001100100004', '17', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '208.00', null, '1.00', '20', null, null, '148.00', '238.00', '208.00', '208.0000', '30.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317008411005816425', '2019021001100100004', '18', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317008531005463044', '2019021001100100004', '19', null, '白酒', '10', '杜康', '10', null, '杜康特调VIP品鉴酒-46°', '', '1016', null, null, null, null, '198.00', null, '1.00', '20', null, null, '138.00', '268.00', '198.00', '198.0000', '70.00', '0.0000', '198.00', '0.0000', null, '\0', '0.00', '0.00', null, '46°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317008661005468891', '2019021001100100004', '20', null, '白酒', '10', '杜康', '10', null, '中华杜康10年-50.8°', '', '1023', null, null, null, null, '288.00', null, '1.00', '20', null, null, '166.00', '318.00', '288.00', '288.0000', '30.00', '0.0000', '288.00', '0.0000', null, '\0', '0.00', '0.00', null, '50.8°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317008851005692220', '2019021001100100004', '21', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克赤霞珠干红', '', '2008', null, null, null, null, '58.00', null, '1.00', '20', null, null, '28.00', '98.00', '58.00', '58.0000', '40.00', '0.0000', '58.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009021005778899', '2019021001100100004', '22', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族金干红', '', '2005', null, null, null, null, '258.00', null, '1.00', '20', null, null, '136.00', '398.00', '258.00', '258.0000', '140.00', '0.0000', '258.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009191005474720', '2019021001100100004', '23', null, '白酒', '10', '--', '99', null, '南湖壹号', '', '1901', null, null, null, null, '398.00', null, '1.00', '20', null, null, '288.00', '618.00', '398.00', '398.0000', '220.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009341005360714', '2019021001100100004', '24', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克金章干白', '', '2003', null, null, null, null, '108.00', null, '1.00', '20', null, null, '60.00', '158.00', '108.00', '108.0000', '50.00', '0.0000', '108.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009481005063056', '2019021001100100004', '25', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-42°', '', '1010', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009601005003860', '2019021001100100004', '26', null, '白酒', '10', '杜康', '10', null, '杜康珍藏1973-38°', '', '1018', null, null, null, null, '298.00', null, '1.00', '20', null, null, '228.00', '328.00', '298.00', '298.0000', '30.00', '0.0000', '298.00', '0.0000', null, '\0', '0.00', '0.00', null, '38°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009731005735792', '2019021001100100004', '27', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-42°', '', '1007', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009831005826847', '2019021001100100004', '28', null, '葡萄酒', '20', '科乐克', '20', null, '冰酒', '', '1906', null, null, null, null, '145.00', null, '1.00', '20', null, null, '0.00', '213.00', '145.00', '145.0000', '68.00', '0.0000', '145.00', '0.0000', null, '\0', '0.00', '0.00', null, '单支', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317009921005764352', '2019021001100100004', '29', null, '白酒', '10', '杜康', '10', null, '中华杜康10年品鉴-41.8°', '', '1021', null, null, null, null, '268.00', null, '1.00', '20', null, null, '156.00', '288.00', '268.00', '268.0000', '20.00', '0.0000', '268.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010021005529890', '2019021001100100004', '30', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克康萨城堡干红', '', '2017', null, null, null, null, '168.00', null, '1.00', '20', null, null, '98.00', '238.00', '168.00', '168.0000', '70.00', '0.0000', '168.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010131005928492', '2019021001100100004', '31', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克金章708干红', '', '2002', null, null, null, null, '128.00', null, '1.00', '20', null, null, '86.00', '168.00', '128.00', '128.0000', '40.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010251005213756', '2019021001100100004', '32', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克波尔多干红', '', '2019', null, null, null, null, '58.00', null, '1.00', '20', null, null, '38.00', '98.00', '58.00', '58.0000', '40.00', '0.0000', '58.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010361005228789', '2019021001100100004', '33', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-60°', '', '1013', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '60°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010471005785017', '2019021001100100004', '34', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-42°', '', '1012', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010581005890203', '2019021001100100004', '35', null, '辅料', '100', '--', '99', null, '冰酒6支装木盒', '', '1907', null, null, null, null, '10.00', null, '1.00', '10', null, null, '0.00', '2.00', '10.00', '10.0000', '-8.00', '0.0000', '10.00', '0.0000', null, '\0', '0.00', '0.00', null, '盒子', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010681005065401', '2019021001100100004', '36', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克金章318干红', '', '2001', null, null, null, null, '178.00', null, '1.00', '20', null, null, '106.00', '248.00', '178.00', '178.0000', '70.00', '0.0000', '178.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010811005929310', '2019021001100100004', '37', null, '白酒', '10', '杜康', '10', null, '中华杜康10年-41.8°', '', '1022', null, null, null, null, '288.00', null, '1.00', '20', null, null, '166.00', '318.00', '288.00', '288.0000', '30.00', '0.0000', '288.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317010931005194866', '2019021001100100004', '38', null, '辅料', '100', '--', '99', null, '精品皮盒', '', '1905', null, null, null, null, '40.00', null, '1.00', '10', null, null, '35.00', '50.00', '40.00', '40.0000', '10.00', '0.0000', '40.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011021005008252', '2019021001100100004', '39', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011141005144476', '2019021001100100004', '40', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011251005742189', '2019021001100100004', '41', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克尚宝龙城堡', '', '2021', null, null, null, null, '580.00', null, '1.00', '20', null, null, '225.00', '980.00', '580.00', '580.0000', '400.00', '0.0000', '580.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011361005048070', '2019021001100100004', '42', null, '葡萄酒', '20', '--', '99', null, '冰酒(木盒2支装)', '', '1903', null, null, null, null, '380.00', null, '1.00', '20', null, null, '0.00', '580.00', '380.00', '380.0000', '200.00', '0.0000', '380.00', '0.0000', null, '\0', '0.00', '0.00', null, '木盒2支装', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011501005763689', '2019021001100100004', '43', null, '白酒', '10', '杜康', '10', null, '杜康珍藏年份小酒-52°', '', '1024', null, null, null, null, '48.00', null, '1.00', '20', null, null, '36.00', '68.00', '48.00', '48.0000', '20.00', '0.0000', '48.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011611005152667', '2019021001100100004', '44', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-42°', '', '1003', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011741005460365', '2019021001100100004', '45', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克红标小教堂', '', '2016', null, null, null, null, '68.00', null, '1.00', '20', null, null, '32.00', '108.00', '68.00', '68.0000', '40.00', '0.0000', '68.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011841005924348', '2019021001100100004', '46', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克风车干红', '', '2007', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '118.00', '78.00', '78.0000', '40.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317011961005018621', '2019021001100100004', '47', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族银干红', '', '2006', null, null, null, null, '208.00', null, '1.00', '20', null, null, '116.00', '298.00', '208.00', '208.0000', '90.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102317012071005416109', '2019021001100100004', '48', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红(3L装)2016', '', '2010', null, null, null, null, '398.00', null, '1.00', '20', null, null, '0.00', '598.00', '398.00', '398.0000', '200.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '(3L装)2016', '', '2019-02-10 23:17:00', null);
INSERT INTO `bus_goods` VALUES ('1902102339283711005823604', '2019021001100100005', '1', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克风车干红', '', '2007', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '118.00', '78.00', '78.0000', '40.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339284251005943987', '2019021001100100005', '2', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红(3L装)2016', '', '2010', null, null, null, null, '398.00', null, '1.00', '20', null, null, '0.00', '598.00', '398.00', '398.0000', '200.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '(3L装)2016', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339284451005084804', '2019021001100100005', '3', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-42°', '', '1005', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339284671005325514', '2019021001100100005', '4', null, '白酒', '10', '杜康', '10', null, '中华杜康贵宾-41.8°', '', '1019', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '98.00', '78.00', '78.0000', '20.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339284881005030996', '2019021001100100005', '5', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克波尔多干红', '', '2019', null, null, null, null, '58.00', null, '1.00', '20', null, null, '38.00', '98.00', '58.00', '58.0000', '40.00', '0.0000', '58.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285071005692429', '2019021001100100005', '6', null, '葡萄酒', '20', '--', '99', null, '冰酒(木盒2支装)', '', '1903', null, null, null, null, '380.00', null, '1.00', '20', null, null, '0.00', '580.00', '380.00', '380.0000', '200.00', '0.0000', '380.00', '0.0000', null, '\0', '0.00', '0.00', null, '木盒2支装', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285281005409121', '2019021001100100005', '7', null, '白酒', '10', '杜康', '10', null, '杜康珍酿8号-52°', '', '1009', null, null, null, null, '208.00', null, '1.00', '20', null, null, '148.00', '238.00', '208.00', '208.0000', '30.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285441005504150', '2019021001100100005', '8', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克酒庄干红', '', '2018', null, null, null, null, '88.00', null, '1.00', '20', null, null, '48.00', '128.00', '88.00', '88.0000', '40.00', '0.0000', '88.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285571005046620', '2019021001100100005', '9', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-52°', '', '1004', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285701005434719', '2019021001100100005', '10', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-42°', '', '1010', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285841005963104', '2019021001100100005', '11', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-42°', '', '1001', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339285971005817736', '2019021001100100005', '12', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-60°', '', '1013', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '60°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339286141005641852', '2019021001100100005', '13', null, '白酒', '10', '杜康', '10', null, '中华杜康10年-41.8°', '', '1022', null, null, null, null, '288.00', null, '1.00', '20', null, null, '166.00', '318.00', '288.00', '288.0000', '30.00', '0.0000', '288.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339286261005208772', '2019021001100100005', '14', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克赤霞珠干红', '', '2008', null, null, null, null, '58.00', null, '1.00', '20', null, null, '28.00', '98.00', '58.00', '58.0000', '40.00', '0.0000', '58.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339286391005945485', '2019021001100100005', '15', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克传奇2015干红', '', '2022', null, null, null, null, '138.00', null, '1.00', '20', null, null, '48.00', '198.00', '138.00', '138.0000', '60.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339286531005981730', '2019021001100100005', '16', null, '白酒', '10', '杜康', '10', null, '杜康珍藏5号-52°', '', '1006', null, null, null, null, '138.00', null, '1.00', '20', null, null, '88.00', '168.00', '138.00', '138.0000', '30.00', '0.0000', '138.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339286901005862747', '2019021001100100005', '17', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族银干红', '', '2006', null, null, null, null, '208.00', null, '1.00', '20', null, null, '116.00', '298.00', '208.00', '208.0000', '90.00', '0.0000', '208.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287041005490381', '2019021001100100005', '18', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克金章708干红', '', '2002', null, null, null, null, '128.00', null, '1.00', '20', null, null, '86.00', '168.00', '128.00', '128.0000', '40.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287161005528639', '2019021001100100005', '19', null, '白酒', '10', '杜康', '10', null, '杜康特酿-38°', '', '1017', null, null, null, null, '128.00', null, '1.00', '20', null, null, '0.00', '178.00', '128.00', '128.0000', '50.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '38°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287301005898444', '2019021001100100005', '20', null, '白酒', '10', '杜康', '10', null, '中华杜康贵宾-50.8°', '', '1020', null, null, null, null, '78.00', null, '1.00', '20', null, null, '46.00', '98.00', '78.00', '78.0000', '20.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '50.8°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287441005256024', '2019021001100100005', '21', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族金干红', '', '2005', null, null, null, null, '258.00', null, '1.00', '20', null, null, '136.00', '398.00', '258.00', '258.0000', '140.00', '0.0000', '258.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287581005964264', '2019021001100100005', '22', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红(3L装)2015', '', '2011', null, null, null, null, '598.00', null, '1.00', '20', null, null, '0.00', '798.00', '598.00', '598.0000', '200.00', '0.0000', '598.00', '0.0000', null, '\0', '0.00', '0.00', null, '(3L装)2015', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339287731005180440', '2019021001100100005', '23', null, '辅料', '100', '--', '99', null, '精品皮盒', '', '1905', null, null, null, null, '40.00', null, '1.00', '10', null, null, '35.00', '50.00', '40.00', '40.0000', '10.00', '0.0000', '40.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339288461005672420', '2019021001100100005', '24', null, '白酒', '10', '杜康', '10', null, '杜康珍藏2号-42°', '', '1003', null, null, null, null, '78.00', null, '1.00', '20', null, null, '48.00', '88.00', '78.00', '78.0000', '10.00', '0.0000', '78.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339288591005235807', '2019021001100100005', '25', null, '白酒', '10', '杜康', '10', null, '杜康珍藏1973-38°', '', '1018', null, null, null, null, '298.00', null, '1.00', '20', null, null, '228.00', '328.00', '298.00', '298.0000', '30.00', '0.0000', '298.00', '0.0000', null, '\0', '0.00', '0.00', null, '38°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339288711005941871', '2019021001100100005', '26', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-52°', '', '1008', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339288821005933144', '2019021001100100005', '27', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克城堡干红', '', '2020', null, null, null, null, '128.00', null, '1.00', '20', null, null, '70.00', '168.00', '128.00', '128.0000', '40.00', '0.0000', '128.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339288941005094096', '2019021001100100005', '28', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆8号-52°', '', '1011', null, null, null, null, '328.00', null, '1.00', '20', null, null, '168.00', '368.00', '328.00', '328.0000', '40.00', '0.0000', '328.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289091005553581', '2019021001100100005', '29', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天合-42°', '', '1012', null, null, null, null, '248.00', null, '1.00', '20', null, null, '158.00', '288.00', '248.00', '248.0000', '40.00', '0.0000', '248.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289221005085867', '2019021001100100005', '30', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克男爵干红(红标)', '', '2014', null, null, null, null, '70.00', null, '1.00', '20', null, null, '34.00', '118.00', '70.00', '70.0000', '48.00', '0.0000', '70.00', '0.0000', null, '\0', '0.00', '0.00', null, '红标', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289351005758637', '2019021001100100005', '31', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天顺-60°', '', '1015', null, null, null, null, '348.00', null, '1.00', '20', null, null, '268.00', '398.00', '348.00', '348.0000', '50.00', '0.0000', '348.00', '0.0000', null, '\0', '0.00', '0.00', null, '60°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289551005881044', '2019021001100100005', '32', null, '白酒', '10', '杜康', '10', null, '中华杜康10年-50.8°', '', '1023', null, null, null, null, '288.00', null, '1.00', '20', null, null, '166.00', '318.00', '288.00', '288.0000', '30.00', '0.0000', '288.00', '0.0000', null, '\0', '0.00', '0.00', null, '50.8°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289701005790686', '2019021001100100005', '33', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克尚宝龙城堡', '', '2021', null, null, null, null, '580.00', null, '1.00', '20', null, null, '225.00', '980.00', '580.00', '580.0000', '400.00', '0.0000', '580.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339289861005257543', '2019021001100100005', '34', null, '白酒', '10', '--', '99', null, '南湖壹号', '', '1901', null, null, null, null, '398.00', null, '1.00', '20', null, null, '288.00', '618.00', '398.00', '398.0000', '220.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290001005785234', '2019021001100100005', '35', null, '白酒', '10', '杜康', '10', null, '杜康特调VIP品鉴酒-46°', '', '1016', null, null, null, null, '198.00', null, '1.00', '20', null, null, '138.00', '268.00', '198.00', '198.0000', '70.00', '0.0000', '198.00', '0.0000', null, '\0', '0.00', '0.00', null, '46°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290161005311560', '2019021001100100005', '36', null, '白酒', '10', '杜康', '10', null, '中华杜康10年品鉴-41.8°', '', '1021', null, null, null, null, '268.00', null, '1.00', '20', null, null, '156.00', '288.00', '268.00', '268.0000', '20.00', '0.0000', '268.00', '0.0000', null, '\0', '0.00', '0.00', null, '41.8°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290341005239256', '2019021001100100005', '37', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克康萨城堡干红', '', '2017', null, null, null, null, '168.00', null, '1.00', '20', null, null, '98.00', '238.00', '168.00', '168.0000', '70.00', '0.0000', '168.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290471005021917', '2019021001100100005', '38', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克红标小教堂', '', '2016', null, null, null, null, '68.00', null, '1.00', '20', null, null, '32.00', '108.00', '68.00', '68.0000', '40.00', '0.0000', '68.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290591005099938', '2019021001100100005', '39', null, '白酒', '10', '杜康', '10', null, '杜康珍藏15号-52°', '', '1002', null, null, null, null, '38.00', null, '1.00', '20', null, null, '28.00', '56.00', '38.00', '38.0000', '18.00', '0.0000', '38.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290721005442445', '2019021001100100005', '40', null, '白酒', '10', '杜康', '10', null, '杜康珍藏年份小酒-52°', '', '1024', null, null, null, null, '48.00', null, '1.00', '20', null, null, '36.00', '68.00', '48.00', '48.0000', '20.00', '0.0000', '48.00', '0.0000', null, '\0', '0.00', '0.00', null, '52°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290831005738009', '2019021001100100005', '41', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克贵族红干红', '', '2004', null, null, null, null, '398.00', null, '1.00', '20', null, null, '258.00', '658.00', '398.00', '398.0000', '260.00', '0.0000', '398.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339290951005956120', '2019021001100100005', '42', null, '葡萄酒', '20', '科乐克', '20', null, '科乐克金章干白', '', '2003', null, null, null, null, '108.00', null, '1.00', '20', null, null, '60.00', '158.00', '108.00', '108.0000', '50.00', '0.0000', '108.00', '0.0000', null, '\0', '0.00', '0.00', null, '--', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339291111005916570', '2019021001100100005', '43', null, '葡萄酒', '20', '--', '99', null, '冰酒(皮盒2支装)', '', '1904', null, null, null, null, '580.00', null, '1.00', '20', null, null, '0.00', '780.00', '580.00', '580.0000', '200.00', '0.0000', '580.00', '0.0000', null, '\0', '0.00', '0.00', null, '皮盒2支装', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339291301005934291', '2019021001100100005', '44', null, '白酒', '10', '杜康', '10', null, '杜康珍藏6号-42°', '', '1007', null, null, null, null, '148.00', null, '1.00', '20', null, null, '108.00', '168.00', '148.00', '148.0000', '20.00', '0.0000', '148.00', '0.0000', null, '\0', '0.00', '0.00', null, '42°', '', '2019-02-10 23:39:28', null);
INSERT INTO `bus_goods` VALUES ('1902102339291461005719028', '2019021001100100005', '45', null, '白酒', '10', '杜康', '10', null, '杜康珍藏原浆天顺-46°', '', '1014', null, null, null, null, '348.00', null, '1.00', '20', null, null, '268.00', '398.00', '348.00', '348.0000', '50.00', '0.0000', '348.00', '0.0000', null, '\0', '0.00', '0.00', null, '46°', '', '2019-02-10 23:39:28', null);

-- ----------------------------
-- Table structure for bus_inv_sku
-- ----------------------------
DROP TABLE IF EXISTS `bus_inv_sku`;
CREATE TABLE `bus_inv_sku` (
  `id` varchar(32) NOT NULL,
  `sku` varchar(32) NOT NULL COMMENT 'sku',
  `shop_id` varchar(32) NOT NULL COMMENT '店铺id',
  `qty` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '库存数量',
  `lock_qty` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '锁定数量',
  `damaged_qty` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '破损数量',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存汇总表';

-- ----------------------------
-- Records of bus_inv_sku
-- ----------------------------
INSERT INTO `bus_inv_sku` VALUES ('1901291003538791006797545', '1001', '1812091925576891014843595', '-225.00', '0.00', '1.00', null, '2019-01-29 10:03:53', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291016260391006342433', '1002', '1812091925576891014843595', '-10.00', '0.00', '1.00', null, '2019-01-29 10:16:26', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1901291016260651006469206', '1003', '1812091925576891014843595', '-7.00', '0.00', '1.00', null, '2019-01-29 10:16:26', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291024012981006630745', '1302', '1812091925576891014843595', '2.00', '0.00', '0.00', null, '2019-01-29 10:24:01', '2019-02-10 23:00:49');
INSERT INTO `bus_inv_sku` VALUES ('1901291116086931006439180', '1004', '1812091925576891014843595', '-7.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087121006925252', '1005', '1812091925576891014843595', '-16.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087281006975412', '1006', '1812091925576891014843595', '-8.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087461006873109', '1007', '1812091925576891014843595', '-6.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087611006424472', '1008', '1812091925576891014843595', '-8.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087751006511784', '1009', '1812091925576891014843595', '-6.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087871006999596', '1010', '1812091925576891014843595', '-6.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116087981006405352', '1011', '1812091925576891014843595', '-6.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901291116088101006544274', '1012', '1812091925576891014843595', '-5.00', '0.00', '1.00', null, '2019-01-29 11:16:08', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1901300946155331006389229', '1001', '1812091930141101014954604', '3.00', '0.00', '0.00', null, '2019-01-30 09:46:15', '2019-02-12 02:41:19');
INSERT INTO `bus_inv_sku` VALUES ('1901300946155471006532744', '1002', '1812091930141101014954604', '0.00', '0.00', '0.00', null, '2019-01-30 09:46:15', '2019-02-08 10:25:34');
INSERT INTO `bus_inv_sku` VALUES ('1901300946155601006877109', '1008', '1812091930141101014954604', '0.00', '0.00', '0.00', null, '2019-01-30 09:46:15', '2019-02-12 03:06:07');
INSERT INTO `bus_inv_sku` VALUES ('1901300946155721006221122', '1011', '1812091930141101014954604', '21.00', '0.00', '0.00', null, '2019-01-30 09:46:15', '2019-02-12 02:39:40');
INSERT INTO `bus_inv_sku` VALUES ('1902081026283631006801389', '1003', '1812091930141101014954604', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', '2019-02-12 03:06:07');
INSERT INTO `bus_inv_sku` VALUES ('1902081026283811006744885', '1005', '1812091930141101014954604', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', '2019-02-12 03:06:07');
INSERT INTO `bus_inv_sku` VALUES ('1902081026283951006594396', '1006', '1812091930141101014954604', '0.00', '0.00', '0.00', null, '2019-02-08 10:26:28', '2019-02-08 10:26:46');
INSERT INTO `bus_inv_sku` VALUES ('1902081026284211006626299', '1010', '1812091930141101014954604', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', '2019-02-12 03:06:07');
INSERT INTO `bus_inv_sku` VALUES ('1902081027116691006963021', '1007', '1812091930141101014954604', '1.00', '0.00', '0.00', null, '2019-02-08 10:27:11', '2019-02-12 03:06:07');
INSERT INTO `bus_inv_sku` VALUES ('1902102300489621006611252', '1013', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300489821006908830', '1014', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300489961006618849', '1015', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490271006042136', '1016', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490451006624461', '1017', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490591006389170', '1018', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490721006028863', '1019', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490841006040982', '1020', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300490961006878343', '1021', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300491091006135300', '1022', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300491211006727225', '1023', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300491341006245203', '1024', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300491491006823661', '1301', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300491791006231208', '1901', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300491921006326237', '1902', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300492051006794531', '1903', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492181006080799', '1904', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492301006988103', '1905', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492431006471329', '1906', '1812091925576891014843595', '0.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:17:00');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492571006486609', '1907', '1812091925576891014843595', '0.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:17:01');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492721006108325', '2001', '1812091925576891014843595', '0.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:17:01');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492841006176299', '2002', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300492991006712869', '2003', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493131006681850', '2004', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493271006396805', '2005', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493371006153827', '2006', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493491006442803', '2007', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493621006698617', '2008', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300493731006101427', '2009', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300493871006345939', '2010', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494011006714622', '2011', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494131006829300', '2012', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300494231006031010', '2014', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494341006719443', '2015', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300494451006480421', '2016', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494561006651073', '2017', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:29');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494691006487897', '2018', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494821006665342', '2019', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300494931006672044', '2020', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300495051006171380', '2021', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300495191006186037', '2022', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', '2019-02-10 23:39:28');
INSERT INTO `bus_inv_sku` VALUES ('1902102300495331006392206', '3001', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300495471006750084', '3002', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902102300495591006606806', '3003', '1812091925576891014843595', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku` VALUES ('1902111717502771006603984', '1004', '1812091930141101014954604', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);

-- ----------------------------
-- Table structure for bus_inv_sku_details
-- ----------------------------
DROP TABLE IF EXISTS `bus_inv_sku_details`;
CREATE TABLE `bus_inv_sku_details` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `trade_type` char(3) DEFAULT NULL COMMENT '单据类型',
  `trade_status` char(3) DEFAULT '0' COMMENT '交易状态',
  `trade_order_no` varchar(32) DEFAULT NULL COMMENT '交易单号',
  `trade_relation_no` varchar(32) DEFAULT NULL COMMENT '交易单关联单号(1、采购入库->申请单号,2、调拨入库->调拨出库单号)',
  `trade_order_detail_id` varchar(32) DEFAULT NULL COMMENT '交易商品明细主键',
  `trade_line_no` int(11) DEFAULT NULL COMMENT '单据行号',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `is_pull` smallint(6) DEFAULT '0' COMMENT '是否入库批次',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `lot_num` varchar(32) DEFAULT '0' COMMENT '批次号',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `qty` decimal(18,2) DEFAULT '0.00' COMMENT '可用数量',
  `lock_qty` decimal(18,2) DEFAULT '0.00' COMMENT '锁定数量',
  `damaged_qty` decimal(18,2) DEFAULT '0.00' COMMENT '破损数量',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店订单批次明细表';

-- ----------------------------
-- Records of bus_inv_sku_details
-- ----------------------------
INSERT INTO `bus_inv_sku_details` VALUES ('1901291003538701007075274', '22', 'A20', '2019012922100100001', null, '1901291003538621018926166', '1', '2019-01-29 10:03:53', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-29 10:03:53', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291004087461007786843', '14', '30', '2019012901100100001', null, '1901291004087161005086458', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291016259861007175442', '12', 'B20', '2019012912100100001', null, '1901291016258561020556111', '1', '2019-01-29 10:16:25', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-01-29 10:16:25', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291016260531007936507', '12', 'B20', '2019012912100100001', null, '1901291016260461020615490', '2', '2019-01-29 10:16:25', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-01-29 10:16:26', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291024012871007260198', '22', 'A20', '2019012922100100002', null, '1901291024012591018469486', '1', '2019-01-29 10:24:01', null, '1812091925576891014843595', '沈荡店仓', '1302', '剑南春-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-29 10:24:01', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291041503331007396522', '16', 'B20', '2019012916100100001', null, '1901291041503271020264881', '1', '2019-01-29 10:41:50', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-01-29 10:41:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291041503811007825578', '16', 'B20', '2019012916100100001', null, '1901291041503771020918269', '2', '2019-01-29 10:41:50', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-01-29 10:41:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116085671007734706', '15', 'B20', '2019012915100100001', null, '1901291116083951020941133', '1', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116086511007033796', '15', 'B20', '2019012915100100001', null, '1901291116086441020673644', '2', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116086671007082047', '15', 'B20', '2019012915100100001', null, '1901291116086621020406499', '3', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116086841007324861', '15', 'B20', '2019012915100100001', null, '1901291116086781020494062', '4', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087051007199150', '15', 'B20', '2019012915100100001', null, '1901291116086991020311979', '5', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087211007916625', '15', 'B20', '2019012915100100001', null, '1901291116087151020795932', '6', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087381007440774', '15', 'B20', '2019012915100100001', null, '1901291116087321020416714', '7', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087541007446656', '15', 'B20', '2019012915100100001', null, '1901291116087491020733070', '8', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087681007724841', '15', 'B20', '2019012915100100001', null, '1901291116087641020495735', '9', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087801007555408', '15', 'B20', '2019012915100100001', null, '1901291116087771020634702', '10', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116087931007938161', '15', 'B20', '2019012915100100001', null, '1901291116087891020326181', '11', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291116088051007277790', '15', 'B20', '2019012915100100001', null, '1901291116088001020588047', '12', '2019-01-29 11:16:08', null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '1.00', null, '2019-01-29 11:16:08', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291203529681007235438', '14', '30', '2019012901100100002', null, '1901291203529381005644397', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-100.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901291203530521007899171', '14', '30', '2019012901100100002', null, '1901291203530451005163033', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-100.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823523611007783532', '14', '30', '2019013001100100001', null, '1901300823523221005837247', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823524171007019097', '14', '30', '2019013001100100001', null, '1901300823524111005628590', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823524371007365252', '14', '30', '2019013001100100001', null, '1901300823524311005118872', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823524581007335205', '14', '30', '2019013001100100001', null, '1901300823524511005828479', '4', null, null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823524791007533390', '14', '30', '2019013001100100001', null, '1901300823524731005238712', '5', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823525001007932091', '14', '30', '2019013001100100001', null, '1901300823524941005433176', '6', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823525261007235905', '14', '30', '2019013001100100001', null, '1901300823525191005409517', '7', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823525501007596300', '14', '30', '2019013001100100001', null, '1901300823525421005195133', '8', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823525731007350612', '14', '30', '2019013001100100001', null, '1901300823525671005804179', '9', null, null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823525921007231473', '14', '30', '2019013001100100001', null, '1901300823525861005101184', '10', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300823526131007940279', '14', '30', '2019013001100100001', null, '1901300823526071005085046', '11', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847187041007383814', '14', '30', '2019013001100100002', null, '1901300847186741005330478', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-10.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847187581007950289', '14', '30', '2019013001100100002', null, '1901300847187521005634338', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847187781007501589', '14', '30', '2019013001100100002', null, '1901300847187721005645684', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847187971007041149', '14', '30', '2019013001100100002', null, '1901300847187911005509828', '4', null, null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188171007563380', '14', '30', '2019013001100100002', null, '1901300847188111005961564', '5', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188341007637333', '14', '30', '2019013001100100002', null, '1901300847188291005297370', '6', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188491007433240', '14', '30', '2019013001100100002', null, '1901300847188441005881677', '7', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188651007799160', '14', '30', '2019013001100100002', null, '1901300847188591005425482', '8', null, null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188821007697409', '14', '30', '2019013001100100002', null, '1901300847188771005855040', '9', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847188991007066278', '14', '30', '2019013001100100002', null, '1901300847188951005488899', '10', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300847189161007465271', '14', '30', '2019013001100100002', null, '1901300847189101005629814', '11', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-10.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300946155221007019972', '22', 'A20', '2019013022100200001', null, '1901300946154991018666588', '1', '2019-01-30 09:46:15', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-30 09:46:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300946155411007073332', '22', 'A20', '2019013022100200001', null, '1901300946155371018646842', '2', '2019-01-30 09:46:15', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1002', '杜康珍藏15号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-30 09:46:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300946155541007037856', '22', 'A20', '2019013022100200001', null, '1901300946155501018740006', '3', '2019-01-30 09:46:15', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-30 09:46:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901300946155661007350390', '22', 'A20', '2019013022100200001', null, '1901300946155631018188329', '4', '2019-01-30 09:46:15', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-01-30 09:46:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901311326265771007766916', '14', '40', '2019012901100100002', null, '1901291203529381005644397', '1', '2019-01-31 13:26:26', null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '100.00', '0.00', '0.00', null, '2019-01-31 13:26:26', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1901311326267621007824566', '14', '40', '2019012901100100002', null, '1901291203530451005163033', '2', '2019-01-31 13:26:26', null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '100.00', '0.00', '0.00', null, '2019-01-31 13:26:26', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902011239268491007299636', '14', '30', '2019020101100100001', null, '1902011239268081005955122', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-10.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902021347217641007396646', '14', '30', '2019020201100100001', null, '1902021347217371005268450', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-100.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232579501007061105', '16', 'B20', '2019020716100100001', null, '1902071232578441020993660', '1', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:57', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580101007504052', '16', 'B20', '2019020716100100001', null, '1902071232580061020072742', '2', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580241007217141', '16', 'B20', '2019020716100100001', null, '1902071232580191020774787', '3', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580381007258727', '16', 'B20', '2019020716100100001', null, '1902071232580331020283362', '4', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580501007824735', '16', 'B20', '2019020716100100001', null, '1902071232580461020535378', '5', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580631007824425', '16', 'B20', '2019020716100100001', null, '1902071232580581020822676', '6', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580751007533512', '16', 'B20', '2019020716100100001', null, '1902071232580711020330920', '7', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232580871007020950', '16', 'B20', '2019020716100100001', null, '1902071232580841020367076', '8', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232581001007560405', '16', 'B20', '2019020716100100001', null, '1902071232580961020093605', '9', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232581111007789628', '16', 'B20', '2019020716100100001', null, '1902071232581071020722720', '10', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232581241007385460', '16', 'B20', '2019020716100100001', null, '1902071232581201020035374', '11', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071232581351007369899', '16', 'B20', '2019020716100100001', null, '1902071232581311020410785', '12', '2019-02-07 12:32:57', null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:32:58', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071237216631007164560', '16', 'B20', '2019020716100100002', null, '1902071237216561020791071', '1', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:37:21', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071237216801007263767', '16', 'B20', '2019020716100100002', null, '1902071237216751020000477', '2', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-10.00', '0.00', '0.00', null, '2019-02-07 12:37:21', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071237216961007249138', '16', 'B20', '2019020716100100002', null, '1902071237216931020335580', '3', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-130.00', '0.00', '0.00', null, '2019-02-07 12:37:21', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071237217181007947076', '16', 'B20', '2019020716100100002', null, '1902071237217051020444715', '4', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-07 12:37:21', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071308447791007004691', '16', 'B90', '2019020716100100002', null, '1902071237216561020791071', '1', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-07 13:08:44', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071308449051007298931', '16', 'B90', '2019020716100100002', null, '1902071237216751020000477', '2', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '10.00', '0.00', '0.00', null, '2019-02-07 13:08:44', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071308449181007633489', '16', 'B90', '2019020716100100002', null, '1902071237216931020335580', '3', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '130.00', '0.00', '0.00', null, '2019-02-07 13:08:44', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902071308449291007094575', '16', 'B90', '2019020716100100002', null, '1902071237217051020444715', '4', '2019-02-07 12:37:21', null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-07 13:08:44', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081025344311007627999', '14', '30', '2019020801100200001', null, '1902081025344031005855088', '1', null, null, '1812091930141101014954604', '嘉兴秀洲店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081025344681007036818', '14', '30', '2019020801100200001', null, '1902081025344651005505670', '2', null, null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081025344811007790268', '14', '30', '2019020801100200001', null, '1902081025344771005604162', '3', null, null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026283391007754967', '22', 'A20', '2019020822100200001', null, '1902081026283201018151475', '1', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026283571007269487', '22', 'A20', '2019020822100200001', null, '1902081026283491018382597', '2', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1003', '杜康珍藏2号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026283731007276235', '22', 'A20', '2019020822100200001', null, '1902081026283671018762788', '3', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1005', '杜康珍藏5号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026283891007343499', '22', 'A20', '2019020822100200001', null, '1902081026283851018654443', '4', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1006', '杜康珍藏5号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026284011007962001', '22', 'A20', '2019020822100200001', null, '1902081026283981018383304', '5', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026284141007628998', '22', 'A20', '2019020822100200001', null, '1902081026284111018341205', '6', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:26:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026465581007492031', '22', 'A90', '2019020822100200001', null, '1902081026283201018151475', '1', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026465731007811462', '22', 'A90', '2019020822100200001', null, '1902081026283491018382597', '2', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026465811007448784', '22', 'A90', '2019020822100200001', null, '1902081026283671018762788', '3', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026465911007780047', '22', 'A90', '2019020822100200001', null, '1902081026283851018654443', '4', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026466001007496585', '22', 'A90', '2019020822100200001', null, '1902081026283981018383304', '5', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081026466181007937725', '22', 'A90', '2019020822100200001', null, '1902081026284111018341205', '6', '2019-02-08 10:26:28', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:26:46', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081027116561007038643', '12', 'B20', '2019020812100200001', null, '1902081027116401020613265', '1', '2019-02-08 10:27:11', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-08 10:27:11', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081027157011007960510', '12', 'B90', '2019020812100200001', null, '1902081027116401020613265', '1', '2019-02-08 10:27:11', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1007', '杜康珍藏6号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-08 10:27:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081102018511007274340', '14', '30', '2019020801100100001', null, '1902081102018241005971829', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081102018891007233326', '14', '30', '2019020801100100001', null, '1902081102018851005043552', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902081102019081007591757', '14', '30', '2019020801100100001', null, '1902081102019031005192896', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902082218291271007784192', '14', '30', '2019020801100100002', null, '1902082218291021005301635', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-100.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902082218291681007529904', '14', '30', '2019020801100100002', null, '1902082218291621005092875', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102247082331007929005', '14', '30', '2019021001100100001', null, '1902102247082021005867689', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102247082751007348410', '14', '30', '2019021001100100001', null, '1902102247082701005522887', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102250104841007500919', '14', '30', '2019021001100100002', null, '1902102250102561005899721', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102250107911007093925', '14', '30', '2019021001100100002', null, '1902102250107721005423437', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251402951007672974', '14', '30', '2019021001100100003', null, '1902102251402891005418482', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403151007982318', '14', '30', '2019021001100100003', null, '1902102251403071005336726', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403301007980493', '14', '30', '2019021001100100003', null, '1902102251403251005910237', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403461007781920', '14', '30', '2019021001100100003', null, '1902102251403401005222570', '4', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403601007257722', '14', '30', '2019021001100100003', null, '1902102251403561005357248', '5', null, null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403781007752204', '14', '30', '2019021001100100003', null, '1902102251403731005556607', '6', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251403941007144974', '14', '30', '2019021001100100003', null, '1902102251403891005768207', '7', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251404141007233526', '14', '30', '2019021001100100003', null, '1902102251404041005467463', '8', null, null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251404311007480389', '14', '30', '2019021001100100003', null, '1902102251404261005880428', '9', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251404501007412169', '14', '30', '2019021001100100003', null, '1902102251404441005742776', '10', null, null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251404761007045505', '14', '30', '2019021001100100003', null, '1902102251404691005759521', '11', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102251404961007672045', '14', '30', '2019021001100100003', null, '1902102251404911005960743', '12', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300487051007127186', '22', 'A20', '2019021022100100001', null, '1902102300485971018330532', '1', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300487481007331104', '22', 'A20', '2019021022100100001', null, '1902102300487431018048450', '2', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300487651007752814', '22', 'A20', '2019021022100100001', null, '1902102300487591018078341', '3', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300487811007367277', '22', 'A20', '2019021022100100001', null, '1902102300487751018890900', '4', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300487981007787826', '22', 'A20', '2019021022100100001', null, '1902102300487931018120088', '5', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300488151007827418', '22', 'A20', '2019021022100100001', null, '1902102300488101018405923', '6', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300488331007574046', '22', 'A20', '2019021022100100001', null, '1902102300488261018586358', '7', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300488521007903449', '22', 'A20', '2019021022100100001', null, '1902102300488461018654535', '8', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300488721007645012', '22', 'A20', '2019021022100100001', null, '1902102300488661018025128', '9', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300488881007156534', '22', 'A20', '2019021022100100001', null, '1902102300488831018219885', '10', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300489221007152286', '22', 'A20', '2019021022100100001', null, '1902102300489141018792250', '11', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300489411007692440', '22', 'A20', '2019021022100100001', null, '1902102300489351018473139', '12', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300489551007937895', '22', 'A20', '2019021022100100001', null, '1902102300489511018479590', '13', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1013', '杜康珍藏原浆天合-60°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300489741007739815', '22', 'A20', '2019021022100100001', null, '1902102300489691018429204', '14', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1014', '杜康珍藏原浆天顺-46°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300489891007007095', '22', 'A20', '2019021022100100001', null, '1902102300489851018661875', '15', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1015', '杜康珍藏原浆天顺-60°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:48', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490151007076870', '22', 'A20', '2019021022100100001', null, '1902102300489991018803809', '16', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1016', '杜康特调VIP品鉴酒-46°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490371007705293', '22', 'A20', '2019021022100100001', null, '1902102300490321018323223', '17', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1017', '杜康特酿-38°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490531007960136', '22', 'A20', '2019021022100100001', null, '1902102300490481018696827', '18', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1018', '杜康珍藏1973-38°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490651007620738', '22', 'A20', '2019021022100100001', null, '1902102300490621018643972', '19', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1019', '中华杜康贵宾-41.8°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490781007365684', '22', 'A20', '2019021022100100001', null, '1902102300490741018251410', '20', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1020', '中华杜康贵宾-50.8°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300490901007239524', '22', 'A20', '2019021022100100001', null, '1902102300490861018971695', '21', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1021', '中华杜康10年品鉴-41.8°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491021007386095', '22', 'A20', '2019021022100100001', null, '1902102300490981018211453', '22', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1022', '中华杜康10年-41.8°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491151007004266', '22', 'A20', '2019021022100100001', null, '1902102300491111018082101', '23', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1023', '中华杜康10年-50.8°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491271007990046', '22', 'A20', '2019021022100100001', null, '1902102300491231018091807', '24', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1024', '杜康珍藏年份小酒-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491421007013840', '22', 'A20', '2019021022100100001', null, '1902102300491371018838046', '25', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1301', '剑南春-38°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491591007483876', '22', 'A20', '2019021022100100001', null, '1902102300491541018818956', '26', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1302', '剑南春-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491721007190763', '22', 'A20', '2019021022100100001', null, '1902102300491681018086123', '27', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1901', '南湖壹号', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491861007661797', '22', 'A20', '2019021022100100001', null, '1902102300491821018556226', '28', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1902', '冰酒(木盒6支装)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300491981007948550', '22', 'A20', '2019021022100100001', null, '1902102300491941018402958', '29', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1903', '冰酒(木盒2支装)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492121007577518', '22', 'A20', '2019021022100100001', null, '1902102300492081018868890', '30', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1904', '冰酒(皮盒2支装)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492241007820284', '22', 'A20', '2019021022100100001', null, '1902102300492201018382752', '31', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1905', '精品皮盒', null, '10', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492361007148744', '22', 'A20', '2019021022100100001', null, '1902102300492321018368633', '32', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1906', '冰酒', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492501007033427', '22', 'A20', '2019021022100100001', null, '1902102300492451018643579', '33', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '1907', '冰酒6支装木盒', null, '10', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492651007640785', '22', 'A20', '2019021022100100001', null, '1902102300492601018876463', '34', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2001', '科乐克金章318干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492781007790604', '22', 'A20', '2019021022100100001', null, '1902102300492741018323784', '35', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2002', '科乐克金章708干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300492921007703338', '22', 'A20', '2019021022100100001', null, '1902102300492881018646439', '36', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2003', '科乐克金章干白', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493081007966807', '22', 'A20', '2019021022100100001', null, '1902102300493031018773079', '37', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2004', '科乐克贵族红干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493201007427746', '22', 'A20', '2019021022100100001', null, '1902102300493151018040511', '38', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2005', '科乐克贵族金干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493321007893420', '22', 'A20', '2019021022100100001', null, '1902102300493291018480081', '39', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2006', '科乐克贵族银干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493431007233559', '22', 'A20', '2019021022100100001', null, '1902102300493391018391094', '40', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2007', '科乐克风车干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493561007205614', '22', 'A20', '2019021022100100001', null, '1902102300493521018570314', '41', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2008', '科乐克赤霞珠干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493681007928264', '22', 'A20', '2019021022100100001', null, '1902102300493641018786253', '42', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2009', '科乐克城堡干红(3L简装)2016', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493791007272461', '22', 'A20', '2019021022100100001', null, '1902102300493761018305520', '43', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2010', '科乐克城堡干红(3L装)2016', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300493951007330819', '22', 'A20', '2019021022100100001', null, '1902102300493901018857518', '44', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2011', '科乐克城堡干红(3L装)2015', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494071007869214', '22', 'A20', '2019021022100100001', null, '1902102300494031018877002', '45', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2012', '科波拉金钻干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494181007416016', '22', 'A20', '2019021022100100001', null, '1902102300494151018142883', '46', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2014', '科乐克男爵干红(红标)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494291007433192', '22', 'A20', '2019021022100100001', null, '1902102300494251018079133', '47', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2015', '索罗金干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494401007565199', '22', 'A20', '2019021022100100001', null, '1902102300494361018011462', '48', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2016', '科乐克红标小教堂', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494511007608422', '22', 'A20', '2019021022100100001', null, '1902102300494471018896540', '49', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2017', '科乐克康萨城堡干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494621007841465', '22', 'A20', '2019021022100100001', null, '1902102300494581018978341', '50', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2018', '科乐克酒庄干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494761007080243', '22', 'A20', '2019021022100100001', null, '1902102300494711018059886', '51', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2019', '科乐克波尔多干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494871007969253', '22', 'A20', '2019021022100100001', null, '1902102300494841018997969', '52', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2020', '科乐克城堡干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300494981007933309', '22', 'A20', '2019021022100100001', null, '1902102300494951018176534', '53', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2021', '科乐克尚宝龙城堡', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300495131007292634', '22', 'A20', '2019021022100100001', null, '1902102300495081018235826', '54', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '2022', '科乐克传奇2015干红', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300495261007068980', '22', 'A20', '2019021022100100001', null, '1902102300495211018676405', '55', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '3001', '沈荡黄酒-8年足陈(小红坛)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300495401007071693', '22', 'A20', '2019021022100100001', null, '1902102300495351018763138', '56', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '3002', '沈荡黄酒-5年足陈(小陶坛)', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102300495531007066950', '22', 'A20', '2019021022100100001', null, '1902102300495491018281036', '57', '2019-02-10 23:00:48', null, '1812091925576891014843595', '沈荡店仓', '3003', '沈荡黄酒-窖藏花雕', null, '20', '1.00', '0.00', '0.00', null, '2019-02-10 23:00:49', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317005591007714357', '14', '30', '2019021001100100004', null, '1902102317005321005503069', '1', null, null, '1812091925576891014843595', '沈荡店仓', '1014', '杜康珍藏原浆天顺-46°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317005951007767219', '14', '30', '2019021001100100004', null, '1902102317005911005612596', '2', null, null, '1812091925576891014843595', '沈荡店仓', '1020', '中华杜康贵宾-50.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006091007520382', '14', '30', '2019021001100100004', null, '1902102317006041005799222', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1015', '杜康珍藏原浆天顺-60°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006211007642549', '14', '30', '2019021001100100004', null, '1902102317006171005111101', '4', null, null, '1812091925576891014843595', '沈荡店仓', '2022', '科乐克传奇2015干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006341007137252', '14', '30', '2019021001100100004', null, '1902102317006301005541858', '5', null, null, '1812091925576891014843595', '沈荡店仓', '2020', '科乐克城堡干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006491007203726', '14', '30', '2019021001100100004', null, '1902102317006441005360687', '6', null, null, '1812091925576891014843595', '沈荡店仓', '2014', '科乐克男爵干红(红标)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006611007458670', '14', '30', '2019021001100100004', null, '1902102317006581005879916', '7', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006741007072736', '14', '30', '2019021001100100004', null, '1902102317006691005968221', '8', null, null, '1812091925576891014843595', '沈荡店仓', '1904', '冰酒(皮盒2支装)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317006861007173022', '14', '30', '2019021001100100004', null, '1902102317006811005814081', '9', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007031007090425', '14', '30', '2019021001100100004', null, '1902102317006971005462165', '10', null, null, '1812091925576891014843595', '沈荡店仓', '1019', '中华杜康贵宾-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007191007524801', '14', '30', '2019021001100100004', null, '1902102317007141005325106', '11', null, null, '1812091925576891014843595', '沈荡店仓', '2011', '科乐克城堡干红(3L装)2015', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007341007407395', '14', '30', '2019021001100100004', null, '1902102317007291005916991', '12', null, null, '1812091925576891014843595', '沈荡店仓', '1017', '杜康特酿-38°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007491007946423', '14', '30', '2019021001100100004', null, '1902102317007431005765284', '13', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007641007409561', '14', '30', '2019021001100100004', null, '1902102317007591005891184', '14', null, null, '1812091925576891014843595', '沈荡店仓', '2004', '科乐克贵族红干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317007801007607180', '14', '30', '2019021001100100004', null, '1902102317007751005061593', '15', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008071007111553', '14', '30', '2019021001100100004', null, '1902102317007911005304704', '16', null, null, '1812091925576891014843595', '沈荡店仓', '2018', '科乐克酒庄干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008321007872307', '14', '30', '2019021001100100004', null, '1902102317008271005432855', '17', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008451007339855', '14', '30', '2019021001100100004', null, '1902102317008411005816425', '18', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008571007895438', '14', '30', '2019021001100100004', null, '1902102317008531005463044', '19', null, null, '1812091925576891014843595', '沈荡店仓', '1016', '杜康特调VIP品鉴酒-46°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008701007001897', '14', '30', '2019021001100100004', null, '1902102317008661005468891', '20', null, null, '1812091925576891014843595', '沈荡店仓', '1023', '中华杜康10年-50.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317008901007523930', '14', '30', '2019021001100100004', null, '1902102317008851005692220', '21', null, null, '1812091925576891014843595', '沈荡店仓', '2008', '科乐克赤霞珠干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009071007183189', '14', '30', '2019021001100100004', null, '1902102317009021005778899', '22', null, null, '1812091925576891014843595', '沈荡店仓', '2005', '科乐克贵族金干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009251007966820', '14', '30', '2019021001100100004', null, '1902102317009191005474720', '23', null, null, '1812091925576891014843595', '沈荡店仓', '1901', '南湖壹号', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009391007938742', '14', '30', '2019021001100100004', null, '1902102317009341005360714', '24', null, null, '1812091925576891014843595', '沈荡店仓', '2003', '科乐克金章干白', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009521007125667', '14', '30', '2019021001100100004', null, '1902102317009481005063056', '25', null, null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009641007419632', '14', '30', '2019021001100100004', null, '1902102317009601005003860', '26', null, null, '1812091925576891014843595', '沈荡店仓', '1018', '杜康珍藏1973-38°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009761007336940', '14', '30', '2019021001100100004', null, '1902102317009731005735792', '27', null, null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009861007211862', '14', '30', '2019021001100100004', null, '1902102317009831005826847', '28', null, null, '1812091925576891014843595', '沈荡店仓', '1906', '冰酒', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317009951007995564', '14', '30', '2019021001100100004', null, '1902102317009921005764352', '29', null, null, '1812091925576891014843595', '沈荡店仓', '1021', '中华杜康10年品鉴-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010051007832140', '14', '30', '2019021001100100004', null, '1902102317010021005529890', '30', null, null, '1812091925576891014843595', '沈荡店仓', '2017', '科乐克康萨城堡干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010161007037322', '14', '30', '2019021001100100004', null, '1902102317010131005928492', '31', null, null, '1812091925576891014843595', '沈荡店仓', '2002', '科乐克金章708干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010291007303187', '14', '30', '2019021001100100004', null, '1902102317010251005213756', '32', null, null, '1812091925576891014843595', '沈荡店仓', '2019', '科乐克波尔多干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010401007691544', '14', '30', '2019021001100100004', null, '1902102317010361005228789', '33', null, null, '1812091925576891014843595', '沈荡店仓', '1013', '杜康珍藏原浆天合-60°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010511007365839', '14', '30', '2019021001100100004', null, '1902102317010471005785017', '34', null, null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010611007384395', '14', '30', '2019021001100100004', null, '1902102317010581005890203', '35', null, null, '1812091925576891014843595', '沈荡店仓', '1907', '冰酒6支装木盒', null, '10', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010721007660638', '14', '30', '2019021001100100004', null, '1902102317010681005065401', '36', null, null, '1812091925576891014843595', '沈荡店仓', '2001', '科乐克金章318干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010851007128280', '14', '30', '2019021001100100004', null, '1902102317010811005929310', '37', null, null, '1812091925576891014843595', '沈荡店仓', '1022', '中华杜康10年-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317010961007476122', '14', '30', '2019021001100100004', null, '1902102317010931005194866', '38', null, null, '1812091925576891014843595', '沈荡店仓', '1905', '精品皮盒', null, '10', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011061007633822', '14', '30', '2019021001100100004', null, '1902102317011021005008252', '39', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011181007180660', '14', '30', '2019021001100100004', null, '1902102317011141005144476', '40', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011281007360815', '14', '30', '2019021001100100004', null, '1902102317011251005742189', '41', null, null, '1812091925576891014843595', '沈荡店仓', '2021', '科乐克尚宝龙城堡', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011411007288938', '14', '30', '2019021001100100004', null, '1902102317011361005048070', '42', null, null, '1812091925576891014843595', '沈荡店仓', '1903', '冰酒(木盒2支装)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011531007535182', '14', '30', '2019021001100100004', null, '1902102317011501005763689', '43', null, null, '1812091925576891014843595', '沈荡店仓', '1024', '杜康珍藏年份小酒-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011651007007362', '14', '30', '2019021001100100004', null, '1902102317011611005152667', '44', null, null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011771007005793', '14', '30', '2019021001100100004', null, '1902102317011741005460365', '45', null, null, '1812091925576891014843595', '沈荡店仓', '2016', '科乐克红标小教堂', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317011881007316748', '14', '30', '2019021001100100004', null, '1902102317011841005924348', '46', null, null, '1812091925576891014843595', '沈荡店仓', '2007', '科乐克风车干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317012001007912513', '14', '30', '2019021001100100004', null, '1902102317011961005018621', '47', null, null, '1812091925576891014843595', '沈荡店仓', '2006', '科乐克贵族银干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102317012111007959553', '14', '30', '2019021001100100004', null, '1902102317012071005416109', '48', null, null, '1812091925576891014843595', '沈荡店仓', '2010', '科乐克城堡干红(3L装)2016', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339283971007444388', '14', '30', '2019021001100100005', null, '1902102339283711005823604', '1', null, null, '1812091925576891014843595', '沈荡店仓', '2007', '科乐克风车干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339284301007836118', '14', '30', '2019021001100100005', null, '1902102339284251005943987', '2', null, null, '1812091925576891014843595', '沈荡店仓', '2010', '科乐克城堡干红(3L装)2016', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339284521007356153', '14', '30', '2019021001100100005', null, '1902102339284451005084804', '3', null, null, '1812091925576891014843595', '沈荡店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339284741007699337', '14', '30', '2019021001100100005', null, '1902102339284671005325514', '4', null, null, '1812091925576891014843595', '沈荡店仓', '1019', '中华杜康贵宾-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339284951007990733', '14', '30', '2019021001100100005', null, '1902102339284881005030996', '5', null, null, '1812091925576891014843595', '沈荡店仓', '2019', '科乐克波尔多干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285131007645717', '14', '30', '2019021001100100005', null, '1902102339285071005692429', '6', null, null, '1812091925576891014843595', '沈荡店仓', '1903', '冰酒(木盒2支装)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285331007493369', '14', '30', '2019021001100100005', null, '1902102339285281005409121', '7', null, null, '1812091925576891014843595', '沈荡店仓', '1009', '杜康珍酿8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285481007850690', '14', '30', '2019021001100100005', null, '1902102339285441005504150', '8', null, null, '1812091925576891014843595', '沈荡店仓', '2018', '科乐克酒庄干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285621007196067', '14', '30', '2019021001100100005', null, '1902102339285571005046620', '9', null, null, '1812091925576891014843595', '沈荡店仓', '1004', '杜康珍藏2号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285741007838000', '14', '30', '2019021001100100005', null, '1902102339285701005434719', '10', null, null, '1812091925576891014843595', '沈荡店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339285881007204724', '14', '30', '2019021001100100005', null, '1902102339285841005963104', '11', null, null, '1812091925576891014843595', '沈荡店仓', '1001', '杜康珍藏15号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286021007583413', '14', '30', '2019021001100100005', null, '1902102339285971005817736', '12', null, null, '1812091925576891014843595', '沈荡店仓', '1013', '杜康珍藏原浆天合-60°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286171007476039', '14', '30', '2019021001100100005', null, '1902102339286141005641852', '13', null, null, '1812091925576891014843595', '沈荡店仓', '1022', '中华杜康10年-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286301007669682', '14', '30', '2019021001100100005', null, '1902102339286261005208772', '14', null, null, '1812091925576891014843595', '沈荡店仓', '2008', '科乐克赤霞珠干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286441007072996', '14', '30', '2019021001100100005', null, '1902102339286391005945485', '15', null, null, '1812091925576891014843595', '沈荡店仓', '2022', '科乐克传奇2015干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286691007139532', '14', '30', '2019021001100100005', null, '1902102339286531005981730', '16', null, null, '1812091925576891014843595', '沈荡店仓', '1006', '杜康珍藏5号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339286941007746851', '14', '30', '2019021001100100005', null, '1902102339286901005862747', '17', null, null, '1812091925576891014843595', '沈荡店仓', '2006', '科乐克贵族银干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287081007682581', '14', '30', '2019021001100100005', null, '1902102339287041005490381', '18', null, null, '1812091925576891014843595', '沈荡店仓', '2002', '科乐克金章708干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287201007627496', '14', '30', '2019021001100100005', null, '1902102339287161005528639', '19', null, null, '1812091925576891014843595', '沈荡店仓', '1017', '杜康特酿-38°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287341007531974', '14', '30', '2019021001100100005', null, '1902102339287301005898444', '20', null, null, '1812091925576891014843595', '沈荡店仓', '1020', '中华杜康贵宾-50.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287491007411717', '14', '30', '2019021001100100005', null, '1902102339287441005256024', '21', null, null, '1812091925576891014843595', '沈荡店仓', '2005', '科乐克贵族金干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287641007234347', '14', '30', '2019021001100100005', null, '1902102339287581005964264', '22', null, null, '1812091925576891014843595', '沈荡店仓', '2011', '科乐克城堡干红(3L装)2015', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339287771007377410', '14', '30', '2019021001100100005', null, '1902102339287731005180440', '23', null, null, '1812091925576891014843595', '沈荡店仓', '1905', '精品皮盒', null, '10', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339288501007785517', '14', '30', '2019021001100100005', null, '1902102339288461005672420', '24', null, null, '1812091925576891014843595', '沈荡店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339288631007175923', '14', '30', '2019021001100100005', null, '1902102339288591005235807', '25', null, null, '1812091925576891014843595', '沈荡店仓', '1018', '杜康珍藏1973-38°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339288741007049345', '14', '30', '2019021001100100005', null, '1902102339288711005941871', '26', null, null, '1812091925576891014843595', '沈荡店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339288861007595335', '14', '30', '2019021001100100005', null, '1902102339288821005933144', '27', null, null, '1812091925576891014843595', '沈荡店仓', '2020', '科乐克城堡干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339288981007892322', '14', '30', '2019021001100100005', null, '1902102339288941005094096', '28', null, null, '1812091925576891014843595', '沈荡店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289131007297514', '14', '30', '2019021001100100005', null, '1902102339289091005553581', '29', null, null, '1812091925576891014843595', '沈荡店仓', '1012', '杜康珍藏原浆天合-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289261007382072', '14', '30', '2019021001100100005', null, '1902102339289221005085867', '30', null, null, '1812091925576891014843595', '沈荡店仓', '2014', '科乐克男爵干红(红标)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289431007230245', '14', '30', '2019021001100100005', null, '1902102339289351005758637', '31', null, null, '1812091925576891014843595', '沈荡店仓', '1015', '杜康珍藏原浆天顺-60°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289591007646848', '14', '30', '2019021001100100005', null, '1902102339289551005881044', '32', null, null, '1812091925576891014843595', '沈荡店仓', '1023', '中华杜康10年-50.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289741007574989', '14', '30', '2019021001100100005', null, '1902102339289701005790686', '33', null, null, '1812091925576891014843595', '沈荡店仓', '2021', '科乐克尚宝龙城堡', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339289911007911515', '14', '30', '2019021001100100005', null, '1902102339289861005257543', '34', null, null, '1812091925576891014843595', '沈荡店仓', '1901', '南湖壹号', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290061007104200', '14', '30', '2019021001100100005', null, '1902102339290001005785234', '35', null, null, '1812091925576891014843595', '沈荡店仓', '1016', '杜康特调VIP品鉴酒-46°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290221007329284', '14', '30', '2019021001100100005', null, '1902102339290161005311560', '36', null, null, '1812091925576891014843595', '沈荡店仓', '1021', '中华杜康10年品鉴-41.8°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290381007990059', '14', '30', '2019021001100100005', null, '1902102339290341005239256', '37', null, null, '1812091925576891014843595', '沈荡店仓', '2017', '科乐克康萨城堡干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290511007166853', '14', '30', '2019021001100100005', null, '1902102339290471005021917', '38', null, null, '1812091925576891014843595', '沈荡店仓', '2016', '科乐克红标小教堂', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290631007707525', '14', '30', '2019021001100100005', null, '1902102339290591005099938', '39', null, null, '1812091925576891014843595', '沈荡店仓', '1002', '杜康珍藏15号-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290751007628033', '14', '30', '2019021001100100005', null, '1902102339290721005442445', '40', null, null, '1812091925576891014843595', '沈荡店仓', '1024', '杜康珍藏年份小酒-52°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339290871007130631', '14', '30', '2019021001100100005', null, '1902102339290831005738009', '41', null, null, '1812091925576891014843595', '沈荡店仓', '2004', '科乐克贵族红干红', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339291001007445588', '14', '30', '2019021001100100005', null, '1902102339290951005956120', '42', null, null, '1812091925576891014843595', '沈荡店仓', '2003', '科乐克金章干白', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339291171007296225', '14', '30', '2019021001100100005', null, '1902102339291111005916570', '43', null, null, '1812091925576891014843595', '沈荡店仓', '1904', '冰酒(皮盒2支装)', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339291361007752992', '14', '30', '2019021001100100005', null, '1902102339291301005934291', '44', null, null, '1812091925576891014843595', '沈荡店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902102339291501007110122', '14', '30', '2019021001100100005', null, '1902102339291461005719028', '45', null, null, '1812091925576891014843595', '沈荡店仓', '1014', '杜康珍藏原浆天顺-46°', null, '20', '-1.00', '0.00', '0.00', null, null, null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717501841007029758', '23', 'A20', '2019021123100200001', null, '1902111717500551018424316', '1', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717502511007478794', '23', 'A20', '2019021123100200001', null, '1902111717502441018517331', '2', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1003', '杜康珍藏2号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717502701007191047', '23', 'A20', '2019021123100200001', null, '1902111717502661018211615', '3', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1004', '杜康珍藏2号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717502861007202094', '23', 'A20', '2019021123100200001', null, '1902111717502821018582722', '4', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1005', '杜康珍藏5号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717503031007157219', '23', 'A20', '2019021123100200001', null, '1902111717502991018903071', '5', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1007', '杜康珍藏6号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902111717503191007568756', '23', 'A20', '2019021123100200001', null, '1902111717503141018734813', '6', '2019-02-11 17:17:50', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-11 17:17:50', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120227553841007246740', '23', 'A20', '2019021223100200001', null, '1902120227553751018058766', '1', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1003', '杜康珍藏2号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:27:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120227554031007670248', '23', 'A20', '2019021223100200001', null, '1902120227553991018312584', '2', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1005', '杜康珍藏5号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:27:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120227554141007481070', '23', 'A20', '2019021223100200001', null, '1902120227554101018394125', '3', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1007', '杜康珍藏6号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:27:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120227554271007565264', '23', 'A20', '2019021223100200001', null, '1902120227554231018098123', '4', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:27:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120227554381007644600', '23', 'A20', '2019021223100200001', null, '1902120227554351018223593', '5', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:27:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120238189241007979234', '23', 'A20', '2019021223100200002', null, '1902120238189171018738514', '1', '2019-02-12 02:38:18', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '10.00', '0.00', '0.00', null, '2019-02-12 02:38:18', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120239402421007141014', '22', 'A20', '2019021222100200001', null, '1902120239402361018651342', '1', '2019-02-12 02:39:40', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1011', '杜康珍藏原浆8号-52°', null, '20', '10.00', '0.00', '0.00', null, '2019-02-12 02:39:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120240409351007527738', '22', 'A20', '2019021222100200002', null, '1902120240409321018309630', '1', '2019-02-12 02:40:40', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:40:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120241197831007538558', '22', 'A20', '2019021222100200003', null, '1902120241197791018670692', '1', '2019-02-12 02:41:19', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1001', '杜康珍藏15号-42°', null, '20', '1.00', '0.00', '0.00', null, '2019-02-12 02:41:19', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120306075731007740043', '23', 'A90', '2019021223100200001', null, '1902120227553751018058766', '1', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1003', '杜康珍藏2号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-12 03:06:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120306075991007881892', '23', 'A90', '2019021223100200001', null, '1902120227553991018312584', '2', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1005', '杜康珍藏5号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-12 03:06:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120306076111007619207', '23', 'A90', '2019021223100200001', null, '1902120227554101018394125', '3', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1007', '杜康珍藏6号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-12 03:06:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120306076191007413153', '23', 'A90', '2019021223100200001', null, '1902120227554231018098123', '4', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1008', '杜康珍藏6号-52°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-12 03:06:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1902120306076281007826772', '23', 'A90', '2019021223100200001', null, '1902120227554351018223593', '5', '2019-02-12 02:27:55', null, '1812091930141101014954604', '嘉兴秀洲店仓', '1010', '杜康珍藏原浆8号-42°', null, '20', '-1.00', '0.00', '0.00', null, '2019-02-12 03:06:07', null);

-- ----------------------------
-- Table structure for bus_order
-- ----------------------------
DROP TABLE IF EXISTS `bus_order`;
CREATE TABLE `bus_order` (
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_type` smallint(6) DEFAULT '1' COMMENT '订单类型 1 pos销售订单，2 盘亏出库，3 外卖销售订单',
  `pay_type` smallint(6) DEFAULT '1' COMMENT '付款方式 1->在线付款  2->货到付款,3 挂账',
  `sys_order_id` varchar(32) DEFAULT NULL COMMENT '对接平台订单id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT '第三方平台订单id',
  `pos_no` varchar(32) DEFAULT NULL COMMENT 'pos编号',
  `card_type` char(2) DEFAULT NULL COMMENT '卡类别',
  `buyer_id` varchar(32) DEFAULT NULL COMMENT '买家id',
  `buyer_name` varchar(32) DEFAULT NULL COMMENT '买家名称',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '经办人编码',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '经办人名称',
  `plat_id` varchar(16) DEFAULT NULL COMMENT '平台id',
  `plat_name` varchar(16) DEFAULT NULL COMMENT '平台',
  `plat_shop_id` varchar(16) DEFAULT NULL COMMENT '平台店铺id',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `trade_from` varchar(64) DEFAULT NULL COMMENT '交易来源 wap,app,pc,pos',
  `trade_status` char(2) DEFAULT NULL COMMENT '交易状态[00 已下单，10 已付款，20 已发货，30 交易成功，40 订单取消，60 交易关闭]',
  `order_status` char(2) DEFAULT NULL COMMENT '订单状态[0 未确认，1 已确认，2已接配送，3已取餐，4已配送成功，5已完结，6已取消]',
  `refund_status` char(2) DEFAULT '0' COMMENT '退款状态[05 申请取消单,10 申请退款,15 同意取消单,20 同意退款, 25 拒绝取消单,30  拒绝退款, 35 取消单完成,40  退款完成,45 申请取消单取消,50 申请退单取消]',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_sponsor` int(11) DEFAULT NULL COMMENT '发起退单（退货）角色：1下单用户，2外卖平台系统，3商户，4外卖平台客服，5其他',
  `refund_type` int(11) DEFAULT NULL COMMENT '退单类型[0,取消单；1.退单]',
  `refund_reason` varchar(500) DEFAULT NULL COMMENT '取消或退单原因',
  `flow_status` char(2) DEFAULT '00' COMMENT '流转状态 00 创建，30 出库，40 完成,99 已回传',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效订单',
  `origin_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单原价',
  `order_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单总金额',
  `ship_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单运费',
  `coupon_price` decimal(18,2) DEFAULT '0.00' COMMENT '商品优惠',
  `discount_price` decimal(18,2) DEFAULT '0.00' COMMENT '优惠金额',
  `to_zero_price` decimal(18,2) DEFAULT '0.00' COMMENT '抹零金额',
  `pay_price` decimal(18,2) DEFAULT '0.00' COMMENT '实付款',
  `dib_price` decimal(18,2) DEFAULT '0.00' COMMENT '找零金额',
  `recept_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单应收款  ',
  `package_price` decimal(18,2) DEFAULT '0.00' COMMENT '打包费',
  `point_fee` int(11) DEFAULT '0' COMMENT '积分',
  `bonus_price` decimal(18,2) DEFAULT '0.00' COMMENT '红包金额',
  `rate_price` decimal(18,2) DEFAULT '0.00' COMMENT '佣金',
  `is_settlemented` bit(1) DEFAULT b'0' COMMENT '是否已结算 0 未结算，1 已生成结算单',
  `receive_name` varchar(64) DEFAULT NULL COMMENT '收件人名称',
  `province_id` varchar(32) DEFAULT NULL COMMENT '省id',
  `province` varchar(32) DEFAULT NULL COMMENT '省',
  `city_id` varchar(32) DEFAULT NULL COMMENT '市id',
  `city` varchar(32) DEFAULT NULL COMMENT '市',
  `district_id` varchar(32) DEFAULT NULL COMMENT '区id',
  `district` varchar(32) DEFAULT NULL COMMENT '区',
  `address` varchar(512) DEFAULT NULL COMMENT '街道(地址)',
  `longitude_address` varchar(64) DEFAULT NULL COMMENT '地址经度',
  `latitude_address` varchar(64) DEFAULT NULL COMMENT '地址维度',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `zip_code` varchar(32) DEFAULT NULL COMMENT '邮编',
  `memo` varchar(512) DEFAULT NULL COMMENT '订单备注',
  `buyer_notes` varchar(256) DEFAULT NULL COMMENT '买家留言',
  `seller_notes` varchar(256) DEFAULT NULL COMMENT '卖家留言',
  `is_invoice` bit(1) DEFAULT b'0' COMMENT '是否开票[0 不开票，1 开票]',
  `is_trave` bit(1) DEFAULT b'0' COMMENT '是否货票同行[0 不同行，1 同行]',
  `invoice_type` smallint(6) DEFAULT '0' COMMENT '发票类型[0 普通发票，1 增值发票]',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(256) DEFAULT NULL COMMENT '发票内容',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '订单确认时间',
  `print_count` int(11) DEFAULT '0' COMMENT '打印次数',
  `cash_id` varchar(32) DEFAULT NULL COMMENT '收银员id',
  `cash_name` varchar(32) DEFAULT NULL COMMENT '收银员',
  `settle_time` datetime DEFAULT NULL COMMENT '日结时间',
  `shift` smallint(6) DEFAULT NULL COMMENT '班次',
  `is_read` smallint(6) DEFAULT NULL COMMENT '读取标志(0: 未读；1已读；2：更新后待读)',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_name` varchar(64) DEFAULT NULL,
  `created_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易订单';

-- ----------------------------
-- Records of bus_order
-- ----------------------------
INSERT INTO `bus_order` VALUES ('2019012901100100001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '38.00', '0.00', '18.00', '6.33', '0.00', '31.67', '0.00', '31.67', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-01-29 10:04:08', '2019-01-29 10:04:08', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-01-29 00:00:00', null, null, '2019-01-29 10:04:08', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019012901100100002', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '40', '6', null, null, null, null, null, '40', '', null, '53600.00', '0.00', '7000.00', '50000.00', '0.00', '3600.00', '0.00', '3600.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-01-29 12:03:52', '2019-01-29 12:03:52', null, null, '1', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-01-29 00:00:00', null, null, '2019-01-29 12:03:52', '2019-01-31 13:26:26', '超级管理员', '超级管理员');
INSERT INTO `bus_order` VALUES ('2019013001100100001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', 'YWY100001', '测试业务员', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '1878.00', '0.00', '288.00', '0.00', '0.00', '1878.00', '0.00', '1878.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, 'ceasdap 21321321321', null, null, '\0', null, null, null, null, '2019-01-30 08:23:52', '2019-01-30 08:23:52', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-01-30 00:00:00', null, null, '2019-01-30 08:23:52', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019013001100100002', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '2386.00', '0.00', '1564.00', '0.00', '0.00', '2386.00', '0.00', '2386.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-01-30 08:47:18', '2019-01-30 08:47:18', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-01-30 00:00:00', null, null, '2019-01-30 08:47:18', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019020101100100001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '380.00', '0.00', '180.00', '0.00', '0.00', '380.00', '0.00', '380.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-01 12:39:26', '2019-02-01 12:39:26', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-01 00:00:00', null, null, '2019-02-01 12:39:26', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019020201100100001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '3800.00', '0.00', '1800.00', '0.00', '0.00', '3800.00', '0.00', '3800.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-02 13:47:21', '2019-02-02 13:47:21', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-02 00:00:00', null, null, '2019-02-02 13:47:21', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019020801100100001', '1', '1', null, null, '1', null, 'VIP100084', '祝海忠', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '324.00', '0.00', '68.00', '0.00', '0.00', '324.00', '0.00', '324.00', null, null, null, null, '', '祝海忠', null, null, null, null, null, null, '', null, null, '13625738888', null, '', null, null, '\0', null, null, null, null, '2019-02-08 11:02:01', '2019-02-08 11:02:01', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-08 00:00:00', null, null, '2019-02-08 11:02:01', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019020801100100002', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '3838.00', '0.00', '1818.00', '0.00', '0.00', '3838.00', '0.00', '3838.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-08 22:18:28', '2019-02-08 22:18:28', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-08 00:00:00', null, null, '2019-02-08 22:18:28', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019020801100200001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', 'YWY100001', '测试业务员', null, null, null, '1812091930141101014954604', '嘉兴秀洲店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '224.00', '0.00', '56.00', '0.00', '0.00', '224.00', '0.00', '224.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-08 10:25:34', '2019-02-08 10:25:34', null, null, '0', '402881ea68bcaece0168bcb03d150002', '孙静', '2019-02-08 00:00:00', null, null, '2019-02-08 10:25:34', null, null, '孙静');
INSERT INTO `bus_order` VALUES ('2019021001100100001', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '286.00', '0.00', '50.00', '1.23', '0.00', '284.77', '0.00', '284.77', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-10 22:47:08', '2019-02-10 22:47:08', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-10 00:00:00', null, null, '2019-02-10 22:47:08', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019021001100100002', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '216.00', '0.00', '40.00', '0.93', '0.00', '215.07', '0.00', '215.07', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-10 22:50:09', '2019-02-10 22:50:09', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-10 00:00:00', null, null, '2019-02-10 22:50:09', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019021001100100003', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '1916.00', '0.00', '306.00', '0.00', '0.00', '1916.00', '0.00', '1916.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-10 22:51:40', '2019-02-10 22:51:40', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-10 00:00:00', null, null, '2019-02-10 22:51:40', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019021001100100004', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '9793.00', '0.00', '3294.00', '0.00', '0.00', '9793.00', '0.00', '9793.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-10 23:17:00', '2019-02-10 23:17:00', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-10 00:00:00', null, null, '2019-02-10 23:17:00', null, null, '超级管理员');
INSERT INTO `bus_order` VALUES ('2019021001100100005', '1', '1', null, null, '1', null, 'VIP100086', '邹贺良', '', '', null, null, null, '1812091925576891014843595', '沈荡店仓', 'pc', '30', '1', null, null, null, null, null, '30', '', null, '9460.00', '0.00', '3164.00', '0.00', '0.00', '9460.00', '0.00', '9460.00', null, null, null, null, '', '邹贺良', null, null, null, null, null, null, '', null, null, '13645835318', null, '', null, null, '\0', null, null, null, null, '2019-02-10 23:39:28', '2019-02-10 23:39:28', null, null, '0', '402882be46404313014640b7eb1c000f', '超级管理员', '2019-02-10 00:00:00', null, null, '2019-02-10 23:39:28', null, null, '超级管理员');

-- ----------------------------
-- Table structure for bus_pay_account
-- ----------------------------
DROP TABLE IF EXISTS `bus_pay_account`;
CREATE TABLE `bus_pay_account` (
  `pay_id` varchar(32) NOT NULL COMMENT '支付Id',
  `line_no` int(11) DEFAULT NULL COMMENT '行号 赠送的顺序号在后边',
  `vip_id` varchar(32) DEFAULT NULL COMMENT '会员id',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(32) DEFAULT NULL COMMENT '店铺名',
  `card_no` varchar(32) DEFAULT NULL COMMENT '卡号',
  `pay_mode` smallint(6) DEFAULT NULL COMMENT '支付方式 1 银行卡，2 现金，3 支付宝，4 微信，5 会员(卡)，6 券, 7 挂账, 99 其他',
  `pay_type` smallint(6) DEFAULT NULL COMMENT '支付类型  1 消费，2 退款 3 补款',
  `point_fee` decimal(18,2) DEFAULT '0.00' COMMENT '积分',
  `bank_account_name` varchar(32) DEFAULT NULL COMMENT '银行账户名称',
  `bank_account_no` varchar(32) DEFAULT NULL COMMENT '银行账户',
  `bank_name` varchar(64) DEFAULT NULL COMMENT '银行名',
  `buyer_name` varchar(127) DEFAULT NULL COMMENT '买家姓名',
  `buyer_account` varchar(32) DEFAULT NULL COMMENT '买家账户',
  `pay_price` decimal(18,2) DEFAULT NULL COMMENT '实付款 不一定存在，实际掏的金额',
  `recept_price` decimal(18,2) DEFAULT NULL COMMENT '应收款   必须有值',
  `dib_price` decimal(18,2) DEFAULT NULL COMMENT '找零金额',
  `over_amount` decimal(18,2) DEFAULT NULL COMMENT '溢收金额',
  `discount_amount` decimal(18,2) DEFAULT NULL COMMENT '优惠金额  赠送金',
  `currency` varchar(16) DEFAULT NULL COMMENT '货币代码(人民币 CNY)',
  `deposit_bank_no` varchar(32) DEFAULT NULL COMMENT '充值网银流水',
  `account_log_id` varchar(32) DEFAULT NULL COMMENT '帐务流水',
  `memo` varchar(127) DEFAULT NULL COMMENT '备注信息',
  `order_id` varchar(64) DEFAULT NULL COMMENT '交易编号（订单号）',
  `other_account_email` varchar(127) DEFAULT NULL COMMENT '帐务对方邮箱',
  `other_account_fullname` varchar(127) DEFAULT NULL COMMENT '帐务对方全称',
  `other_user_id` varchar(32) DEFAULT NULL COMMENT '帐务对方支付宝用户号',
  `partner_id` varchar(32) DEFAULT NULL COMMENT '合作者身份id',
  `seller_account` varchar(32) DEFAULT NULL COMMENT '卖家支付宝人民币支付帐号',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '卖家姓名',
  `trade_no` varchar(32) DEFAULT NULL COMMENT '支付交易流水',
  `trade_refund_amount` decimal(18,2) DEFAULT NULL COMMENT '退款金额',
  `trans_account` varchar(32) DEFAULT NULL COMMENT '帐务本方支付宝人民币资金帐号(user_id+0156)',
  `cash_name` varchar(32) DEFAULT NULL COMMENT '收银员',
  `trans_code_msg` varchar(16) DEFAULT NULL COMMENT '业务类型',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `src_order_id` varchar(32) DEFAULT NULL COMMENT '原订单号',
  `src_trade_no` varchar(32) DEFAULT NULL COMMENT '原第三方支付流水号',
  `src_pay_id` varchar(32) DEFAULT NULL COMMENT '原账单号',
  `activity_id` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `flow_status` char(2) DEFAULT NULL COMMENT '同步状态 00 未同步，99 已同步',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易对账数据';

-- ----------------------------
-- Records of bus_pay_account
-- ----------------------------
INSERT INTO `bus_pay_account` VALUES ('1901291004086561010971254', '1', null, null, null, '13645835318', '7', '1', null, null, null, null, null, null, '38.00', '38.00', '0.00', null, '6.33', null, null, null, null, '2019012901100100001', null, null, null, null, null, null, null, null, null, null, null, '2019-01-29 10:04:08', null, null, null, null, null, '2019-01-29 10:04:08', null);
INSERT INTO `bus_pay_account` VALUES ('1901291203529021010415351', '1', null, null, null, null, '6', '1', null, null, null, null, null, null, '3600.00', '3600.00', '0.00', null, '0.00', null, null, null, null, '2019012901100100002', null, null, null, null, null, null, null, null, null, null, null, '2019-01-29 12:03:52', null, null, null, null, null, '2019-01-29 12:03:52', null);
INSERT INTO `bus_pay_account` VALUES ('1901291203529311010040839', '2', null, null, null, null, '100', '1', null, null, null, null, null, null, '0.00', '50000.00', '0.00', null, '50000.00', null, null, null, null, '2019012901100100002', null, null, null, null, null, null, null, null, null, null, null, '2019-01-29 12:03:52', null, null, null, null, null, '2019-01-29 12:03:52', null);
INSERT INTO `bus_pay_account` VALUES ('1901300823521501010961334', '1', null, null, null, null, '2', '1', null, null, null, null, null, null, '1878.00', '1878.00', '0.00', null, '0.00', null, null, null, null, '2019013001100100001', null, null, null, null, null, null, null, null, null, null, null, '2019-01-30 08:23:52', null, null, null, null, null, '2019-01-30 08:23:52', null);
INSERT INTO `bus_pay_account` VALUES ('1901300847185551010112698', '1', null, null, null, null, '2', '1', null, null, null, null, null, null, '2386.00', '2386.00', '0.00', null, '0.00', null, null, null, null, '2019013001100100002', null, null, null, null, null, null, null, null, null, null, null, '2019-01-30 08:47:18', null, null, null, null, null, '2019-01-30 08:47:18', null);
INSERT INTO `bus_pay_account` VALUES ('1902011239266131010562968', '1', null, null, null, null, '6', '1', null, null, null, null, null, null, '380.00', '380.00', '0.00', null, '0.00', null, null, null, null, '2019020101100100001', null, null, null, null, null, null, null, null, null, null, null, '2019-02-01 12:39:26', null, null, null, null, null, '2019-02-01 12:39:26', null);
INSERT INTO `bus_pay_account` VALUES ('1902021347217061010524576', '1', null, null, null, null, '6', '1', null, null, null, null, null, null, '3800.00', '3800.00', '0.00', null, '0.00', null, null, null, null, '2019020201100100001', null, null, null, null, null, null, null, null, null, null, null, '2019-02-02 13:47:21', null, null, null, null, null, '2019-02-02 13:47:21', null);
INSERT INTO `bus_pay_account` VALUES ('1902081025342851010752722', '1', null, null, null, '', '3', '1', null, null, null, null, null, null, '224.00', '224.00', '0.00', null, '0.00', null, null, null, null, '2019020801100200001', null, null, null, null, null, null, '', null, null, null, null, '2019-02-08 10:25:34', null, null, null, null, null, '2019-02-08 10:25:34', null);
INSERT INTO `bus_pay_account` VALUES ('1902081102017131010462108', '1', null, null, null, '', '1', '1', null, null, null, null, null, null, '324.00', '324.00', '0.00', null, '0.00', null, null, null, null, '2019020801100100001', null, null, null, null, null, null, '', null, null, null, null, '2019-02-08 11:02:01', null, null, null, null, null, '2019-02-08 11:02:01', null);
INSERT INTO `bus_pay_account` VALUES ('1902082218289691010132574', '1', null, null, null, null, '6', '1', null, null, null, null, null, null, '3838.00', '3838.00', '0.00', null, '0.00', null, null, null, null, '2019020801100100002', null, null, null, null, null, null, null, null, null, null, null, '2019-02-08 22:18:28', null, null, null, null, null, '2019-02-08 22:18:28', null);
INSERT INTO `bus_pay_account` VALUES ('1902102247080331010056946', '1', null, null, null, '13645835318', '7', '1', null, null, null, null, null, null, '286.00', '286.00', '0.00', null, '1.23', null, null, null, null, '2019021001100100001', null, null, null, null, null, null, null, null, null, null, null, '2019-02-10 22:47:08', null, null, null, null, null, '2019-02-10 22:47:08', null);
INSERT INTO `bus_pay_account` VALUES ('1902102250094181010240156', '1', null, null, null, '13645835318', '7', '1', null, null, null, null, null, null, '216.00', '216.00', '0.00', null, '0.93', null, null, null, null, '2019021001100100002', null, null, null, null, null, null, null, null, null, null, null, '2019-02-10 22:50:09', null, null, null, null, null, '2019-02-10 22:50:09', null);
INSERT INTO `bus_pay_account` VALUES ('1902102251402821010793384', '1', null, null, null, '', '1', '1', null, null, null, null, null, null, '1916.00', '1916.00', '0.00', null, '0.00', null, null, null, null, '2019021001100100003', null, null, null, null, null, null, '', null, null, null, null, '2019-02-10 22:51:40', null, null, null, null, null, '2019-02-10 22:51:40', null);
INSERT INTO `bus_pay_account` VALUES ('1902102317004041010070449', '1', null, null, null, '', '3', '1', null, null, null, null, null, null, '9793.00', '9793.00', '0.00', null, '0.00', null, null, null, null, '2019021001100100004', null, null, null, null, null, null, '', null, null, null, null, '2019-02-10 23:17:00', null, null, null, null, null, '2019-02-10 23:17:00', null);
INSERT INTO `bus_pay_account` VALUES ('1902102339283451010636181', '1', null, null, null, '', '1', '1', null, null, null, null, null, null, '9460.00', '9460.00', '0.00', null, '0.00', null, null, null, null, '2019021001100100005', null, null, null, null, null, null, '', null, null, null, null, '2019-02-10 23:39:28', null, null, null, null, null, '2019-02-10 23:39:28', null);

-- ----------------------------
-- Table structure for bus_refund
-- ----------------------------
DROP TABLE IF EXISTS `bus_refund`;
CREATE TABLE `bus_refund` (
  `refund_id` varchar(32) NOT NULL COMMENT '退货单号',
  `order_id` varchar(32) DEFAULT NULL COMMENT '原订单号',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT '外部订单号',
  `barter_order_id` varchar(32) DEFAULT NULL COMMENT '换发单号',
  `buyer_id` varchar(32) DEFAULT NULL COMMENT '买家id',
  `buyer_name` varchar(64) DEFAULT NULL COMMENT '买家名称',
  `seller_id` varchar(32) DEFAULT NULL COMMENT '卖家id',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '卖家名称',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `refund_type` smallint(6) DEFAULT NULL COMMENT '退换货类型  1->退货单 2->换退单',
  `refund_status` smallint(6) NOT NULL COMMENT '退单状态，1 已退货 未退款 ，2 已退货 已退款，3 退单完成， 4 退单取消',
  `refund_order_status` smallint(6) NOT NULL COMMENT '订单处理状态，0 未处理， 1 已处理',
  `reason` varchar(1024) DEFAULT NULL COMMENT '退货款理由',
  `refund_reason` smallint(6) DEFAULT NULL COMMENT '退换货原因，枚举值 1-发错商品 2-无理由退换货 3-商品质量 4-收到实际商品与描述不符 5-配送产生问题 6-其他',
  `refund_price` decimal(18,2) DEFAULT '0.00' COMMENT '退款金额',
  `diff_price` decimal(18,2) DEFAULT '0.00' COMMENT '差异金额',
  `change_price` decimal(18,2) DEFAULT '0.00' COMMENT '变更金额',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `is_valid` bit(1) DEFAULT b'1' COMMENT '是否有效订单',
  `all_return` bit(1) DEFAULT b'0' COMMENT '是否是整单退',
  `check_time` datetime DEFAULT NULL COMMENT '处理时间',
  `refund_time` datetime DEFAULT NULL COMMENT '退款完成时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_name` varchar(64) DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_name` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货订单';

-- ----------------------------
-- Records of bus_refund
-- ----------------------------

-- ----------------------------
-- Table structure for bus_refund_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_refund_goods`;
CREATE TABLE `bus_refund_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT 'goods_id',
  `order_id` varchar(32) DEFAULT NULL COMMENT '原订单id',
  `refund_id` varchar(32) DEFAULT NULL COMMENT '退单id',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `goods_type` smallint(6) DEFAULT NULL COMMENT '商品类型',
  `category_name` varchar(64) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(64) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `product_type` smallint(6) DEFAULT NULL COMMENT '产品类型 1 单品，2 组合',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `parent_sku` varchar(32) DEFAULT NULL COMMENT 'parent_sku',
  `sku_id` varchar(32) DEFAULT NULL COMMENT '原SKU ID',
  `parent_sku_id` varchar(32) DEFAULT NULL COMMENT '原父SKU ID',
  `en_unit` varchar(32) DEFAULT NULL COMMENT '英文单位简称',
  `total_part_price` decimal(18,2) DEFAULT NULL COMMENT '总分摊价',
  `rate_type` varchar(32) DEFAULT NULL COMMENT '税种',
  `qty` decimal(18,2) DEFAULT NULL COMMENT '购买数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `market_price` decimal(18,2) NOT NULL COMMENT '市场价',
  `origin_sale_price` decimal(18,2) NOT NULL COMMENT '原销售价',
  `sale_price` decimal(18,2) NOT NULL COMMENT '实际销售价(销售价、会员价)',
  `part_price` decimal(18,4) DEFAULT '0.0000' COMMENT '商品分摊价',
  `coupon_price` decimal(18,2) DEFAULT NULL,
  `discount_price` decimal(18,4) DEFAULT '0.0000' COMMENT '商品折价 销售价-分摊价=折扣价',
  `total_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '商品销售总金额',
  `cost_price` decimal(18,4) DEFAULT '0.0000' COMMENT '成本价',
  `rate_precent` decimal(18,2) DEFAULT '17.00' COMMENT '税率',
  `is_gift` bit(1) DEFAULT b'0' COMMENT '是否为赠品 1 赠品，0 非赠品',
  `gift_count` decimal(18,2) DEFAULT NULL COMMENT '赠送数量',
  `gift_price` decimal(18,2) DEFAULT NULL COMMENT '赠送金额',
  `is_show` bit(1) DEFAULT NULL COMMENT '点单界面是否显示，不显示用于组合商品',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易商品表';

-- ----------------------------
-- Records of bus_refund_goods
-- ----------------------------

-- ----------------------------
-- Table structure for bus_rul_price
-- ----------------------------
DROP TABLE IF EXISTS `bus_rul_price`;
CREATE TABLE `bus_rul_price` (
  `rul_id` varchar(32) NOT NULL COMMENT '策略Id',
  `rul_name` varchar(64) DEFAULT NULL COMMENT '价格策略名称',
  `is_discount` bit(1) DEFAULT b'0' COMMENT '是否统一折扣',
  `discount` decimal(18,2) DEFAULT NULL COMMENT '折扣',
  `sort_code` int(11) DEFAULT '999999' COMMENT '优先级',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `updated_id` varchar(32) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`rul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格策略';

-- ----------------------------
-- Records of bus_rul_price
-- ----------------------------
INSERT INTO `bus_rul_price` VALUES ('1', '普通店仓策略', '\0', null, '999999', '2018-12-09 23:21:20', null, '', null);

-- ----------------------------
-- Table structure for bus_rul_shop
-- ----------------------------
DROP TABLE IF EXISTS `bus_rul_shop`;
CREATE TABLE `bus_rul_shop` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `rul_id` varchar(32) DEFAULT NULL COMMENT '产品分类Id',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店铺编号',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格策略应用店铺';

-- ----------------------------
-- Records of bus_rul_shop
-- ----------------------------
INSERT INTO `bus_rul_shop` VALUES ('1901291353011521012664185', '1', '1812091925576891014843595', '沈荡店仓', '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_shop` VALUES ('1901291353011541012782483', '1', '1812091930141101014954604', '嘉兴秀洲店仓', '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_shop` VALUES ('1901291353011551012540814', '1', '1812100008460611014145244', '海宁店仓', '2019-01-29 13:53:01', null);

-- ----------------------------
-- Table structure for bus_rul_sku
-- ----------------------------
DROP TABLE IF EXISTS `bus_rul_sku`;
CREATE TABLE `bus_rul_sku` (
  `sku_id` varchar(32) NOT NULL COMMENT 'rul_sku_id',
  `rul_id` varchar(32) DEFAULT NULL COMMENT '策略Id',
  `category_code` varchar(32) NOT NULL COMMENT '产品分类编码',
  `product_type` smallint(6) DEFAULT NULL COMMENT '产品类型 0 单品，1 组合',
  `sku` varchar(64) NOT NULL COMMENT 'sku',
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `en_name` varchar(128) DEFAULT NULL COMMENT '英文名称',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `market_price` decimal(18,2) DEFAULT '0.00' COMMENT '市场价（改为批发价）',
  `sale_price` decimal(18,2) DEFAULT '0.00' COMMENT '销售价',
  `supply_price` decimal(18,2) DEFAULT '0.00' COMMENT '內供价',
  `cost_price` decimal(18,2) DEFAULT '0.00' COMMENT '成本价',
  `vip_price` decimal(18,2) DEFAULT '0.00' COMMENT '会员价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `keywords` varchar(256) DEFAULT NULL COMMENT '商品关键字',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店信息';

-- ----------------------------
-- Records of bus_rul_sku
-- ----------------------------
INSERT INTO `bus_rul_sku` VALUES ('1901291353011571013056786', '1', '10', '0', '1001', '10', '杜康珍藏15号-42°', '', '42°', '28.00', '56.00', '23.00', '0.00', '38.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011591013398711', '1', '10', '0', '1002', '10', '杜康珍藏15号-52°', '', '52°', '28.00', '56.00', '23.00', '0.00', '38.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011631013552021', '1', '10', '0', '1003', '10', '杜康珍藏2号-42°', '', '42°', '48.00', '88.00', '35.00', '0.00', '78.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011651013677427', '1', '10', '0', '1004', '10', '杜康珍藏2号-52°', '', '52°', '48.00', '88.00', '35.00', '0.00', '78.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011681013910560', '1', '10', '0', '1005', '10', '杜康珍藏5号-42°', '', '42°', '88.00', '168.00', '50.00', '0.00', '138.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011701013067532', '1', '10', '0', '1006', '10', '杜康珍藏5号-52°', '', '52°', '88.00', '168.00', '50.00', '0.00', '138.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011721013552669', '1', '10', '0', '1007', '10', '杜康珍藏6号-42°', '', '42°', '108.00', '168.00', '55.00', '0.00', '148.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011751013843274', '1', '10', '0', '1008', '10', '杜康珍藏6号-52°', '', '52°', '108.00', '168.00', '55.00', '0.00', '148.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011771013148518', '1', '10', '0', '1009', '10', '杜康珍酿8号-52°', '', '52°', '148.00', '238.00', '0.00', '0.00', '208.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011801013604013', '1', '10', '0', '1010', '10', '杜康珍藏原浆8号-42°', '', '42°', '168.00', '368.00', '90.00', '0.00', '328.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011831013010770', '1', '10', '0', '1011', '10', '杜康珍藏原浆8号-52°', '', '52°', '168.00', '368.00', '90.00', '0.00', '328.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011851013624539', '1', '10', '0', '1012', '10', '杜康珍藏原浆天合-42°', '', '42°', '158.00', '288.00', '75.00', '0.00', '248.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011871013117794', '1', '10', '0', '1013', '10', '杜康珍藏原浆天合-60°', '', '60°', '158.00', '288.00', '75.00', '0.00', '248.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011891013155599', '1', '10', '0', '1014', '10', '杜康珍藏原浆天顺-46°', '', '46°', '268.00', '398.00', '168.00', '0.00', '348.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011911013288446', '1', '10', '0', '1015', '10', '杜康珍藏原浆天顺-60°', '', '60°', '268.00', '398.00', '168.00', '0.00', '348.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011931013713329', '1', '10', '0', '1016', '10', '杜康特调VIP品鉴酒-46°', '', '46°', '138.00', '268.00', '75.00', '0.00', '198.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011951013058476', '1', '10', '0', '1017', '10', '杜康特酿-38°', '', '38°', '0.00', '178.00', '70.00', '0.00', '128.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011971013634789', '1', '10', '0', '1018', '10', '杜康珍藏1973-38°', '', '38°', '228.00', '328.00', '136.00', '0.00', '298.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353011991013831764', '1', '10', '0', '1019', '10', '中华杜康贵宾-41.8°', '', '41.8°', '46.00', '98.00', '38.00', '0.00', '78.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012021013443864', '1', '10', '0', '1020', '10', '中华杜康贵宾-50.8°', '', '50.8°', '46.00', '98.00', '38.00', '0.00', '78.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012041013350892', '1', '10', '0', '1021', '10', '中华杜康10年品鉴-41.8°', '', '41.8°', '156.00', '288.00', '115.00', '0.00', '268.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012061013174924', '1', '10', '0', '1022', '10', '中华杜康10年-41.8°', '', '41.8°', '166.00', '318.00', '135.00', '0.00', '288.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012081013003883', '1', '10', '0', '1023', '10', '中华杜康10年-50.8°', '', '50.8°', '166.00', '318.00', '135.00', '0.00', '288.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012101013864338', '1', '10', '0', '1024', '10', '杜康珍藏年份小酒-52°', '', '52°', '36.00', '68.00', '23.00', '0.00', '48.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012121013683865', '1', '10', '0', '1301', '30', '剑南春-38°', '', '38°', '0.00', '0.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012151013877423', '1', '10', '0', '1302', '30', '剑南春-52°', '', '52°', '0.00', '0.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012181013854149', '1', '10', '0', '1901', '99', '南湖壹号', '', '--', '288.00', '618.00', '0.00', '0.00', '398.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012201013461083', '1', '20', '0', '1903', '99', '冰酒(木盒2支装)', '', '木盒2支装', '0.00', '580.00', '0.00', '0.00', '380.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012221013454221', '1', '20', '0', '1904', '99', '冰酒(皮盒2支装)', '', '皮盒2支装', '0.00', '780.00', '0.00', '0.00', '580.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012241013018122', '1', '100', '0', '1905', '99', '精品皮盒', '', '--', '35.00', '50.00', '35.00', '0.00', '40.00', '10', '个', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012261013789878', '1', '20', '0', '1906', '20', '冰酒', '', '单支', '0.00', '213.00', '0.00', '0.00', '145.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012281013665871', '1', '100', '0', '1907', '99', '冰酒6支装木盒', '', '盒子', '0.00', '2.00', '0.00', '0.00', '10.00', '10', '个', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012301013247664', '1', '20', '0', '2001', '20', '科乐克金章318干红', '', '--', '106.00', '248.00', '72.00', '0.00', '178.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012321013370183', '1', '20', '0', '2002', '20', '科乐克金章708干红', '', '--', '86.00', '168.00', '50.00', '0.00', '128.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012351013642788', '1', '20', '0', '2003', '20', '科乐克金章干白', '', '--', '60.00', '158.00', '42.00', '0.00', '108.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012391013357267', '1', '20', '0', '2004', '20', '科乐克贵族红干红', '', '--', '258.00', '658.00', '162.00', '0.00', '398.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012421013165055', '1', '20', '0', '2005', '20', '科乐克贵族金干红', '', '--', '136.00', '398.00', '102.00', '0.00', '258.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012451013538534', '1', '20', '0', '2006', '20', '科乐克贵族银干红', '', '--', '116.00', '298.00', '87.00', '0.00', '208.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012491013206833', '1', '20', '0', '2007', '20', '科乐克风车干红', '', '--', '46.00', '118.00', '35.00', '0.00', '78.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012521013056297', '1', '20', '0', '2008', '20', '科乐克赤霞珠干红', '', '--', '28.00', '98.00', '22.00', '0.00', '58.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012561013338191', '1', '20', '0', '2009', '20', '科乐克城堡干红(3L简装)2016', '', '(3L简装)2016', '0.00', '0.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012601013291361', '1', '20', '0', '2010', '20', '科乐克城堡干红(3L装)2016', '', '(3L装)2016', '0.00', '598.00', '180.00', '0.00', '398.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012631013827948', '1', '20', '0', '2011', '20', '科乐克城堡干红(3L装)2015', '', '(3L装)2015', '0.00', '798.00', '0.00', '0.00', '598.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012671013746631', '1', '20', '0', '2012', '20', '科波拉金钻干红', '', '--', '40.00', '0.00', '30.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012711013442425', '1', '20', '0', '2013', '20', '科乐克男爵干红(金标)', '', '金标', '34.00', '118.00', '18.00', '0.00', '70.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012751013374020', '1', '20', '0', '2014', '20', '科乐克男爵干红(红标)', '', '红标', '34.00', '118.00', '18.00', '0.00', '70.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012791013877183', '1', '20', '0', '2015', '99', '索罗金干红', '', '--', '30.00', '0.00', '25.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012831013354914', '1', '20', '0', '2016', '20', '科乐克红标小教堂', '', '--', '32.00', '108.00', '18.00', '0.00', '68.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012861013469902', '1', '20', '0', '2017', '20', '科乐克康萨城堡干红', '', '--', '98.00', '238.00', '48.00', '0.00', '168.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012901013476040', '1', '20', '0', '2018', '20', '科乐克酒庄干红', '', '--', '48.00', '128.00', '26.00', '0.00', '88.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012941013466464', '1', '20', '0', '2019', '20', '科乐克波尔多干红', '', '--', '38.00', '98.00', '18.00', '0.00', '58.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353012981013878451', '1', '20', '0', '2020', '20', '科乐克城堡干红', '', '--', '70.00', '168.00', '35.00', '0.00', '128.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353013011013693041', '1', '20', '0', '2021', '20', '科乐克尚宝龙城堡', '', '--', '225.00', '980.00', '140.00', '0.00', '580.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353013051013359717', '1', '20', '0', '2022', '20', '科乐克传奇2015干红', '', '--', '48.00', '198.00', '28.00', '0.00', '138.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353013081013318557', '1', '50', '0', '3001', '99', '沈荡黄酒-8年足陈(小红坛)', '', '8年足陈', '0.00', '38.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353013111013942531', '1', '50', '0', '3002', '99', '沈荡黄酒-5年足陈(小陶坛)', '', '5年足陈', '0.00', '18.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1901291353013151013784469', '1', '50', '0', '3003', '99', '沈荡黄酒-窖藏花雕', '', '--', '0.00', '98.00', '0.00', '0.00', '0.00', '20', '瓶', null, '2019-01-29 13:53:01', null);

-- ----------------------------
-- Table structure for bus_shop
-- ----------------------------
DROP TABLE IF EXISTS `bus_shop`;
CREATE TABLE `bus_shop` (
  `shop_id` varchar(32) NOT NULL COMMENT '店仓编号',
  `shop_code` varchar(32) DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(32) NOT NULL COMMENT '店仓名称',
  `position` varchar(32) DEFAULT NULL COMMENT '位置',
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号',
  `contacts` varchar(16) DEFAULT NULL COMMENT '联系人',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `enabled` bit(1) DEFAULT b'0' COMMENT '是否可用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `updated_id` varchar(32) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_shop
-- ----------------------------
INSERT INTO `bus_shop` VALUES ('1812091925576891014843595', '1001', '沈荡店仓', null, '浙江海盐沈荡', '18868382345', '毛哥', '', '', '2018-12-09 19:25:57', '2018-12-09 19:26:09', 'super', '402882be46404313014640b7eb1c000f');
INSERT INTO `bus_shop` VALUES ('1812091930141101014954604', '1002', '嘉兴秀洲店仓', null, '浙江嘉兴秀洲区丽丰新天地对面', '18878972131', '静姐', '测试', '', '2018-12-09 19:30:14', null, 'super', null);
INSERT INTO `bus_shop` VALUES ('1812100008460611014145244', '1003', '海宁店仓', null, '', '19876784563', '小王', '', '', '2018-12-10 00:08:46', null, 'super', null);

-- ----------------------------
-- Table structure for bus_take_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_take_goods`;
CREATE TABLE `bus_take_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT 'goods_id',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `qty` decimal(18,2) DEFAULT NULL COMMENT '自提数量',
  `sale_price` decimal(18,2) NOT NULL COMMENT '实际销售价(销售价、会员价)',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否逻辑删除',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '自提时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易商品寄存表';

-- ----------------------------
-- Records of bus_take_goods
-- ----------------------------

-- ----------------------------
-- Table structure for bus_vip
-- ----------------------------
DROP TABLE IF EXISTS `bus_vip`;
CREATE TABLE `bus_vip` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `customer_code` varchar(32) NOT NULL COMMENT '客户编号',
  `card_type` int(11) DEFAULT NULL,
  `card_no` varchar(32) NOT NULL COMMENT '会员卡号',
  `mobile` varchar(64) NOT NULL COMMENT '手机号',
  `wechat` varchar(32) DEFAULT NULL COMMENT '微信号',
  `cn_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(16) DEFAULT NULL COMMENT '姓别',
  `brithday` datetime DEFAULT NULL COMMENT '出生日期',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `origin_precent` decimal(18,2) DEFAULT NULL COMMENT '本金比例',
  `vip_time` datetime DEFAULT NULL COMMENT '开卡时间',
  `gift_price` decimal(18,2) DEFAULT '0.00',
  `enable_price` decimal(18,2) DEFAULT '0.00' COMMENT '可用余额',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否可用',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_name` varchar(64) DEFAULT NULL COMMENT '创建人',
  `updated_name` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡信息';

-- ----------------------------
-- Records of bus_vip
-- ----------------------------
INSERT INTO `bus_vip` VALUES ('1901230115344381016353505', 'VIP100086', '3', '13645835318', '13645835318', '', '邹贺良', '', null, '', '1.10', '2019-01-23 01:15:34', '1.51', '352.00', '', '', '2019-02-10 23:35:35', 'super', '超级管理员');
INSERT INTO `bus_vip` VALUES ('1901230129238321016842613', 'VIP100085', '3', '609273', '609273', '', '祝元军', '', null, '', '1.00', '2019-01-23 01:29:23', '0.00', '0.00', '', '', '2019-02-08 22:46:23', 'super', '超级管理员');
INSERT INTO `bus_vip` VALUES ('1901230129359601016497779', 'VIP100084', '3', '13625738888', '13625738888', '', '祝海忠', '', null, '', '2.00', '2019-01-23 01:29:35', '100.00', '200.00', '', '', '2019-02-02 13:35:48', 'super', '超级管理员');
INSERT INTO `bus_vip` VALUES ('1901230129457461016272640', 'VIP100083', '3', '636619', '636619', '', '朱周良', '', null, '', '1.00', '2019-01-23 01:29:45', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230129587111016715693', 'VIP100082', '3', '13505735167', '13505735167', '', '朱云伟', '', null, '', '1.00', '2019-01-23 01:29:58', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230130142321016584363', 'VIP100081', '3', '13906830111', '13906830111', '', '朱月忠', '', null, '', '1.00', '2019-01-23 01:30:14', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230130242531016641150', 'VIP100080', '3', '13456335918', '13456335918', '', '朱祥飞', '', null, '', '1.00', '2019-01-23 01:30:24', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230130333791016579719', 'VIP100079', '3', '13857390280', '13857390280', '', '朱惠明', '', null, '', '1.00', '2019-01-23 01:30:33', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230130444981016444009', 'VIP100078', '3', '18857366828', '18857366828', '', '周云泉', '', null, '', '1.00', '2019-01-23 01:30:44', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230131377121016113490', 'VIP100077', '3', 'VIP100077', '', '', '周武', '', null, '', '1.00', '2019-01-23 01:31:37', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230131467591016933393', 'VIP100076', '3', '13575333000', '13575333000', '', '周平', '', null, '', '1.00', '2019-01-23 01:31:46', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230131572061016487080', 'VIP100075', '3', 'VIP100075', '', '', '周江峰', '', null, '', '1.00', '2019-01-23 01:31:57', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230132074261016158780', 'VIP100074', '3', '13758065060', '13758065060', '', '钟铮', '', null, '', '1.00', '2019-01-23 01:32:07', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230132193501016918765', 'VIP100073', '3', '15157309100', '15157309100', '', '郑晓龙', '', null, '', '1.00', '2019-01-23 01:32:19', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230133145041016709086', 'VIP100072', '3', '13356006868', '13356006868', '', '郑利明', '', null, '', '1.00', '2019-01-23 01:33:14', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230134048491016372940', 'VIP100071', '3', 'VIP100071', '', '', '赵锡军', '', null, '', '1.00', '2019-01-23 01:34:04', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230134143881016982772', 'VIP100070', '3', '658551', '658551', '', '赵利斌', '', null, '', '1.00', '2019-01-23 01:34:14', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230134275501016183049', 'VIP100069', '3', '18267312568', '18267312568', '', '张增辉', '', null, '', '1.00', '2019-01-23 01:34:27', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230134424831016351434', 'VIP100068', '3', '13806739002', '13806739002', '', '张一舟', '', null, '', '1.00', '2019-01-23 01:34:42', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230134542941016446198', 'VIP100067', '3', '13311602923', '13311602923', '', '张小松', '', null, '', '1.00', '2019-01-23 01:34:54', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230135058391016038562', 'VIP100066', '3', '630388', '630388', '', '张松华', '', null, '', '1.00', '2019-01-23 01:35:05', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230135198141016576360', 'VIP100065', '3', '13819066693', '13819066693', '', '张平', '', null, '', '1.00', '2019-01-23 01:35:19', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230135323421016905853', 'VIP100064', '3', '13305732633', '13305732633', '', '张杰', '', null, '', '1.00', '2019-01-23 01:35:32', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230135461591016911473', 'VIP100063', '3', '15157355888', '15157355888', '', '郁旭峰', '', null, '', '1.00', '2019-01-23 01:35:46', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230135579211016452510', 'VIP100062', '3', '13706830998', '13706830998', '', '姚伟强', '', null, '', '1.00', '2019-01-23 01:35:57', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230136093081016506128', 'VIP100061', '3', '15397266888', '15397266888', '', '姚伟明', '', null, '', '1.00', '2019-01-23 01:36:09', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230136188521016577435', 'VIP100060', '3', 'VIP100060', '', '', '杨志顺', '', null, '', '1.00', '2019-01-23 01:36:18', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230136317971016060704', 'VIP100059', '3', '15906836666', '15906836666', '', '杨易才', '', null, '', '1.00', '2019-01-23 01:36:31', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230136416921016890090', 'VIP100058', '3', '13806739127', '13806739127', '', '薛海珍', '', null, '', '1.00', '2019-01-23 01:36:41', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230136523311016117882', 'VIP100057', '3', '18911261428', '18911261428', '', '许卫星', '', null, '', '1.00', '2019-01-23 01:36:52', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230137169931016098492', 'VIP100056', '3', '231031', '231031', '', '许伟', '', null, '', '1.00', '2019-01-23 01:37:16', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230137287481016699721', 'VIP100055', '3', '18657300000', '18657300000', '', '许立峰', '', null, '', '1.00', '2019-01-23 01:37:28', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230137376671016420889', 'VIP100054', '3', '13906830133', '13906830133', '', '许加生', '', null, '', '1.00', '2019-01-23 01:37:37', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230137478391016581791', 'VIP100053', '3', '668038', '668038', '', '徐有良', '', null, '', '1.00', '2019-01-23 01:37:47', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230138031001016248014', 'VIP100052', '3', '669308', '669308', '', '徐永新', '', null, '', '1.00', '2019-01-23 01:38:03', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230138145111016179149', 'VIP100051', '3', '664444', '664444', '', '徐金平', '', null, '', '1.00', '2019-01-23 01:38:14', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230138255221016595847', 'VIP100050', '3', '13511325888', '13511325888', '', '夏高其', '', null, '', '1.00', '2019-01-23 01:38:25', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230138395551016377454', 'VIP100049', '3', 'VIP100049', '', '', '吴其明', '', null, '', '1.00', '2019-01-23 01:38:39', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230138510831016373394', 'VIP100048', '3', '13906837345', '13906837345', '', '王中林', '', null, '', '1.00', '2019-01-23 01:38:51', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230139009841016082634', 'VIP100047', '3', 'VIP100047', '', '', '王永军', '', null, '', '1.00', '2019-01-23 01:39:00', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230139112101016004585', 'VIP100046', '3', '13305735524', '13305735524', '', '王伟', '', null, '', '1.00', '2019-01-23 01:39:11', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230139235081016725531', 'VIP100045', '3', 'VIP100045', '', '', '王连才', '', null, '', '1.00', '2019-01-23 01:39:23', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230139358411016277159', 'VIP100044', '3', '15257323788', '15257323788', '', '王李平', '', null, '', '1.00', '2019-01-23 01:39:35', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230139507951016679033', 'VIP100043', '3', '00000632488', '00000632488', '', '王建军', '', null, '', '1.00', '2019-01-23 01:39:50', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230140037151016450323', 'VIP100042', '3', '18157349999', '18157349999', '', '王高飞', '', null, '', '1.00', '2019-01-23 01:40:03', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230140303211016244445', 'VIP100041', '3', '13656725555', '13656725555', '', '王福生', '', null, '', '1.00', '2019-01-23 01:40:30', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230140400221016058777', 'VIP100040', '3', 'VIP100040', '', '', '童小军', '', null, '', '1.00', '2019-01-23 01:40:40', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230140513871016246471', 'VIP100039', '3', 'VIP100039', '', '', '唐金炎', '', null, '', '1.00', '2019-01-23 01:40:51', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230141024541016280412', 'VIP100038', '3', '18057319777', '18057319777', '', '唐佳祥', '', null, '', '1.00', '2019-01-23 01:41:02', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230141165251016066533', 'VIP100037', '3', '13655730011', '13655730011', '', '盛利华', '', null, '', '1.00', '2019-01-23 01:41:16', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230141329801016075908', 'VIP100036', '3', '13844843866', '13844843866', '', '沈建军', '', null, '', '1.00', '2019-01-23 01:41:32', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230141505111016560447', 'VIP100035', '3', '13867366006', '13867366006', '', '秦荣亮', '', null, '', '1.00', '2019-01-23 01:41:50', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230142036971016099891', 'VIP100034', '3', '217206', '217206', '', '钱燕飞', '', null, '', '1.00', '2019-01-23 01:42:03', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230142167551016981317', 'VIP100033', '3', '13967320111', '13967320111', '', '潘建中', '', null, '', '1.00', '2019-01-23 01:42:16', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230142276741016424103', 'VIP100032', '3', '689121', '689121', '', '潘海峰', '', null, '', '1.00', '2019-01-23 01:42:27', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230142394401016836903', 'VIP100031', '3', 'VIP100031', '', '', '缪伟明', '', null, '', '1.00', '2019-01-23 01:42:39', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230142532781016128769', 'VIP100030', '3', '13004210088', '13004210088', '', '毛建明', '', null, '', '1.00', '2019-01-23 01:42:53', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230143108571016983295', 'VIP100029', '3', '13757370877', '13757370877', '', '马永华', '', null, '', '1.00', '2019-01-23 01:43:10', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230143215331016680065', 'VIP100028', '3', '15067334567', '15067334567', '', '马品术', '', null, '', '1.00', '2019-01-23 01:43:21', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230143383811016054894', 'VIP100027', '3', '699688', '699688', '', '马德祥', '', null, '', '1.00', '2019-01-23 01:43:38', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230143523041016500011', 'VIP100026', '3', '15824361111', '15824361111', '', '陆小平', '', null, '', '1.00', '2019-01-23 01:43:52', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230144039371016510832', 'VIP100025', '3', '635878', '635878', '', '陆建中', '', null, '', '1.00', '2019-01-23 01:44:03', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230144185361016532409', 'VIP100024', '3', '13957399099', '13957399099', '', '陆成中', '', null, '', '1.00', '2019-01-23 01:44:18', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230144315851016555068', 'VIP100023', '3', '13586308888', '13586308888', '', '刘其武', '', null, '', '1.00', '2019-01-23 01:44:31', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230144479651016805323', 'VIP100021', '3', 'VIP100021', '', '', '林加生', '', null, '', '1.00', '2019-01-23 01:44:47', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230145002961016422125', 'VIP100020', '3', 'VIP100020', '', '', '李荣光', '', null, '', '1.00', '2019-01-23 01:45:00', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230145136761016094004', 'VIP100019', '3', '679772', '679772', '', '李进', '', null, '', '1.00', '2019-01-23 01:45:13', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230145344451016209093', 'VIP100018', '3', '13906833683', '13906833683', '', '李家生', '', null, '', '1.00', '2019-01-23 01:45:34', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230145483981016727293', 'VIP100017', '3', 'VIP100017', '', '', '蒋敏峰', '', null, '', '1.00', '2019-01-23 01:45:48', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230146004851016587676', 'VIP100016', '3', 'VIP100016', '', '', '蒋马飞', '', null, '', '1.00', '2019-01-23 01:46:00', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230146130521016853057', 'VIP100015', '3', '15857301888', '15857301888', '', '黄伟康', '', null, '', '1.00', '2019-01-23 01:46:13', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230146281841016790530', 'VIP100014', '3', '18357331155', '18357331155', '', '高红光', '', null, '', '1.00', '2019-01-23 01:46:28', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230146439301016193295', 'VIP100013', '3', '639025', '639025', '', '冯惠松', '', null, '', '1.00', '2019-01-23 01:46:43', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230147112801016764107', 'VIP100012', '3', '677777', '677777', '', '冯法军', '', null, '', '1.00', '2019-01-23 01:47:11', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230147299671016794897', 'VIP100011', '3', '18805730005', '18805730005', '', '方志坚', '', null, '', '1.00', '2019-01-23 01:47:29', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230147503301016392702', 'VIP100010', '3', '13706585213', '13706585213', '', '方国民', '', null, '', '1.00', '2019-01-23 01:47:50', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230148048351016948222', 'VIP100009', '3', '13905739681', '13905739681', '', '戴国军', '', null, '', '1.00', '2019-01-23 01:48:04', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230148166581016956465', 'VIP100008', '3', '622890', '622890', '', '崔强英', '', null, '', '1.00', '2019-01-23 01:48:16', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230148321111016196431', 'VIP100007', '3', '638000', '638000', '', '陈明甫', '', null, '', '1.00', '2019-01-23 01:48:32', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230148510251016637304', 'VIP100006', '3', 'VIP100006', '', '', '陈红旗', '', null, '', '1.00', '2019-01-23 01:48:51', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230149083651016813524', 'VIP100005', '3', '18006730777', '18006730777', '', '陈朝辉', '', null, '', '1.00', '2019-01-23 01:49:08', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230149228941016651890', 'VIP100004', '3', '13216335589', '13216335589', '', '曹伟', '', null, '', '1.00', '2019-01-23 01:49:22', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230149338741016095767', 'VIP100003', '3', '650510', '650510', '', '曹飞', '', null, '', '1.00', '2019-01-23 01:49:33', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230149461211016536154', 'VIP100002', '3', '620290', '620290', '', '鲍峰', '', null, '', '1.00', '2019-01-23 01:49:46', '0.00', '0.00', '', '', null, 'super', null);
INSERT INTO `bus_vip` VALUES ('1901230149599681016776400', 'VIP100001', '3', '13806736549', '13806736549', '', '包劲松', '', null, '', '1.00', '2019-01-23 01:49:59', '0.00', '0.00', '', '', null, 'super', null);

-- ----------------------------
-- Table structure for bus_vip_unpaid
-- ----------------------------
DROP TABLE IF EXISTS `bus_vip_unpaid`;
CREATE TABLE `bus_vip_unpaid` (
  `unpaid_id` varchar(32) NOT NULL COMMENT '挂账支付Id',
  `customer_code` varchar(32) DEFAULT NULL COMMENT '会员Id',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '店仓编号',
  `pay_mode` smallint(6) DEFAULT NULL COMMENT '结款方式  1 银行卡，2 现金，3 支付宝，4 微信，6、挂账，7 会员(卡),99 其他',
  `trade_type` smallint(6) DEFAULT NULL COMMENT '交易类型  1 挂账，2 挂账结款 3会员卡消费 4会员卡充值',
  `trade_status` smallint(6) DEFAULT NULL COMMENT '交易状态  30 交易成功，40 交易取消 ',
  `trade_time` datetime DEFAULT NULL COMMENT '订单交易时间',
  `trade_price` decimal(18,2) DEFAULT NULL COMMENT '交易金额',
  `gift_price` decimal(18,2) DEFAULT NULL COMMENT '赠金',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `created_name` varchar(32) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_name` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `card_no` varchar(32) DEFAULT NULL,
  `unusual` bit(1) DEFAULT NULL COMMENT '标记异常单据',
  `pay_id` varchar(32) DEFAULT '' COMMENT '账单id',
  `relation_id` varchar(32) DEFAULT NULL COMMENT '用于会员卡充值时出现该客户存在挂账欠帐的情况',
  PRIMARY KEY (`unpaid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂账明细';

-- ----------------------------
-- Records of bus_vip_unpaid
-- ----------------------------
INSERT INTO `bus_vip_unpaid` VALUES ('1901291003237411017217666', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-01-29 10:03:23', '1200.00', '200.00', '', null, null, '2019-01-29 10:03:23', null, '2019-02-02 13:41:08', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901291004086571017648192', 'VIP100086', '1812091925576891014843595', '7', '3', '30', '2019-01-29 10:04:08', '-38.00', '-6.33', null, '2019012901100100001', null, '2019-01-29 10:04:08', null, null, '13645835318', '\0', '1901291004086561010971254', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901291200397621017722904', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-01-29 12:00:39', '1300.00', '300.00', '', null, null, '2019-01-29 12:00:39', null, '2019-02-02 13:33:33', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901291203529021017695015', 'VIP100086', '1812091925576891014843595', '6', '1', '30', '2019-01-29 12:03:52', '-3600.00', '0.00', null, '2019012901100100002', null, '2019-01-29 12:03:52', null, '2019-01-31 13:26:26', null, '', '1901291203529021010415351', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901300941436791017310581', 'VIP100086', '1812091930141101014954604', '2', '4', '30', '2019-01-30 09:41:43', '2600.00', '600.00', '', null, null, '2019-01-30 09:41:43', null, '2019-02-02 13:31:57', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901301012420721017791083', 'VIP100086', '1812091930141101014954604', '2', '4', '30', '2019-01-30 10:12:42', '32800.00', '3000.00', '', null, null, '2019-01-30 10:12:42', null, '2019-02-02 13:27:39', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901301019273091017712550', 'VIP100086', '1812091930141101014954604', '2', '4', '30', '2019-01-30 10:19:27', '20.00', '10.00', '', null, null, '2019-01-30 10:19:27', null, '2019-02-02 13:27:23', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901301028203781017540414', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-01-30 10:28:20', '32.00', '12.00', '', null, null, '2019-01-30 10:28:20', null, '2019-02-02 13:25:41', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901311214128871017936637', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-01-31 12:14:12', '600.00', '0.00', '', null, null, '2019-01-31 12:14:12', null, '2019-02-02 13:51:17', null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901311248199821017149581', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-01-31 12:48:19', '1000.00', '0.00', '', null, null, '2019-01-31 12:48:19', null, '2019-02-02 13:51:01', null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1901311326268901017502949', 'VIP100086', '1812091925576891014843595', '6', '1', '40', '2019-01-31 13:26:26', '3600.00', '0.00', null, '2019012901100100002', null, '2019-01-31 13:26:26', null, null, null, '', '1901291203529021010415351', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902011239266151017040123', 'VIP100086', '1812091925576891014843595', '6', '1', '30', '2019-02-01 12:39:26', '-380.00', '0.00', null, '2019020101100100001', null, '2019-02-01 12:39:26', null, null, null, '\0', '1902011239266131010562968', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021325572711017886708', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-02 13:25:41', '-32.00', '-12.00', '', null, null, '2019-02-02 13:25:41', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021327230101017906538', 'VIP100086', '1812091930141101014954604', '2', '4', '40', '2019-02-02 13:27:23', '-20.00', '-10.00', '', null, null, '2019-02-02 13:27:23', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021327395751017042459', 'VIP100086', '1812091930141101014954604', '2', '4', '40', '2019-02-02 13:27:39', '-32800.00', '-3000.00', '', null, null, '2019-02-02 13:27:39', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021331579511017357970', 'VIP100086', '1812091930141101014954604', '2', '4', '40', '2019-02-02 13:31:57', '-2600.00', '-600.00', '', null, null, '2019-02-02 13:31:57', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021333333471017703174', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-02 13:33:33', '-1300.00', '-300.00', '', null, null, '2019-02-02 13:33:33', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021335170721017884888', 'VIP100084', '1812091925576891014843595', '2', '4', '30', '2019-02-02 13:35:17', '200.00', '100.00', '', null, null, '2019-02-02 13:35:17', null, null, '13625738888', '\0', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021335379781017348839', 'VIP100084', '1812091925576891014843595', '2', '4', '30', '2019-02-02 13:35:37', '5800.00', '2900.00', '', null, null, '2019-02-02 13:35:37', null, '2019-02-02 13:35:48', '13625738888', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021335488751017531295', 'VIP100084', '1812091925576891014843595', '2', '4', '40', '2019-02-02 13:35:48', '-5800.00', '-2900.00', '', null, null, '2019-02-02 13:35:48', null, null, '13625738888', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021340592091017998980', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-02 13:40:59', '110.00', '10.00', '', null, null, '2019-02-02 13:40:59', null, null, '13645835318', '\0', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021341088261017511625', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-02 13:41:08', '-1200.00', '-200.00', '', null, null, '2019-02-02 13:41:08', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021347217081017433259', 'VIP100086', '1812091925576891014843595', '6', '1', '30', '2019-02-02 13:47:21', '-3800.00', '0.00', null, '2019020201100100001', null, '2019-02-02 13:47:21', null, null, null, '\0', '1902021347217061010524576', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021349093501017532382', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-02 13:49:09', '80.00', '0.00', '', null, null, '2019-02-02 13:49:09', null, '2019-02-02 13:51:47', null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021350216441017428574', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-02 13:50:21', '120.00', '0.00', '', null, null, '2019-02-02 13:50:21', null, '2019-02-02 13:51:44', null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021351066261017750124', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-02 13:51:01', '-1000.00', '0.00', '', null, null, '2019-02-02 13:51:01', null, null, null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021351173171017674516', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-02 13:51:17', '-600.00', '0.00', '', null, null, '2019-02-02 13:51:17', null, null, null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021351447281017761905', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-02 13:51:44', '-120.00', '0.00', '', null, null, '2019-02-02 13:51:44', null, null, null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902021351479231017319942', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-02 13:51:47', '-80.00', '0.00', '', null, null, '2019-02-02 13:51:47', null, null, null, '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082117345041017705495', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-08 21:17:06', '4180.00', '600.00', '', null, null, '2019-02-08 21:17:06', null, '2019-02-10 20:42:08', null, '', null, '10011902082117230401017118445');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082118415971017084444', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-08 21:17:06', '2420.00', '0.00', '', null, null, '2019-02-08 21:17:06', null, '2019-02-10 20:42:08', '13645835318', '', null, '10011902082117230401017118445');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082122353321017236293', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-08 21:22:35', '5500.00', '500.00', '', null, null, '2019-02-08 21:22:35', null, '2019-02-08 21:22:49', '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082122496071017480427', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-08 21:22:49', '-5500.00', '-500.00', '', null, null, '2019-02-08 21:22:49', null, null, '13645835318', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082218289721017453515', 'VIP100086', '1812091925576891014843595', '6', '1', '30', '2019-02-08 22:18:28', '-3838.00', '0.00', null, '2019020801100100002', null, '2019-02-08 22:18:28', null, null, null, '\0', '1902082218289691010132574', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082219273661017182426', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-08 22:19:27', '3300.00', '300.00', '', null, null, '2019-02-08 22:19:27', null, '2019-02-08 22:39:13', null, '', null, '10011902082219273561017308026');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082219273821017771385', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-08 22:19:27', '0.00', '0.00', '', null, null, '2019-02-08 22:19:27', null, '2019-02-08 22:39:13', '13645835318', '', null, '10011902082219273561017308026');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082239131341017772491', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-08 22:39:13', '-3300.00', '-300.00', '', null, null, '2019-02-08 22:39:13', null, null, null, '', null, '10011902082219273561017308026');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082239132581017158105', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-08 22:39:13', '0.00', '0.00', '', null, null, '2019-02-08 22:39:13', null, null, '13645835318', '', null, '10011902082219273561017308026');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082241336781017238694', 'VIP100085', '1812091925576891014843595', '2', '4', '30', '2019-02-08 22:41:33', '100.00', '0.00', '', null, null, '2019-02-08 22:41:33', null, '2019-02-08 22:46:23', '609273', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082246235511017030850', 'VIP100085', '1812091925576891014843595', '2', '4', '40', '2019-02-08 22:46:23', '-100.00', '0.00', '', null, null, '2019-02-08 22:46:23', null, null, '609273', '', null, null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902082249532141017917998', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-08 22:49:53', '1100.00', '100.00', '', null, null, '2019-02-08 22:49:53', null, '2019-02-08 22:51:27', null, '', null, '10011902082249532111017423472');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082249532201017198991', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-08 22:49:53', '0.00', '0.00', '', null, null, '2019-02-08 22:49:53', null, '2019-02-08 22:52:08', '13645835318', '', null, '10011902082249532111017423472');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082251432241017684489', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-08 22:51:27', '-1100.00', '-100.00', '', null, null, '2019-02-08 22:51:27', null, null, null, '', null, '10011902082249532111017423472');
INSERT INTO `bus_vip_unpaid` VALUES ('1902082252165761017683211', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-08 22:52:08', '0.00', '0.00', '', null, null, '2019-02-08 22:52:08', null, null, '13645835318', '', null, '10011902082249532111017423472');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102041587101017562929', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-10 20:41:58', '-4180.00', '-600.00', '', null, null, '2019-02-10 20:41:58', null, null, null, '', null, '10011902082117230401017118445');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102041588171017476631', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-10 20:41:58', '-2420.00', '0.00', '', null, null, '2019-02-10 20:41:58', null, null, '13645835318', '', null, '10011902082117230401017118445');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102045273861017177040', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-10 20:45:27', '5500.00', '500.00', '', null, null, '2019-02-10 20:45:27', null, '2019-02-10 20:46:58', null, '', null, '10011902102045273811017783933');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102045273951017802291', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-10 20:45:27', '0.00', '0.00', '', null, null, '2019-02-10 20:45:27', null, '2019-02-10 20:46:58', '13645835318', '', null, '10011902102045273811017783933');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102046111391017478807', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-10 20:46:11', '2518.00', '300.00', '', null, null, '2019-02-10 20:46:11', null, null, null, '\0', null, '10011902102046111351017395186');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102046111431017437998', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-10 20:46:11', '782.00', '0.00', '', null, null, '2019-02-10 20:46:11', null, null, '13645835318', '\0', null, '10011902102046111351017395186');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102046580661017254134', 'VIP100086', '1812091925576891014843595', '2', '2', '40', '2019-02-10 20:46:58', '-5500.00', '-500.00', '', null, null, '2019-02-10 20:46:58', null, null, null, '', null, '10011902102045273811017783933');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102046580801017052332', 'VIP100086', '1812091925576891014843595', '2', '4', '40', '2019-02-10 20:46:58', '0.00', '0.00', '', null, null, '2019-02-10 20:46:58', null, null, '13645835318', '', null, '10011902102045273811017783933');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102247080341017416467', 'VIP100086', '1812091925576891014843595', '7', '3', '30', '2019-02-10 22:47:08', '-286.00', '-1.23', null, '2019021001100100001', null, '2019-02-10 22:47:08', null, null, '13645835318', '\0', '1902102247080331010056946', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902102250094231017391272', 'VIP100086', '1812091925576891014843595', '7', '3', '30', '2019-02-10 22:50:09', '-216.00', '-0.93', null, '2019021001100100002', null, '2019-02-10 22:50:09', null, null, '13645835318', '\0', '1902102250094181010240156', null);
INSERT INTO `bus_vip_unpaid` VALUES ('1902102335353591017928845', 'VIP100086', '1812091925576891014843595', '2', '2', '30', '2019-02-10 23:35:35', '1000.00', '100.00', '', null, null, '2019-02-10 23:35:35', null, null, null, '\0', null, '10011902102335353531017445004');
INSERT INTO `bus_vip_unpaid` VALUES ('1902102335354531017932680', 'VIP100086', '1812091925576891014843595', '2', '4', '30', '2019-02-10 23:35:35', '0.00', '0.00', '', null, null, '2019-02-10 23:35:35', null, null, '13645835318', '\0', null, '10011902102335353531017445004');

-- ----------------------------
-- Table structure for doc_asn_details
-- ----------------------------
DROP TABLE IF EXISTS `doc_asn_details`;
CREATE TABLE `doc_asn_details` (
  `asn_detail_id` varchar(32) NOT NULL COMMENT 'asn_detail_id',
  `asn_no` varchar(32) DEFAULT NULL COMMENT '单据号',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `category_code` varchar(32) DEFAULT NULL COMMENT '分类编码',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `parent_sku` varchar(32) DEFAULT NULL COMMENT 'parent_sku',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `po_no` varchar(32) DEFAULT NULL COMMENT '关联po单号',
  `po_line_no` int(11) DEFAULT NULL COMMENT '关联po单号行号',
  `line_status` varchar(32) DEFAULT NULL COMMENT '行状态',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_qty` decimal(18,2) DEFAULT NULL COMMENT '收货数量',
  `order_qty` decimal(18,2) DEFAULT NULL COMMENT '采购数量',
  `expected_qty` decimal(18,2) DEFAULT NULL COMMENT '预期收货数量',
  `damaged_qty` decimal(18,2) DEFAULT NULL COMMENT '破损数量',
  `expected_time` datetime DEFAULT NULL COMMENT '预期收货时间',
  `rejected_qty` decimal(18,2) DEFAULT NULL COMMENT '拒收数量',
  `rejected_time` datetime DEFAULT NULL COMMENT '拒收时间',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `total_price` decimal(18,2) DEFAULT '0.00' COMMENT '商品总金额',
  `cost_price` decimal(18,2) DEFAULT '0.00' COMMENT '成本价',
  `lot_num` varchar(32) DEFAULT '0' COMMENT '批次号',
  `price` decimal(18,2) DEFAULT '0.00' COMMENT '单价',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `goods_type` char(2) DEFAULT NULL COMMENT '货品类别 1 正常，2 强压',
  `volume` decimal(18,2) DEFAULT '0.00' COMMENT '体积',
  `rate_precent` decimal(18,2) DEFAULT '17.00' COMMENT '税率',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`asn_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单明细';

-- ----------------------------
-- Records of doc_asn_details
-- ----------------------------
INSERT INTO `doc_asn_details` VALUES ('1901291003538621018926166', '2019012922100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-01-29 10:03:53', null);
INSERT INTO `doc_asn_details` VALUES ('1901291024012591018469486', '2019012922100100002', '1', '10', '白酒', '', '30', '剑南春', '剑南春-52°', '1302', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-01-29 10:24:01', null);
INSERT INTO `doc_asn_details` VALUES ('1901300946154991018666588', '2019013022100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-01-30 09:46:15', null);
INSERT INTO `doc_asn_details` VALUES ('1901300946155371018646842', '2019013022100200001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-01-30 09:46:15', null);
INSERT INTO `doc_asn_details` VALUES ('1901300946155501018740006', '2019013022100200001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-01-30 09:46:15', null);
INSERT INTO `doc_asn_details` VALUES ('1901300946155631018188329', '2019013022100200001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-01-30 09:46:15', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026283201018151475', '2019020822100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026283491018382597', '2019020822100200001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026283671018762788', '2019020822100200001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026283851018654443', '2019020822100200001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-52°', '1006', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026283981018383304', '2019020822100200001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902081026284111018341205', '2019020822100200001', '6', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-08 10:26:28', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300485971018330532', '2019021022100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300487431018048450', '2019021022100100001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300487591018078341', '2019021022100100001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300487751018890900', '2019021022100100001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-52°', '1004', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300487931018120088', '2019021022100100001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300488101018405923', '2019021022100100001', '6', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-52°', '1006', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300488261018586358', '2019021022100100001', '7', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300488461018654535', '2019021022100100001', '8', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300488661018025128', '2019021022100100001', '9', '10', '白酒', '', '10', '杜康', '杜康珍酿8号-52°', '1009', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '238.00', '0.00', null, '238.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300488831018219885', '2019021022100100001', '10', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489141018792250', '2019021022100100001', '11', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489351018473139', '2019021022100100001', '12', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天合-42°', '1012', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '288.00', '0.00', null, '288.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489511018479590', '2019021022100100001', '13', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天合-60°', '1013', null, '60°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '288.00', '0.00', null, '288.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489691018429204', '2019021022100100001', '14', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天顺-46°', '1014', null, '46°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '398.00', '0.00', null, '398.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489851018661875', '2019021022100100001', '15', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天顺-60°', '1015', null, '60°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '398.00', '0.00', null, '398.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300489991018803809', '2019021022100100001', '16', '10', '白酒', '', '10', '杜康', '杜康特调VIP品鉴酒-46°', '1016', null, '46°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '268.00', '0.00', null, '268.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490321018323223', '2019021022100100001', '17', '10', '白酒', '', '10', '杜康', '杜康特酿-38°', '1017', null, '38°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '178.00', '0.00', null, '178.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490481018696827', '2019021022100100001', '18', '10', '白酒', '', '10', '杜康', '杜康珍藏1973-38°', '1018', null, '38°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '328.00', '0.00', null, '328.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490621018643972', '2019021022100100001', '19', '10', '白酒', '', '10', '杜康', '中华杜康贵宾-41.8°', '1019', null, '41.8°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '98.00', '0.00', null, '98.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490741018251410', '2019021022100100001', '20', '10', '白酒', '', '10', '杜康', '中华杜康贵宾-50.8°', '1020', null, '50.8°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '98.00', '0.00', null, '98.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490861018971695', '2019021022100100001', '21', '10', '白酒', '', '10', '杜康', '中华杜康10年品鉴-41.8°', '1021', null, '41.8°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '288.00', '0.00', null, '288.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300490981018211453', '2019021022100100001', '22', '10', '白酒', '', '10', '杜康', '中华杜康10年-41.8°', '1022', null, '41.8°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '318.00', '0.00', null, '318.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491111018082101', '2019021022100100001', '23', '10', '白酒', '', '10', '杜康', '中华杜康10年-50.8°', '1023', null, '50.8°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '318.00', '0.00', null, '318.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491231018091807', '2019021022100100001', '24', '10', '白酒', '', '10', '杜康', '杜康珍藏年份小酒-52°', '1024', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '68.00', '0.00', null, '68.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491371018838046', '2019021022100100001', '25', '10', '白酒', '', '30', '剑南春', '剑南春-38°', '1301', null, '38°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491541018818956', '2019021022100100001', '26', '10', '白酒', '', '30', '剑南春', '剑南春-52°', '1302', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491681018086123', '2019021022100100001', '27', '10', '白酒', '', '99', '--', '南湖壹号', '1901', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '618.00', '0.00', null, '618.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491821018556226', '2019021022100100001', '28', '20', '葡萄酒', '', '99', '--', '冰酒(木盒6支装)', '1902', null, '木盒6支装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '1280.00', '0.00', null, '1280.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300491941018402958', '2019021022100100001', '29', '20', '葡萄酒', '', '99', '--', '冰酒(木盒2支装)', '1903', null, '木盒2支装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '580.00', '0.00', null, '580.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492081018868890', '2019021022100100001', '30', '20', '葡萄酒', '', '99', '--', '冰酒(皮盒2支装)', '1904', null, '皮盒2支装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '780.00', '0.00', null, '780.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492201018382752', '2019021022100100001', '31', '100', '辅料', '', '99', '--', '精品皮盒', '1905', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '10', null, null, '50.00', '0.00', null, '50.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492321018368633', '2019021022100100001', '32', '20', '葡萄酒', '', '20', '科乐克', '冰酒', '1906', null, '单支', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '213.00', '0.00', null, '213.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492451018643579', '2019021022100100001', '33', '100', '辅料', '', '99', '--', '冰酒6支装木盒', '1907', null, '盒子', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '10', null, null, '10.00', '0.00', null, '10.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492601018876463', '2019021022100100001', '34', '20', '葡萄酒', '', '20', '科乐克', '科乐克金章318干红', '2001', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '248.00', '0.00', null, '248.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492741018323784', '2019021022100100001', '35', '20', '葡萄酒', '', '20', '科乐克', '科乐克金章708干红', '2002', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300492881018646439', '2019021022100100001', '36', '20', '葡萄酒', '', '20', '科乐克', '科乐克金章干白', '2003', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '158.00', '0.00', null, '158.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493031018773079', '2019021022100100001', '37', '20', '葡萄酒', '', '20', '科乐克', '科乐克贵族红干红', '2004', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '658.00', '0.00', null, '658.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493151018040511', '2019021022100100001', '38', '20', '葡萄酒', '', '20', '科乐克', '科乐克贵族金干红', '2005', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '398.00', '0.00', null, '398.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493291018480081', '2019021022100100001', '39', '20', '葡萄酒', '', '20', '科乐克', '科乐克贵族银干红', '2006', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '298.00', '0.00', null, '298.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493391018391094', '2019021022100100001', '40', '20', '葡萄酒', '', '20', '科乐克', '科乐克风车干红', '2007', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '118.00', '0.00', null, '118.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493521018570314', '2019021022100100001', '41', '20', '葡萄酒', '', '20', '科乐克', '科乐克赤霞珠干红', '2008', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '98.00', '0.00', null, '98.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493641018786253', '2019021022100100001', '42', '20', '葡萄酒', '', '20', '科乐克', '科乐克城堡干红(3L简装)2016', '2009', null, '(3L简装)2016', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493761018305520', '2019021022100100001', '43', '20', '葡萄酒', '', '20', '科乐克', '科乐克城堡干红(3L装)2016', '2010', null, '(3L装)2016', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '598.00', '0.00', null, '598.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300493901018857518', '2019021022100100001', '44', '20', '葡萄酒', '', '20', '科乐克', '科乐克城堡干红(3L装)2015', '2011', null, '(3L装)2015', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '798.00', '0.00', null, '798.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494031018877002', '2019021022100100001', '45', '20', '葡萄酒', '', '20', '科乐克', '科波拉金钻干红', '2012', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494151018142883', '2019021022100100001', '46', '20', '葡萄酒', '', '20', '科乐克', '科乐克男爵干红(红标)', '2014', null, '红标', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '118.00', '0.00', null, '118.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494251018079133', '2019021022100100001', '47', '20', '葡萄酒', '', '99', '--', '索罗金干红', '2015', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '0.00', '0.00', null, '0.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494361018011462', '2019021022100100001', '48', '20', '葡萄酒', '', '20', '科乐克', '科乐克红标小教堂', '2016', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '108.00', '0.00', null, '108.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494471018896540', '2019021022100100001', '49', '20', '葡萄酒', '', '20', '科乐克', '科乐克康萨城堡干红', '2017', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '238.00', '0.00', null, '238.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494581018978341', '2019021022100100001', '50', '20', '葡萄酒', '', '20', '科乐克', '科乐克酒庄干红', '2018', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '128.00', '0.00', null, '128.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494711018059886', '2019021022100100001', '51', '20', '葡萄酒', '', '20', '科乐克', '科乐克波尔多干红', '2019', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '98.00', '0.00', null, '98.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494841018997969', '2019021022100100001', '52', '20', '葡萄酒', '', '20', '科乐克', '科乐克城堡干红', '2020', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300494951018176534', '2019021022100100001', '53', '20', '葡萄酒', '', '20', '科乐克', '科乐克尚宝龙城堡', '2021', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '980.00', '0.00', null, '980.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300495081018235826', '2019021022100100001', '54', '20', '葡萄酒', '', '20', '科乐克', '科乐克传奇2015干红', '2022', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '198.00', '0.00', null, '198.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300495211018676405', '2019021022100100001', '55', '50', '黄酒', '', '99', '--', '沈荡黄酒-8年足陈(小红坛)', '3001', null, '8年足陈', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '38.00', '0.00', null, '38.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300495351018763138', '2019021022100100001', '56', '50', '黄酒', '', '99', '--', '沈荡黄酒-5年足陈(小陶坛)', '3002', null, '5年足陈', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '18.00', '0.00', null, '18.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902102300495491018281036', '2019021022100100001', '57', '50', '黄酒', '', '99', '--', '沈荡黄酒-窖藏花雕', '3003', null, '--', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '98.00', '0.00', null, '98.00', null, null, null, null, null, null, '', '2019-02-10 23:00:48', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717500551018424316', '2019021123100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717502441018517331', '2019021123100200001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717502661018211615', '2019021123100200001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-52°', '1004', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717502821018582722', '2019021123100200001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717502991018903071', '2019021123100200001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902111717503141018734813', '2019021123100200001', '6', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-11 17:17:50', null);
INSERT INTO `doc_asn_details` VALUES ('1902120227553751018058766', '2019021223100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '88.00', '0.00', null, '88.00', null, null, null, null, null, null, '', '2019-02-12 02:27:55', null);
INSERT INTO `doc_asn_details` VALUES ('1902120227553991018312584', '2019021223100200001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-12 02:27:55', null);
INSERT INTO `doc_asn_details` VALUES ('1902120227554101018394125', '2019021223100200001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-12 02:27:55', null);
INSERT INTO `doc_asn_details` VALUES ('1902120227554231018098123', '2019021223100200001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '168.00', '0.00', null, '168.00', null, null, null, null, null, null, '', '2019-02-12 02:27:55', null);
INSERT INTO `doc_asn_details` VALUES ('1902120227554351018223593', '2019021223100200001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '368.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-12 02:27:55', null);
INSERT INTO `doc_asn_details` VALUES ('1902120238189171018738514', '2019021223100200002', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, '10.00', '10.00', null, '0.00', null, '0.00', null, '20', null, null, '3680.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-12 02:38:18', null);
INSERT INTO `doc_asn_details` VALUES ('1902120239402361018651342', '2019021222100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, '10.00', '10.00', null, '0.00', null, '0.00', null, '20', null, null, '3680.00', '0.00', null, '368.00', null, null, null, null, null, null, '', '2019-02-12 02:39:40', null);
INSERT INTO `doc_asn_details` VALUES ('1902120240409321018309630', '2019021222100200002', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-12 02:40:40', null);
INSERT INTO `doc_asn_details` VALUES ('1902120241197791018670692', '2019021222100200003', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '56.00', '0.00', null, '56.00', null, null, null, null, null, null, '', '2019-02-12 02:41:19', null);

-- ----------------------------
-- Table structure for doc_asn_header
-- ----------------------------
DROP TABLE IF EXISTS `doc_asn_header`;
CREATE TABLE `doc_asn_header` (
  `asn_no` varchar(32) NOT NULL COMMENT '入库单编号',
  `print_count` int(255) DEFAULT '0' COMMENT '打印次数',
  `ext_order_no` varchar(32) DEFAULT NULL COMMENT '外部订单id',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `check_user_id` varchar(32) DEFAULT NULL COMMENT '审核人id',
  `check_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `check_status` char(2) DEFAULT NULL COMMENT '审核状态 00 未审核，10 审核通过，20 审核不通过',
  `po_no` varchar(32) DEFAULT NULL COMMENT '关联要货单号',
  `order_no` varchar(32) DEFAULT NULL COMMENT '关联出库单号',
  `asn_type` char(3) DEFAULT NULL COMMENT '单据类型',
  `asn_status` char(3) DEFAULT NULL COMMENT '单据状态',
  `asn_source` char(10) DEFAULT NULL COMMENT '单据来源',
  `order_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单总金额',
  `to_shop_id` varchar(32) DEFAULT NULL COMMENT '收货店仓id',
  `to_shop_name` varchar(64) DEFAULT NULL COMMENT '收货店仓名称',
  `from_shop_id` varchar(32) DEFAULT NULL COMMENT '发货店仓id',
  `from_shop_name` varchar(64) DEFAULT NULL COMMENT '发货店仓名称',
  `expected_time` datetime DEFAULT NULL COMMENT '预期到货时间',
  `volume` decimal(18,2) DEFAULT '0.00' COMMENT '体积',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '承运人id',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '承运人姓名',
  `place_loading` varchar(32) DEFAULT NULL COMMENT '装货地',
  `place_discharge` varchar(32) DEFAULT NULL COMMENT '卸货地',
  `pay_terms` varchar(32) DEFAULT NULL COMMENT '付款条款',
  `delivery_terms` varchar(32) DEFAULT NULL COMMENT '交付条款',
  `descr` varchar(2156) DEFAULT NULL COMMENT '描述',
  `vehicle_no` varchar(32) DEFAULT NULL COMMENT '车号',
  `address` varchar(512) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `zip_code` varchar(32) DEFAULT NULL COMMENT '邮编',
  `supplier_id` varchar(32) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(32) DEFAULT NULL COMMENT '供应商名称',
  `supplier_address` varchar(128) DEFAULT NULL COMMENT '供应商地址',
  `supplier_zip_code` varchar(32) DEFAULT NULL COMMENT '供应商邮编',
  `supplier_contact` varchar(32) DEFAULT NULL COMMENT '供应商联系人',
  `supplier_tel` varchar(32) DEFAULT NULL COMMENT '供应商电话',
  `i_id` varchar(32) DEFAULT NULL COMMENT '下单人id',
  `i_name` varchar(32) DEFAULT NULL COMMENT '下单人名称',
  `i_address` varchar(128) DEFAULT NULL COMMENT '下单人地址',
  `i_zip_code` varchar(32) DEFAULT NULL COMMENT '下单人邮编',
  `i_contact` varchar(32) DEFAULT NULL COMMENT '下单人联系人',
  `i_tel` varchar(32) DEFAULT NULL COMMENT '下单人电话',
  `receiving_time` datetime DEFAULT NULL COMMENT '交付时间',
  `created_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_name` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`asn_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库单';

-- ----------------------------
-- Records of doc_asn_header
-- ----------------------------
INSERT INTO `doc_asn_header` VALUES ('2019012922100100001', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '56.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2019-01-29 10:03:53', '超级管理员', '2019-01-29 10:03:53', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019012922100100002', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '0.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2019-01-29 10:24:01', '超级管理员', '2019-01-29 10:24:01', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019013022100200001', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '648.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'f36328d24baff4d1014baff87a660012', '小周', '嘉兴秀洲店仓', null, '小周', null, '2019-01-30 09:46:15', '小周', '2019-01-30 09:46:15', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019020822100200001', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '1016.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-08 10:26:28', '孙静', '2019-02-08 10:26:28', '孙静', '2019-02-08 10:26:46');
INSERT INTO `doc_asn_header` VALUES ('2019021022100100001', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '14529.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2019-02-10 23:00:48', '超级管理员', '2019-02-10 23:00:48', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019021123100200001', '0', null, null, null, null, null, null, null, '23', 'A20', 'pc', '936.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-11 17:17:50', '孙静', '2019-02-11 17:17:50', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019021222100200001', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '3680.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-12 02:39:40', '孙静', '2019-02-12 02:39:40', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019021222100200002', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '56.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-12 02:40:40', '孙静', '2019-02-12 02:40:40', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019021222100200003', '0', null, null, null, null, null, null, null, '22', 'A20', 'pc', '56.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-12 02:41:19', '孙静', '2019-02-12 02:41:19', null, null);
INSERT INTO `doc_asn_header` VALUES ('2019021223100200001', '0', '1234567', null, null, null, null, null, null, '23', 'A90', 'pc', '960.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'GYS100001', '红酒供应商测试', '测试地址', null, '测试小王', '18812345671', '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-12 02:27:55', '孙静', '2019-02-12 02:27:55', '孙静', '2019-02-12 03:06:07');
INSERT INTO `doc_asn_header` VALUES ('2019021223100200002', '0', '', null, null, null, null, null, null, '23', 'A20', 'pc', '3680.00', '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'GYS100001', '红酒供应商测试', '测试地址', null, '测试小王', '18812345671', '402881ea68bcaece0168bcb03d150002', '孙静', '嘉兴秀洲店仓', null, '孙静', null, '2019-02-12 02:38:18', '孙静', '2019-02-12 02:38:18', null, null);

-- ----------------------------
-- Table structure for doc_order_details
-- ----------------------------
DROP TABLE IF EXISTS `doc_order_details`;
CREATE TABLE `doc_order_details` (
  `so_detail_id` varchar(32) NOT NULL COMMENT 'so_detail_id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '单据号',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `category_code` varchar(32) DEFAULT NULL COMMENT '分类编码',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `parent_sku` varchar(32) DEFAULT NULL COMMENT 'parent_sku',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `lot_num` varchar(32) DEFAULT '0' COMMENT '批次号',
  `line_status` varchar(32) DEFAULT NULL COMMENT '行状态',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_qty` decimal(18,2) DEFAULT NULL COMMENT '收货数量',
  `ordered_qty` decimal(18,2) DEFAULT NULL COMMENT '订购数量',
  `picked_qty` decimal(18,2) DEFAULT NULL COMMENT '拣货数量',
  `shipped_qty` decimal(18,2) DEFAULT NULL COMMENT '发货数量',
  `sub_qty` decimal(18,2) DEFAULT '0.00' COMMENT '商品增减数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `total_price` decimal(18,2) DEFAULT '0.00' COMMENT '商品总金额',
  `cost_price` decimal(18,2) DEFAULT '0.00' COMMENT '成本价',
  `price` decimal(18,2) DEFAULT '0.00' COMMENT '单价',
  `volume` decimal(18,2) DEFAULT NULL COMMENT '体积',
  `rate_precent` decimal(18,2) DEFAULT '17.00' COMMENT '税率',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`so_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库单明细';

-- ----------------------------
-- Records of doc_order_details
-- ----------------------------
INSERT INTO `doc_order_details` VALUES ('1901291016258561020556111', '2019012912100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-01-29 10:16:25', null);
INSERT INTO `doc_order_details` VALUES ('1901291016260461020615490', '2019012912100100001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-01-29 10:16:25', null);
INSERT INTO `doc_order_details` VALUES ('1901291041503271020264881', '2019012916100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-01-29 10:41:50', null);
INSERT INTO `doc_order_details` VALUES ('1901291041503771020918269', '2019012916100100001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-01-29 10:41:50', null);
INSERT INTO `doc_order_details` VALUES ('1901291116083951020941133', '2019012915100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116086441020673644', '2019012915100100001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116086621020406499', '2019012915100100001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116086781020494062', '2019012915100100001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-52°', '1004', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116086991020311979', '2019012915100100001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087151020795932', '2019012915100100001', '6', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-52°', '1006', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087321020416714', '2019012915100100001', '7', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087491020733070', '2019012915100100001', '8', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087641020495735', '2019012915100100001', '9', '10', '白酒', '', '10', '杜康', '杜康珍酿8号-52°', '1009', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '238.00', '0.00', '238.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087771020634702', '2019012915100100001', '10', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '368.00', '0.00', '368.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116087891020326181', '2019012915100100001', '11', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '368.00', '0.00', '368.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1901291116088001020588047', '2019012915100100001', '12', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天合-42°', '1012', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '288.00', '0.00', '288.00', null, null, '', '2019-01-29 11:16:08', null);
INSERT INTO `doc_order_details` VALUES ('1902071232578441020993660', '2019020716100100001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580061020072742', '2019020716100100001', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580191020774787', '2019020716100100001', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580331020283362', '2019020716100100001', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-52°', '1004', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580461020535378', '2019020716100100001', '5', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-42°', '1005', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580581020822676', '2019020716100100001', '6', '10', '白酒', '', '10', '杜康', '杜康珍藏5号-52°', '1006', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580711020330920', '2019020716100100001', '7', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580841020367076', '2019020716100100001', '8', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-52°', '1008', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232580961020093605', '2019020716100100001', '9', '10', '白酒', '', '10', '杜康', '杜康珍酿8号-52°', '1009', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '238.00', '0.00', '238.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232581071020722720', '2019020716100100001', '10', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-42°', '1010', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '368.00', '0.00', '368.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232581201020035374', '2019020716100100001', '11', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆8号-52°', '1011', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '368.00', '0.00', '368.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071232581311020410785', '2019020716100100001', '12', '10', '白酒', '', '10', '杜康', '杜康珍藏原浆天合-42°', '1012', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '288.00', '0.00', '288.00', null, null, '', '2019-02-07 12:32:57', null);
INSERT INTO `doc_order_details` VALUES ('1902071237216561020791071', '2019020716100100002', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-42°', '1001', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '56.00', '0.00', '56.00', null, null, '', '2019-02-07 12:37:21', null);
INSERT INTO `doc_order_details` VALUES ('1902071237216751020000477', '2019020716100100002', '2', '10', '白酒', '', '10', '杜康', '杜康珍藏15号-52°', '1002', null, '52°', null, null, null, null, null, null, null, '1.00', null, '10.00', null, '20', null, null, '560.00', '0.00', '56.00', null, null, '', '2019-02-07 12:37:21', null);
INSERT INTO `doc_order_details` VALUES ('1902071237216931020335580', '2019020716100100002', '3', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-42°', '1003', null, '42°', null, null, null, null, null, null, null, '1.00', null, '130.00', null, '20', null, null, '11440.00', '0.00', '88.00', null, null, '', '2019-02-07 12:37:21', null);
INSERT INTO `doc_order_details` VALUES ('1902071237217051020444715', '2019020716100100002', '4', '10', '白酒', '', '10', '杜康', '杜康珍藏2号-52°', '1004', null, '52°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '88.00', '0.00', '88.00', null, null, '', '2019-02-07 12:37:21', null);
INSERT INTO `doc_order_details` VALUES ('1902081027116401020613265', '2019020812100200001', '1', '10', '白酒', '', '10', '杜康', '杜康珍藏6号-42°', '1007', null, '42°', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '168.00', '0.00', '168.00', null, null, '', '2019-02-08 10:27:11', null);

-- ----------------------------
-- Table structure for doc_order_header
-- ----------------------------
DROP TABLE IF EXISTS `doc_order_header`;
CREATE TABLE `doc_order_header` (
  `order_no` varchar(32) NOT NULL COMMENT '订单号',
  `print_count` int(11) DEFAULT '0' COMMENT '打印次数',
  `order_type` char(3) DEFAULT NULL COMMENT '单据类型',
  `order_status` char(3) NOT NULL COMMENT '单据状态',
  `order_mode` char(3) DEFAULT NULL COMMENT '领用方式(10 样品 20 品鉴 30 试饮 40 赠送 50 礼品 60 其他)',
  `order_source` char(10) DEFAULT NULL COMMENT '单据来源',
  `po_no` varchar(32) DEFAULT NULL COMMENT '申请单号',
  `route_id` varchar(32) DEFAULT NULL COMMENT '发运路线id',
  `order_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `order_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单总金额',
  `to_shop_id` varchar(32) DEFAULT NULL COMMENT '收货店仓id',
  `to_shop_name` varchar(64) DEFAULT NULL COMMENT '收货店仓名称',
  `from_shop_id` varchar(32) DEFAULT NULL COMMENT '发货店仓id',
  `from_shop_name` varchar(64) DEFAULT NULL COMMENT '发货店仓名称',
  `expected_time` datetime DEFAULT NULL COMMENT '预期收货时间',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `release_status` char(2) DEFAULT NULL COMMENT '释放状态',
  `priority` char(2) DEFAULT NULL COMMENT '订单优先级别',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '经办人编码',
  `carrier_name` varchar(32) DEFAULT NULL COMMENT '经办人名称',
  `place_discharge` varchar(32) DEFAULT NULL COMMENT '卸货地',
  `zip_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `contacts` varchar(64) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL COMMENT '收货人手机',
  `receive_address` varchar(128) DEFAULT NULL COMMENT '收货人地址',
  `vehicle_no` varchar(32) DEFAULT NULL COMMENT '车号',
  `onsignee_id` varchar(32) DEFAULT NULL COMMENT '收货人id',
  `onsign_name` varchar(32) DEFAULT NULL COMMENT '收货人',
  `descr` varchar(2156) DEFAULT NULL COMMENT '描述',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `i_shop_id` varchar(32) DEFAULT NULL COMMENT '下单门店id',
  `i_id` varchar(32) DEFAULT NULL COMMENT '下单人id',
  `i_address` varchar(128) DEFAULT NULL COMMENT '下单人地址',
  `i_zip_code` varchar(32) DEFAULT NULL COMMENT '下单人邮编',
  `i_contact` varchar(32) DEFAULT NULL COMMENT '下单人联系人',
  `i_name` varchar(32) DEFAULT NULL,
  `i_tel` varchar(32) DEFAULT NULL COMMENT '下单人电话',
  `supplier_id` varchar(32) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(32) DEFAULT NULL COMMENT '供应商名称',
  `supplier_address` varchar(128) DEFAULT NULL COMMENT '供应商地址',
  `supplier_zip_code` varchar(32) DEFAULT NULL COMMENT '供应商邮编',
  `supplier_contact` varchar(32) DEFAULT NULL COMMENT '供应商联系人',
  `supplier_tel` varchar(32) DEFAULT NULL COMMENT '供应商电话',
  `address` varchar(512) DEFAULT NULL COMMENT '收货人街道(地址)',
  `volume` decimal(18,2) DEFAULT NULL COMMENT '体积',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `created_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_name` varchar(32) DEFAULT NULL COMMENT '更新人',
  `place_loading` varchar(32) DEFAULT NULL COMMENT '装货地',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `route` varchar(512) DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货订单';

-- ----------------------------
-- Records of doc_order_header
-- ----------------------------
INSERT INTO `doc_order_header` VALUES ('2019012912100100001', '0', '12', 'B20', null, 'pc', null, null, null, '144.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2019-01-29 10:16:25', '超级管理员', '2019-01-29 10:16:25', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2019012915100100001', '0', '15', 'B20', null, 'pc', null, null, null, '2222.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2019-01-29 11:16:08', '超级管理员', '2019-01-29 11:16:08', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2019012916100100001', '0', '16', 'B20', '10', 'pc', null, null, null, '112.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, 'YWY100001', '测试业务员', null, null, '邹贺良', '13645835318', '', null, 'VIP100086', '邹贺良', null, '', null, 'YWY100001', '沈荡店仓', null, '超级管理员', '测试业务员', null, null, null, null, null, null, null, null, null, '2019-01-29 10:41:50', '超级管理员', '2019-01-29 10:41:50', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2019020716100100001', '0', '16', 'B20', '10', 'pc', null, null, null, '2222.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, 'YWY100001', '测试业务员', null, null, '邹贺良', '13645835318', '', null, 'VIP100086', '邹贺良', null, '', null, 'YWY100001', '沈荡店仓', null, '超级管理员', '测试业务员', null, null, null, null, null, null, null, null, null, '2019-02-07 12:32:57', '超级管理员', '2019-02-07 12:32:57', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2019020716100100002', '0', '16', 'B90', '50', 'pc', null, null, null, '12144.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, 'YWY100001', '测试业务员', null, null, '朱云伟', '13505735167', '', null, 'VIP100082', '朱云伟', null, '7987098', null, 'YWY100001', '沈荡店仓', null, '超级管理员', '测试业务员', null, null, null, null, null, null, null, null, null, '2019-02-07 12:37:21', '超级管理员', '2019-02-07 12:37:21', '超级管理员', null, '2019-02-07 13:08:44', null);
INSERT INTO `doc_order_header` VALUES ('2019020812100200001', '0', '12', 'B90', null, 'pc', null, null, null, '168.00', null, null, '1812091930141101014954604', '嘉兴秀洲店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402881ea68bcaece0168bcb03d150002', '嘉兴秀洲店仓', null, '孙静', null, null, null, null, null, null, null, null, null, null, '2019-02-08 10:27:11', '孙静', '2019-02-08 10:27:11', '孙静', null, '2019-02-08 10:27:15', null);

-- ----------------------------
-- Table structure for doc_po_details
-- ----------------------------
DROP TABLE IF EXISTS `doc_po_details`;
CREATE TABLE `doc_po_details` (
  `po_detail_id` varchar(32) NOT NULL COMMENT 'po_detail_id',
  `po_no` varchar(32) DEFAULT NULL COMMENT '单据号',
  `line_no` int(11) DEFAULT NULL COMMENT '行号',
  `category_code` varchar(32) DEFAULT NULL COMMENT '分类编码',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `brand_code` varchar(32) DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `goods_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sku` varchar(32) DEFAULT NULL COMMENT 'sku',
  `parent_sku` varchar(32) DEFAULT NULL COMMENT 'parent_sku',
  `property` varchar(64) DEFAULT NULL COMMENT '商品属性',
  `line_status` varchar(32) DEFAULT NULL COMMENT '行状态',
  `lot_num` varchar(32) DEFAULT '0' COMMENT '批次号',
  `seq` varchar(32) DEFAULT NULL COMMENT '商品序号',
  `sub_qty` decimal(18,2) DEFAULT '0.00' COMMENT '商品增减数量',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_qty` decimal(18,2) DEFAULT NULL COMMENT '收货数量',
  `expected_qty` decimal(18,2) DEFAULT NULL COMMENT '预期收货数量',
  `ordered_qty` decimal(18,2) DEFAULT NULL COMMENT '订购数量',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `convert_qty` decimal(18,2) DEFAULT NULL COMMENT '换算数量',
  `convert_unit` varchar(32) DEFAULT NULL COMMENT '换算单位',
  `is_gift` bit(1) DEFAULT b'0' COMMENT '是否赠品',
  `total_price` decimal(18,2) DEFAULT '0.00' COMMENT '商品总金额',
  `cost_price` decimal(18,2) DEFAULT '0.00' COMMENT '成本价',
  `price` decimal(18,2) DEFAULT '0.00' COMMENT '单价',
  `volume` decimal(18,2) DEFAULT '0.00' COMMENT '体积',
  `rate_precent` decimal(18,2) DEFAULT '17.00' COMMENT '税率',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='要货单明细';

-- ----------------------------
-- Records of doc_po_details
-- ----------------------------

-- ----------------------------
-- Table structure for doc_po_header
-- ----------------------------
DROP TABLE IF EXISTS `doc_po_header`;
CREATE TABLE `doc_po_header` (
  `po_no` varchar(32) NOT NULL COMMENT 'PO号',
  `print_count` int(255) DEFAULT '0' COMMENT '打印次数',
  `po_type` char(3) DEFAULT NULL COMMENT '单据类型',
  `po_status` char(3) NOT NULL COMMENT '单据状态',
  `po_source` char(10) DEFAULT NULL COMMENT '单据来源',
  `to_shop_id` varchar(32) DEFAULT NULL COMMENT '收货店仓id',
  `to_shop_name` varchar(64) DEFAULT NULL COMMENT '收货店仓名称',
  `from_shop_id` varchar(32) DEFAULT NULL COMMENT '发货店仓id',
  `from_shop_name` varchar(64) DEFAULT NULL COMMENT '发货店仓名称',
  `order_price` decimal(18,2) DEFAULT '0.00' COMMENT '订单总金额',
  `expected_time` datetime DEFAULT NULL COMMENT '预期到货时间',
  `user_define1` varchar(64) DEFAULT NULL COMMENT '用户自定义1',
  `user_define2` varchar(64) DEFAULT NULL COMMENT '用户自定义2',
  `user_define3` varchar(64) DEFAULT NULL COMMENT '用户自定义3',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `descr` varchar(2156) DEFAULT NULL COMMENT '描述',
  `i_shop_id` varchar(32) DEFAULT NULL COMMENT '下单门店id',
  `i_id` varchar(32) DEFAULT NULL COMMENT '下单人id',
  `i_name` varchar(32) DEFAULT NULL COMMENT '下单人名称',
  `i_address` varchar(128) DEFAULT NULL COMMENT '下单人地址',
  `i_zip_code` varchar(32) DEFAULT NULL COMMENT '下单人邮编',
  `i_contact` varchar(32) DEFAULT NULL COMMENT '下单人联系人',
  `i_tel` varchar(32) DEFAULT NULL COMMENT '下单人电话',
  `supplier_id` varchar(32) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(32) DEFAULT NULL COMMENT '供应商名称',
  `supplier_address` varchar(128) DEFAULT NULL COMMENT '供应商地址',
  `supplier_zip_code` varchar(32) DEFAULT NULL COMMENT '供应商邮编',
  `supplier_contact` varchar(32) DEFAULT NULL COMMENT '供应商联系人',
  `supplier_tel` varchar(32) DEFAULT NULL COMMENT '供应商电话',
  `volume` decimal(18,2) DEFAULT NULL COMMENT '体积',
  `receiving_Time` datetime DEFAULT NULL COMMENT '交付时间',
  `created_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_name` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`po_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='要货单';

-- ----------------------------
-- Records of doc_po_header
-- ----------------------------

-- ----------------------------
-- Table structure for r_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `r_role_menu`;
CREATE TABLE `r_role_menu` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `menu_id` char(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of r_role_menu
-- ----------------------------
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7c0021', '297ea07f3da970a6013daa018581000c', '402887e64d4635eb014d463780db0002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7c0020', '297ea07f3da970a6013daa018581000c', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7c001f', '297ea07f3da970a6013daa018581000c', '4028d9814aa3d39e014aa3d617580002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7c001e', '297ea07f3da970a6013daa018581000c', '402882be464c0a0e01464c4f58ed0001');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b001d', '297ea07f3da970a6013daa018581000c', '297ea07f40516d39014051bbae940001');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b001c', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da09a94cf0004');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b001b', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da099ebcd0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b001a', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da09960e30002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0019', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da0aee03e0005');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0018', '297ea07f3da970a6013daa018581000c', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0017', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0016', '297ea07f3da970a6013daa018581000c', '4028d981531790740153179356e60002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0015', '297ea07f3da970a6013daa018581000c', '402880e862aa57960162ab13c567001f');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0014', '297ea07f3da970a6013daa018581000c', '4028d9815e21e12a015e21e3a4050002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0013', '297ea07f3da970a6013daa018581000c', '4028878d4cbc337b014cbc4346ea0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7b0012', '297ea07f3da970a6013daa018581000c', '4028d9814a6d50f1014a6d5d00fb0077');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0011', '297ea07f3da970a6013daa018581000c', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0010', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000f', '297ea07f3da970a6013daa018581000c', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000e', '297ea07f3da970a6013daa018581000c', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df00082', 'f36328d24baff4d1014baff9c63f0016', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0015', 'f36328d24baff4d1014baff725770002', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0014', 'f36328d24baff4d1014baff725770002', '4028d9814aa3d39e014aa3d617580002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0013', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0012', 'f36328d24baff4d1014baff725770002', '4028d981531790740153179356e60002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0011', 'f36328d24baff4d1014baff725770002', '402880e862aa57960162ab13c567001f');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f0010', 'f36328d24baff4d1014baff725770002', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86f000f', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e000e', 'f36328d24baff4d1014baff725770002', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e000d', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc56b64800fc');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e000c', 'f36328d24baff4d1014baff725770002', '4028d98152a12d8f0152a131ef810002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e000b', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e000a', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0009', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df00081', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df00080', 'f36328d24baff4d1014baff9c63f0016', '4028d981531790740153179356e60002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df0007f', 'f36328d24baff4d1014baff9c63f0016', '402880e862aa57960162ab13c567001f');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df0007e', 'f36328d24baff4d1014baff9c63f0016', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df0007d', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df0007c', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2df0007b', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000d', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc56b64800fc');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0008', 'f36328d24baff4d1014baff725770002', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0007', 'f36328d24baff4d1014baff725770002', '4028867462a4e9b90162a4ece0470002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0006', 'f36328d24baff4d1014baff725770002', '4028d9815e0511c1015e0516bf270002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000c', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a131ef810002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0005', 'f36328d24baff4d1014baff725770002', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000b', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000a', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86e0004', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86d0003', 'f36328d24baff4d1014baff725770002', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def007a', 'f36328d24baff4d1014baff9c63f0016', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0079', 'f36328d24baff4d1014baff9c63f0016', '4028867462a4e9b90162a4ece0470002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dba86d0002', 'f36328d24baff4d1014baff725770002', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0009', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0008', '297ea07f3da970a6013daa018581000c', '4028867462a4e9b90162a4ece0470002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0007', '297ea07f3da970a6013daa018581000c', '4028d981529b18f101529b1d05600002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0006', '297ea07f3da970a6013daa018581000c', '4028d9815e0511c1015e0516bf270002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790005', '297ea07f3da970a6013daa018581000c', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790004', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790003', '297ea07f3da970a6013daa018581000c', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790002', '297ea07f3da970a6013daa018581000c', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0078', 'f36328d24baff4d1014baff9c63f0016', '4028d9815e0511c1015e0516bf270002');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0077', 'f36328d24baff4d1014baff9c63f0016', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0076', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0075', 'f36328d24baff4d1014baff9c63f0016', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('ff80808168c5da200168c5dc2def0074', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3f7e6920013f7e6b2e3c0002');

-- ----------------------------
-- Table structure for r_role_power
-- ----------------------------
DROP TABLE IF EXISTS `r_role_power`;
CREATE TABLE `r_role_power` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `power_id` char(32) DEFAULT NULL COMMENT '操作ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色操作表';

-- ----------------------------
-- Records of r_role_power
-- ----------------------------
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a93009a', '297ea07f3da970a6013daa018581000c', '4028d9815316f41e015317182f44000d');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a930099', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13ef2a00019');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a930098', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13c51980017');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a930097', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13bc1840015');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a930096', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13aeb360012');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920095', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a139f1840010');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920094', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13952f1000e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920093', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a1382197000c');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920092', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920091', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a920090', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008f', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cc6d040009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008e', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008d', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008c', '297ea07f3da970a6013daa018581000c', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008b', '297ea07f3da970a6013daa018581000c', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a92008a', '297ea07f3da970a6013daa018581000c', '4028d9814c3a9999014c3a9cb0f20002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910089', '297ea07f3da970a6013daa018581000c', '4028d9814bcda404014bcdae284f0006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910088', '297ea07f3da970a6013daa018581000c', '4028d9814bcda404014bcdad9f190004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910087', '297ea07f3da970a6013daa018581000c', 'f36328d24baf6b7f014baf713ed00008');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910086', '297ea07f3da970a6013daa018581000c', '4028888e49f4ba790149f5030ae1000c');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910085', '297ea07f3da970a6013daa018581000c', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910084', '297ea07f3da970a6013daa018581000c', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910083', '297ea07f3da970a6013daa018581000c', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910082', '297ea07f3da970a6013daa018581000c', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910081', '297ea07f3da970a6013daa018581000c', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a910080', '297ea07f3da970a6013daa018581000c', '4028d98149d5445f0149d54bfe900002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a91007f', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a91007e', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a90007d', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6c7fe300a4');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a90007c', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6c32a000a2');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a90007b', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6bbf9400a0');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a90007a', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6b7333009e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900079', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a9a17009a');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900078', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a58560098');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900077', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a1f710096');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900076', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa69a7650094');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900075', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa693feb0092');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900074', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa686b09008e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900073', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa681215008c');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a900072', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6788950088');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0071', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa67520a0086');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0070', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff9818ea00c0');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006f', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d0001fe0008');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006e', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d00602b000a');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006d', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d00d06c000c');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006c', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0cfdbe820002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006b', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0cfec1e80004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f006a', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa66642f0081');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0069', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa65a09a007d');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0068', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa657141007b');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0067', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff98687300c2');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8f0066', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff3dcc000003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0065', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa56fa3a0059');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0064', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa56c2fb0057');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0063', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa568f3a0055');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0062', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa5cb32c006e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0061', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa513013003e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e0060', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4d79c60036');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005f', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4d1b4d0034');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005e', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4cd40b0032');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005d', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4b81db002e');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005c', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4af7a1002c');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005b', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4a77fa0029');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8e005a', '297ea07f3da970a6013daa018581000c', '4028803c41243da901425956bf8f000b');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0059', '297ea07f3da970a6013daa018581000c', '297ea07f3fc27b1a013fc283e7c30004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0058', '297ea07f3da970a6013daa018581000c', '402880e73f3b3caa013f3c5278990014');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0057', '297ea07f3da970a6013daa018581000c', '297ea07f3e359d13013e35a15ecc0004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0056', '297ea07f3da970a6013daa018581000c', '297ea07f3e359d13013e359fe4af0003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0055', '297ea07f3da970a6013daa018581000c', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0054', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b1282a983000b');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0053', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b12821a940009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0052', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127c85a60006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0051', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127b9dcc0004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d0050', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127b01b90002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8d004f', '297ea07f3da970a6013daa018581000c', '297ea07f422b5f8401422b6029390001');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c004e', '297ea07f3da970a6013daa018581000c', '297ea07f3e34a15b013e34a1e4260001');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c004d', '297ea07f3da970a6013daa018581000c', '297ea07f3e346d19013e346e4bb70001');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c004c', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b575f9440012');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c004b', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b575724f0010');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c004a', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0049', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0048', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0047', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e0600a1', 'f36328d24baff4d1014baff9c63f0016', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e0600a0', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e06009f', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e06009e', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e06009d', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e05009c', 'f36328d24baff4d1014baff9c63f0016', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e05009b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e05009a', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050099', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050098', 'f36328d24baff4d1014baff9c63f0016', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050097', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050096', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050095', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050094', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050093', 'f36328d24baff4d1014baff9c63f0016', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e050092', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e040091', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88f0073', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cc6d040009');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e0072', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e0071', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e0070', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006f', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006e', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006d', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006c', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006b', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e006a', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e0069', 'f36328d24baff4d1014baff725770002', 'f36328d24baf6b7f014baf713ed00008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88e0068', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0067', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0066', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfec1e80004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0065', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfdbe820002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0064', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0063', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0062', 'f36328d24baff4d1014baff725770002', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0061', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b1282a983000b');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d0060', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b12821a940009');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d005f', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127c85a60006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d005e', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b9dcc0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88d005d', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b01b90002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c005c', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00d06c000c');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c005b', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00602b000a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c005a', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d0001fe0008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0059', 'f36328d24baff4d1014baff725770002', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0058', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0057', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0056', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0055', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0054', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88c0053', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b0052', 'f36328d24baff4d1014baff725770002', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b0051', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b0050', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004f', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575f9440012');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004e', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575724f0010');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004d', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004c', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004b', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c7fe300a4');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b004a', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c32a000a2');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b0049', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6bbf9400a0');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88b0048', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6b7333009e');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0047', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a9a17009a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0046', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a58560098');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0045', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a1f710096');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0044', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa69a7650094');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0043', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa693feb0092');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0042', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa686b09008e');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0041', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa681215008c');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a0040', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6788950088');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a003f', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa67520a0086');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba88a003e', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff9818ea00c0');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba889003d', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa66642f0081');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba889003c', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa65a09a007d');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba889003b', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa657141007b');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba889003a', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff98687300c2');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890039', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff3dcc000003');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890038', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56fa3a0059');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890037', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56c2fb0057');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890036', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa568f3a0055');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890035', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa5cb32c006e');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890034', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa513013003e');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8890033', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d79c60036');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8880032', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d1b4d0034');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8880031', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4cd40b0032');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8880030', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4b81db002e');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002f', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4af7a1002c');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002e', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4a77fa0029');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002d', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002c', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002b', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba888002a', 'f36328d24baff4d1014baff725770002', '4028803c41243da901425956bf8f000b');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8880029', 'f36328d24baff4d1014baff725770002', '297ea07f3fc27b1a013fc283e7c30004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0046', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0045', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0044', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0043', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0042', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0041', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8880028', 'f36328d24baff4d1014baff725770002', '402880e73f3b3caa013f3c5278990014');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870027', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e35a15ecc0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870026', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e359fe4af0003');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870025', 'f36328d24baff4d1014baff725770002', '297ea07f422b5f8401422b6029390001');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870024', 'f36328d24baff4d1014baff725770002', '297ea07f3e34a15b013e34a1e4260001');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870023', 'f36328d24baff4d1014baff725770002', '297ea07f3e346d19013e346e4bb70001');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0040', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003f', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006b1f60003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003e', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d007288c0007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003d', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d00764c00009');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e040090', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870022', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870021', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003c', '297ea07f3da970a6013daa018581000c', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003b', '297ea07f3da970a6013daa018581000c', '4028888e49df4da30149df57b75e0003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003a', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0039', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0038', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ffb6c40007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0037', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e5001fc20009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0036', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0035', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006e7a90005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0034', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8870020', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba887001f', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba887001e', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba886001d', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba886001c', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdad9f190004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba886001b', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdae284f0006');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba886001a', 'f36328d24baff4d1014baff725770002', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008f', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008e', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008d', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008c', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e04008a', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e040089', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e040088', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0033', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0032', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0031', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0030', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a002f', '297ea07f3da970a6013daa018581000c', '4028d9814c4be3cf014c4be79b030002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a002e', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a002d', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a002c', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a89002b', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2d000b0003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a89002a', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2e3f320005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890029', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2ef64a0007');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8860019', 'f36328d24baff4d1014baff725770002', '4028d9814c3a9999014c3a9cb0f20002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8860018', 'f36328d24baff4d1014baff725770002', '4028d9814c4be3cf014c4be79b030002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8860017', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e030087', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e030086', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e030085', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e030084', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dc2e030083', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('ff80808168c5da200168c5dba8860016', 'f36328d24baff4d1014baff725770002', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890028', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2f6d980009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890027', '297ea07f3da970a6013daa018581000c', '40288702530787290153079722df0003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890026', '297ea07f3da970a6013daa018581000c', '40288702530787290153079799500005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890025', '297ea07f3da970a6013daa018581000c', '402887025307872901530797fe190007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890024', '297ea07f3da970a6013daa018581000c', '40288702530787290153079878720009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890023', '297ea07f3da970a6013daa018581000c', '402887025307872901530798badb000b');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a890022', '297ea07f3da970a6013daa018581000c', '4028d98153174a9101531754e6220004');

-- ----------------------------
-- Table structure for r_role_user
-- ----------------------------
DROP TABLE IF EXISTS `r_role_user`;
CREATE TABLE `r_role_user` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色用户表';

-- ----------------------------
-- Records of r_role_user
-- ----------------------------
INSERT INTO `r_role_user` VALUES ('402882be46404313014640b84ece0013', '297ea07f3da970a6013daa018581000c', '402882be46404313014640b7eb1c000f');
INSERT INTO `r_role_user` VALUES ('402881ea68bcaece0168bcb0ed740005', 'f36328d24baff4d1014baff9c63f0016', 'f36328d24baff4d1014baff87a660012');
INSERT INTO `r_role_user` VALUES ('4028d98152e860080152e86aed810116', 'f36328d24baff4d1014baff9c63f0016', '4028d98152e860080152e86ab6740114');
INSERT INTO `r_role_user` VALUES ('402881ea68bcaece0168bcb07bf00004', 'f36328d24baff4d1014baff725770002', '402881ea68bcaece0168bcb03d150002');

-- ----------------------------
-- Table structure for service_registry
-- ----------------------------
DROP TABLE IF EXISTS `service_registry`;
CREATE TABLE `service_registry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `evaluation_order` int(11) NOT NULL,
  `ignore_attributes` bit(1) NOT NULL DEFAULT b'1',
  `img_path` longtext,
  `index_url` longtext NOT NULL,
  `name` varchar(32) NOT NULL,
  `power_code` varchar(32) NOT NULL,
  `service_id` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_registry
-- ----------------------------
INSERT INTO `service_registry` VALUES ('1', '1232', '10000014', '', '/images/apps/monitor.png', 'http://192.168.6.123:8080/fsun-erp', 'fsun-erp', 'ROLE_ADMIN', 'http://192.168.6.123:8080/fsun-erp/.*');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  `sequence` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL COMMENT '操作用户',
  `log_level` smallint(6) DEFAULT NULL COMMENT '日志级别',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operate_type` smallint(6) DEFAULT NULL COMMENT '操作类别(1登录、2退出、3插入、4删除、5更新、6打印、7上传、8其他'')',
  `log_content` text COMMENT '日志内容',
  `note` text COMMENT '节点',
  `broswer` varchar(100) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('402882e9676db37101676db3fa100001', '402882be46404313014640b7eb1c000f', '1', '2018-12-02 14:56:10', '1', '用户：super登录成功', '192.168.2.105', 'Chrome');
INSERT INTO `sys_log` VALUES ('402881ea68bcaece0168bcaf3bdd0001', null, '1', '2019-02-05 16:03:47', '1', '用户：super登录成功', '192.168.1.106', 'Chrome');
INSERT INTO `sys_log` VALUES ('402881ea68bcaece0168bcb03d360003', '402882be46404313014640b7eb1c000f', '1', '2019-02-05 16:04:53', '3', '用户: sj插入成功', '192.168.1.106', 'Chrome');
INSERT INTO `sys_log` VALUES ('402881ea68bcaece0168bcb3063f0078', null, '1', '2019-02-05 16:07:55', '1', '用户：sj登录成功', '192.168.1.106', 'Chrome');
INSERT INTO `sys_log` VALUES ('402881ea68bcaece0168bcb3abf60079', null, '1', '2019-02-05 16:08:38', '1', '用户：super登录成功', '192.168.1.106', 'Chrome');
INSERT INTO `sys_log` VALUES ('402881ea68bcaece0168bcb5cc6b00a9', null, '1', '2019-02-05 16:10:57', '1', '用户：xw登录成功', '192.168.1.106', 'Chrome');
INSERT INTO `sys_log` VALUES ('ff80808168c5da200168c5db00ed0001', null, '1', '2019-02-07 10:48:10', '1', '用户：super登录成功', '127.0.0.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('ff80808168c5da200168c5dc81eb00a2', null, '1', '2019-02-07 10:49:49', '1', '用户：sj登录成功', '127.0.0.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('ff80808168c5da200168c5dcf4ed00a3', null, '1', '2019-02-07 10:50:18', '1', '用户：xw登录成功', '127.0.0.1', 'Chrome');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `code` varchar(64) DEFAULT NULL COMMENT '菜单编码',
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL COMMENT '节点图标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `isleaf` bit(1) DEFAULT NULL COMMENT '是否有叶子',
  `iconcls` varchar(64) DEFAULT NULL COMMENT '节点图标CSS类名',
  `expanded` bit(1) DEFAULT NULL COMMENT '是否扩展（1-代表扩展，0代表收缩）',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态',
  `description` text COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人ID',
  `pid` char(32) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('402880f33e3ae38d013e3b2511250009', 'DICTIONARY_MANAGE', '数据字典', 'sys/dictionary/manage', 'images/icons/17.png', '2013-04-24 00:00:00', null, '2013-12-16 16:17:11', null, 'icon-memu_magic_cube', null, '', null, '6', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d981494f5aa601494f60ecfc000a', 'MARKET_MANAGE', '营销管理', null, 'images/icons/briefcase.png', '2014-10-27 10:13:12', '402882be46404313014640b7eb1c000f', '2014-12-21 23:03:33', null, 'icon-memu_briefcase', null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09a94cf0004', 'MENU_MANAGE', '菜单管理', 'sys/menu/manage', 'images/icons/plugins48.png', '2013-03-25 04:11:58', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:52', null, 'icon-memu_plugins', null, '', null, '5', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da099ebcd0003', 'ROLE_MANAGE', '角色管理', 'sys/role/manage', 'images/icons/themes8.png', '2013-03-25 04:11:14', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:36', null, 'icon-memu_themes', null, '', null, '4', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09960e30002', 'USER_MANAGE', '用户管理', 'sys/user/manage', 'images/icons/46.png', '2013-03-25 00:00:00', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:26', null, 'icon-memu_man', null, '', null, '3', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da098bf150001', 'SYSTEM_MANAGE', '系统管理', null, 'images/icons/l-sjzx.png', '2013-03-25 04:09:57', null, '2013-07-18 16:58:19', null, 'icon-memu_l-sjzx', null, '', null, '17', '测试', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3e35f0a0013e35f8a5e00001', 'LOG_MANAGE', '日志管理', 'sys/log/manage', 'images/icons/9.png', '2013-04-23 16:18:08', '402882be46404313014640b7eb1c000f', '2015-01-08 16:34:37', null, 'icon-memu_calendar', null, '', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da0aee03e0005', 'POWER_MANAGE', '权限管理', 'sys/power/manage', 'images/icons/22.png', '2013-03-25 04:34:08', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:16', null, 'icon-memu_setup', null, '', null, '2', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3f7e6920013f7e6b2e3c0002', 'SYSTEM', '业务系统', null, '&#xe6b8;', '2013-06-26 10:58:40', '402882be46404313014640b7eb1c000f', '2015-01-01 15:37:12', null, '', null, '', null, '1', '297ea07f3df89479013df895251d0001', null);
INSERT INTO `sys_menu` VALUES ('402890f03feb8eb5013feb9598640003', 'OVERVIEW_MANAGE', '总览', 'bus/overview/manage', 'images/icons/sys_store.png', '2013-07-17 03:43:36', '402882be46404313014640b7eb1c000f', '2014-12-21 23:02:58', null, 'icon-memu_sys_store', null, '', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc5540ee00fa', 'FACTORYINFO_MANAGE', '客户管理', 'bus/customer/index', 'images/icons/rss.png', '2014-11-20 16:32:59', '402882be46404313014640b7eb1c000f', '2016-02-04 16:05:15', null, 'icon-memu_rss', null, null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc56b64800fc', 'CLASSIFY_MANAGE', '员工管理', 'bus/user/index', 'images/icons/play.png', '2014-11-20 16:34:35', '402882be46404313014640b7eb1c000f', '2016-02-02 16:56:56', null, 'icon-memu_play', null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('297ea07f40516d39014051bbae940001', 'ICON_MANAGE', '图标管理', 'sys/icon/manage', 'images/icons/comments8.png', '2013-08-06 11:46:28', '402882be46404313014640b7eb1c000f', '2015-01-08 23:03:55', null, 'icon-memu_comments', null, '', null, '7', null, '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402882be464c0a0e01464c4f58ed0001', 'AUTH_MANAGE', '注册认证', 'sys/auth/manage', 'images/icons/article48.png', '2014-05-30 16:46:46', '402882be46404313014640b7eb1c000f', '2015-02-27 09:08:08', null, 'icon-memu_article', null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc52cbc900f7', 'SUPPLY_GOOD_MANAGE', '基础资料', null, 'images/icons/l-jq.png', '2014-11-20 16:30:18', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:04', null, 'icon-memu_l-jq', null, null, null, '15', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc4028dc0005', 'ORDER_MANAGE', '销售单管理', 'bus/order/index', 'images/icons/sale.png', '2014-11-20 16:09:57', '402882be46404313014640b7eb1c000f', '2015-01-21 22:53:25', null, 'icon-memu_sale', null, null, null, '3', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028888e49d058530149d05a687a0002', 'PRODUCT_MANAGE', '价格策略', 'bus/rule/price/index', 'images/icons/18.png', '2014-11-21 11:17:06', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:16', null, 'icon-memu_electron', null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d56d4850074', 'MARKET_SUMMARY', '营销汇总', null, 'images/icons/chart.png', '2014-12-21 22:53:34', '402882be46404313014640b7eb1c000f', '2015-02-28 08:49:15', null, 'icon-memu_chart', null, null, null, '16', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d5d00fb0077', 'ORDER_SUMMARY', '订单汇总', 'bus/summary/order/manage', 'images/icons/research.png', '2014-12-21 23:00:19', '402882be46404313014640b7eb1c000f', '2015-02-28 08:50:02', null, 'icon-memu_research', null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9814adc1ba0014adc1db9d90002', 'CUSTOMER_MANAGE', '会员卡管理', 'bus/vip/index', 'images/icons/46.png', '2015-01-12 11:09:03', null, null, null, 'icon-memu_man', '', null, null, '5', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814af28328014af32663aa0006', 'PLUGIN_MANAGE', '插件下载', 'base/plugin/index', 'images/icons/43.png', '2015-01-16 22:29:46', null, null, null, 'icon-memu_stock_out', '', null, null, '12', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d9814b17de71014b17e6ec4b0003', 'MADE_MANAGE', '入库单管理', 'doc/asn/index', 'images/icons/transfer.png', '2015-01-24 01:46:24', '402882be46404313014640b7eb1c000f', '2017-08-21 21:59:06', null, 'icon-memu_transfer', null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9814aa3d39e014aa3d617580002', 'SYSTEM_CONFIG_MANAGE', '数据字典', 'sys/codes/index', 'images/icons/5.png', '2015-01-01 12:52:04', '402882be46404313014640b7eb1c000f', '2015-01-01 15:47:18', null, 'icon-memu_stop', null, null, null, '11', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028878d4cbc337b014cbc4346ea0003', 'ORDER_DETAIL_SUMMARY', '订单明细汇总', 'bus/summary/orderDetail/manage', 'images/icons/views8.png', '2015-04-15 16:47:47', null, null, null, 'icon-memu_views', '', null, null, '2', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('402887e64d4635eb014d463780db0002', 'MESSAGE_MANAGE', '消息管理', 'bus/message/manage', 'images/icons/comments8.png', '2015-05-12 11:42:32', null, null, null, 'icon-memu_comments', '', null, null, '13', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402887e64de145d5014de14829a40002', 'STOCK_MANAGE', '库存管理', 'bus/invSku/index', 'images/icons/25.png', '2015-06-11 14:21:52', null, null, null, 'icon-memu_room', '', null, null, '16', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('402887e64e09c689014e09c9cd400003', 'STORE_MANAGE', '店仓管理', 'bus/shop/index', 'images/icons/sys_store.png', '2015-06-19 11:08:17', null, null, null, 'icon-memu_sys_store', '', null, null, '7', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981529b18f101529b1d05600002', 'PURCHASE_MANAGE', '申请单管理', 'doc/po/index', 'images/icons/sys_delivery.png', '2016-02-01 12:35:16', null, null, null, 'icon-memu_sys_delivery', '', null, null, '6', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d98152a12d8f0152a131ef810002', 'MATERIEL_MANAGE', '商品管理', 'bus/basSku/index', 'images/icons/shipping.png', '2016-02-02 16:55:50', null, null, null, 'icon-memu_shipping', '', null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981531790740153179356e60002', 'PURCHASE_DETAIL_SUMMARY', '会员卡充值消费', 'bus/vipUnpaid/summary/vip/index', 'images/icons/calculator.png', '2016-02-25 16:37:25', '402882be46404313014640b7eb1c000f', '2016-02-26 00:16:20', null, 'icon-memu_calculator', null, null, null, '5', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9815e0511c1015e0516bf270002', 'DELIVERY_MANAGE', '出库单管理', 'doc/order/index', 'images/icons/shipping.png', '2017-08-21 21:58:50', '402882be46404313014640b7eb1c000f', '2017-08-25 13:37:13', null, 'icon-memu_shipping', null, null, null, '5', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9815e21e12a015e21e3a4050002', 'DELIVERY_ORDER_SUMMARY', '送货单明细汇总', 'bus/summary/deliveryDetail/manage', 'images/icons/16.png', '2017-08-27 12:12:00', null, null, null, 'icon-memu_pc', '', null, null, '3', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028867462a4e9b90162a4ece0470002', 'PROXY_MANAGE', '寄存单管理', 'bus/proxyOrder/manage', 'images/icons/22.png', '2018-04-08 19:03:30', null, null, null, 'icon-memu_setup', '', null, null, '7', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('402880e862aa57960162ab13c567001f', 'PORXY_ORDER_SUMMARY', '挂账结款消费', 'bus/vipUnpaid/summary/unpaid/index', 'images/icons/31.png', '2018-04-09 23:43:42', null, null, null, 'icon-memu_note_book', '', null, null, '4', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');

-- ----------------------------
-- Table structure for sys_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `menu_id` char(32) DEFAULT NULL COMMENT '所属模块',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态',
  `description` text COMMENT '备注',
  `url` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `update_man_id` char(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统操作表';

-- ----------------------------
-- Records of sys_power
-- ----------------------------
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b5765c4b0014', '删除', 'OSVERSION_DELETE', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:43:56', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b576a5210016', '取消', 'OSVERSION_CANCEL', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:44:15', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('297ea07f3e346d19013e346e4bb70001', '用户删除', 'USER_DEL', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/delete', null, '2013-04-23 09:07:23', '测试', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:54');
INSERT INTO `sys_power` VALUES ('297ea07f3e34a15b013e34a1e4260001', '用户取消', 'USER_CANCEL', '297ea07f3da06a5e013da09960e30002', null, null, null, null, '2013-04-23 10:03:45', '测试', '297ea07f3df89479013df895251d0001', '2013-08-05 15:21:30');
INSERT INTO `sys_power` VALUES ('297ea07f422b5f8401422b6029390001', '更新', 'MODULE_UPDATE', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-11-06 00:00:00', null, null, '2013-12-16 15:30:55');
INSERT INTO `sys_power` VALUES ('297ea07f3e359d13013e359fe4af0003', '用户新增', 'USER_ADD', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/savetoAdd', null, '2013-04-23 02:41:38', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:37');
INSERT INTO `sys_power` VALUES ('297ea07f3e359d13013e35a15ecc0004', '用户编辑', 'USER_EDIT', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/savetoUpdate', null, '2013-04-23 02:42:48', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:47');
INSERT INTO `sys_power` VALUES ('402880e73f3b3caa013f3c5278990014', '新增', 'MENU_ADD', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/savetoAdd', null, '2013-06-13 00:00:00', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:13');
INSERT INTO `sys_power` VALUES ('297ea07f3fc27b1a013fc283e7c30004', '新增', 'ROLE_ADD', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/savetoAdd', null, '2013-07-09 00:00:00', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:28:52');
INSERT INTO `sys_power` VALUES ('4028803c41243da901425956bf8f000b', '新增', 'MODULE_ADD', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-11-15 00:00:00', null, null, '2013-12-16 15:30:42');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc5767e800fe', '新增', 'FACTORY_ADD', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/savetoAdd', null, '2014-11-20 16:35:20', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:21:41');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc57ecec0100', '编辑', 'FACTORY_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/savetoUpdate', null, '2014-11-20 16:35:54', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:21:55');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc584a170102', '删除', 'FACTORY_DELETE', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/delete', null, '2014-11-20 16:36:18', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:22:02');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4a77fa0029', '新增', 'TACTICS_ADD', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:21');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4af7a1002c', '更新', 'TACTICS_UPDATE', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 15:24:46', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4b81db002e', '删除', 'TACTICS_DELETE', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 15:25:21', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4cd40b0032', '新增', 'STOR_ADD', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:26:48', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4d1b4d0034', '更新', 'STOR_UPDATE', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:27:06', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4d79c60036', '删除', 'STOR_DELETE', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:27:30', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa513013003e', '删除', 'MODULE_DELETE', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-12-16 15:31:34', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa5cb32c006e', '取消', 'POWER_CANCEL', '297ea07f3da06a5e013da0aee03e0005', null, null, null, null, '2013-12-16 15:44:08', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa568f3a0055', '新增', 'POWER_ADD', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/savetoAdd', null, '2013-12-16 15:37:26', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:24:34');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa56c2fb0057', '更新', 'POWER_UPDATE', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/savetoUpdate', null, '2013-12-16 15:37:39', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:24:55');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa56fa3a0059', '删除', 'POWER_DELETE', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/delete', null, '2013-12-16 15:37:53', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:09');
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff3dcc000003', '密码初始化', 'USER_RESET', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/pwdReset', null, '2013-12-17 14:28:29', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:26:33');
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff98687300c2', '排序', 'DICTIONARY_SORT', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-17 16:07:27', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa657141007b', '更新', 'ROLE_UPDATE', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/savetoUpdate', null, '2013-12-16 15:53:41', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:29:04');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa65a09a007d', '删除', 'ROLE_DELETE', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/delete', null, '2013-12-16 15:53:53', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:29:14');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa66642f0081', '取消', 'ROLE_CANCEL', '297ea07f3da06a5e013da099ebcd0003', null, null, null, null, '2013-12-16 15:54:43', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff9818ea00c0', '排序', 'MENU_SORT', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-17 16:07:07', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa67520a0086', '更新', 'MENU_UPDATE', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/savetoUpdate', null, '2013-12-16 15:55:44', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:26');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6788950088', '删除', 'MENU_DELETE', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/delete', null, '2013-12-16 15:55:58', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:33');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa681215008c', '取消', 'MENU_CANCEL', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 15:56:33', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa686b09008e', '保存', 'MENU_SAVE', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 15:56:56', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa693feb0092', '展开', 'MENU_EXPAND', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:40');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa69a7650094', '收缩', 'MENU_SHRINK', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:03');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a1f710096', '新增', 'DICTIONARY_ADD', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:03');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a58560098', '更新', 'DICTIONARY_UPDATE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 15:59:02', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a9a17009a', '删除', 'DICTIONARY_DELETE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 15:59:19', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6b7333009e', '取消', 'DICTIONARY_CANCEL', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 16:00:15', null, null, '2013-12-16 16:44:58');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6bbf9400a0', '保存', 'DICTIONARY_SAVE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:32');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6c32a000a2', '展开', 'DICTIONARY_EXPAND', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:58');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6c7fe300a4', '收缩', 'DICTIONARY_SHRINK', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:27');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6d0b8000a6', '新增', 'ICON_ADD', '297ea07f40516d39014051bbae940001', null, null, 'sys/icon/savetoAdd', null, '2013-12-16 12:00:00', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:31:18');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6d6cdc00a8', '删除', 'ICON_DELETE', '297ea07f40516d39014051bbae940001', null, null, 'sys/icon/delete', null, '2013-12-16 00:00:00', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:31:27');
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b575724f0010', '新增', 'OSVERSION_ADD', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:42:56', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b575f9440012', '更新', 'OSVERSION_UPDATE', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:43:31', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d006b1f60003', '新增', 'CLASSIFY_ADD', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/savetoAdd', null, '2014-11-21 09:45:40', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:25');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d006e7a90005', '删除', 'CLASSIFY_DELETE', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/delete', null, '2014-11-21 09:45:53', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:22');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d007288c0007', '编辑', 'CLASSIFY_UPDATE', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/savetoUpdate', null, '2014-11-21 09:46:10', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:15');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d00764c00009', '取消', 'CLASSIFY_CANCEL', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-21 09:46:25', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:00:49');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05b18b70004', '新增', 'PRODUCT_ADD', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/savetoAdd', null, '2014-11-21 11:17:51', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:17');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05b8c200006', '编辑', 'PRODUCT_EDIT', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/savetoUpdate', null, '2014-11-21 11:18:20', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:05:47');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05bdddf0008', '删除', 'PRODUCT_DELETE', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/delete', null, '2014-11-21 11:18:41', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:05:59');
INSERT INTO `sys_power` VALUES ('4028d98149d2bf470149d2c235070002', '取消', 'PRODUCT_CANCEL', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-21 22:29:43', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98149d5445f0149d54bfe900002', '添加产品分类', 'CLASSIFY_IN', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-22 10:19:27', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:46');
INSERT INTO `sys_power` VALUES ('4028888e49df4da30149df57b75e0003', '去除产品分类', 'CLASSIFY_OUT', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-24 09:08:28', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:49');
INSERT INTO `sys_power` VALUES ('4028888e49dfa6d80149dfa877380002', '添加产品', 'PRODUCT_IN', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-24 10:36:40', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2014-11-24 12:52:53');
INSERT INTO `sys_power` VALUES ('4028888e49dfa6d80149dfa8f3340004', '去除产品', 'PRODUCT_OUT', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-24 10:37:11', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2014-11-24 12:52:41');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4fe85780003', '禁用', 'PRODUCT_DISABLE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-25 11:28:45', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:17:20');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4ff07fa0005', '启用', 'PRODUCT_ENABLE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-25 11:29:19', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:58');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4ffb6c40007', '禁用', 'CLASSIFY_DISABLE', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-25 11:30:04', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:25');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e5001fc20009', '启用', 'CLASSIFY_ENABLE', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-25 11:30:30', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:36');
INSERT INTO `sys_power` VALUES ('4028888e49e62c670149e62dd2d00002', '禁用', 'FACTORY_DISABLE', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2014-11-25 17:00:03', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49e62c670149e62e58aa0004', '启用', 'FACTORY_ENABLE', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2014-11-25 17:00:37', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49f4ba790149f5015668000a', '保存', 'PRODUCT_SAVE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-28 14:05:45', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:13');
INSERT INTO `sys_power` VALUES ('4028888e49f4ba790149f5030ae1000c', '保存', 'CLASSIFY_COMMIT', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-28 14:07:37', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:15:50');
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d0001fe0008', '删除', 'ORDER_DELETE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/delete', null, '2015-01-21 22:57:59', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d00602b000a', '刷新', 'ORDER_REFRESH', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-21 22:58:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d00d06c000c', 'excel导出', 'ORDER_EXPORT', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-21 22:58:52', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-22 21:51:19');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127b01b90002', '产品增加', 'ORDER_PRODUCT_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/savetoAdd', null, '2015-01-23 00:30:26', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 14:16:54');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127b9dcc0004', '产品编辑', 'ORDER_PRODUCT_UPDATE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/savetoUpdate', null, '2015-01-23 00:31:06', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-04-15 13:19:41');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127c85a60006', '产品删除', 'ORDER_PRODUCT_DELETE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/delete', null, '2015-01-23 00:32:05', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 14:16:40');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b12821a940009', '产品保存', 'ORDER_PRODUCT_SAVE', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-23 00:38:11', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b1282a983000b', '产品修改取消', 'ORDER_PRODUCT_CANCEL', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-23 00:38:47', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b38a40a014b38beb1b60002', '添加实际数量', 'UPDATE_NUMBER', '4028d9814b17de71014b17e6ec4b0003', null, null, null, null, '2015-01-30 10:49:56', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc9157b40006', '删除', 'CUSTOMER_DELETE', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/delete', null, '2015-01-12 13:15:20', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc91c4760008', '禁用', 'CUSTOMER_DISABLE', '4028d9814adc1ba0014adc1db9d90002', null, null, null, null, '2015-01-12 13:15:48', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc92168c000a', '选择启用客户', 'CUSTOMER_ENABLE', '4028d9814adc1ba0014adc1db9d90002', null, null, null, null, '2015-01-12 13:16:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0cfdbe820002', '制单', 'ORDER_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/savetoAdd', null, '2015-01-21 22:55:30', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 00:32:59');
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0cfec1e80004', '编辑', 'ORDER_EDIT', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/savetoUpdate', null, '2015-01-21 22:56:37', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-21 22:57:17');
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc9051e10002', '新增', 'CUSTOMER_ADD', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/savetoAdd', null, '2015-01-12 13:14:13', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc90e72a0004', '编辑', 'CUSTOMER_EDIT', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/savetoUpdate', null, '2015-01-12 13:14:51', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('f36328d24baf6b7f014baf713ed00008', '打印显示金额', 'SHOW_PRICE', '4028d9814b17de71014b17e6ec4b0003', null, null, null, null, '2015-02-22 12:00:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bcda404014bcdad9f190004', '刷新', 'ORDER_SUMMARY_REFRESH', '4028d9814a6d50f1014a6d5d00fb0077', null, null, null, null, '2015-02-28 08:54:42', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bcda404014bcdae284f0006', 'EXCEL导出', 'ORDER_SUMMARY_EXPORT', '4028d9814a6d50f1014a6d5d00fb0077', null, null, null, null, '2015-02-28 08:55:17', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7be2720002', '外协回执单新增', 'OUTSIDE_ADD', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/savetoAdd', null, '2015-03-03 19:53:33', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:51');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7ca3160004', '外协回执单编辑', 'OUTSIDE_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/savetoUpdate', null, '2015-03-03 19:54:22', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:44');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7d7be80006', '外协回执单删除', 'OUTSIDE_DELETE', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/delete', null, '2015-03-03 19:55:17', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:32');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7e2b0d0008', '附件编辑', 'ATT_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2015-03-03 19:56:02', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814c3a9999014c3a9cb0f20002', '订单产品及其明细添加', 'ORDER_PRODUCT_INFO_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/product/savetoAdd', null, '2015-03-21 12:34:49', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-21 14:31:11');
INSERT INTO `sys_power` VALUES ('4028d9814c40d654014c41c163ef0005', 'excel导出', 'OUTSIDE_EXPORT', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2015-03-22 21:52:15', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814c4be3cf014c4be79b030002', '返单', 'ORDER_REORDER', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/reorder/savetoAdd', null, '2015-03-24 21:10:11', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-25 21:14:46');
INSERT INTO `sys_power` VALUES ('4028878d4cbb5fff014cbb838f880021', '生产单编辑', 'PRODUCE_EDIT', '4028d9814b17de71014b17e6ec4b0003', null, null, 'bus/produce/savetoUpdate', null, '2015-04-15 13:18:23', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-04-15 13:20:29');
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de15834d20002', '新增', 'STOCK_ADD', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/savetoAdd', null, '2015-06-11 14:39:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de158bb700004', '编辑', 'STOCK_EDIT', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/savetoUpdate', null, '2015-06-11 14:39:58', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de15918740006', '删除', 'STOCK_DELETE', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/delete', null, '2015-06-11 14:40:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cacd120005', '仓库新增', 'STORE_ADD', '402887e64e09c689014e09c9cd400003', null, null, 'bus/store/savetoAdd', null, '2015-06-19 11:09:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cb96310007', '仓库修改', 'STORE_UPDATE', '402887e64e09c689014e09c9cd400003', null, null, 'bus/store/savetoUpdate', null, '2015-06-19 11:10:14', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cc6d040009', '仓库删除', 'STORE_DELETE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:09', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-06-19 12:41:19');
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09ccbab2000b', '仓库禁用', 'STORE_DISABLE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:28', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09ccf0d1000d', '仓库启用', 'STORE_ENABLE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:42', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:06:07');
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cd38db000f', '取消操作', 'STORE_CANCEL', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:12:01', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2d000b0003', '采购制单', 'PURCHASE_ADD_IN', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/savetoAdd', null, '2016-02-01 12:52:43', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2e3f320005', '采购单编辑', 'PURCHASE_EDIT', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/savetoUpdate', null, '2016-02-01 12:54:05', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2ef64a0007', '采购单删除', 'PURCHASE_DELETE', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/delete', null, '2016-02-01 12:54:52', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2f6d980009', '采购单刷新', 'PURCHASE_REFRESH', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-01 12:55:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a1382197000c', '物料新增', 'MATERIEL_ADD', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/savetoAdd', null, '2016-02-02 17:02:36', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13952f1000e', '物料编辑', 'MATERIEL_EDIT', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/savetoUpdate', null, '2016-02-02 17:03:54', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a139f1840010', '物料删除', 'MATERIEL_DELETE', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/delete', null, '2016-02-02 17:04:35', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13aeb360012', '取消', 'MATERIEL_CANCEL', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:05:39', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13bc1840015', '启用', 'MATERIEL_ENABLE', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:06:33', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13c51980017', '禁用', 'MATERIEL_DISABLE', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:07:10', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13ef2a00019', '物料保存', 'MATERIEL_COMMIT', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:10:03', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:16:42');
INSERT INTO `sys_power` VALUES ('40288702530787290153079722df0003', '新增', 'BUYINFO_ADD', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/savetoAdd', null, '2016-02-22 14:07:38', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('40288702530787290153079799500005', '编辑', 'BUYINFO_EDIT', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/savetoUpdate', null, '2016-02-22 14:08:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887025307872901530797fe190007', '删除', 'BUYINFO_DELETE', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/delete', null, '2016-02-22 14:08:34', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('40288702530787290153079878720009', '验收', 'BUYINFO_ACCEPT', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-22 14:09:06', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887025307872901530798badb000b', 'excel导出', 'BUYINFO_TEMPLETE_EXPORT', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-22 14:09:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9815316f41e015317182f44000d', '生成采购单', 'PURCHASE_POS', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-25 14:22:54', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98153174a9101531754e6220004', '更新供货厂家', 'BUYINFO_UPDATE_FACTORY', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-25 15:29:13', '402882be46404313014640b7eb1c000f', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(32) NOT NULL COMMENT '角色ID',
  `code` varchar(64) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `description` text COMMENT '备注',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '最后更新人',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('297ea07f3da970a6013daa018581000c', 'super', '超级管理员', null, null, null, '测试', '2013-03-27 00:00:59', '402882be46404313014640b7eb1c000f', '2015-01-23 00:13:07');
INSERT INTO `sys_role` VALUES ('f36328d24baff4d1014baff725770002', 'manage', '经理', null, null, null, '402882be46404313014640b7eb1c000f', '2015-02-22 14:26:24', null, null);
INSERT INTO `sys_role` VALUES ('f36328d24baff4d1014baff9c63f0016', 'staff', '员工', null, null, null, '402882be46404313014640b7eb1c000f', '2015-02-22 14:29:16', null, null);

-- ----------------------------
-- Table structure for sys_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings` (
  `id` char(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `value` varchar(256) DEFAULT NULL,
  `group_name` varchar(64) DEFAULT NULL,
  `editor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_settings
-- ----------------------------
INSERT INTO `sys_settings` VALUES ('1', 'register_key', '注册码', '3ed686afda63cd26fa257300f0714e2fec96e6a5b177377fe782f8de882825ae6b44cb2440de2be3', '系统注册', 'text');
INSERT INTO `sys_settings` VALUES ('21', 'system_version', '版本号', 'fsun-erp-1.0', '系统版本', 'text');
INSERT INTO `sys_settings` VALUES ('22', 'delivery_code_format', '送货单号格式', 'month_format', '单号格式化', 'text');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` char(32) NOT NULL COMMENT '用户ID',
  `code` varchar(64) DEFAULT NULL COMMENT '用户编码',
  `username` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `realname` varchar(64) DEFAULT NULL COMMENT '用户中文名称',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `description` text COMMENT '备注',
  `issys` bit(1) DEFAULT NULL COMMENT '是否是系统管理员',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '最后更新人',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `shop_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('402882be46404313014640b7eb1c000f', null, 'super', '7cf89929244d8c1ca0f053dfad7c34b4', '超级管理员', null, null, null, '', '', null, null, null, '402882be46404313014640b7eb1c000f', '2014-11-28 14:30:09', '1812091925576891014843595');
INSERT INTO `sys_user` VALUES ('f36328d24baff4d1014baff87a660012', null, 'zqh', '25c6ec51ff1722a99d27114487429296', '小周', null, null, null, '\0', '', null, null, null, '402882be46404313014640b7eb1c000f', '2018-12-14 22:01:50', '1812091930141101014954604');
INSERT INTO `sys_user` VALUES ('4028d98152e860080152e86ab6740114', null, 'xw', '89a2aa7952a18f8e2e13a75f1b7dc584', '小王', null, null, null, '\0', '', null, '402882be46404313014640b7eb1c000f', '2016-02-16 12:50:53', '402882be46404313014640b7eb1c000f', '2019-01-29 13:51:06', '1812091930141101014954604');
INSERT INTO `sys_user` VALUES ('402881ea68bcaece0168bcb03d150002', null, 'sj', 'eddf9f93056a7cd49f1cbdce843ab61c', '孙静', '', null, '', '\0', '', null, '402882be46404313014640b7eb1c000f', '2019-02-05 16:04:53', '402881ea68bcaece0168bcb03d150002', '2019-02-05 16:17:03', '1812091930141101014954604');
