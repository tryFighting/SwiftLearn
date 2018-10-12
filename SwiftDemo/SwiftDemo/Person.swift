//
//  Person.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/12.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 便利构造函数
 条件判断：满足条件，才能实例化对象
 简化对象的创建
 */
class Person: NSObject {

    var name: String?
    var age: Int = 0
    
    /// 便利器构造函数
    ///
    /// - Parameters:
    ///   - name: 名字
    ///   - age: 年龄
    convenience  init?(name: String,age: Int) {
        if age > 100 {
            return nil
        }
        self.init()//实例化当前对象
        self.name = name
    }
}
