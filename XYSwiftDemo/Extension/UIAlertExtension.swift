//
//  UIAlertExtension.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/31.
//  Copyright © 2018年 VansXY. All rights reserved.
//

import Foundation
import UIKit


extension UIAlertController {
    //在指定视图控制器上弹出普通消息提示框
    static func showAlert(message: String, actionTitle: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出普通消息提示框
    static func showAlert(message: String, actionTitle: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showAlert(message: message, actionTitle: actionTitle, in: vc)
        }
    }
    
    ///自动消失的普通消息提示框
    static func showAlert(message: String, afterTime: Float, in viewController: UIViewController) {
        let afterTime:TimeInterval = TimeInterval(afterTime)
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        viewController.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + afterTime) {
            viewController.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    //在指定视图控制器上弹出确认框
    static func showConfirm(message: String, in viewController: UIViewController,
                            confirm: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: confirm))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出确认框
    static func showConfirm(message: String, confirm: ((UIAlertAction)->Void)?) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showConfirm(message: message, in: vc, confirm: confirm)
        }
    }
    
    //在指定视图控制器上弹出普通消息提示框
    static func showActionSheet(message: String, actionTitle: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    ///在根视图控制器上弹出普通消息提示框
    static func showActionSheet(message: String, actionTitle: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showAlert(message: message, actionTitle: actionTitle, in: vc)
        }
    }
    
    // 自动消失的普通消息提示框
    static func showActionSheet(message: String, afterTime: Float, in viewController: UIViewController) {
        let afterTime:TimeInterval = TimeInterval(afterTime)
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        viewController.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + afterTime) {
            viewController.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
}
