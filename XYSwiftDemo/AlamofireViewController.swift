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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "Alamofire"
        let button = UIButton(type: .custom)
//        button.frame = CGRect(x:15, y:100, width:KscreenWidth - 30, height:50)
        button.addTarget(self, action: #selector(clickToLoadData(_:)), for: .touchUpInside)
        button.setTitle("请求网络", for: .normal)
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(200)
        }
    }
    
    @objc func clickToLoadData (_ button : UIButton) {
        self.loadData()
    }
    
    func loadData() {
        print("请求网络")
        
        /// 请求参数
        let param = ["city": "北京"]
        
        /// 请求头
//        let headers = ["": ""]
        
        Alamofire.request("https://www.sojson.com/open/api/weather/json.shtml", method: .get, parameters: param).validate().responseJSON { (response) in
            print(response.request ?? "")
            print(response.result)
            if (response.result.isSuccess) {
                print(response)
            } else {
                print(response.error ?? "_")
            }
            
        }
    }

}
