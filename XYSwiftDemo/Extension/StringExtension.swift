//
//  StringExtension.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/2/26.
//  Copyright © 2018年 VansXY. All rights reserved.
//

import Foundation

extension String {
    /// 字符串截取
    ///
    /// - Parameters:
    ///   - start: 开始位置
    ///   - length: 子字符串长度
    /// - Returns: 返回子字符串
    func subStrings(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}
