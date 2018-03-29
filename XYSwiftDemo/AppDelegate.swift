//
//  AppDelegate.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if !UserDefaults.standard.bool(forKey: "firstIn") {
            UserDefaults.standard.set(true, forKey: "firstIn")
            let guideViewController = GuideViewController()
            self.window!.rootViewController = guideViewController
        }
        //请求通知权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                (accepted, error) in
                if !accepted {
                    print("用户不允许消息通知。")
                }
        }
        // 把起始ViewController作为导航控件封装，我们在ViewController里就能调用导航条进行页面切换了
//        let rootViewController = ViewController()
//        let rootNavgationController = UINavigationController(rootViewController: rootViewController)
//        self.window?.rootViewController = rootNavgationController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication,
                     didReceive notification: UILocalNotification) {
        print(self.window?.rootViewController ?? "1234")
        UIApplication.shared.applicationIconBadgeNumber = 0
        UIAlertController.showAlert(message: "收到本地通知", afterTime: 3, in: (self.window?.rootViewController)!)
    }


}

