//
//  AppDelegate_GDMap.swift
//  CarProject
//
//  Created by macos on 2017/12/21.
//  Copyright © 2017年 macos. All rights reserved.
//

import UIKit

let GD_mapKey = "6b84997b68f6b504a45c07d732159adf"
extension AppDelegate{

    func GD_MapConfigure() {
        
        AMapServices.shared().apiKey = GD_mapKey;
        
        AMapServices.shared().enableHTTPS = true;
    }
    
    
}
