//
//  AccessControl.swift
//  SwiftDemo
//
//  Created by zrq on 2018/11/20.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 Swift为代码中的实体提供了五种不同的访问级别。
 
 Open和Public级别可以让实体被同一模块源文件中的所有实体访问
 Internal级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问，通常情况下，如果某个接口只能在应用程序或框架内部使用，就可以将其设置Internal级别
 File-private限制实体只能在其定义的文件内部访问。如果功能的部分细节只需要在文件内使用，就可以使用File-Private来将其隐藏
 Private限制实体只能在其定义的作用域，以及同一文件内extension访问，如果功能的部分细节只需要在当前作用域内使用，可以使用Private来将其隐藏
 
 */
///添加到branch分支
class AccessControl: NSObject {
    var myNumber = 1
    
    
}
func oneMore(than number: Int) -> Int {
    return  number + 1
}
