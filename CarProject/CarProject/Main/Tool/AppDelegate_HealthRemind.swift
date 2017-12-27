//
//  AppDelegate_HealthRemind.swift
//  Mythsbears
//
//  Created by macos on 2017/11/14.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func registerLocationNotification(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        
         if launchOptions != nil {
            let local = launchOptions![UIApplicationLaunchOptionsKey.localNotification]
            // 说明, 用户是点击了本地通知/app图标, 启动的app
            if local != nil {
                // 以后真实开发当中, 会在这个位置, 做一些用户点击了本地通知之后的一些业务逻辑处理
               
            }
        }
        
        let unt = UIUserNotificationSettings.init(types: [.alert,.badge,.sound], categories: nil);
        UIApplication.shared.registerUserNotificationSettings(unt);

        
    }
    
    ///接收到本地通知(前后台)
    func healthLocationNotificationDidReceive(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
        if application.applicationState == .background{
            //在后台
        }else if application.applicationState == .active{
            //在前台
        
        }else if application.applicationState == .inactive{
            //从后台变为前台
           
            
        }
    }
    
}


extension AppDelegate:UIAlertViewDelegate{
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if buttonIndex == 1{
            
            
            
        }
    }
}
