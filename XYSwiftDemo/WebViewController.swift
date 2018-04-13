//
//  WebViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/13.
//  Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view.
    }

    func setUI() {
        self.title = "webVC"
        self.view.backgroundColor = UIColor.white
        let urlString = "http://hangge.com"
        /// 调用系统浏览器打开
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:]) { (data) in
                    print(data)
                }
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func useWebViewController() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
