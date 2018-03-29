//
//  VansXY_String_Util.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/19.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

extension String {
    
    // 截取字符串从start开始，长度为length的字符串
    subscript (start: Int, length: Int) -> String {
        
        get {
            let index1 = self.index(startIndex, offsetBy: start)
            let index2 = self.index(index1, offsetBy: length)
            return String(self[index1..<index2])
        }
        
        set {
            let temp = self
            var s = ""
            var e = ""
            for (idx, item) in temp.enumerated()  {
                if (idx < start) {
                    s += "\(item)"
                }
                if (idx > start + length) {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
            
        }
    }
    
    subscript (index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            let temp = self
            self = ""
            for (idx, item) in temp.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                } else {
                    self += "\(item)"
                }
            }
            
        }
    }
}

extension Double {
    
    func mm() -> String {
        return (self / 1).description+"mm"
    }
    
    func cm() -> String {
        return (self / 10).description + "cm"
    }
    
    func m() -> String {
        return (self / 100).description + "m"
    }
    
    func km() -> String {
        return (self / 1000 / 1000).description + "km"
    }
}



