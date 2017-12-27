//
//  MapVC.swift
//  CarProject
//
//  Created by macos on 2017/12/22.
//  Copyright © 2017年 macos. All rights reserved.
//

import UIKit

class MapVC: DDBaseViewController {

    
    lazy var  mapView:MAMapView = {[weak self] in
        let map = MAMapView.init(frame: (self?.view.bounds)!);
        map.delegate = self;
        map.showsUserLocation = true;
        map.userTrackingMode = .follow;
        return map;
    }()
    
    
    lazy var pointAnnotation:MAPointAnnotation = {
        
        let p = MAPointAnnotation.init()
        p.isLockedToScreen = false;
        return p;
    }()
    
    lazy var animationAnnotation:MAAnimatedAnnotation = {
        let an = MAAnimatedAnnotation.init();
        return an;
    }()
    
    let GD_vm = GD_MapViewModel.share;
    
    //iOS8用到XIB必须写这两个方法
    init() {
        super.init(nibName: String.init(describing: MapVC.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.addAnnotation(pointAnnotation);
        self.view.addSubview(mapView);
    }

    override func setupUI() {
        
        addNavBarRightButton(btnTitle: "搜索", titleColor: UIColor.red) { (bt) in
            
            self.GD_vm.GD_AMapPOIKeywordsSearchRequest();
            
        }
    }
}

extension MapVC:MAMapViewDelegate{
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation.isKind(of: MAPointAnnotation.self) {
            let pointReuseIndetifier = "pointReuseIndetifier"
            var annotationView: MAPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as! MAPinAnnotationView?
            
            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }
            
            annotationView!.canShowCallout = true//气泡
            annotationView!.animatesDrop = true  //动画
            annotationView!.isDraggable = true   //拖动
            annotationView!.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
            
            let idx = annotationView?.index(ofAccessibilityElement: annotation as! MAPointAnnotation)
            annotationView!.pinColor = MAPinAnnotationColor(rawValue: idx!)!
            
            return annotationView!
        }
        
        return nil
    }
}
