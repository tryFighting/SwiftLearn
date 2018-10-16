//
//  InterviewViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/15.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 函数实际上是一种特殊的闭包：它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数
 即使闭包时在一个不同的作用域被执行的，你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型的声明与
 闭包函数体进行分离
 
 使用struct来创建一个结构体，结构体和类有很多相同的地方，比如方法和构造器
 区别：结构体是传值  类是传引用
 
 泛型：在尖括号里写一个名字创建一个泛型函数或者类型
 */
class InterviewViewController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
       /*
         面试题集锦
         */
        var nums = [13,14,15,16]
        print(nums)
        swap(&nums, 1, 2)
        print(nums)
        
        let addTwo = add(2)//addTwo是个Function
        print(addTwo(2))
        //!拆包必须保证有值 ？可选 as?  as!下行转换
       let result = divide(dividend: 13, by: 19.7)!
        print(result)
        
        //实例
        block()
        
        block1()
        
        var numbers = [20,19,7,12]
        numbers.map ({ (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        
        let item =  repeatItem(repeating: "Knick", numerOfLines: 4)
        print(item)
    }
    ///泛型支持
    func repeatItem<Item>(repeating item: Item,numerOfLines: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numerOfLines {
            result.append(item)
        }
        return result
    }
    /// 函数时第一等类型，这意味着函数可以作为另一个函数的返回值
    /// 函数也可以当做参数传入另一个参数
    /// - Returns: 返回一个函数
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(numer: Int) -> Int{
            return 1 + numer
        }
        return addOne
    }
    /// closure没有申明复制拷贝car，所以闭包用的还是全局的car变量
    func block1() -> () {
        var car = "Benz"
        let closure = {
            print("i have \(car)")
        }
        car = "Tesla"
        closure()
    }
    /// 因为clousre已经申明将car复制进去了，此时clousure里面的car是个局部变量，不再与外面的car有关
    func block() -> () {
        var car = "Benz"
        let closure = {
            [car] in print("I drive\(car)")
        }
        car = "Tesla"
        closure()
    }
    /// guard let的应用
    /// ！拆包必须保证有值 出现nil会闪退
    /// - Parameters:
    ///   - dividend: 可选参数
    ///   - divisor: 可选参数
    /// - Returns: 可选参数
    func divide(dividend: Double?,by divisor: Double?) -> Double? {
        guard let dividend = dividend,let divisor = divisor,divisor != 0  else {
            return nil
        }
        return dividend/divisor
    }
    /// swift的currying特性 柯里化
    ///
    /// - Parameter num: 参数num
    /// - Returns: 返回
    func add(_ num: Int) -> (Int) -> Int {
        return {
            val in
            return num + val
        }
    }
    /// 避免产生循环引用
    public class Node{
        public var value: Int
        //注意weak的使用 可以避免产生循环引用
        weak var prev: Node?
        weak var post: Node?
        init(_ value: Int) {
            self.value = value
        }
    }
    /// 问题1:给定一个数组，要求写一函数，交换数组中的两个元素
    func swap<T>(_ nums: inout [T],_ p: Int,_ q: Int){
        (nums[p], nums[q]) = (nums[q],nums[p])
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
