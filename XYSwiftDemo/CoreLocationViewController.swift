//
//  CoreLocationViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/28.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import CoreLocation

class CoreLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    
    /*
     1.定位精度的设置
     定位服务管理类CLLocationManager的desiredAccuracy属性表示精准度，有如下6种选择：
     kCLLocationAccuracyBestForNavigation ：精度最高，一般用于导航
     kCLLocationAccuracyBest ： 精确度最佳
     kCLLocationAccuracyNearestTenMeters ：精确度10m以内
     kCLLocationAccuracyHundredMeters ：精确度100m以内
     kCLLocationAccuracyKilometer ：精确度1000m以内
     kCLLocationAccuracyThreeKilometers ：精确度3000m以内
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位进度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        locationManager.distanceFilter = 100
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
        }
        setUI()
    }
    
    func setUI() {
        self.title = "CoreLocationViewController"
        self.view.backgroundColor = UIColor.white
        
        let currentLocation = CLLocation(latitude: 52.104526, longitude: 51.111151)
        let targetLocation = CLLocation(latitude: 52.105526, longitude: 51.141151)
        let distance:CLLocationDistance = currentLocation.distance(from: targetLocation)
        print("两点间距离是：\(distance)")
    }
}
