//
//  MyDelegateDemo.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/9.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
protocol myDelegate {
    func delegateMethod()
}
class MyDelegateDemo: NSObject {
    var delegate: myDelegate?
    /// 触发代理方法{}是事先准备好的代码块，需要执行时进行调用
    func start() {
        delegate?.delegateMethod()
    }
    
}
