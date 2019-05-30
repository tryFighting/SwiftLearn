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
/// self消除方法参数x和实例属性x之间的歧义
/*
 你需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变行为（mutating）,然后z就可以从其方法内部改变它的属性，并且这个方法做的任何改变都会在方法执行结束时写回到原始结构体中。方法中可以给隐含的self属性赋予一个全新的实例，这个新实例方法结束时会h替换现存实例。
 */
struct Point {
    var x = 0.0 ,y = 0.0
    mutating func moveByX(deltaX: Double,y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
class Counter {
    var count = 0
    /// 让计数器按一递增
    func increment() {
        count += 1
    }
    
    /// 让计数器按一个指定的整数值递增
    ///
    /// - Parameter amount:
    func increment(by amount: Int) {
        count += amount
    }
    //重置为0
    func reset() {
        count = 0
    }
    
}
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
func sum(x: Int,y:Int) -> Int{
    return x + y
}
func sum1(num1 x: Int,num2 y:Int) -> Int{
    return x + y
}
func sum2(x: Int = 3,y:Int = 3) -> Int{
    return x + y
}
/// 尾随闭包
func demoClousure(completion:@escaping (_ result: [String]) ->()) ->(){
    DispatchQueue.global().async {
        ///尾随闭包  最后一个形参可省略
        Thread.sleep(forTimeInterval: 5)
        
        let json = ["苹果","华为","谷歌"]
        DispatchQueue.main.async(execute: {
           
            
            completion(json)
        })
        ///可缩减
        /*
         DispatchQueue.main.async {
         
         
         completion(json)
         }
         */
    }
}
class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//       print(sum(x: 1, y: 2))
//        ///形参列表  无用到的可以用 _ 忽略
//        print(sum1(num1: 2, num2: 2))
//        ///默认值函数调用
//        print(sum2(),sum2( y: 1),sum2(x: 2,y: 3),sum2(x: 2))
        let p = sum2
        print(p(1,2))
        view.backgroundColor = UIColor.white
        ///闭包学习 b1自动推到 () -> ()
        let b1 = {
            print("无参数无返回值的闭包")
        };
        b1()
        ///有参数，无返回值  (Any) -> ()
        let b2 = {
            intdex in
            print(intdex)
        }
        b2(222)
        
        ///有参数，有返回值
        let b3 = {
            (ing: Int) -> Int in
            return ing + 5
        }
        print(b3(333))
        
        
        ///尾随闭包
        demoClousure { (result) in
            print(result)
        }
        
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
        
        //实例方法 类型方法
        /*
         实例方法是属于某个特定类，结构体或者枚举类型的方法
         */
        let counter = Counter()
        counter.increment()
        counter.increment(by: 5)
        counter.reset()
        
        //结构体或枚举的修改
        var somePoint =  Point(x: 1.0, y: 1.0)
        somePoint.moveByX(deltaX: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        
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
