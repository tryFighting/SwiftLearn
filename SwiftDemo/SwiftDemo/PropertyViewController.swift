//
//  PropertyViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/22.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 属性:存储属性，计算属性，属性观察器，全局变量和局部变量。类型属性
 计算属性可以用于类和结构体，存储属性只能用于类和结构体
 
 存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量或常量修饰属性
 
 */
struct FixedLengthRange {
    var firstValue: Int
    
    let length: Int
    
    
}
class StepCounter {
    var totalSteps: Int = 0{
        willSet(newTotalStep){
          print("About to set totalSteps to \(newTotalStep)")
        }
        didSet{
            if totalSteps > oldValue {
                print("Add \(totalSteps - oldValue) steps")
            }
        }
    }
    
}
class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6
        
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        //报错原因：结构体属于值类型，值类型被声明为常量的时候，它的所有属性也就变成常量
        //属于引用类型的class则不一样，把一个引用类型的实例付给一个常量后，仍然可以修改该实例的变量属性
        //rangeOfFourItems.firstValue = 6 报错
        
        //延迟存储属性  指第一次调用的时候才会计算其初始化值的属性，在属性声明前使用lazy来标示一个延迟储存属性
        //notice:必须使用var关键字，因为属性的初始化可能在实例构造完成后才会得到，而常量属性在构造过程完成之前必须要有初始值,因为无法声明成延迟属性，延迟属性很有用，当属性的值依赖于在实例的构造过程结束后才会知道影响的外部因素时，或者当获得属性的初始值需要复杂或大量计算，可以在需要的时候计算它
        var data = [String]()
        //存储属性和实例属性
        /*
         属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值域旧值相同的时候也不例外
         可以为属性添加如下的一个或全部观察器 willset didset
         */
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
