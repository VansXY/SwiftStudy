//
//  AlamofireViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/11.
//  Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class AlamofireViewController: UIViewController {

    var progressView: UIProgressView!
    var button: UIButton!
    var destinationPath:DownloadRequest.DownloadFileDestination!
    var cancelledDta:Data?
    var downloadRequest:DownloadRequest!
    let downloadUrl = "http://dldir1.qq.com/qqfile/qq/QQ7.9/16621/QQ7.9.exe"
    
    /*
     注意点1： 参数编码方式
     public enum ParameterEncoding {
     case URL
     case URLEncodedInURL
     case JSON
     case PropertyList(NSPropertyListFormat, NSPropertyListWriteOptions)
     case Custom((URLRequestConvertible, [String: AnyObject]?) -> (NSMutableURLRequest, NSError?))
     }
     Alamofire.request(.POST, "http://www.example.com/service", parameters: parameters, encoding: .JSON)
     
     注意点2：响应处理方法
     观察上面几个请求，我都是使用样例的responseJSON（处理json类型的返回结果）外，Alamofire还提供了许多其他类型的响应处理方法：
     response()
     responseData()
     responseString(encoding: NSStringEncoding)
     responseJSON(options: NSJSONReadingOptions)
     responsePropertyList(options: NSPropertyListReadOptions)
     
     */
    
    /*
     Alamofire的功能特性：
     （1）链式的请求/响应方法
     （2）URL / JSON / plist参数编码
     （3）上传类型支持：文件（File ）、数据（Data ）、流（Stream）以及MultipartFormData
     （4）支持文件下载，下载支持断点续传
     （5）支持使用NSURLCredential进行身份验证
     （6）HTTP响应验证
     （7）TLS Certificate and Public Key Pinning
     （8）Progress Closure & NSProgress
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDownloadPath()
        self.setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setDownloadPath() {
        //设置下载路径。保存到用户文档目录，文件名不变，如果有同名文件则会覆盖
        self.destinationPath = { _, response in
            let documentsPath = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)[0]
            let fileURL = documentsPath.appendingPathComponent(response.suggestedFilename!)
            //完成以后才会输出,记得这里查看地址的时候，要把地址最前面的file//去掉
            print("输出此时下载的地址位置。。。。。\(fileURL)");
            //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
            return (fileURL,[.removePreviousFile, .createIntermediateDirectories])
        }
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "Alamofire"
        
        
        self.button = UIButton(type: .custom)
//        button.frame = CGRect(x:15, y:100, width:KscreenWidth - 30, height:50)
        self.button.addTarget(self, action: #selector(clickToLoadData(_:)), for: .touchUpInside)
        self.button.setTitle("请求网络", for: .normal)
        self.button.backgroundColor = UIColor.orange
        self.view.addSubview(self.button)
        /// 创建约束
        self.button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(200)
        }
        
        self.progressView = UIProgressView.init()
        self.progressView.progressViewStyle = .default
        self.progressView.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.progressView)
        self.progressView.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.top.equalTo(500)
            make.height.equalTo(30)
        }
        /// 更新约束
//        button.snp.updateConstraints { (make) in
//            
//        }
        
        /// 重做约束
//        button.snp.remakeConstraints { (make) in
//
//        }
        
        /// 优先宽度自适应（两个label，优先设置右边的label）
//        rightLabel.setContentHuggingPriority(1000, for: UILayoutConstraintAxis.horizontal);
    }
    
    @objc func clickToLoadData (_ button : UIButton) {
        if button.isSelected {
            /// 暂停下载
            button.setTitle("Download Start", for: .normal)
            button.isSelected = false
            self.downloadRequest.cancel()
        } else {
            /// 开始下载
            button.setTitle("Download Stop", for: .normal)
            button.isSelected = true
            self.httpRequest()
        }
//        self.loadData()
    }
    
    /// 开始下载
    func httpRequest() {
        /// 判断如果已经下载，则从后面继续下载
        if let cancelledData = self.cancelledDta {
            self.downloadRequest = Alamofire.download(resumingWith: cancelledData, to: self.destinationPath)
        } else {
            self.downloadRequest = Alamofire.download(downloadUrl, to: self.destinationPath)
        }
        /// 下载进度
        self.downloadRequest.downloadProgress(queue: DispatchQueue.main) { (progress) in
            self.progressView.setProgress(Float(progress.fractionCompleted), animated: true)
        }
        /// 下载数据
        self.downloadRequest.responseData { (response) in
            self.downloadResult(response: response)
        }
    }
    
    /// 更新进度条
//    func uploadProgressView(progress:Progress) {
//        self.progressView.setProgress(Float(progress.fractionCompleted), animated: true)
//        print("当前进度：\(progress.fractionCompleted*100)%");
//    }
    /// 可以用持久化，存储下载的data，下载完成后，删除临时文件，下载中时，不断的覆盖
    func downloadResult(response:DownloadResponse<Data>) {
        switch response.result {
        case .success(_):
            self.button.setTitle("download Finished", for: .normal)
        case .failure(_):
            self.cancelledDta = response.resumeData
        }
    }
    
    func loadData() {
        print("请求网络")
        
        /// 请求参数
        let param = ["city": "北京"]
        
        /// 请求头
//        let headers = ["": ""]
        
        Alamofire.request("https://www.sojson.com/open/api/weather/json.shtml", method: .get, parameters: param).validate().responseJSON { (response) in
            print(response.request ?? "_")
            print(response.result)
            if (response.result.isSuccess) {
                print(response)
            } else {
                print(response.error ?? "_")
            }
            
        }
    }

}
