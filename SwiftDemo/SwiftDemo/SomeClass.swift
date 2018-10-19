//
//  SomeClass.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/19.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

class SomeClass: NSObject {
    var x = 10
    func doSomething() -> () {
        someFunctionWithEscapingClosure { self.x = 100 }//逃逸闭包
        someFunctionWithNonescapingClosure { x = 200 }//非逃逸闭包
    }
    //逃逸闭包
    var completionHandlers: [() ->Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () ->Void){
        completionHandlers.append(completionHandler)
    }
    //非逃逸闭包
    /// 非逃逸闭包
    ///
    /// - Parameter closure: () 参数类型为函数
    func someFunctionWithNonescapingClosure(closure: ()-> Void){
        closure()
    }
}
