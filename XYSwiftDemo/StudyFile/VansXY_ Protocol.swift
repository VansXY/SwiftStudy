//
//  VansXY_ Protocol.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/19.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

// 协议里只做方法的声明，包括方法名、返回值、参数等信息，而没有具体的方法实现。
protocol Person {
    // 读写属性
    var name : String{get set}
    // 只读
    var age: Int{get}
    // 类型方法
    static func method1()
    // 实例方法
    func method2() -> Bool
    // 突变方法
    mutating func method3()
    
}

// 协议里继承另一个协议
protocol Animal {
    func move()
}

protocol Bird:Animal {
    func song()
}
