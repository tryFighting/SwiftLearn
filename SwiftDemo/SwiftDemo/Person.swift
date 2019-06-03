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
    var title: String?
    
    init(name: String,age: Int,title: String) {
        self.name = name
        self.age = age
        self.title = title
    }
    class func propertyList() -> [String]{
        var count: UInt32 = 0
        
        //1.获取类的属性列表
        let list = class_copyPropertyList(self, &count)
        
        //2.遍历数组
        for i in 0..<Int(count) {
            //3.根据下标取出属性
            let pty = list?[i]
            //4.获取属性的名称 C语言的字符串 INT8-->BYTE-->CHAR--->C语言字符串
            let cName = property_getName(pty!)
            //5.转换成String的字符串
            let name = String(utf8String: cName)
            print(name!)
            
        }
        print("属性的数量 \(count)")
        //释放C语言对象
        free(list)
        return []
    }
    /// 便利器构造函数
    ///
    /// - Parameters:
    ///   - name: 名字
    ///   - age: 年龄
//    convenience  init?(name: String,age: Int) {
//        if age > 100 {
//            return nil
//        }
//        self.init()//实例化当前对象
//        self.name = name
//    }
}
///Swift 给已有类添加属性
private var middleNameKey: Void?
extension Person{
    var middleName: String?{
        get{
            return objc_getAssociatedObject(self, &middleNameKey) as? String
        }
        set{
            objc_setAssociatedObject(self, &middleNameKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
    
}
