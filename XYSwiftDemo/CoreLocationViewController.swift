//
//  CoreLocationViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/28.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class CoreLocationViewController: UIViewController {
    
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
        
        setUI()
    }
    
    func setUI() {
        self.title = "CoreLocationViewController"
        self.view.backgroundColor = UIColor.white
    }
}
