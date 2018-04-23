//
//  WebViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/13.
//  Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    var webView:UIWebView!
    var textField:UITextField!
    var goBtn:UIButton!
    var loadIndicator:UIActivityIndicatorView!
    
    var progressView : UIProgressView!
    var toolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view.
    }

    func setUI() {
        self.title = "webVC"
        self.view.backgroundColor = UIColor.white
        self.setToolBar()
//        let items = ["显示HTML", "显示PDF", "系统浏览器"]
//        segmentView = UISegmentedControl(items: items)
//        segmentView.addTarget(self, action: #selector(segmentValueChange(_:)), for: .valueChanged)
//        self.view.addSubview(segmentView)
//        segmentView.snp.makeConstraints { (make) in
//            make.left.equalTo(30)
//            make.top.equalTo(100)
//            make.width.equalTo(315)
//            make.height.equalTo(30)
//        }
//        segmentView.selectedSegmentIndex = 0
        
        textField = UITextField()
        textField.placeholder = "请输入网址"
        textField.borderStyle = .roundedRect
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom).offset(10)
            make.left.equalTo(30)
            make.width.equalTo(KscreenWidth / 2)
            make.height.equalTo(30)
        }
        
        goBtn = UIButton(type: .custom)
        goBtn.setTitle("Go", for: .normal)
        goBtn.setTitleColor(UIColor.black, for: .normal)
        goBtn.addTarget(self, action: #selector(clickGoBtn(_ :)), for: .touchUpInside)
        self.view.addSubview(goBtn)
        goBtn.snp.makeConstraints { (make) in
            make.top.equalTo(textField)
            make.left.equalTo(textField.snp.right).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.centerY.equalTo(textField)
        }
        
        webView = UIWebView()
        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.width.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.centerX.equalTo(self.view)
        }
        
        
        

    }
    
    func loadWebViewWithUrl(urlString: String) {
        let url = URL(string: urlString)
        webView.loadRequest(URLRequest(url: url!))
    }
    
    func setToolBar() {
        toolBar = UIToolbar()
        self.view.addSubview(toolBar)
        toolBar.snp.makeConstraints { (make) in
            make.top.equalTo(83)
            make.left.equalTo(0)
            make.width.equalTo(self.view)
            make.height.equalTo(50)
        }
        let backTool = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(webViewGoBack))
        let forwardTool = UIBarButtonItem(title: "下一页", style: .done, target: self, action: #selector(webViewForward))
        let reloadTool = UIBarButtonItem(title: "重载", style: .done, target: self, action: #selector(webViewReload))
        let stopTool = UIBarButtonItem(title: "停止", style: .done, target: self, action: #selector(webViewStop))
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 20)
        let progressViewTool = UIBarButtonItem(customView: progressView)
        
        let tool1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let tool2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let tool3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let tool4 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([backTool, tool1, forwardTool, tool2, reloadTool, tool3, stopTool, tool4, progressViewTool], animated: true)
    }
    
    @objc func webViewGoBack () {
        
    }
    
    @objc func webViewForward () {
        
    }
    
    @objc func webViewReload () {
        
    }
    
    @objc func webViewStop () {
        
    }
    
    @objc func clickGoBtn(_ sender:UIButton) {
        
    }
    
    @objc func segmentValueChange(_ sender:UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            let html = "<h1>欢迎来到：<a href='http://hangge.com'>航歌</a></h1>";
            webView.loadHTMLString(html,baseURL:nil)
        case 1:
            let path = Bundle.main.path(forResource: "test1", ofType:"pdf")
            let urlStr = URL(fileURLWithPath: path!)
            webView.loadRequest(URLRequest(url:urlStr))
        case 2:
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
        default:
            print("出错了")
        }
        
    }
    
    func useWebViewController() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
