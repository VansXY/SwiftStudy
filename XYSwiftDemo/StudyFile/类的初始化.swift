//
//  类的初始化.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

class Student: NSObject {
    
    // 类属性
    var name : String = ""
    var number : Int32 = 0
    
    // 类构造函数
    init(newName : String, newNumber : Int32) {
        self.name = newName
        self.number = newNumber
    }
    
    // 类方法
    func say() -> String {
        return "我叫\(name)"
    }
    
    // 反初始化方法
    deinit {
        // 可以做一些清理工作
    }
}





