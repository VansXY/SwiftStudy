//
//  控制流.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

class ControlFlow: NSObject {
    
    init(number: Int, number1: Int) {
        super.init()
//        self.vansXY_IF(number: number, number1: number1)
//        self.vansXY_Switch(student: "student")
//        self.vansXY_name(age: 20)
//        self.vansXY_point()
        self.vansXY_FOR()
    }
    
    
    func vansXY_IF(number : Int, number1 : Int) -> Void {
        if number > number1 {
            print("\(number.description) > \(number1.description)")
        } else {
            print("\(number.description) < \(number1.description)")
        }
    }
    
    func vansXY_Switch(student : String) -> Void {
        switch student {
        case "student":
            print("good")
        case "boy":
            print("great")
        default:
            print("bad")
        }
    }
    
    // case分支还可以进行区间匹配
    func vansXY_name(age:Int) -> Void {
        switch age {
        case 0...10:
            print("正太")
        case 11...25:
            print("青年")
        default:
            print("大叔")
        }
    }
    
    func vansXY_point() -> Void {
        let point = (2,2)
        switch point {
        case (0,0):
            print("坐标在原点")
        case (_,0):
            print("坐标在x轴上")
        case (0,_):
            print("坐标在y轴上")
        case (-3...3, -3...3):
            print("坐标在长宽为6的正方形内")
        default:
            print("在什么地方")
        }
    }
    
    // FOR循环
    func vansXY_FOR() -> Void {
//        for i in 1..<100 {
//            print(i)
//        }
        
        // 遍历数组元素
        let numbers = [1,2,4,7]
        for num in numbers{
            print("\(num)")
        }
        
        // 遍历字典
        let nameOfAge = ["lily":18, "Candy":24]
        for (aName, iAge) in nameOfAge{
            print("\(aName) is \(iAge)")
        }
        
        // 遍历字符串的字符
        for chare in "hangge".characters {
            print(chare)
        }
        
    }
    
    // while循环
    func vansXY_while() -> Void {
        var i = 0
        while i<100 {
            i+=1
        }
        
        repeat{
            i+=1
        } while i<100
    }
    
    
    
    
    
    
}






