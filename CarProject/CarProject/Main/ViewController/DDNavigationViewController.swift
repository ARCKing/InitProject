//
//  DDNavigationViewController.swift
//  Mythsbears
//
//  Created by HJQ on 2017/9/19.
//  Copyright © 2017年 HJQ. All rights reserved.
//

import UIKit


// MARK: - 优雅的管理selector
fileprivate struct Action {
    static let navigationBackClickAction = #selector(DDNavigationViewController.navigationBackClick)
}

class DDNavigationViewController: JQNavigationController {

    // MARK: - system methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            // 进入新页面隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back"), style: .plain, target: self, action: Action.navigationBackClickAction)
        }
        
        super.pushViewController(viewController, animated: animated)
        // 获取tabBar的frame, 如果没有直接返回
        guard var frame = self.tabBarController?.tabBar.frame else {
            return
        }
        // 设置frame的y值, y = 屏幕高度 - tabBar高度
        frame.origin.y = UIScreen.main.bounds.size.height - frame.size.height
        // 修改tabBar的frame
        self.tabBarController?.tabBar.frame = frame
    }
    
    // MARK: - Private methods
    private func setupUI() {
        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.isTranslucent = false
        navBar.barTintColor = UIColor.white
            //UIColor.init(r: 111, g: 179, b: 246)
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: DDGlobalNavTitleColor(), NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
    }
    
    // MARK: - 
    /// 返回按钮
    @objc func navigationBackClick() {
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
    

}
