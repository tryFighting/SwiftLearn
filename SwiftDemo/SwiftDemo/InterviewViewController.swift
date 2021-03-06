//
//  InterviewViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/15.
//  Copyright © 2018年 zrq. All rights reserved.
//
/*
 1.内存的几大区域
 stack 栈区由编译器自动分配并释放，存放函数的参数值，局部变量等。栈是系统数据结构，对应线程/进程是唯一的。优点是快速高效，缺点是有限制，数据不灵活
 栈空间分静态分配和动态分配两种
 
 heap由程序员分配和释放，如果程序员不释放，程序结束时，可能会由操作系统回收
 优点：椎是函数库内部数据结构，不一定唯一
 不同椎分配的内存无法互相操作
 椎空间的分配总是动态的
 
 全局区  全局变量和静态变量的存储是放在一起的，初始化的全局变量和静态变量存放在一块区域
 未初始化的全局变量和静态变量在相邻的另一块区域，程序结束时有系统释放（BSS段 未被初始化的全局变量和静态变量）
 
 文字常量区  存放常量字符串 程序结束后由系统释放
 
 代码区 存放函数的二进制代码
 
 栈：存储每一个函数在执行的时候都会向操作系统索要资源，栈区就是函数运行时的内存，栈区中的变量由编译器负责分配和释放，内存随着函数的运行分配，随着函数的结束而释放，由系统自动完成。
 注：只要栈的剩余空间大于所申请的空间，系统将为程序提供内存，否则将报异常提示栈溢出
 
 椎：
 1.操作系统有一个记录空闲内存地址的链表。
 2.当系统收到程序的申请时，会遍历该链表，寻找第一个空间大于所申请空间的椎节点，然后将该节点从空闲节点链表中删除，并将该节点的空间分配给程序
 3.由于找到的椎节点的大小不一定正好等于申请的大小，系统会自动的将多余的那部分重新放入空闲链表中
 */
import UIKit
/*
 Swift VS OC （STRING,ARRAY,DICTIONARY）
 值类型相比引用类型，最大优势在于内存使用的高效
 值类型相比引用类型，最大的优势在于内存使用的高效，值类型在栈上操作，引用类型在椎上操作
 栈上的操作仅仅是单个指针的上下移动，而椎上的操作涉及到合并，移位，重新链接等
 SWIFT这样设计，大幅减少椎上的内存分配和回收的次数，同时copy-on-write又将值传递和复制的开销降到最低
 
 STRING,ARRAY,DICTIONARY 设计成值类型，也是为了线程考虑。通过swift的let设置，使得这些数据达到了真正意义上的不变，它也从根本上解决了多线程中内存访问和操作顺序的问题
 设计成值类型还可以提升API的灵活度，可以遍历String，使得整个开发更加灵活高效
 */
/*
 Swift中若要使用OC代码，可以在ProjectName-Bridging-Header.h里添加OC的头文件名称，Swift文件中即可调用OC
 代码，一般情况下，Xcode会自动创建
 
 使用协议解决了复用性，可读性，维护性三个难题
 
 self.tableview reloadData
 编译阶段，编译器会把这句话翻译成objc_msgSend(self.tableview,@selector(reload)),把消息发送给self.tableview
 运行阶段:接受者self.tableview会响应这个消息，期间可能会直接执行，转发消息，也可能会找不到方法崩溃
 
 整个流程---编译器翻译---给接收者发送消息---接收者响应消息
 
 Swift目前被公认为是一门静态语言，它的动态特性是通过桥接OC来实现的
 */
/*
 Swift有五个级别的访问权限
 从高到低依次为Open,Public,Internal,File-private,Private
 Open(被任意Module中被访问和重写)
 Public(仅次于Open，可以被访问，不可以被重写)
 Internal是默认权限，它表示当前定义的模块访问和重写，可以被一个Module中被访问，不能被重写
 File-private是被修饰的对象只能在当前文件中使用，例如它可以被一个文件中的class,extension，struct共同使用
 Private是最低的访问权限 它的对象只能在定义的作用域，即使是同一个文件中的其他作用域，也无法访问
 */
/*
 函数实际上是一种特殊的闭包：它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数
 即使闭包时在一个不同的作用域被执行的，你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型的声明与
 闭包函数体进行分离
 
 使用struct来创建一个结构体，结构体和类有很多相同的地方，比如方法和构造器
 区别：结构体是传值  类是传引用
 
 泛型：在尖括号里写一个名字创建一个泛型函数或者类型
 */
/*
 函数实际上是一种特殊的闭包：它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数
 即使闭包时在一个不同的作用域被执行的，你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型的声明与
 闭包函数体进行分离
 
 使用struct来创建一个结构体，结构体和类有很多相同的地方，比如方法和构造器
 区别：结构体是传值  类是传引用
 
 泛型：在尖括号里写一个名字创建一个泛型函数或者类型
 */
enum numTest: Int,Error {
    case _0,_1,_2,_3
    case nothing = 999
}
class InterviewViewController: UIViewController {
    var title1: String = ""{
        willSet{
            print("将标题\(title1)设置到\(newValue)")
        }
        didSet{
            print("已将标题从\(oldValue)设置到\(title1)")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //协议中是动态派发，扩展是静态派发
        //函数式编程
       print((0...10).map{ $0 * $0 }.filter{$0 % 2 == 0})
        //try?和try!主要用在对异常抛出函数进行不需要捕捉异常的处理，一般不建议用try!,后期容易出现问题
        print("即将开始测试")
        do {
            try errorTest(by: 0)
        } catch  {
            print("--测试---中")
        }
        print("测试结束")
        
        
        let p: Person = Person(name: "HH", age: 13, title: "DDDD")
        print("\(String(describing: p.name)) \(p.age) \(String(describing: p.title))")
        print(Person.propertyList())
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
        
        //#测试代码
        
        
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
         逃逸闭包
         当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行  我们就该称该闭包从函数中逃逸。
         当你定义接收的闭包作为参数的函数时，你可以在参数名之前标注@escaping，用来指明这个闭包时允许逃逸出这个函数的
         将这个闭包保存在一个函数外部定义的变量中。
         例子：很多启动异步操作的函数接受一个闭包参数作为completion Handler
         这类函数会在异步操作开始之后立刻返回 但是闭包知道异步操作结束后z才会被调用
         */
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        instance.completionHandlers.first?()
        print(instance.x)
        /*
         自动闭包：是一种自动创建的闭包，用于包装传递给函数作为参数的表达式
         这种闭包不接受任何参数，当它被调用时，会返回被包装在其中表达式的值
         这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包
         
         自动闭包让你能够延迟求值，因为知道你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用和高计算成本的代码说是很有益处的，因为它使得你能控制代码的执行时机
         */
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        let customerProvider = {customersInLine.remove(at: 0)}
        print(customersInLine.count)
        print("Now serving\(customerProvider())")
        print(customersInLine.count)
        //自动闭包与逃逸闭包的混合使用
        var customerProviders: [() -> String] = []
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        
        print("Collected \(customerProviders.count) closures.")
        // 打印 "Collected 2 closures."
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        
        Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +)
        print(Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +))
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
    
    func errorTest(by num:Int)throws -> String {
        switch num {
        case 0:
            throw numTest._0
        case 1:
            throw numTest._1
        case 2:
            throw numTest._2
        case 3:
            throw numTest._3
        case 10:
            throw numTest.nothing
        default:
            return "OK" + "\(num)"
        }
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
