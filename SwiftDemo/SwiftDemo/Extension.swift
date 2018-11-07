//
//  Extension.swift
//  SwiftDemo
//
//  Created by zrq on 2018/11/1.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 扩展就是为一个已有的类，结构体，枚举类型或者协议类型添加新功能
 这包括在没有权限获取原始代码的情况下扩展类型的能力（逆向建模）
 扩展和Objective-C分类类似
 
 Swift的扩展可以:
 1.添加计算型属性和计算型类型属性
 2.定义实例方法和类型方法
 3.提供新的构造器
 4.定义下标
 5.定义和使用新的嵌套类型
 6.使用一个已有类型符合某个协议
 */
/// 扩展可以添加新的计算型属性,但是不可以添加存储属性，也不可以为已有属性添加属性观察器
class Extension: NSObject {

    let defaultRect = Rect()//默认构造器
    let memberwiseRect = Rect(origin: POINT(x: 2.0, y: 3.0), size: Size(width: 5.0, height: 5.0))
    
    let centerRect = Rect(center: POINT(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
   
   
}
struct Size {
    var width = 0.0,height = 0.0
}
struct POINT {
    var x = 0.0,y = 0.0
}
/// 因为结构体Rect未提供定制的构造器，因此它会获得一个逐一成员构造器
struct Rect {
    var origin =  POINT()
    var size = Size()
}
// MARK: - 提供一个额外的接受指定中心点和大小的构造器来扩展Rect结构体
extension Rect{
    //扩展  重载函数
    init(center: POINT,size: Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:POINT(x: originX, y: originY),size: size)
    }
}
// MARK: - 扩展可以为已有类型添加新的实例方法和类型方法
extension Int{
    func repeatitions(task: () -> Void){
        for _ in 0..<self {
             task()
        }
    }
}
// MARK: - 可变实例方法,结构体和枚举类型中修改self或者属性的方法必须将该实例方法标注为mutating
extension Int{
    mutating func squre(){
        self = self * self
    }
}
// MARK: - 扩展可以为已有类型添加新下标,swift内建类型Int添加了一个整型下标 12[0]
extension Int{
    subscript(digitIndex: Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
       return (self/decimalBase) % 10
    }
}
// MARK: - 扩展可以为已有的类，结构体和枚举添加新的嵌套类型
extension Int{
    enum Kind {
        case Negative,Zero,Positive
    }
    var kind: Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
    
}
