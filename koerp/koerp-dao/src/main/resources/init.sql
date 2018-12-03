drop table if exists bus_bas_sku;

create table bus_bas_sku
(
   sku_id               varchar(32) not null comment 'sku_id',
   bar_code             varchar(32) comment '商品条码',
   sku                  varchar(32) not null comment 'sku',
   parent_sku           varchar(32) not null comment '上级sku',
   category_code        varchar(32) comment '产品分类编码',
   product_type         smallint comment '产品类型 0 单品，1 组合',
   brand_code           varchar(32) comment '品牌编码',
   assist_id            varchar(32) comment '辅助编码',
   goods_name           varchar(200) comment '商品名称',
   en_name              varchar(128) comment '英文名称',
   property             varchar(64) comment '商品属性',
   market_price         decimal(18,2) default 0 comment '市场价',
   cost_price           decimal(18,2) default 0 comment '成本价',
   origin_sale_price    decimal(18,2) default 0 comment '原销售价',
   warning_qty          int(11) default 0 comment '库存预警值',
   qty                  decimal(18,2) comment '数量',
   unit                 varchar(32) comment '单位',
   unit_name            varchar(32) comment '单位名称',
   convert_qty          decimal(18,2) default NULL comment '换算数量',
   convert_unit         varchar(32) comment '换算单位',
   keywords             varchar(256) comment '商品关键字',  
   memo                 varchar(1024) comment '备注',
   descr                varchar(256) comment '详情',     
   status               smallint default NULL comment '状态 1 待审核，2 仓库中，3 已上架，4 已下架',
   is_recommend         bit default 0 comment '是否推荐商品',
   on_shelf_time        datetime default NULL comment '上架时间',
   off_shelf_time       datetime default NULL comment '下架时间',
   sort_code            int default 999999 comment '排序号',
   is_enabled           bit default 1 comment '状态,1启用,-0 禁用',
   ext_0                varchar(256) comment 'Extended field',
   ext_1                varchar(256) comment 'Extended field',
   rate_precent         decimal(18,2) comment '税率',
   settle_type          int comment '0，非直接结算；1直接结算',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
	 created_id           varchar(32) comment '创建人id',
	 updated_id           varchar(32) comment '更新人id',
   primary key (sku_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='商品';

alter table bus_bas_sku comment '店铺产品';


drop table if exists bus_rul_shop;

/*==============================================================*/
/* Table: rul_shop                                              */
/*==============================================================*/
create table bus_rul_shop
(
   id                   varchar(32) not null comment 'id',
   rul_id               varchar(32) comment '产品分类Id',
   shop_id            varchar(32) comment '店铺编号',
   shop_name            varchar(64) comment '店铺名称',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_rul_shop comment '价格策略应用店铺';


drop table if exists bus_rul_price;

/*==============================================================*/
/* Table: rul_price                                             */
/*==============================================================*/
create table bus_rul_price
(
   rul_id               varchar(32) not null comment '策略Id',
   rul_name             varchar(64) default NULL comment '价格策略名称',
   is_discount          bit default 0 comment '是否统一折扣',
   discount             decimal(18,2) default NULL comment '折扣',
   sort_code            int default 999999 comment '优先级',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   created_id           varchar(32) comment '创建人id',
	 updated_id           varchar(32) comment '更新人id',
   primary key (rul_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_rul_price comment '价格策略';


drop table if exists bus_rul_sku;

/*==============================================================*/
/* Table: rul_sku                                               */
/*==============================================================*/
create table bus_rul_sku
(
   sku_id               varchar(32) not null comment 'rul_sku_id',
   rul_id               varchar(32) comment '策略Id',
   category_code        varchar(32) not null comment '产品分类编码',
   product_type         smallint comment '产品类型 0 单品，1 组合',
   sku                  varchar(64) not null comment 'sku',
   brand_code           varchar(32) comment '品牌编码',
   goods_name           varchar(200) comment '商品名称',
   en_name              varchar(128) comment '英文名称',
   property             varchar(64) comment '商品属性',
   market_price         decimal(18,2) default 0 comment '市场价',
   sale_price           decimal(18,2) default 0 comment '销售价',
   last_sale_price      decimal(18,2) default 0 comment '原销售价',
   cost_price           decimal(18,2) default 0 comment '成本价',
	 vip_price            decimal(18,2) default 0 comment '会员价',
   unit                 varchar(32) comment '单位',
   unit_name            varchar(32) comment '单位名称',
   keywords             varchar(256) comment '商品关键字',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (sku_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_rul_sku comment '基础物料';



-- ----------------------------
-- Table structure for bus_store
-- ----------------------------
DROP TABLE IF EXISTS bus_shop;
CREATE TABLE bus_shop (
  shop_id		varchar(32) NOT NULL comment '店仓编号' ,
  shop_code             varchar(32) comment '店铺编码',
  shop_name		varchar(32) CHARACTER SET utf8 NOT NULL comment '店仓名称' ,
  position		varchar(32) CHARACTER SET utf8 DEFAULT NULL comment '位置' ,
  address		varchar(128) CHARACTER SET utf8 DEFAULT NULL comment '地址' ,
  contacts		varchar(16) DEFAULT NULL comment '联系人' ,
  memo			varchar(512) CHARACTER SET utf8 DEFAULT NULL comment '备注' ,
  disable		tinyint(1) DEFAULT '0' comment '是否可用' ,
  created_time		datetime default NULL comment '创建时间',
  updated_time		datetime default NULL comment '更新时间',
  created_id           varchar(32) comment '创建人id',
  updated_id           varchar(32) comment '更新人id',
  PRIMARY KEY (shop_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_rul_sku comment '门店信息';

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS bus_customer;

CREATE TABLE bus_customer (
  id 			varchar(32) NOT NULL COMMENT '主键',
  customer_code		varchar(32) DEFAULT NULL COMMENT '客户编号',
  customer_type		varchar(32) DEFAULT NULL COMMENT '客户类型(SK:散客, YWY:业务员,GYS:供应商, JXS:经销商, GZ 挂账单位, VIP会员)',
  customer_name		varchar(64) DEFAULT NULL COMMENT '客户名称',
  contacts		varchar(32) DEFAULT NULL COMMENT '联系人',
  address 		varchar(256) COMMENT '地址',
  tel 			varchar(32) DEFAULT NULL COMMENT '联系方式',
  memo 			varchar(256) COMMENT '备注',   
  salesman 		varchar(32) DEFAULT NULL COMMENT '所属销售代表',
  credit_price		decimal(18,2) default 0 comment '信用额度',
  enabled 		tinyint(1) DEFAULT NULL COMMENT '是否可用',
  created_time		datetime default NULL comment '创建时间',
  updated_time		datetime default NULL comment '更新时间',
  created_id		varchar(32) comment '创建人id',
  updated_id		varchar(32) comment '更新人id',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_customer comment '挂账信息';


drop table if exists bus_vip;

/*==============================================================*/
/* Table: vip_info                                              */
/*==============================================================*/
create table bus_vip
(
   vip_id               varchar(32) not null comment '会员编号',
   wechat               varchar(32) DEFAULT NULL COMMENT '微信号',
   cn_name              varchar(32) comment '姓名', 
   sex                  varchar(16) comment '姓别',  
   brithday             datetime default NULL comment '出生日期',  
   email                varchar(64) comment '邮箱',   
   origin_precent       decimal(18,2) comment '本金比例',  
   vip_time             datetime default NULL comment '入会时间',
   enable_price         decimal(18,2) default 0 comment '可用余额',
   primary key (vip_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_vip comment '会员信息';


drop table if exists bus_vip_unpaid;

/*==============================================================*/
/* Table: vip_unpaid                                            */
/*==============================================================*/
create table bus_vip_unpaid
(
   unpaid_id            varchar(32) not null comment '挂账支付Id',
   customer_id          varchar(32) comment '会员Id',
   shop_id              varchar(32) comment '店仓编号',
   pay_mode             smallint default NULL comment '结款方式  1 银行卡，2 现金，3 支付宝，4 微信，5 会员(卡),6(券)，99 其他',
   trade_type           smallint default NULL comment '交易类型  1 挂账，2 挂账结款 ',
   trade_status         smallint default NULL comment '交易状态  1 交易成功，2 交易取消 ',
   trade_time           datetime default NULL comment '订单交易时间',
   trade_price          decimal(18,2) default NULL comment '交易金额',
   memo                 varchar(256) default NULL comment '备注信息',
   order_id             varchar(64) default NULL comment '订单号',  
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (unpaid_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_vip_unpaid comment '挂账明细';




drop table if exists bus_order;

/*==============================================================*/
/* Table: doc_order                                             */
/*==============================================================*/
create table bus_order
(
   order_id             varchar(32) not null comment '订单id',
   order_type           smallint(6) default 1 comment '订单类型 1 pos销售订单，2 盘亏出库，3 外卖销售订单',
   pay_type             smallint(6) default 1 comment '付款方式 1->在线付款  2->货到付款,3 挂账',
   sys_order_id         varchar(32) comment '对接平台订单id',
   ext_order_id         varchar(32) comment '第三方平台订单id',
   pos_no               varchar(32) comment 'pos编号',
   card_type            char(2) comment '卡类别',
   buyer_id             varchar(32) comment '买家id',
   buyer_name           varchar(32) comment '买家名称',
   plat_id              varchar(16) default NULL comment '平台id',
   plat_name            varchar(16) default NULL comment '平台',
   plat_shop_id         varchar(16) default NULL comment '平台店铺id',
   shop_id              varchar(16) default NULL comment '店铺id',
   shop_name            varchar(64) comment '店铺名称',
   trade_from           varchar(64) comment '交易来源 wap,app,pc,pos',
   trade_status         char(2) comment '交易状态[00 已下单，10 已付款，20 已发货，30 交易成功，40 订单取消，60 交易关闭]',
   order_status         char(2) comment '订单状态[0 未确认，1 已确认，2已接配送，3已取餐，4已配送成功，5已完结，6已取消]',
   refund_status        char(2) default '0' comment '退款状态[05 申请取消单,10 申请退款,15 同意取消单,20 同意退款, 25 拒绝取消单,30  拒绝退款, 35 取消单完成,40  退款完成,45 申请取消单取消,50 申请退单取消]',
   refund_time          datetime comment '退款时间',
   refund_sponsor       int comment '发起退单（退货）角色：1下单用户，2外卖平台系统，3商户，4外卖平台客服，5其他',
   refund_type          int comment '退单类型[0,取消单；1.退单]',
   refund_reason        varchar(500) comment '取消或退单原因',
   flow_status          char(2) default '00' comment '流转状态 00 创建，30 出库，40 完成,99 已回传',
   is_valid             bit default 1 comment '是否有效订单',
   origin_price         decimal(18,2) default 0 comment '订单原价',
   order_price          decimal(18,2) default 0 comment '订单总金额',
   ship_price           decimal(18,2) default 0 comment '订单运费',
   discount_price       decimal(18,2) default 0 comment '优惠金额',
   to_zero_price        decimal(18,2) default 0 comment '抹零金额',
   pay_price            decimal(18,2) default 0 comment '实付款',
   dib_price            decimal(18,2) default 0 comment '找零金额',
   recept_price         decimal(18,2) default 0 comment '订单应收款  ',
   package_price        decimal(18,2) default 0 comment '打包费',
   point_fee            int(11) default 0 comment '积分',
   bonus_price          decimal(18,2) default 0 comment '红包金额',
   rate_price           decimal(18,2) default 0 comment '佣金',
   is_settlemented      bit default 0 comment '是否已结算 0 未结算，1 已生成结算单',
   extra                text comment '订单额外信息',
   receive_name         varchar(64) comment '收件人名称',
   province_id          varchar(32) comment '省id',
   province             varchar(32) comment '省',
   city_id              varchar(32) comment '市id',
   city                 varchar(32) default NULL comment '市',
   district_id          varchar(32) default NULL comment '区id',
   district             varchar(32) default NULL comment '区',
   address              varchar(512) default NULL comment '街道(地址)',
   longitude_address    varchar(64) default NULL comment '地址经度',
   latitude_address     varchar(64) default NULL comment '地址维度',
   mobile               varchar(32) comment '手机',
   zip_code             varchar(32) default NULL comment '邮编',
   memo                 varchar(512) default NULL comment '订单备注',
   buyer_notes          varchar(256) default NULL comment '买家留言',
   seller_notes         varchar(256) default NULL comment '卖家留言',
   is_invoice           bit default 0 comment '是否开票[0 不开票，1 开票]',
   is_trave             bit default 0 comment '是否货票同行[0 不同行，1 同行]',
   invoice_type         smallint default 0 comment '发票类型[0 普通发票，1 增值发票]',
   invoice_title        varchar(64) comment '发票抬头',
   invoice_content      varchar(256) comment '发票内容',
   order_time           datetime comment '下单时间',
   pay_time             datetime comment '付款时间',
   delivery_time        datetime comment '发货时间',
   confirm_time         datetime comment '订单确认时间',
   print_count          int default 0 comment '打印次数',
   cash_id              varchar(32) comment '收银员id',
   cash_name            varchar(32) comment '收银员',
   logistics_plat       varchar(64) comment '配送平台名称',
   logistics_type       smallint(6) comment '配送平台类型[1平台配送；0自配送]',
   logistics            varchar(64) comment '配送人员姓名',
   logistics_phone      varchar(32) comment '配送人员联系方式',
   settle_time          datetime comment '日结时间',
   logistics_time       datetime comment '配送下达时间',
   logistics_pick_time  datetime comment '配送取餐时间',
   logistics_receive_time datetime comment '配送送达时间',
   shift                smallint(6) comment '班次',
   is_read              smallint(6) comment '读取标志(0: 未读；1已读；2：更新后待读)',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (order_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_order comment '交易订单';



drop table if exists bus_goods;

/*==============================================================*/
/* Table: doc_goods                                             */
/*==============================================================*/
create table bus_goods
(
   goods_id             varchar(32) not null comment 'goods_id',
   order_id             varchar(32) comment '订单id',
   line_no              int comment '行号',
   category_id          varchar(32) comment '分类id',
   brand_code           varchar(32) default NULL comment '品牌编码',
   product_type         smallint not null comment '产品类型 1 单品，2 组合',
   goods_name           varchar(128) comment '商品名称',
   bar_code             varchar(32) comment '商品条码',
   sku                  varchar(32) comment 'sku',
   parent_sku           varchar(32) comment 'parent_sku',
   sku_id               varchar(32) comment '原SKU ID',
   parent_sku_id        varchar(32) comment '原父SKU ID',
   en_unit              varchar(32) comment '英文单位简称',
   total_part_price     decimal(18,2) comment '总分摊价',
   rate_type            varchar(32) comment '税种',
   qty                  decimal(18,2) default NULL comment '购买数量',
   unit                 varchar(32) comment '单位',
   convert_qty          decimal(18,2) default NULL comment '换算数量',
   convert_unit         varchar(32) comment '换算单位',
   market_price         decimal(18,2) not null comment '市场价',
   origin_sale_price    decimal(18,2) not null comment '原销售价',
   sale_price           decimal(18,2) not null comment '实际销售价(销售价、会员价)',
   part_price           decimal(18,4) default 0 comment '商品分摊价',
   discount_price       decimal(18,4) default 0 comment '商品折价 销售价-分摊价=折扣价',
   total_price          decimal(18,2) not null default 0 comment '商品销售总金额',
   cost_price           decimal(18,4) default 0 comment '成本价',
   rate_precent         decimal(18,2) default 17 comment '税率',
   is_gift              bit default 0 comment '是否为赠品 1 赠品，0 非赠品',
   gift_count           DECIMAL(18,2) comment '赠送数量',
   gift_price           DECIMAL(18,2) comment '赠送金额',
   is_show              bit comment '点单界面是否显示，不显示用于组合商品',
   property             varchar(64) default NULL comment '商品属性',
   memo                 varchar(512) default NULL comment '备注',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (goods_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_goods comment '交易商品表';


drop table if exists bus_pay_account;

/*==============================================================*/
/* Table: pay_account                                           */
/*==============================================================*/
create table bus_pay_account
(
   pay_id               varchar(32) not null comment '支付Id',
   line_no              int comment '行号 赠送的顺序号在后边',
   vip_id               varchar(32) comment '会员id',
   shop_id              varchar(32) comment '店铺id',
   shop_name            varchar(32) comment '店铺名',
   card_no              varchar(32) comment '卡号',  
   pay_mode             smallint default NULL comment '支付方式 1 银行卡，2 现金，3 支付宝，4 微信，5 会员(卡)，6 券, 7 挂账, 99 其他',
   pay_type             smallint default NULL comment '支付类型  1 充值，2 消费，3 退款 4 充值撤销,5 赠送',
   point_fee            decimal(18,2) default 0 comment '积分',
   bank_account_name    varchar(32) default NULL comment '银行账户名称',
   bank_account_no      varchar(32) default NULL comment '银行账户',
   bank_name            varchar(64) default NULL comment '银行名',
   buyer_name           varchar(127) default NULL comment '买家姓名',
   buyer_account        varchar(32) default NULL comment '买家账户',
   pay_price            decimal(18,2) default NULL comment '实付款 不一定存在，实际掏的金额',
   recept_price         decimal(18,2) default NULL comment '应收款   必须有值',
   dib_price            decimal(18,2) default NULL comment '找零金额',
   over_amount          decimal(18,2) default NULL comment '溢收金额',
   discount_amount      decimal(18,2) default NULL comment '优惠金额  赠送金',
   currency             varchar(16) default NULL comment '货币代码(人民币 CNY)',
   deposit_bank_no      varchar(32) default NULL comment '充值网银流水',
   account_log_id       varchar(32) default NULL comment '帐务流水',
   memo                 varchar(127) default NULL comment '备注信息',
   order_id             varchar(64) default NULL comment '交易编号（订单号）',
   other_account_email  varchar(127) default NULL comment '帐务对方邮箱',
   other_account_fullname varchar(127) default NULL comment '帐务对方全称',
   other_user_id        varchar(32) default NULL comment '帐务对方支付宝用户号',
   partner_id           varchar(32) default NULL comment '合作者身份id',
   seller_account       varchar(32) default NULL comment '卖家支付宝人民币支付帐号',
   seller_name          varchar(64) default NULL comment '卖家姓名',
   trade_no             varchar(32) default NULL comment '支付宝交易流水',
   trade_refund_amount  decimal(18,2) default NULL comment '退款金额',
   trans_account        varchar(32) default NULL comment '帐务本方支付宝人民币资金帐号(user_id+0156)',
   cash_name            varchar(32) comment '收银员',
   trans_code_msg       varchar(16) default NULL comment '业务类型',
   trade_time           datetime default NULL comment '交易时间',
   src_order_id         varchar(32) comment '原订单号',
   src_trade_no         varchar(32) comment '原第三方支付流水号',
   src_pay_id           varchar(32) comment '原账单号',
   activity_id          varchar(32) comment '活动ID',
   flow_status          char(2) comment '同步状态 00 未同步，99 已同步',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (pay_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_pay_account comment '交易对账数据';



drop table if exists doc_po_header;

/*==============================================================*/
/* Table: doc_po_header                                         */
/*==============================================================*/
create table doc_po_header
(
   po_no                varchar(32) not null comment 'PO号',
   po_type              char(2) comment '单据类型',
   po_status            char(2) not null comment '单据状态',
   po_source            char(2) default NULL comment '单据来源',
   to_shop_id           varchar(32) default NULL comment '收货店仓id',
   to_shop_name         varchar(64) default NULL comment '收货店仓名称',
   from_shop_id         varchar(32) default NULL comment '发货店仓id',
   from_shop_name       varchar(64) default NULL comment '发货店仓名称',
   order_price          decimal(18,2) default 0 comment '订单总金额',
   expected_time        datetime not null comment '预期到货时间',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   memo                 varchar(512) default NULL comment '备注',
   descr                varchar(2156) default NULL comment '描述',
   i_shop_id            varchar(32) default NULL comment '下单门店id',
   i_id                 varchar(32) default NULL comment '下单人id',
   i_name               varchar(32) default NULL comment '下单人名称',
   i_address            varchar(128) default NULL comment '下单人地址',
   i_zip_code           varchar(32) default NULL comment '下单人邮编',
   i_contact            varchar(32) default NULL comment '下单人联系人',
   i_tel                varchar(32) default NULL comment '下单人电话',
   supplier_id          varchar(32) default NULL comment '供应商id',
   supplier_name        varchar(32) default NULL comment '供应商名称',
   supplier_address     varchar(128) default NULL comment '供应商地址',
   supplier_zip_code    varchar(32) default NULL comment '供应商邮编',
   supplier_contact     varchar(32) default NULL comment '供应商联系人',
   supplier_tel         varchar(32) default NULL comment '供应商电话',
   volume               decimal(18,2) comment '体积',
   receiving_Time       datetime not null comment '交付时间',
   created_name         varchar(32) not null comment '创建人',
   created_time         datetime not null comment '创建时间',
   updated_name         varchar(32) not null comment '更新人',
   updated_time         datetime not null comment '更新时间',
   primary key (po_no)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_po_header comment '要货单';


drop table if exists doc_po_details;

/*==============================================================*/
/* Table: doc_po_details                                        */
/*==============================================================*/
create table doc_po_details
(
   po_detail_id         varchar(32) not null comment 'po_detail_id',
   po_no                varchar(32) comment '单据号',
   line_no              int comment '行号',
   category_code        varchar(32) comment '分类编码',
   category_name        varchar(32) comment '分类名称',
   bar_code             varchar(32) comment '商品条码',
   brand_code           varchar(32) default NULL comment '品牌编码',
   brand_name           varchar(32) default NULL comment '品牌名称',
   goods_name           varchar(128) comment '商品名称',
   sku                  varchar(32) comment 'sku',
   parent_sku           varchar(32) comment 'parent_sku',
   property             varchar(64) comment '商品属性',
   line_status          varchar(32) comment '行状态',
   lot_num              varchar(32) default '0' comment '批次号',
   seq                  varchar(32) default NULL comment '商品序号',
   sub_qty              decimal(18,2) default 0 comment '商品增减数量',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   receive_time         datetime comment '收货时间',
   receive_qty          decimal(18,2) default NULL comment '收货数量',
   expected_qty         decimal(18,2) default NULL comment '预期收货数量',
   ordered_qty          decimal(18,2) default NULL comment '订购数量',
   unit                 varchar(32) comment '单位',
   convert_qty          decimal(18,2) default NULL comment '换算数量',
   convert_unit         varchar(32) comment '换算单位',
   is_gift              bit default 0 comment '是否赠品',
   total_price          decimal(18,2) not null default 0 comment '商品总金额',
   cost_price           decimal(18,2) default 0 comment '成本价',
   price                decimal(18,2) default 0 comment '单价',
   volume               decimal(18,2) default 0 comment '体积',
   rate_precent         decimal(18,2) default 17 comment '税率',
   memo                 varchar(512) comment '备注',
   created_time         datetime comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (po_detail_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_po_details comment '要货单明细';




drop table if exists doc_order_header;

/*==============================================================*/
/* Table: doc_order_header                                      */
/*==============================================================*/
create table doc_order_header
(
   order_no             varchar(32) not null comment '订单号',
   order_type           char(2) comment '单据类型',
   so_status            char(2) not null comment '单据状态',
   route_id             varchar(32) comment '发运路线id',
   order_time           datetime not null comment '订单创建时间',
   order_price          decimal(18,2) default 0 comment '订单总金额',
   to_shop_id           varchar(32) default NULL comment '收货店仓id',
   to_shop_name         varchar(64) default NULL comment '收货店仓名称',
   from_shop_id         varchar(32) default NULL comment '发货店仓id',
   from_shop_name       varchar(64) default NULL comment '发货店仓名称',
   expected_time        datetime not null comment '预期发货时间',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   release_status       char(2) not null comment '释放状态',
   priority             char(2) not null comment '订单优先级别',
   carrier_id           varchar(32) default NULL comment '承运人id',
   carrier_name         varchar(32) default NULL comment '承运人姓名',
   place_discharge      varchar(32) default NULL comment '卸货地',   
   zip_code             varchar(32) default NULL comment '收货人邮编',
   mobile               varchar(32) comment '收货人手机',
   receive_address      varchar(128) default NULL comment '收货人地址',
   vehicle_no           varchar(32) default NULL comment '车号',
   onsignee_id          varchar(32) default NULL comment '收货人id',
   onsign_name          varchar(32) default NULL comment '收货人',
   descr                varchar(2156) default NULL comment '描述',
   memo                 varchar(512) default NULL comment '备注',
   i_shop_id            varchar(32) default NULL comment '下单门店id',
   i_id                 varchar(32) default NULL comment '下单人id',
   i_address            varchar(128) default NULL comment '下单人地址',
   i_zip_code           varchar(32) default NULL comment '下单人邮编',
   i_contact            varchar(32) default NULL comment '下单人联系人',
   i_tel                varchar(32) default NULL comment '下单人电话',
   supplier_id          varchar(32) default NULL comment '供应商id',
   supplier_name        varchar(32) default NULL comment '供应商名称',
   supplier_address     varchar(128) default NULL comment '供应商地址',
   supplier_zip_code    varchar(32) default NULL comment '供应商邮编',
   supplier_contact     varchar(32) default NULL comment '供应商联系人',
   supplier_tel         varchar(32) default NULL comment '供应商电话',
   address              varchar(512) default NULL comment '收货人街道(地址)',
   volume               decimal(18,2) comment '体积',
   delivery_time        datetime comment '发货时间',
   created_name         varchar(32) not null comment '创建人',
   created_time         datetime not null comment '创建时间',
   updated_name         varchar(32) not null comment '更新人',
   place_loading        varchar(32) default NULL comment '装货地',
   updated_time         datetime not null comment '更新时间',
   route                varchar(512) default NULL comment '路径',
   primary key (order_no)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_order_header comment '发货订单';


drop table if exists doc_order_details;

/*==============================================================*/
/* Table: doc_order_details                                     */
/*==============================================================*/
create table doc_order_details
(
   so_detail_id         varchar(32) not null comment 'so_detail_id',
   order_no             varchar(32) comment '单据号',
   line_no              int comment '行号',
   category_code        varchar(32) comment '分类编码',
   category_name        varchar(32) comment '分类名称',
   bar_code             varchar(32) comment '商品条码',
   brand_code           varchar(32) default NULL comment '品牌编码',
   brand_name           varchar(32) default NULL comment '品牌名称',
   goods_name           varchar(128) comment '商品名称',
   sku                  varchar(32) comment 'sku',
   parent_sku           varchar(32) comment 'parent_sku',
   property             varchar(64) comment '商品属性',
   lot_num              varchar(32) default '0' comment '批次号',
   line_status          varchar(32) comment '行状态',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   receive_time         datetime comment '收货时间',
   receive_qty          decimal(18,2) default NULL comment '收货数量',
   ordered_qty          decimal(18,2) default NULL comment '订购数量',
   picked_qty           decimal(18,2) default NULL comment '拣货数量',
   shipped_qty          decimal(18,2) default NULL comment '发货数量',
   sub_qty              decimal(18,2) default 0 comment '商品增减数量',
   unit                 varchar(32) comment '单位',
   convert_qty          decimal(18,2) default NULL comment '换算数量',
   convert_unit         varchar(32) comment '换算单位',
   total_price          decimal(18,2) not null default 0 comment '商品总金额',
   cost_price           decimal(18,2) default 0 comment '成本价',
   price                decimal(18,2) default 0 comment '单价',
   volume               decimal(18,2) comment '体积',
   rate_precent         decimal(18,2) default 17 comment '税率',
   memo                 varchar(512) comment '备注',
   created_time         datetime comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (so_detail_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_order_details comment '出库单明细';


drop table if exists doc_asn_header;

/*==============================================================*/
/* Table: doc_asn_header                                        */
/*==============================================================*/
create table doc_asn_header
(
   asn_no               varchar(32) not null comment '入库单编号',
   ext_order_no         varchar(32) default NULL comment '外部订单id',
   delivery_time        datetime comment '发货时间',
   check_user_id        varchar(32) not null comment '审核人id',
   check_name           varchar(32) not null comment '审核人',
   check_status         char(2) not null comment '审核状态 00 未审核，10 审核通过，20 审核不通过',
   po_no                varchar(32) default NULL comment '关联要货单号',
   order_no             varchar(32) default NULL comment '关联出库单号',
   asn_type             char(2) default NULL comment '单据类型',
   asn_status           char(2) not null comment '单据状态',
   asn_source           char(2) default NULL comment '单据来源',
   order_price          decimal(18,2) default 0 comment '订单总金额',
   to_shop_id           varchar(32) default NULL comment '收货店仓id',
   to_shop_name         varchar(64) default NULL comment '收货店仓名称',
   from_shop_id         varchar(32) default NULL comment '发货店仓id',
   from_shop_name       varchar(64) default NULL comment '发货店仓名称',
   expected_time        datetime not null comment '预期到货时间',
   volume               decimal(18,2) default 0 comment '体积',
   memo                 varchar(512) default NULL comment '备注',
   carrier_id           varchar(32) default NULL comment '承运人id',
   carrier_name         varchar(32) default NULL comment '承运人姓名',
   place_loading        varchar(32) default NULL comment '装货地',
   place_discharge      varchar(32) default NULL comment '卸货地',
   pay_terms            varchar(32) default NULL comment '付款条款',
   delivery_terms       varchar(32) default NULL comment '交付条款',
   descr                varchar(2156) default NULL comment '描述',
   vehicle_no           varchar(32) default NULL comment '车号',
   address              varchar(512) default NULL comment '地址',
   mobile               varchar(32) comment '手机',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   zip_code             varchar(32) default NULL comment '邮编',
   supplier_id          varchar(32) default NULL comment '供应商id',
   supplier_name        varchar(32) default NULL comment '供应商名称',
   supplier_address     varchar(128) default NULL comment '供应商地址',
   supplier_zip_code    varchar(32) default NULL comment '供应商邮编',
   supplier_contact     varchar(32) default NULL comment '供应商联系人',
   supplier_tel         varchar(32) default NULL comment '供应商电话',
   i_id                 varchar(32) default NULL comment '下单人id',
   i_name               varchar(32) default NULL comment '下单人名称',
   i_address            varchar(128) default NULL comment '下单人地址',
   i_zip_code           varchar(32) default NULL comment '下单人邮编',
   i_contact            varchar(32) default NULL comment '下单人联系人',
   i_tel                varchar(32) default NULL comment '下单人电话',
   receiving_Time       datetime not null comment '交付时间',
   created_name         varchar(32) not null comment '创建人',
   created_time         datetime not null comment '创建时间',
   updated_name         varchar(32) not null comment '更新人',
   updated_time         datetime not null comment '更新时间',
   primary key (asn_no)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_asn_header comment '入库单';


drop table if exists doc_asn_details;

/*==============================================================*/
/* Table: doc_asn_details                                       */
/*==============================================================*/
create table doc_asn_details
(
   asn_detail_id        varchar(32) not null comment 'asn_detail_id',
   asn_no               varchar(32) comment '单据号',
   line_no              int comment '行号',
   category_code        varchar(32) comment '分类编码',
   category_name        varchar(32) comment '分类名称',
   bar_code             varchar(32) comment '商品条码',
   brand_code           varchar(32) default NULL comment '品牌编码',
   brand_name           varchar(32) default NULL comment '品牌名称',
   goods_name           varchar(128) comment '商品名称',
   sku                  varchar(32) comment 'sku',
   parent_sku           varchar(32) comment 'parent_sku',
   property             varchar(64) comment '商品属性',
   po_no                varchar(32) comment '关联po单号',
   po_line_no           int comment '关联po单号行号',
   line_status          varchar(32) comment '行状态',
   receive_time         datetime comment '收货时间',
   receive_qty          decimal(18,2) default NULL comment '收货数量',
   order_qty            decimal(18,2) default NULL comment '采购数量',
   expected_qty         decimal(18,2) default NULL comment '预期收货数量',
   damaged_qty          decimal(18,2) default NULL comment '破损数量',
   expected_time        datetime default NULL comment '预期收货时间',
   rejected_qty         decimal(18,2) default NULL comment '拒收数量',
   rejected_time        datetime default NULL comment '拒收时间',
   unit                 varchar(32) comment '单位',
   convert_qty          decimal(18,2) default NULL comment '换算数量',
   convert_unit         varchar(32) comment '换算单位',
   total_price          decimal(18,2) not null default 0 comment '商品总金额',
   cost_price           decimal(18,2) default 0 comment '成本价',
   lot_num              varchar(32) default '0' comment '批次号',
   price                decimal(18,2) default 0 comment '单价',
   user_define1         varchar(64) default NULL comment '用户自定义1',
   user_define2         varchar(64) default NULL comment '用户自定义2',
   user_define3         varchar(64) default NULL comment '用户自定义3',
   goods_type           char(2) default NULL comment '货品类别 1 正常，2 强压',
   volume               decimal(18,2) default 0 comment '体积',
   rate_precent         decimal(18,2) default 17 comment '税率',
   memo                 varchar(512) comment '备注',
   created_time         datetime comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (asn_detail_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table doc_asn_details comment '入库单明细';


drop table if exists bus_inv_sku;

/*==============================================================*/
/* Table: inv_sku                                               */
/*==============================================================*/
create table bus_inv_sku
(
   id                   varchar(32) not null comment 'id',
   sku                  varchar(32) comment 'sku',
   shop_id              varchar(32) comment '店铺id',
   shop_name            varchar(64) comment '店铺名称',
   qty                  decimal(18,2) default 0 comment '库存数量',
   lock_qty             decimal(18,2) default 0 comment '锁定数量',
   damaged_qty          decimal(18,2) default 0 comment '破损数量',
   memo                 varchar(512) not null comment '备注',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_inv_sku comment '库存汇总表';


drop table if exists bus_inv_lot;

/*==============================================================*/
/* Table: inv_lot                                               */
/*==============================================================*/
create table bus_inv_lot
(
   id                   varchar(32) not null comment 'id',
   sku                  varchar(32) comment 'sku',
   goods_name           varchar(128) comment '商品名称',
   trade_type           smallint comment '单据类型',
   trade_order_no       varchar(32) default NULL comment '交易单号',
   lot_num              varchar(32) default '0' comment '批次号',
   shop_id              varchar(32) default NULL comment '店铺id',
   shop_name            varchar(64) default NULL comment '店铺名称',
   qty                  decimal(18,2) default 0 comment '库存数量',
   lock_qty             decimal(18,2) default 0 comment '锁定数量',
   damaged_qty          decimal(18,2) default 0 comment '破损数量',
   memo                 varchar(512) not null comment '备注',
   created_time         datetime comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_inv_lot comment '门店订单批次汇总表';


drop table if exists bus_inv_lot_details;

/*==============================================================*/
/* Table: inv_transaction_Log                                   */
/*==============================================================*/
create table bus_inv_lot_details
(
   id       						varchar(32) not null comment 'id',  
   trade_type           smallint comment '单据类型',
   trade_status         smallint default 0 comment '交易状态',
   trade_order_no       varchar(32) default NULL comment '交易单号',  
   trade_line_no        int comment '单据行号',
   trade_time           datetime default NULL comment '交易时间',
   is_pull              smallint default 0 comment '是否入库批次',
   shop_id              varchar(32) default NULL comment '店铺id',
   shop_name            varchar(64) default NULL comment '店铺名称',  
   sku                  varchar(32) default NULL comment 'sku',
   goods_name           varchar(128) comment '商品名称',
   lot_num              varchar(32) default '0' comment '批次号',
   unit                 varchar(32) comment '单位',
   qty                  decimal(18,2) default 0 comment '数量',
   memo                 varchar(512) comment '备注',
   created_time         datetime comment '创建时间',
   updated_time         datetime comment '更新时间',
   primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_inv_lot_details comment '门店订单批次明细表';


drop table if exists bus_bas_codes;

/*==============================================================*/
/* Table: bas_codes                                             */
/*==============================================================*/
create table bus_bas_codes
(
   code_id              varchar(32) not null comment '代码id',
   code_type            varchar(32) comment '代码类别 字段名 temp_id',
   code                 varchar(32) default NULL comment '代码',
   code_name            varchar(32) default NULL comment '名称 ',
   sort_code            int default 999999 comment '排序号',
   user_define1         varchar(32) default NULL comment '自定义1',
   user_define2         varchar(256) default NULL comment '自定义2',
   user_define3         varchar(512) default NULL comment '自定义3',
   created_name         varchar(32) default NULL comment '创建人',
   updated_name         varchar(32) default NULL comment '更新人',
   created_time         datetime default NULL comment '创建时间',
   updated_time         datetime default NULL comment '更新时间',
   primary key (code_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table bus_bas_codes comment '业务数据字典';
