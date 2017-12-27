//
//  GD_MapViewModel.swift
//  CarProject
//
//  Created by macos on 2017/12/22.
//  Copyright © 2017年 macos. All rights reserved.
//

import UIKit

class GD_MapViewModel: NSObject {

    static var share = GD_MapViewModel.init();
    fileprivate override init() {
    }
    
    lazy var GD_AmapSearch:AMapSearchAPI = {[weak self] in
        let mapS = AMapSearchAPI.init();
        mapS?.delegate = self;
        return mapS!;
    }()
    
    var GD_AMapSearchRequest:AMapPOIKeywordsSearchRequest?
}

extension GD_MapViewModel{
    
    ///关键字检索
    func GD_AMapPOIKeywordsSearchRequest() {
        
        let r = AMapPOIKeywordsSearchRequest.init();
        r.city = "南宁";
        r.keywords = "KTV" //关键词，多个关键词用|隔开
        r.requireExtension = true;
        r.requireSubPOIs = true;
        r.cityLimit = true;
        GD_AmapSearch.aMapPOIKeywordsSearch(r);
    }
    
    
    
    
    
}

extension GD_MapViewModel:AMapSearchDelegate{
    
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {

        response.pois.forEach { (poi) in
            
            print(poi.adcode)
            print(poi.address)
            print(poi.businessArea)
            print(poi.city)
            print(poi.citycode)
            print(poi.direction)
            print(poi.distance)
            print(poi.district)
            print(poi.email)
            print(poi.enterLocation)
            print(poi.exitLocation)
            print("=============================")
        }
    }
}
