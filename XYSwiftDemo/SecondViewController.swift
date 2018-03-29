//
//  SecondViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/9.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
       
    }
    

    // MARK: - Public Property
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension SecondViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "StudyDetail"
        
        let oneDayView = OneDayView.init(frame: CGRect(x:10, y:20 + NavgationHeight, width:300, height:100))
        oneDayView.isUserInteractionEnabled = true
        self.view.addSubview(oneDayView)
        
    }
}


