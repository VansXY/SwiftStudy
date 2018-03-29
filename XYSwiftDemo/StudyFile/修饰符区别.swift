//
//  修饰符区别.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import Foundation

// MARK: - open > public > interal > fileprivate > private
/*
 private
 private 访问级别所修饰的属性或者方法只能在当前类里访问。
 
 fileprivate
 fileprivate 访问级别所修饰的属性或者方法在当前的 Swift 源文件里可以访问。（比如上面样例把 private 改成 fileprivate 就不会报错了）
 
 internal（默认访问级别，internal修饰符可写可不写）
 internal 访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是 App 代码，也是在整个 App 代码，也是在整个 App 内部可以访问。
 
 public
 可以被任何人访问。但其他 module 中不可以被 override 和继承，而在 module 内可以被 override 和继承。
 
 open
 可以被任何人使用，包括 override 和继承。
 
 5种修饰符访问权限排序
 open > public > interal > fileprivate > private
 
 */


// MARK: - is 与 as
/*
    is 用来做类型检查
 //    for people in arr {
 //        if people is Man {
 //            println("这是个男人")
 //        } else if people is Woman {
 //            println("这是个女人")
 //        }
 //    }
 
    as 用来做类型转换
 //    for people in arr {
 //        if let m = people as? Man {
 //            println("这是个男人")
 //        } else if let w = people as? Woman {
 //            println("这是个女人")
 //        }
 //    }
 */

// MARK: - AnyObject 与 Any
/*
    AnyObject ：代表任何class类型的对象实例。
 
    Any ：范围更广，代表除函数外任何类型的实例
 */


// MARK: - AnyObject 与 Any
/*
 1，按位取反运算：操作符是 ~
 2，按位与运算：操作符是 &
 3，按位或运算：操作符是 |
 4，按位异或运算：操作符是 ^
 5，按位左移/右移运算：操作符是 << 和 >>
 */

// MARK: - 浮点数转换成整数
/*
    var i = Int(23.50)      //23
    var i = lroundf(23.50)  //24
 */



class optionClass: NSObject {
    var i = Int(23.50)      //23
    var j = lroundf(23.50)  //24
}







