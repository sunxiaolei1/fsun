
if (typeof ListModuleType == "undefined") {
    var ListModuleType = {}; //列表对应的模块类型
    
    //销售单
    ListModuleType.ORDER_BASE = 11; //销售单
    ListModuleType.ORDER_AUDIT = 12; //待审核订单
    ListModuleType.ORDER_EXPRESS = 13; //快递重指定
    ListModuleType.ORDER_EXTRA = 14; //特殊订单
    ListModuleType.ORDER_STORE = 15; //订单存盘
    ListModuleType.LACK_ORDER = 16; //缺货订单
    ListModuleType.LACK_SKUS = 17; //缺货商品
    
    //售后单
    ListModuleType.AFTERSALE_REFUND = 21; //退货单
    ListModuleType.AFTERSALE_REFUND_RATE = 22; //退货率
    ListModuleType.AFTERSALE_REFUND_SKUS = 23; //退货商品
    ListModuleType.AFTERSALE_BARTER = 24; //换货单
    ListModuleType.AFTERSALE_REISSUE = 25; //补发单
    ListModuleType.AFTERSALE_PACKAGE = 26; //无单据包裹
      
    //补退款单
    ListModuleType.CASH_REFUND= 31; //退款单列表
    ListModuleType.CASH_REISSUE = 32; //补款单列表 
    
    //其他
    ListModuleType.PROMOTIONS = 41; //活动列表      
    ListModuleType.BLACK_USERS = 42; //黑名单列表
    ListModuleType.DIFF_BASE = 43 //差异单    
}