//
//  Application-Extension.swift
//  Mythsbears
//
//  Created by HJQ on 2017/9/19.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import Foundation
import Kingfisher
import IQKeyboardManagerSwift

extension AppDelegate {
    
    public func jq_application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        //sleep(1)
        if #available(iOS 11.0, *) {
            // 适配iOS 11的系统
           UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        validateHTTPS()
        IQKeyboardManager.sharedManager().enable = false
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        //UIApplication.shared.statusBarStyle = .lightContent;
        configImages()
        // 初始化微信配置
        wechat_setup()
        
        //高德地图配置
        GD_MapConfigure();
        
        //监听网络
        monitorTheNetworkStatusAction();
        
        //本地通知
//        registerLocationNotification(application, didFinishLaunchingWithOptions: launchOptions);
    }
    
    // 如果收到内存警告清除内存缓存
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        getImageCache().clearMemoryCache()

    }
    
    /// 支持https
    func validateHTTPS(){
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = self.manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
    
    // 监听当前的网络状态
    private func monitorTheNetworkStatusAction() {
        networkManager!.listener = { status in
            switch status {
            case .notReachable:
                self.isHaveNetwork = false
                BFunction.shared.showMessage("notReachable")
            case .unknown:
                self.isHaveNetwork = false
                BFunction.shared.showMessage("unknown")

            case .reachable(.ethernetOrWiFi):
                self.isHaveNetwork = true
                BFunction.shared.showMessage("reachable.wifi")

            case .reachable(.wwan):
                self.isHaveNetwork = true
                BFunction.shared.showMessage("reachable.wwan")
            }
        }
        networkManager!.startListening()
    }
    
    // MARK: - 关于图片设置
    private func configImages() {
        
        let cache = KingfisherManager.shared.cache
        
        // 设置硬盘最大缓存50M ，默认无限
        cache.maxDiskCacheSize = 50 * 1024 * 1024
        // 设置硬盘最大保存3天 ， 默认1周
        cache.maxCachePeriodInSecond = 60 * 60 * 24 * 3
    }
    
    // 获取ImageCache instance
    public func getImageCache() -> ImageCache {
        return KingfisherManager.shared.cache;
    }
    
}
