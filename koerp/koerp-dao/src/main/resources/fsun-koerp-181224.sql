/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : fsun-koerp

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-12-24 15:10:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_access_log
-- ----------------------------
DROP TABLE IF EXISTS `bus_access_log`;
CREATE TABLE `bus_access_log` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'id',
  `request_id` varchar(256) DEFAULT NULL COMMENT '请求流水号',
  `request_json` varchar(1024) DEFAULT NULL COMMENT '请求参数',
  `error_msg` varchar(1024) DEFAULT NULL COMMENT '系统返回的异常信息',
  `request_status` smallint(6) DEFAULT NULL COMMENT '请求状态码',
  `request_type` smallint(6) DEFAULT NULL COMMENT '0、内部系统；1、外部接口',
  `spend_time` smallint(6) DEFAULT NULL COMMENT '接口耗时',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `ext_0` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_1` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_2` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_3` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `ext_4` varchar(256) DEFAULT NULL COMMENT 'Extended field',
  `created_time` datetime DEFAULT NULL COMMENT '请求发起时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口访问日志';

-- ----------------------------
-- Records of bus_access_log
-- ----------------------------

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
INSERT INTO `bus_bas_codes` VALUES ('062380926FCF412F9F1D4ED193A96DA7', 'BusCustomerType', 'VIP', '会员', '2', '客户类型', '', '', 'super', null, '2018-12-02 22:37:08', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072056156751002374180', 'CategoryCode', '10', '白酒', '1', '商品分类', '0', '', 'super', null, '2018-12-07 20:56:15', null);
INSERT INTO `bus_bas_codes` VALUES ('1812072056347771002567905', 'CategoryCode', '20', '红酒', '3', '商品分类', '0', '', 'super', null, '2018-12-07 20:56:34', null);
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
INSERT INTO `bus_bas_codes` VALUES ('1812141250265351002697501', 'payMode', '6', '挂账', '9', '支付方式', '', '', 'super', null, '2018-12-14 12:50:26', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141250585371002694195', 'PayMode', '7', '会员卡', '11', '支付方式', '', '', 'super', null, '2018-12-14 12:50:58', null);
INSERT INTO `bus_bas_codes` VALUES ('1812141251226411002686734', 'PayMode', '100', '活动优惠', '13', '支付方式', '', '', 'super', null, '2018-12-14 12:51:22', null);
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
  `parent_sku` varchar(32) DEFAULT NULL COMMENT '上级sku',
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
INSERT INTO `bus_bas_sku` VALUES ('1812072138428741003432309', '123456', '1120', null, '20', '0', '20', null, '测试商品', '', '精装', '10.00', '5.00', '5.00', null, '1.00', '20', '瓶', null, null, null, '是', '12321', null, '\0', null, null, '1', '', null, null, null, null, '2018-12-07 21:49:24', '2018-12-09 18:21:26', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '\0');
INSERT INTO `bus_bas_sku` VALUES ('1812100030200621003226563', '', '1130', null, '10', '0', '10', null, '测试白酒', '', '精装', '200.00', '100.00', '180.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '6', '', null, null, null, null, '2018-12-10 00:30:20', null, '402882be46404313014640b7eb1c000f', null, '');
INSERT INTO `bus_bas_sku` VALUES ('1812100031162331003740089', '', '1131', null, '10', '0', '10', null, '测试白酒1', '', '简装', '400.00', '200.00', '300.00', null, '1.00', '20', '瓶', null, null, null, '', '', null, '\0', null, null, '4', '', null, null, null, null, '2018-12-10 00:31:16', null, '402882be46404313014640b7eb1c000f', null, '');

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
INSERT INTO `bus_customer` VALUES ('2', 'JXS100001', 'JXS', '测试经销商', '', '', '13645736015', '', 'YWY100001', '1000.00', '', null, null, null, null);
INSERT INTO `bus_customer` VALUES ('2E759B37865A4AE883B6D1B0EA39662E', 'JXS100002', 'JXS', '小王1', '', '', '13645736016', '', 'YWY100001', '0.00', '', '2018-12-03 02:49:52', null, 'super', null);
INSERT INTO `bus_customer` VALUES ('3', 'SK100001', 'SK', '散客', null, null, null, null, null, '0.00', '', null, null, null, null);
INSERT INTO `bus_customer` VALUES ('A8195E68183A48539FCD6DACEBAE520B', 'VIP100001', 'VIP', '王总', '', '1234566789', '123456', '', 'YWY100001', '0.00', '', '2018-12-04 02:33:09', '2018-12-23 00:57:55', 'super', 'super');

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
INSERT INTO `bus_inv_sku` VALUES ('1812192222079631006886015', '1120', '1812091925576891014843595', '-3.00', '0.00', '0.00', null, '2018-12-19 22:22:07', '2018-12-23 01:08:41');
INSERT INTO `bus_inv_sku` VALUES ('1812192222079931006661836', '1130', '1812091925576891014843595', '-2.00', '0.00', '0.00', null, '2018-12-19 22:22:07', '2018-12-23 01:08:41');
INSERT INTO `bus_inv_sku` VALUES ('1812192247223681006714569', '1131', '1812091925576891014843595', '-1.00', '0.00', '0.00', null, '2018-12-19 22:47:22', '2018-12-22 22:20:34');

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
INSERT INTO `bus_inv_sku_details` VALUES ('1812192222078951007921961', '22', 'A20', '2018121922100100001', null, '1812192222077791018955109', '1', '2018-12-19 22:22:07', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '100.00', '0.00', '0.00', null, '2018-12-19 22:22:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812192222079851007643646', '22', 'A20', '2018121922100100001', null, '1812192222079771018666938', '2', '2018-12-19 22:22:07', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '1200.00', '0.00', '0.00', null, '2018-12-19 22:22:07', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812192247222761007098452', '22', 'A20', '2018121922100100002', null, '1812192247221591018857641', '1', '2018-12-19 22:47:22', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '100.00', '0.00', '0.00', null, '2018-12-19 22:47:22', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812192247223601007916415', '22', 'A20', '2018121922100100002', null, '1812192247223501018701762', '2', '2018-12-19 22:47:22', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '100.00', '0.00', '0.00', null, '2018-12-19 22:47:22', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812192351151521007692897', '22', 'A20', '2018121922100100003', null, '1812192351150291018374631', '1', '2018-12-19 23:51:15', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '1.00', '0.00', '0.00', null, '2018-12-19 23:51:15', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812192351317481007996451', '22', 'A90', '2018121922100100003', null, '1812192351150291018374631', '1', '2018-12-19 23:51:15', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-19 23:51:31', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812200000400831007686414', '22', 'A20', '2018122022100100001', null, '1812200000399761018542992', '1', '2018-12-20 00:00:39', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '1.00', '0.00', '0.00', null, '2018-12-20 00:00:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812200000401111007055972', '22', 'A20', '2018122022100100001', null, '1812200000401071018553202', '2', '2018-12-20 00:00:39', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '1.00', '0.00', '0.00', null, '2018-12-20 00:00:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812200003552241007255735', '22', 'A90', '2018122022100100001', null, '1812200000399761018542992', '1', '2018-12-20 00:00:39', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-20 00:03:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812200003553861007015199', '22', 'A90', '2018122022100100001', null, '1812200000401071018553202', '2', '2018-12-20 00:00:39', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-20 00:03:55', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812202250545581007678227', '22', 'A20', '2018122022100100002', null, '1812202250544191018151366', '1', '2018-12-20 22:50:54', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '1.00', '0.00', '0.00', null, '2018-12-20 22:50:54', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812202250546401007079630', '22', 'A20', '2018122022100100002', null, '1812202250546331018369520', '2', '2018-12-20 22:50:54', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '1.00', '0.00', '0.00', null, '2018-12-20 22:50:54', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812221809246191007934942', '12', 'B20', '2018122212100100001', null, '1812221808502611020512926', '1', '2018-12-22 18:08:46', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-100.00', '0.00', '0.00', null, '2018-12-22 18:09:24', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812221809293461007117685', '12', 'B20', '2018122212100100001', null, '1812221809271001020236373', '2', '2018-12-22 18:08:46', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-100.00', '0.00', '0.00', null, '2018-12-22 18:09:29', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812221955160531007934115', '22', 'A20', '2018122222100100001', null, '1812221955158601018058587', '1', '2018-12-22 19:55:15', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '200.00', '0.00', '0.00', null, '2018-12-22 19:55:16', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812221955161471007695728', '22', 'A20', '2018122222100100001', null, '1812221955161381018855071', '2', '2018-12-22 19:55:15', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '500.00', '0.00', '0.00', null, '2018-12-22 19:55:16', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222010258691007949500', '12', 'B20', '2018122212100100002', null, '1812222010258481020967771', '1', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:10:25', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222010259221007242194', '12', 'B20', '2018122212100100002', null, '1812222010259181020609238', '2', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:10:25', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222010259391007544043', '12', 'B20', '2018122212100100002', null, '1812222010259331020855888', '3', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:10:25', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222015279091007253125', '12', 'B90', '2018122212100100002', null, '1812222010258481020967771', '1', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 20:15:27', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222015281191007715599', '12', 'B90', '2018122212100100002', null, '1812222010259181020609238', '2', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 20:15:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222015281331007364850', '12', 'B90', '2018122212100100002', null, '1812222010259331020855888', '3', '2018-12-22 20:10:25', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 20:15:28', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222022358021007672010', '12', 'B20', '2018122212100100003', null, '1812222022357911020480785', '1', '2018-12-22 20:22:35', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-200.00', '0.00', '0.00', null, '2018-12-22 20:22:35', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026206701007891184', '12', 'B90', '2018122212100100003', null, '1812222022357911020480785', '1', '2018-12-22 20:22:35', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '200.00', '0.00', '0.00', null, '2018-12-22 20:26:20', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026249581007972207', '12', 'B90', '2018122212100100001', null, '1812221808502611020512926', '1', '2018-12-22 18:08:46', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '100.00', '0.00', '0.00', null, '2018-12-22 20:26:24', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026249691007910294', '12', 'B90', '2018122212100100001', null, '1812221809271001020236373', '2', '2018-12-22 18:08:46', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '100.00', '0.00', '0.00', null, '2018-12-22 20:26:24', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026325561007426721', '22', 'A90', '2018122222100100001', null, '1812221955158601018058587', '1', '2018-12-22 19:55:15', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-200.00', '0.00', '0.00', null, '2018-12-22 20:26:32', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026325671007663100', '22', 'A90', '2018122222100100001', null, '1812221955161381018855071', '2', '2018-12-22 19:55:15', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-500.00', '0.00', '0.00', null, '2018-12-22 20:26:32', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026365671007432911', '22', 'A90', '2018122022100100002', null, '1812202250544191018151366', '1', '2018-12-20 22:50:54', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:26:36', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026365841007938374', '22', 'A90', '2018122022100100002', null, '1812202250546331018369520', '2', '2018-12-20 22:50:54', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:26:36', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026402091007339589', '22', 'A90', '2018121922100100002', null, '1812192247221591018857641', '1', '2018-12-19 22:47:22', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-100.00', '0.00', '0.00', null, '2018-12-22 20:26:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026402221007028350', '22', 'A90', '2018121922100100002', null, '1812192247223501018701762', '2', '2018-12-19 22:47:22', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-100.00', '0.00', '0.00', null, '2018-12-22 20:26:40', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026438751007092724', '22', 'A90', '2018121922100100001', null, '1812192222077791018955109', '1', '2018-12-19 22:22:07', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-100.00', '0.00', '0.00', null, '2018-12-22 20:26:43', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222026438871007871952', '22', 'A90', '2018121922100100001', null, '1812192222079771018666938', '2', '2018-12-19 22:22:07', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1200.00', '0.00', '0.00', null, '2018-12-22 20:26:43', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222041188061007403657', '16', 'B20', '2018122216100100001', null, '1812222041186931020321009', '1', '2018-12-22 20:41:18', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:41:18', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222041188761007383841', '16', 'B20', '2018122216100100001', null, '1812222041188701020140832', '2', '2018-12-22 20:41:18', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 20:41:18', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222155043331007616196', '16', 'B20', '2018122216100100002', null, '1812222155042161020186549', '1', '2018-12-22 21:55:04', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 21:55:04', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222155044141007910356', '16', 'B20', '2018122216100100002', null, '1812222155044051020050706', '2', '2018-12-22 21:55:04', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 21:55:04', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222218423101007598164', '15', 'B20', '2018122215100100001', null, '1812222218421751020025395', '1', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 22:18:42', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222218423791007261269', '15', 'B20', '2018122215100100001', null, '1812222218423741020507522', '2', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 22:18:42', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222218423941007788972', '15', 'B20', '2018122215100100001', null, '1812222218423901020690498', '3', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-22 22:18:42', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222220341341007629217', '15', 'B90', '2018122215100100001', null, '1812222218421751020025395', '1', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 22:20:34', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222220341621007424735', '15', 'B90', '2018122215100100001', null, '1812222218423741020507522', '2', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 22:20:34', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812222220341731007302998', '15', 'B90', '2018122215100100001', null, '1812222218423901020690498', '3', '2018-12-22 22:18:42', null, '1812091925576891014843595', '沈荡店仓', '1131', '测试白酒1', null, '20', '1.00', '0.00', '0.00', null, '2018-12-22 22:20:34', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812230108411821007039652', '16', 'B20', '2018122316100100001', null, '1812230108410371020555863', '1', '2018-12-23 01:08:41', null, '1812091925576891014843595', '沈荡店仓', '1120', '测试商品', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-23 01:08:41', null);
INSERT INTO `bus_inv_sku_details` VALUES ('1812230108412471007758384', '16', 'B20', '2018122316100100001', null, '1812230108412421020652454', '2', '2018-12-23 01:08:41', null, '1812091925576891014843595', '沈荡店仓', '1130', '测试白酒', null, '20', '-1.00', '0.00', '0.00', null, '2018-12-23 01:08:41', null);

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
  `shop_id` varchar(16) DEFAULT NULL COMMENT '店铺id',
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
  `extra` text COMMENT '订单额外信息',
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
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易订单';

-- ----------------------------
-- Records of bus_order
-- ----------------------------

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
  `pay_type` smallint(6) DEFAULT NULL COMMENT '支付类型  1 充值，2 消费，3 退款 4 充值撤销,5 赠送',
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
  `trade_no` varchar(32) DEFAULT NULL COMMENT '支付宝交易流水',
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
INSERT INTO `bus_rul_shop` VALUES ('1812132302011361012185136', '1', '1812091930141101014954604', '嘉兴秀洲店仓', '2018-12-13 23:02:01', null);
INSERT INTO `bus_rul_shop` VALUES ('1812132302011401012663455', '1', '1812100008460611014145244', '海宁店仓', '2018-12-13 23:02:01', null);

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
  `last_sale_price` decimal(18,2) DEFAULT '0.00' COMMENT '原销售价',
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
INSERT INTO `bus_rul_sku` VALUES ('1812132302011421013594240', '1', '20', '0', '1120', '20', '测试商品', null, '精装', '10.00', '10.00', '8.00', '5.00', '8.00', '20', '瓶', null, '2018-12-13 23:02:01', null);
INSERT INTO `bus_rul_sku` VALUES ('1812132302011471013300546', '1', '10', '0', '1130', '10', '测试白酒', '', '精装', '200.00', '180.00', null, '100.00', '100.00', '20', '瓶', null, '2018-12-13 23:02:01', null);

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
INSERT INTO `bus_vip` VALUES ('1', 'VIP100001', '1', '1123131', '13645736211', '3', '3', '3', '2018-12-18 21:56:01', '3', '3.00', '2018-12-25 02:33:59', '0.00', '3', '', '2018-12-17 21:55:30', '', null);
INSERT INTO `bus_vip` VALUES ('EE50A9B2BC894503968FA609A384DABF', 'VIP100001', '3', '1234567898765432', '13645739876', '', '小孙', '男', '2018-12-05 00:00:00', '', '1.00', '2018-12-04 03:19:34', '0.00', '测试', '', null, 'super', null);

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
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `card_no` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`unpaid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂账明细';

-- ----------------------------
-- Records of bus_vip_unpaid
-- ----------------------------

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
INSERT INTO `doc_asn_details` VALUES ('1812192222077791018955109', '2018121922100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, '100.00', '100.00', null, '0.00', null, '0.00', null, '20', null, null, '500.00', '5.00', null, '5.00', null, null, null, null, null, null, '', '2018-12-19 22:22:07', null);
INSERT INTO `doc_asn_details` VALUES ('1812192222079771018666938', '2018121922100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, '1200.00', '1200.00', null, '0.00', null, '0.00', null, '20', null, null, '216000.00', '100.00', null, '180.00', null, null, null, null, null, null, '', '2018-12-19 22:22:07', null);
INSERT INTO `doc_asn_details` VALUES ('1812192247221591018857641', '2018121922100100002', '1', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, '100.00', '100.00', null, '0.00', null, '0.00', null, '20', null, null, '18000.00', '100.00', null, '180.00', null, null, null, null, null, null, '', '2018-12-19 22:47:22', null);
INSERT INTO `doc_asn_details` VALUES ('1812192247223501018701762', '2018121922100100002', '2', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, '100.00', '100.00', null, '0.00', null, '0.00', null, '20', null, null, '30000.00', '200.00', null, '300.00', null, null, null, null, null, null, '', '2018-12-19 22:47:22', null);
INSERT INTO `doc_asn_details` VALUES ('1812192351150291018374631', '2018121922100100003', '1', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '180.00', '100.00', null, '180.00', null, null, null, null, null, null, '', '2018-12-19 23:51:15', null);
INSERT INTO `doc_asn_details` VALUES ('1812200000399761018542992', '2018122022100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '5.00', '5.00', null, '5.00', null, null, null, null, null, null, '', '2018-12-20 00:00:39', null);
INSERT INTO `doc_asn_details` VALUES ('1812200000401071018553202', '2018122022100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '300.00', '200.00', null, '300.00', null, null, null, null, null, null, '', '2018-12-20 00:00:39', null);
INSERT INTO `doc_asn_details` VALUES ('1812202250544191018151366', '2018122022100100002', '1', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '180.00', '100.00', null, '180.00', null, null, null, null, null, null, '', '2018-12-20 22:50:54', null);
INSERT INTO `doc_asn_details` VALUES ('1812202250546331018369520', '2018122022100100002', '2', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, '1.00', '1.00', null, '0.00', null, '0.00', null, '20', null, null, '300.00', '200.00', null, '300.00', null, null, null, null, null, null, '', '2018-12-20 22:50:54', null);
INSERT INTO `doc_asn_details` VALUES ('1812221955158601018058587', '2018122222100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, '200.00', '200.00', null, '0.00', null, '0.00', null, '20', null, null, '1000.00', '5.00', null, '5.00', null, null, null, null, null, null, '', '2018-12-22 19:55:15', null);
INSERT INTO `doc_asn_details` VALUES ('1812221955161381018855071', '2018122222100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, '500.00', '500.00', null, '0.00', null, '0.00', null, '20', null, null, '90000.00', '100.00', null, '180.00', null, null, null, null, null, null, '', '2018-12-22 19:55:15', null);

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
INSERT INTO `doc_asn_header` VALUES ('2018121922100100001', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '216500.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '测试', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-19 22:22:07', '超级管理员', '2018-12-19 22:22:07', '超级管理员', '2018-12-22 20:26:43');
INSERT INTO `doc_asn_header` VALUES ('2018121922100100002', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '48000.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-19 22:47:22', '超级管理员', '2018-12-19 22:47:22', '超级管理员', '2018-12-22 20:26:40');
INSERT INTO `doc_asn_header` VALUES ('2018121922100100003', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '180.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-19 23:51:15', '超级管理员', '2018-12-19 23:51:15', '超级管理员', '2018-12-19 23:51:31');
INSERT INTO `doc_asn_header` VALUES ('2018122022100100001', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '305.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-20 00:00:39', '超级管理员', '2018-12-20 00:00:39', '超级管理员', '2018-12-20 00:03:55');
INSERT INTO `doc_asn_header` VALUES ('2018122022100100002', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '480.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-20 22:50:54', '超级管理员', '2018-12-20 22:50:54', '超级管理员', '2018-12-22 20:26:36');
INSERT INTO `doc_asn_header` VALUES ('2018122222100100001', '0', null, null, null, null, null, null, null, '22', 'A90', 'pc', '91000.00', '1812091925576891014843595', '沈荡店仓', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '超级管理员', '沈荡店仓', null, '超级管理员', null, '2018-12-22 19:55:15', '超级管理员', '2018-12-22 19:55:15', '超级管理员', '2018-12-22 20:26:32');

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
INSERT INTO `doc_order_details` VALUES ('1812221808502611020512926', '2018122212100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '100.00', null, '20', null, null, '500.00', '5.00', '5.00', null, null, '', '2018-12-22 18:08:46', null);
INSERT INTO `doc_order_details` VALUES ('1812221809271001020236373', '2018122212100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, null, null, null, '1.00', null, '100.00', null, '20', null, null, '18000.00', '100.00', '180.00', null, null, '', '2018-12-22 18:08:46', null);
INSERT INTO `doc_order_details` VALUES ('1812222010258481020967771', '2018122212100100002', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '5.00', '5.00', '5.00', null, null, '', '2018-12-22 20:10:25', null);
INSERT INTO `doc_order_details` VALUES ('1812222010259181020609238', '2018122212100100002', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '180.00', '100.00', '180.00', null, null, '', '2018-12-22 20:10:25', null);
INSERT INTO `doc_order_details` VALUES ('1812222010259331020855888', '2018122212100100002', '3', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '300.00', '200.00', '300.00', null, null, '', '2018-12-22 20:10:25', null);
INSERT INTO `doc_order_details` VALUES ('1812222022357911020480785', '2018122212100100003', '1', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, null, null, null, '1.00', null, '200.00', null, '20', null, null, '60000.00', '200.00', '300.00', null, null, '', '2018-12-22 20:22:35', null);
INSERT INTO `doc_order_details` VALUES ('1812222041186931020321009', '2018122216100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '5.00', '5.00', '5.00', null, null, '', '2018-12-22 20:41:18', null);
INSERT INTO `doc_order_details` VALUES ('1812222041188701020140832', '2018122216100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '180.00', '100.00', '180.00', null, null, '', '2018-12-22 20:41:18', null);
INSERT INTO `doc_order_details` VALUES ('1812222155042161020186549', '2018122216100100002', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '5.00', '5.00', '5.00', null, null, '', '2018-12-22 21:55:04', null);
INSERT INTO `doc_order_details` VALUES ('1812222155044051020050706', '2018122216100100002', '2', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '300.00', '200.00', '300.00', null, null, '', '2018-12-22 21:55:04', null);
INSERT INTO `doc_order_details` VALUES ('1812222218421751020025395', '2018122215100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '5.00', '5.00', '5.00', null, null, '', '2018-12-22 22:18:42', null);
INSERT INTO `doc_order_details` VALUES ('1812222218423741020507522', '2018122215100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '180.00', '100.00', '180.00', null, null, '', '2018-12-22 22:18:42', null);
INSERT INTO `doc_order_details` VALUES ('1812222218423901020690498', '2018122215100100001', '3', '10', '白酒', '', '10', '杜康', '测试白酒1', '1131', null, '简装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '300.00', '200.00', '300.00', null, null, '', '2018-12-22 22:18:42', null);
INSERT INTO `doc_order_details` VALUES ('1812230108410371020555863', '2018122316100100001', '1', '20', '红酒', '123456', '20', '科乐克', '测试商品', '1120', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '5.00', '5.00', '5.00', null, null, '', '2018-12-23 01:08:41', null);
INSERT INTO `doc_order_details` VALUES ('1812230108412421020652454', '2018122316100100001', '2', '10', '白酒', '', '10', '杜康', '测试白酒', '1130', null, '精装', null, null, null, null, null, null, null, '1.00', null, '1.00', null, '20', null, null, '180.00', '100.00', '180.00', null, null, '', '2018-12-23 01:08:41', null);

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
INSERT INTO `doc_order_header` VALUES ('2018122212100100001', null, '12', 'B90', null, 'pc', null, null, null, '18500.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 18:08:46', '超级管理员', '2018-12-22 18:08:46', '超级管理员', null, '2018-12-22 20:26:24', null);
INSERT INTO `doc_order_header` VALUES ('2018122212100100002', null, '12', 'B90', null, 'pc', null, null, null, '485.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 20:10:25', '超级管理员', '2018-12-22 20:10:25', '超级管理员', null, '2018-12-22 20:15:27', null);
INSERT INTO `doc_order_header` VALUES ('2018122212100100003', null, '12', 'B90', null, 'pc', null, null, null, '60000.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 20:22:35', '超级管理员', '2018-12-22 20:22:35', '超级管理员', null, '2018-12-22 20:26:20', null);
INSERT INTO `doc_order_header` VALUES ('2018122215100100001', null, '15', 'B90', null, 'pc', null, null, null, '485.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 22:18:42', '超级管理员', '2018-12-22 22:18:42', '超级管理员', null, '2018-12-22 22:20:34', null);
INSERT INTO `doc_order_header` VALUES ('2018122216100100001', null, '16', 'B20', '40', 'pc', null, null, null, '185.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '小红', null, '', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 20:41:18', '超级管理员', '2018-12-22 20:41:18', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2018122216100100002', null, '16', 'B20', '10', 'pc', null, null, null, '305.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, null, null, null, null, null, '18868384667', '嘉兴海盐', null, null, '小王', null, '测试', null, '402882be46404313014640b7eb1c000f', '沈荡店仓', null, '超级管理员', null, null, null, null, null, null, null, null, null, null, '2018-12-22 21:55:04', '超级管理员', '2018-12-22 21:55:04', null, null, null, null);
INSERT INTO `doc_order_header` VALUES ('2018122316100100001', null, '16', 'B20', '10', 'pc', null, null, null, '185.00', null, null, '1812091925576891014843595', '沈荡店仓', null, null, null, null, null, null, 'YWY100001', '测试业务员', null, null, null, '123456', '1234566789', null, 'VIP100001', '王总', null, '测试', null, 'YWY100001', '沈荡店仓', null, '超级管理员', '测试业务员', null, null, null, null, null, null, null, null, null, '2018-12-23 01:08:41', '超级管理员', '2018-12-23 01:08:41', null, null, null, null);

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
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b5', 'f36328d24baff4d1014baff725770002', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b4', 'f36328d24baff4d1014baff725770002', '4028d9814aa3d39e014aa3d617580002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b3', 'f36328d24baff4d1014baff725770002', '402882be464c0a0e01464c4f58ed0001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b2', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da099ebcd0003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b1', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da09960e30002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b0', 'f36328d24baff4d1014baff725770002', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00af', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00ae', 'f36328d24baff4d1014baff725770002', '4028878d4cbc337b014cbc4346ea0003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00ad', 'f36328d24baff4d1014baff725770002', '4028d9814a6d50f1014a6d5d00fb0077');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00ac', 'f36328d24baff4d1014baff725770002', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00ab', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00aa', 'f36328d24baff4d1014baff725770002', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a9', 'f36328d24baff4d1014baff725770002', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a8', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca93025000e', 'f36328d24baff4d1014baff9c63f0016', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca93025000d', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca93025000c', 'f36328d24baff4d1014baff9c63f0016', '402880e862aa57960162ab13c567001f');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca93025000b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca93025000a', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca930250009', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca930230008', 'f36328d24baff4d1014baff9c63f0016', '4028867462a4e9b90162a4ece0470002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000d', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc56b64800fc');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a7', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a6', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a5', 'f36328d24baff4d1014baff725770002', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000c', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a131ef810002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a4', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000b', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a000a', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a3', 'f36328d24baff4d1014baff725770002', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a2', 'f36328d24baff4d1014baff725770002', '402890f03feb8eb5013feb9598640003');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca930230007', 'f36328d24baff4d1014baff9c63f0016', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('ff80808162c7e19e0162cca930230006', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a1', 'f36328d24baff4d1014baff725770002', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0009', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0008', '297ea07f3da970a6013daa018581000c', '4028867462a4e9b90162a4ece0470002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0007', '297ea07f3da970a6013daa018581000c', '4028d981529b18f101529b1d05600002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a7a0006', '297ea07f3da970a6013daa018581000c', '4028d9815e0511c1015e0516bf270002');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790005', '297ea07f3da970a6013daa018581000c', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790004', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790003', '297ea07f3da970a6013daa018581000c', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('402882e9676db37101676dc64a790002', '297ea07f3da970a6013daa018581000c', '297ea07f3f7e6920013f7e6b2e3c0002');

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
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93036002d', 'f36328d24baff4d1014baff9c63f0016', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93036002c', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93036002b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93036002a', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930360029', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930360028', 'f36328d24baff4d1014baff9c63f0016', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930360027', 'f36328d24baff4d1014baff9c63f0016', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930360026', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930360025', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930350024', 'f36328d24baff4d1014baff9c63f0016', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930350023', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930350022', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930350021', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930350020', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93035001f', 'f36328d24baff4d1014baff9c63f0016', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93035001e', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93035001d', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf80112', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cc6d040009');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70111', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70110', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010f', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010e', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010d', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010c', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010b', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010a', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70109', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70108', 'f36328d24baff4d1014baff725770002', 'f36328d24baf6b7f014baf713ed00008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70107', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70106', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70105', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfec1e80004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70104', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfdbe820002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70103', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70102', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70101', 'f36328d24baff4d1014baff725770002', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70100', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b1282a983000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf700ff', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b12821a940009');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf700fe', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127c85a60006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fd', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b9dcc0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fc', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b01b90002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fb', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00d06c000c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fa', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00602b000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f9', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d0001fe0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f8', 'f36328d24baff4d1014baff725770002', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f7', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f6', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f5', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f4', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f3', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f2', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f1', 'f36328d24baff4d1014baff725770002', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f0', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ef', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ee', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575f9440012');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ed', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575724f0010');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ec', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600eb', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ea', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c7fe300a4');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600e9', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c32a000a2');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600e8', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6bbf9400a0');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e7', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6b7333009e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e6', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a9a17009a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e5', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a58560098');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e4', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a1f710096');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e3', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa69a7650094');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e2', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa693feb0092');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e1', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa686b09008e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e0', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa681215008c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500df', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6788950088');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500de', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa67520a0086');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500dd', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff9818ea00c0');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500dc', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa66642f0081');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500db', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa65a09a007d');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500da', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa657141007b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d9', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff98687300c2');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d8', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff3dcc000003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d7', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56fa3a0059');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d6', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56c2fb0057');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d5', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa568f3a0055');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d4', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa5cb32c006e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d3', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa513013003e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d2', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d79c60036');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d1', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d1b4d0034');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d0', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4cd40b0032');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cf', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4b81db002e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400ce', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4af7a1002c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cd', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4a77fa0029');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cc', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cb', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400ca', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c9', 'f36328d24baff4d1014baff725770002', '4028803c41243da901425956bf8f000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c8', 'f36328d24baff4d1014baff725770002', '297ea07f3fc27b1a013fc283e7c30004');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0046', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0045', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0044', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8c0043', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0042', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0041', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c7', 'f36328d24baff4d1014baff725770002', '402880e73f3b3caa013f3c5278990014');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c6', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e35a15ecc0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c5', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e359fe4af0003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c4', 'f36328d24baff4d1014baff725770002', '297ea07f422b5f8401422b6029390001');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c3', 'f36328d24baff4d1014baff725770002', '297ea07f3e34a15b013e34a1e4260001');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c2', 'f36328d24baff4d1014baff725770002', '297ea07f3e346d19013e346e4bb70001');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0040', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003f', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006b1f60003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003e', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d007288c0007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003d', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d00764c00009');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93035001c', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c1', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c0', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003c', '297ea07f3da970a6013daa018581000c', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003b', '297ea07f3da970a6013daa018581000c', '4028888e49df4da30149df57b75e0003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b003a', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0039', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0038', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ffb6c40007');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8b0037', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e5001fc20009');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0036', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0035', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006e7a90005');
INSERT INTO `r_role_power` VALUES ('402882e9676db37101676dc64a8a0034', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400bf', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400be', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bd', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bc', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bb', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdad9f190004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300ba', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdae284f0006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b9', 'f36328d24baff4d1014baff725770002', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93035001b', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93034001a', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340019', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340018', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340017', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340016', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340015', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340014', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15918740006');
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
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b8', 'f36328d24baff4d1014baff725770002', '4028d9814c3a9999014c3a9cb0f20002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b7', 'f36328d24baff4d1014baff725770002', '4028d9814c4be3cf014c4be79b030002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b6', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340013', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930340012', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930330011', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca930330010', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('ff80808162c7e19e0162cca93033000f', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf80113', 'f36328d24baff4d1014baff725770002', '4028d9814c40d654014c41c163ef0005');
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
INSERT INTO `r_role_user` VALUES ('f36328d24baff4d1014baffd331e008d', 'f36328d24baff4d1014baff725770002', 'f36328d24baff4d1014baff87a660012');
INSERT INTO `r_role_user` VALUES ('4028d98152e860080152e86aed810116', 'f36328d24baff4d1014baff9c63f0016', '4028d98152e860080152e86ab6740114');

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
INSERT INTO `sys_menu` VALUES ('402880f33e3ae38d013e3b2511250009', 'DICTIONARY_MANAGE', '数据字典', 'sys/dictionary/manage', null, '2013-04-24 00:00:00', null, '2013-12-16 16:17:11', null, null, null, '', null, '6', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d981494f5aa601494f60ecfc000a', 'MARKET_MANAGE', '营销管理', null, 'images/icons/briefcase.png', '2014-10-27 10:13:12', '402882be46404313014640b7eb1c000f', '2014-12-21 23:03:33', null, null, null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09a94cf0004', 'MENU_MANAGE', '菜单管理', 'sys/menu/manage', 'images/icons/plugins48.png', '2013-03-25 04:11:58', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:52', null, null, null, '', null, '5', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da099ebcd0003', 'ROLE_MANAGE', '角色管理', 'sys/role/manage', 'images/icons/themes8.png', '2013-03-25 04:11:14', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:36', null, null, null, '', null, '4', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09960e30002', 'USER_MANAGE', '用户管理', 'sys/user/manage', 'images/icons/46.png', '2013-03-25 00:00:00', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:26', null, null, null, '', null, '3', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da098bf150001', 'SYSTEM_MANAGE', '系统管理', null, 'images/icons/l-sjzx.png', '2013-03-25 04:09:57', null, '2013-07-18 16:58:19', null, null, null, '', null, '17', '测试', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3e35f0a0013e35f8a5e00001', 'LOG_MANAGE', '日志管理', 'sys/log/manage', 'images/icons/9.png', '2013-04-23 16:18:08', '402882be46404313014640b7eb1c000f', '2015-01-08 16:34:37', null, null, null, '', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da0aee03e0005', 'POWER_MANAGE', '权限管理', 'sys/power/manage', 'images/icons/22.png', '2013-03-25 04:34:08', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:16', null, null, null, '', null, '2', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3f7e6920013f7e6b2e3c0002', 'SYSTEM', '业务系统', null, '&#xe6b8;', '2013-06-26 10:58:40', '402882be46404313014640b7eb1c000f', '2015-01-01 15:37:12', null, null, null, '', null, '1', '297ea07f3df89479013df895251d0001', null);
INSERT INTO `sys_menu` VALUES ('402890f03feb8eb5013feb9598640003', 'OVERVIEW_MANAGE', '总览', 'bus/overview/manage', 'images/icons/sys_store.png', '2013-07-17 03:43:36', '402882be46404313014640b7eb1c000f', '2014-12-21 23:02:58', null, null, null, '', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc5540ee00fa', 'FACTORYINFO_MANAGE', '客户管理', 'bus/customer/index', 'images/icons/rss.png', '2014-11-20 16:32:59', '402882be46404313014640b7eb1c000f', '2016-02-04 16:05:15', null, null, null, null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc56b64800fc', 'CLASSIFY_MANAGE', '员工管理', 'bus/user/index', 'images/icons/play.png', '2014-11-20 16:34:35', '402882be46404313014640b7eb1c000f', '2016-02-02 16:56:56', null, null, null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('297ea07f40516d39014051bbae940001', 'ICON_MANAGE', '图标管理', 'sys/icon/manage', 'images/icons/comments8.png', '2013-08-06 11:46:28', '402882be46404313014640b7eb1c000f', '2015-01-08 23:03:55', null, null, null, '', null, '7', null, '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402882be464c0a0e01464c4f58ed0001', 'AUTH_MANAGE', '注册认证', 'sys/auth/manage', 'images/icons/article48.png', '2014-05-30 16:46:46', '402882be46404313014640b7eb1c000f', '2015-02-27 09:08:08', null, null, null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc52cbc900f7', 'SUPPLY_GOOD_MANAGE', '基础资料', null, 'images/icons/l-jq.png', '2014-11-20 16:30:18', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:04', null, null, null, null, null, '15', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc4028dc0005', 'ORDER_MANAGE', '销售单管理', 'bus/order/index', 'images/icons/sale.png', '2014-11-20 16:09:57', '402882be46404313014640b7eb1c000f', '2015-01-21 22:53:25', null, null, null, null, null, '3', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028888e49d058530149d05a687a0002', 'PRODUCT_MANAGE', '价格策略', 'bus/rule/price/index', 'images/icons/18.png', '2014-11-21 11:17:06', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:16', null, null, null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d56d4850074', 'MARKET_SUMMARY', '营销汇总', null, 'images/icons/chart.png', '2014-12-21 22:53:34', '402882be46404313014640b7eb1c000f', '2015-02-28 08:49:15', null, null, null, null, null, '16', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d5d00fb0077', 'ORDER_SUMMARY', '订单汇总', 'bus/summary/order/manage', 'images/icons/research.png', '2014-12-21 23:00:19', '402882be46404313014640b7eb1c000f', '2015-02-28 08:50:02', null, null, null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9814adc1ba0014adc1db9d90002', 'CUSTOMER_MANAGE', '会员卡管理', 'bus/vip/index', 'images/icons/46.png', '2015-01-12 11:09:03', null, null, null, null, '', null, null, '5', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814af28328014af32663aa0006', 'PLUGIN_MANAGE', '插件下载', 'sys/plugin/manage', 'images/icons/43.png', '2015-01-16 22:29:46', null, null, null, null, '', null, null, '12', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d9814b17de71014b17e6ec4b0003', 'MADE_MANAGE', '入库单管理', 'doc/asn/index', 'images/icons/transfer.png', '2015-01-24 01:46:24', '402882be46404313014640b7eb1c000f', '2017-08-21 21:59:06', null, null, null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9814aa3d39e014aa3d617580002', 'SYSTEM_CONFIG_MANAGE', '数据字典', 'sys/codes/index', 'images/icons/5.png', '2015-01-01 12:52:04', '402882be46404313014640b7eb1c000f', '2015-01-01 15:47:18', null, null, null, null, null, '11', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028878d4cbc337b014cbc4346ea0003', 'ORDER_DETAIL_SUMMARY', '订单明细汇总', 'bus/summary/orderDetail/manage', 'images/icons/views8.png', '2015-04-15 16:47:47', null, null, null, null, '', null, null, '2', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('402887e64d4635eb014d463780db0002', 'MESSAGE_MANAGE', '消息管理', 'bus/message/manage', 'images/icons/comments8.png', '2015-05-12 11:42:32', null, null, null, null, '', null, null, '13', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402887e64de145d5014de14829a40002', 'STOCK_MANAGE', '库存管理', 'bus/invSku/index', 'images/icons/25.png', '2015-06-11 14:21:52', null, null, null, null, '', null, null, '6', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('402887e64e09c689014e09c9cd400003', 'STORE_MANAGE', '店仓管理', 'bus/shop/index', 'images/icons/sys_store.png', '2015-06-19 11:08:17', null, null, null, null, '', null, null, '7', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981529b18f101529b1d05600002', 'PURCHASE_MANAGE', '申请单管理', 'doc/po/index', 'images/icons/sys_delivery.png', '2016-02-01 12:35:16', null, null, null, null, '', null, null, '6', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d98152a12d8f0152a131ef810002', 'MATERIEL_MANAGE', '商品管理', 'bus/basSku/index', 'images/icons/shipping.png', '2016-02-02 16:55:50', null, null, null, null, '', null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981531790740153179356e60002', 'PURCHASE_DETAIL_SUMMARY', '物料采购明细汇总', 'bus/summary/buyDetail/manage', 'images/icons/calculator.png', '2016-02-25 16:37:25', '402882be46404313014640b7eb1c000f', '2016-02-26 00:16:20', null, null, null, null, null, '5', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9815e0511c1015e0516bf270002', 'DELIVERY_MANAGE', '出库单管理', 'doc/order/index', 'images/icons/shipping.png', '2017-08-21 21:58:50', '402882be46404313014640b7eb1c000f', '2017-08-25 13:37:13', null, null, null, null, null, '5', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9815e21e12a015e21e3a4050002', 'DELIVERY_ORDER_SUMMARY', '送货单明细汇总', 'bus/summary/deliveryDetail/manage', 'images/icons/16.png', '2017-08-27 12:12:00', null, null, null, null, '', null, null, '3', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028867462a4e9b90162a4ece0470002', 'PROXY_MANAGE', '寄存单管理', 'bus/proxyOrder/manage', 'images/icons/22.png', '2018-04-08 19:03:30', null, null, null, null, '', null, null, '7', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('402880e862aa57960162ab13c567001f', 'PORXY_ORDER_SUMMARY', '加工单明细汇总', 'bus/summary/proxyDetail/manage', 'images/icons/31.png', '2018-04-09 23:43:42', null, null, null, null, '', null, null, '4', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');

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
INSERT INTO `sys_user` VALUES ('4028d98152e860080152e86ab6740114', null, 'xw', '89a2aa7952a18f8e2e13a75f1b7dc584', '小王', null, null, null, '\0', '', null, '402882be46404313014640b7eb1c000f', '2016-02-16 12:50:53', '402882be46404313014640b7eb1c000f', '2018-12-15 00:20:05', '1812091925576891014843595');
