//
//  API.swift
//  HTTPClientDemo
//
//  Created by HJQ on 2017/9/9.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import Foundation

// MARK: - API接口地址
struct API {
    // 服务器地址
    static let baseServer = "http://ml.nnddkj.com/healthMall/API/"
    
    // 智能手表
    static let baseServerHardware = "http://ml.nnddkj.com/smartMask/devices/"
    
}

// MARK: - 融云相关
extension API {
    
    // 获取融云Token
    static let getRongcloudToken = "rongcloud/getToken.php"
    

}

// MARK: - 首页
extension API {
    /// 首页
    // 首页推荐列表
    static let homeData = "indexAPI/indexOne.php"
    
    // 每日签到
    static let addsignbeans = "makeMoney/addsignbeans.php"
    
    // 钱包余额
    static let  getMoney = "makeMoney/getMoney.php"
    
    // 资讯列表
    static let gethealthinfo = "mylove/gethealthinfo.php"
    
    // 健康指导
    static let getHealthGuidance = "shoping/getHealthGuidance.php"
    
    // 获取专家列表
    static let getExpertList = "rongcloud/getExpertsList.php"
}

// MARK: - 商城
extension API {
    
    /// 商城相关
    // 商城首页
    static let mallhomeData = "indexAPI/index.php"
    
    // 商品详情
    static let productDetails = "shoping/productDetails.php"
    
    // 商品添加收藏
    static let addShopCollection = "shoping/addShopCollection.php"
    
    // 取消商品收藏
    static let delShopCollection = "shoping/delShopCollection.php"
    
    // 添加到购物车
    static let addShoppingCart = "shoping/addShoppingCart.php"
    
    // 商品评价点赞
    static let addShopFabulous = "shoping/addShopFabulous.php"
    
    // 商品是否收藏
    static let isCollection = "shoping/isCollection.php"
    
    // 取消商品评价点赞
    static let delShopFabulous = "shoping/delShopFabulous.php"
    
    // 获取商品评价列表
    static let getEvaluation = "shoping/getEvaluation.php"
    
    // 商品搜索
    static let searchProduct = "shoping/getQueryShopping.php"
    
    // 热搜
    static let hotSearchKeyword = "shoping/getHot.php"
    
    // 获取商品类别
    static let getShoppingType = "shoping/getShoppingType.php"
    
    /// 商品结算页相关
    // 支付宝支付
    static let getAlipayOrders = "alipay/getAlipayOrders.php"
    
    // 微信支付
    static let getWechapayOrders = "wechaPay/getWechapayOrders.php"
    
    // 余额支付
    static let banlancePay = "shoping/banlancePay.php"
    
    // 获取默认地址
    static let getDefaultAddress = "shoping/getDefaultAddress.php"
    
    /// 购物车相关
    // 获取购物车列表
    static let shoppingcarList = "shoping/getShoppingCartInfo.php"
    
    // 购物车数量增加
    static let productIncrease = "shoping/addShoppingCartNumber.php"
    
    // 购物车数量减少
    static let productDeIncrease = "shoping/delShoppingCartNumber.php"
    
    // 删除购物车商品
    static let productDeleted = "shoping/delShoppingCart.php"
    
    // 分享
    static let share = "shoping/share.php"
    
}

// MARK: - 我的关爱
extension API {
    
    // 关爱列表
    static let getmylove = "mylove/getmylove.php"
    
    // 获取关爱成员信息
    static let getloverinfo = "mylove/getloverinfo.php"
    
    // 添加关爱成员
    static let addmylove = "mylove/addmylove.php"
    
    // 送关爱
    static let sendlove = "mylove/sendlove.php"
}

// MARK: - 智能硬件
extension API {
    
    /// 手表数据
    static let getSmartwarchData = "smarthwatch/getSmartwarchData.php"
    
    // 检测结果
    static let getDetectionResult = "shoping/getDetectionResult.php"
    
    // 智能手表绑定
    static let devicesBinding = "receivedata/binding.php"
    
    // 今日测试数据
    static let watchTodayData = "receivedata/todayData.php"
    
    // 历史测试数据
    static let watchHistoryData = "receivedata/historyData.php"
    
}


// MARK: - 我的
extension API {
    
    
    /// 个人中心相关
    // 用户登录
    static let login = "user/login.php"
    
    //微信登录
    static let login_weChat = "user/login_weixin_qq.php"
    
    // 用户注册
    static let register = "user/registered.php"
    
    // 获取注册验证码
    static let smsCode = "user/sendSms.php"
    
    // 找回密码
    static let findPassword = "user/findPassword.php"
    
    // 修改密码
    static let checkPassword = "user/checkPassword.php"
    
    //验证token
    static let checkTokenAPI = "user/checkLoginToken.php"
    
    // 上传极光推送registerID
    static let getRegistrationID = "user/getRegistrationID.php"
    
    //退出登录
    static let userLogout = "user/logout.php"
    
    //修改头像
    static let feedbackImg = "user/feedbackImg.php"
    
    //用户资料
    static let userInfoAPI = "user/getUserInfo.php"
    
    //会员等级
    static let memberLevelAPI = "user/memberLevel.php"
    
    //修改用户资料
    static let userInfoUpDataAPI = "user/updateUserInfo.php"
    
    //商品收藏列表
    static let shopCollectListAPI = "shoping/getCollecInfo.php"
    
    ///订单
    //全部订单
    static let allOrderAPI = "shoping/selectOrder.php"
    
    //待付款订单
    static let waitPayOrderAPI = "shoping/selectPaymentOrder.php"
    
    //待发货订单
    static let waitSendOrderAPI = "shoping/selectPaymentOrder.php"
    
    //待收货订单
    static let waitGetOrderAPI = "shoping/selectPaymentOrder.php"
    
    //待评价订单
    static let waitCommentOrderAPI = "shoping/selectPaymentOrder.php"
    
    //正在申请退款订单
    static let reimburseNowAPI = "shoping/selectPaymentOrder.php"
    
    //已退款订单
    static let reimburseFinishAPI = "shoping/selectPaymentOrder.php"
    
    //删除订单
    static let deleteOrderAPI = "shoping/delOrder.php"
    
    //取消订单
    static let cancleOrderAPI =  "shoping/cancelOrders.php"
    
    //订单详情
    static let orderDetailAPI = "shoping/orderDetail.php"
    
    //查看物流
    static let logisticsAPI = "notice/express_api/express_api.php"
    
    ///售后
    //售后退款列表
    static let afterSaleListAPI = "shoping/getAfterSaleList.php"
    
    //售后退款详情
    static let afterSaleDetailAPI = "shoping/getReturnMoneyDetail.php"
    
    //申请售后
    static let afterSaleApplyAPI = "shoping/addAfteSalesApplication.php"
    
    ///微信申请退款
    static let refundCash_weChatPayAPI = "wechaPay/refundWechapayOrder.php"
    
    ///支付宝申请退款
    static let refundCash_aliPayAPI = "alipay/refundAlipayOrders.php"

    ///确认收货
    static let verifyTakeGoods = "shoping/confirmReceipt.php"
    
    ///消息
    //用户消息
    static let customerMessageAPI = "notice/getNotice.php"
    //系统消息
    static let systemMessageAPI = ""
    
    ///收货地址
    
    //收货地址列表
    static let addressListAPI = "shoping/getReceiptAddress.php"
    
    //新增收货地址
    static let addNewAddressAPI = "shoping/receiptAddress.php"
    
    //修改收货地址
    static let modifiedAddressAPI = "shoping/updateReceiptAddress.php"
    
    //删除收货地址
    static let deleteAddressAPI = "shoping/deleteReceiptAddress.php"

    //获取默认收货地址
    static let defaultAddressAPI = "shoping/getDefaultAddress.php"

    ///钱包余额
    static let moneyBalanceAPI = "makeMoney/getMoney.php"

    ///钱包充值
    static let moneyRechargeAPI = "wechaPay/getWechapayOrders.php"

    
    ////面膜
    ///上传面膜测试数据
    static let maskDataupLoadAPI = "smart/getMaskData.php"
    
    ///面膜数据列表
    static let maskDataListAPI = "smart/getUserMaskData.php"
    
    ///上传评论
    static let commentAPI = "shoping/addEvaluete.php"
    
    ///意见反馈
    static let feedbackAPI = "user/feedbackMessage.php"
    
    ///每日任务
    static let dayTaskAPI = "mylove/getTask.php"
}


