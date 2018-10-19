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
         闭包可以捕获和存储其所在上下文中任意常量和变量的引用,被称为包裹常量和变量.
         .全局函数是一个有名字但不会捕获任何值的闭包
         .嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
         .闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
         闭包表达式语法一般形式:{
         (parameter) -> returnType in
         statements
         }
         */
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        /// 内联闭包参数
        /// 函数和返回值类型都写在{}闭包函数体部分由关键字in引入，该关键字表示闭包的参数和返回值类型已经开始
        /// - Parameters:
        ///   - s1:
        ///   - s2:
        /// - Returns:
        func backward(_ s1: String,_ s2:String) ->Bool{
            return s1 > s2
        }
        var reversedNames = names.sorted()
        print(reversedNames)
        //backward 函数 闭包函数较短  可以写成一行代码
        
        /*
         内联闭包表达式构造的闭包作为参数传递给函数或方法时,总是能够推断出闭包的参数和返回值类型
         这就意味着闭包作为函数或者方法的参数时，你几乎不需要利用完整格式构造内联闭包
         单行表达式闭包可以通过省略return来隐思返回单行表达式的结果
         */
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
        reversedNames = names.sorted(by: {(_ s1: String,_ s2: String)->Bool in return s1 > s2})
        //swift自动为内联闭包提供了参数名称缩写功能，可以直接通过$0,$1,$2来顺序调用闭包的参数
        reversedNames = names.sorted(by: { $0 > $1 } )
        //运算符方法
        reversedNames = names.sorted(by: >)
         print(reversedNames)
        
        
        
        
        //尾随闭包:
        /*
         当闭包非常长以至于不能再一行中进行书写时,尾随闭包就会变得非常有用
         Swift的Array类型有一个map(_:)方法，这个方法获取一个闭包表达式作为其唯一的参数
         该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方式和返回值类型
         由闭包来指定
         */
        reversedNames = names.sorted() { $0 > $1 }
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let number = [16, 58, 510]
        let string = number.map{
           (num) -> String in
            var num = num
            var output = ""
            repeat{
                output = digitNames[num%10]! + output
                num /= 10
            }while num > 0
            return output
        }
        print(string)
        
        /*
         值捕获
         闭包可以在其被定义的上下文捕获常量或变量，即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以
         在闭包函数体内引用和修改这些值
         */
        /// 尾随闭包
        ///嵌套函数 实现闭包
        /// - Parameter amount: 参数
        /// - Returns: () ->Int 一个返回Int的函数，该函数在每次调用时不接收任何参数，只返回一个Int
        func makeIncrementer(forIncrement amount: Int) ->() ->Int{
            var runningTotal = 0
            //函数捕获上下文的变量
            func incrementer() ->Int{
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        //notice:如果一个值不会被闭包改变，或者在闭包创建后不会改变，swift可能会改为捕获并保存一份对值的拷贝，swift也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量  函数和变量都是引用类型
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print(incrementByTen())
        print(incrementByTen())
        print(incrementByTen())
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print(incrementBySeven())
         print(incrementByTen())
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
