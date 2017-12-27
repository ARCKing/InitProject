//
//  AppDelegate-Wechat.swift
//  Mythsbears
//
//  Created by HJQ on 2017/10/10.
//  Copyright © 2017年 HJQ. All rights reserved.
//

/*
 * 如果不添加白名单无法检测手机是否已经安装微信客户端
 */
// 1.info.plist 中添加微信白名单 LSApplicationQueriesSchemes（数组）-> weixin
// 2.添加 URL Schemes => WX_APPID

import Foundation

let WX_APPID = "wxd347cc7e928e1a43"
let WX_APPSecret = "fd265f71354643aa55d376c24d7da36c"

// 微信相关
extension AppDelegate {
    
    func wechat_setup() {
        // 注册微信(为防止与第三方含有sdk冲突)
        //WXApi.registerApp(WX_APPID)
        WXApi.registerApp(WX_APPID, enableMTA: true)
    }
    
    // 支付回调
    @discardableResult
    func wechat_application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }
    
    @discardableResult
    func wechat_application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }
    
    private func shareSuccess() {
        let request = ShareAPI.shareSuccess()
        DDHTTPRequest.request(r: request, requestSuccess: { (result) in
            
        }, requestError: { (result, errorModel) in
            
        }) { (error) in

        }
    }
    
}

// MARK: - WXApiDelegate
extension AppDelegate: WXApiDelegate {
    
    func onResp(_ resp: BaseResp!) {
        if resp.isKind(of: PayResp.self) {
            let type = resp!.errCode
            Barista.post(notification: .wechatPayResult, object: type as AnyObject)
            switch type {
                // 支付成功
            case WXSuccess.rawValue:
                break
            default:
                break
            }
        }else if resp.isKind(of: SendAuthResp.self) {
            let response = resp as? SendAuthResp
            if resp.errCode == WXSuccess.rawValue && resp.type == 0 {
                // 授权成功
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "WXLoginSuccessNotification"), object: response?.code)

            }
        }else if resp.isKind(of: SendMessageToWXResp.self) {
            if resp.errCode == WXSuccess.rawValue {
                print("分享成功")
                BFunction.shared.showToastMessge("分享成功")
                shareSuccess()
                
            } else {
                print("分享失败")
                BFunction.shared.showToastMessge("分享失败")
                print(resp.errCode)
                
            }
        }
        
    }

}
