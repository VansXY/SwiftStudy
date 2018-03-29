//
//  FiveDaysViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/31.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class FiveDaysViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    
    @IBOutlet weak var clickAlert: UIButton!
    @IBOutlet weak var clickActionSheet: UIButton!
    @IBOutlet weak var clickAlertDismiss: UIButton!
    
    @IBAction func clickAlertBtn(_ sender: Any) {
        let alertVC = UIAlertController(title: "系统提示", message: "您确定要离开hangge.com吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let defaultAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("点击了确定")
            })
        alertVC.addAction(cancelAction)
        alertVC.addAction(defaultAction)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    @IBAction func clickActionSheetBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "删除", style: .destructive, handler: nil)
        let archiveAction = UIAlertAction(title: "保存", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func clickAlertTextfield(_ sender: Any) {
        let alertVC = UIAlertController(title: "系统提示", message: "您确定要离开hangge.com吗？", preferredStyle: .alert)
        alertVC.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "用户名"
        }
        alertVC.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "密码"
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let defaultAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            //也可以用下标的形式获取textField let login = alertController.textFields![0]
            let login = alertVC.textFields!.first!
            let password = alertVC.textFields!.last!
            print("用户名：\(String(describing: login.text)) 密码：\(String(describing: password.text))")
        })
        alertVC.addAction(cancelAction)
        alertVC.addAction(defaultAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func clickAlertDismiss(_ sender: Any) {
//        let alertVC = UIAlertController(title: "自动消失", message: nil, preferredStyle: .alert)
//        self.present(alertVC, animated: true, completion: nil)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            self.presentedViewController?.dismiss(animated: true, completion: nil)
//        }
//        UIAlertController.showAlert(message: "自动消失", afterTime: 2, in: self)
        UIAlertController.showActionSheet(message: "自动消失", afterTime: 1.5, in: self)
    }
}

// MARK: - UI
extension FiveDaysViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "UIAlertController"
        
        
    }
}

// MARK: - Action
extension FiveDaysViewController {
    
}

// MARK: - Network
extension FiveDaysViewController {
    
}

// MARK: - Delegate Internal

// MARK: -

// MARK: - Delegate External

// MARK: -

// MARK: - Helper
extension FiveDaysViewController {
    
}

// MARK: - Other
extension FiveDaysViewController {
    
}

// MARK: - Public
extension FiveDaysViewController {
    
}

