//
//  class与staitc关键字.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

/*
 static 可以在类、结构体、或者枚举中使用。而 class 只能在类中使用。
 static 可以修饰存储属性，static 修饰的存储属性称为静态变量(常量)。而 class 不能修饰存储属性。
 static 修饰的计算属性不能被重写。而 class 修饰的可以被重写。
 static 修饰的静态方法不能被重写。而 class 修饰的类方法可以被重写。
 class 修饰的计算属性被重写时，可以使用 static 让其变为静态属性。
 class 修饰的类方法被重写时，可以使用 static 让方法变为静态方法。
 
 原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_520.html
 */

struct Account {
    
    var amount : Double = 2000.0
    var name : String = ""
    
    // 修饰 属性
    static var interestRate : Double = 0.668
    // 修饰 类
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
  
}

class Account1 {
    var amount : Double = 0.0                 //账户金额
    var owner : String = ""                   //账户名
    
    static var interestRate : Double = 0.668  //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}


class Account2 {
    var amount : Double = 0.0               // 账户金额
    var owner : String = ""                 // 账户名
    
    class var staticProp : Double {
        return 0.668
    }
    
    class func interestBy(amount : Double) -> Double {
        return 0.8886 * amount
    }
}




