//
//  GenericityStatement.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/30.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 泛型类型，泛型函数以及泛型构造器的参数，包括形参和实参
 声明泛型类型，函数，或构造器时 需指定相应的类型参数，类型参数相当于一个x占位符
 */
class GenericityStatement: NSObject {
    var name: String?
    init(name: String) {
         super.init()
        self.name = name
    }
    /// 约束用于指明该类型形参继承自某个类或者符合某个协议或协议组合
    /// 下面的泛型函数中，泛型形参T Comparable表示任何用于替代类型形参T的类型实参必须满足Comparable协议
    /// - Parameters:
    ///   - x: <#x description#>
    ///   - y: <#y description#>
    /// - Returns: <#return value description#>
    func simpleMax<T: Comparable>(_ x: T, _ y: T) -> T {
        if x < y {
            return y
        }
        return x
    }
}

