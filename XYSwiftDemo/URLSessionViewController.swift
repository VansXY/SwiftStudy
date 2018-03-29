//
//  URLSessionViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/2/5.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class URLSessionViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        sessionLoadData()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension URLSessionViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white;
        self.title = "URLSessionViewController"
    }
}

// MARK: - Action
extension URLSessionViewController {
    
}

// MARK: - Network
extension URLSessionViewController {
    func sessionLoadData() {
        // url
        let urlString:String = "http://www.apiopen.top:88/createStatisticsKey?appId=com.chat.peakchao&passWd=123456"
        let url = URL(string:urlString)!
        // request
        let request = URLRequest(url:url)
        let session = URLSession.shared
        // resume开始任务
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                let str = String(data: data!, encoding: String.Encoding.utf8)!
                print(str)
            }
        } as URLSessionTask
        
        dataTask.resume()
    }
}



