//
//  ScheduleNotificationViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/2/24.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import UserNotifications

class ScheduleNotificationViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "发送本地通知"
        self.view.backgroundColor = UIColor.white
        
        setUI()
        studyArray()
    }

    // MARK: - Public Property
    var button : UIButton!
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension ScheduleNotificationViewController {
    fileprivate func setUI() {
        // 创建发送通知的按钮
        button = UIButton(type:.custom)
        button.frame = CGRect(x:50, y: 100, width: 275, height: 50)
        button.setTitle("发送本地通知", for:.normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(scheduleNotification(_ :)), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    @objc func scheduleNotification (_ button : UIButton) {
        // 设置推送内容
        let content = UNMutableNotificationContent()
        content.title = "标题"
        content.body = "这是一个本地通知的内容"
        // 设置通知触发器
        /*
         1. 一段时间后触发（UNTimeIntervalNotificationTrigger）
         2. 指定日期时间触发（UNCalendarNotificationTrigger）
         3. 根据位置触发（UNLocationNotificationTrigger）
         */
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        // 设置请求标识符
         let requestIdentifier = "localNotification"
        // 设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        // 将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request) { error in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }
    }
}

// MARK: - Action
extension ScheduleNotificationViewController {
    ///for循环
    /*
     // for loop
     for (index, element) in names.enumerated()
     for name in names { }
     names.forEach { element in }
     for i in 0 ... names.count - 1 { }
     for i in 0 ..< names.count { }
     for _ in 0 ..< names.count { }
     for name in names.reverse() { }
     for i in 0.stride(through: names.count - 1, by 2) { }
     for i in 0.stride(to: names.count, by: 2) { }
     
     // while loop
     var i = 0
     while i < names.count { }
     repeat { } while i < names.count
     
     作者：故胤道长
     链接：https://www.jianshu.com/p/ee16bcf50a59
     來源：简书
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */

    func studyArray() {
        let names:[String] = ["hbhbhb", "hahaha", "hchchc"]
        for (index, element) in names.enumerated() {
            print(index, element)
        }
        for name in names {
            print(name)
        }
        for name in names.reversed() { // 倒序
            print(name)
        }
        print(names.sorted())
        
        let _:CGRect = UIScreen.main.bounds
    }
    
    
}



