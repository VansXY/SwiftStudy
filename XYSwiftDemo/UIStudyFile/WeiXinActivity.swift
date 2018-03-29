//
//  WeiXinActivity.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/29.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class WeiXinActivity: UIActivity {

    var text: String!
    var url:URL!
    var image:UIImage!
    
    // 显示在分享框里的名称
    override var activityTitle: String?  {
        return "微信"
    }
    
    // 分享框的图片
    override var activityImage: UIImage? {
        return UIImage(named:"weixin")
    }
    
    // 分享类型，在UIActivityViewController.completionHandler回调里可以用于判断，一般取当前类名
    override var activityType: UIActivityType? {
        return UIActivityType(rawValue: WeiXinActivity.self.description())
    }
    
    // 按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class var activityCategory: UIActivityCategory {
        return .share
    }
    
    // 是否显示分享按钮，这里一般根据用户是否授权,或分享内容是否正确等来决定是否要隐藏分享按钮
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is URL {
                return true
            }
        }
        return false;
    }
    
    // 解析分享数据时调用，可以进行一定的处理
    override func prepare(withActivityItems activityItems: [Any]) {
        for item in activityItems {
            if item is UIImage {
                image = item as! UIImage
            }
            if item is String {
                text = item as! String
            }
            if item is URL {
                url = item as! URL
            }
        }
    }
    
    // 执行分享行为
    override func perform() {
        activityDidFinish(true)
    }
    
    // 分享时调用
    override var activityViewController: UIViewController? {
        return nil
    }
    // 完成分享后调用
    override func activityDidFinish(_ completed: Bool) {
        
    }
    
    
}
