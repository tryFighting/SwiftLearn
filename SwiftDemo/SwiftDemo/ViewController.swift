//
//  ViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/6/14.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
///当使用枚举或者结构体实现Togglable协议时，需要d提供一个带有mutating前缀的方法
enum onOffSwitch:  Togglable{
    case off,on
   mutating func toggle() {
    switch self {
    case .off:
        self = .on
    case .on:
        self = .off
    }
    }
}
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
///确保边长相同
class TriangleAndSquare {
    var traiangle: EquatabteralTraiangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet{
            traiangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double,name: String) {
        square = Square(sideLength: size, name: name)
        traiangle = EquatabteralTraiangle(sideLength: size, name: name)
    }
    
}
///除了储存简单的属性之外，属性可以有getter和setter
class EquatabteralTraiangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue/3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}
class Circle: NamedShape {
    var radius: Double
    var nameString: String
    init(radius: Double,nameString: String,name:String) {
        self.radius = radius
        self.nameString = nameString
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return radius * radius * Double.pi
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(radius)."
    }
}
class Square: NamedShape {
    var sideLength: Double
    init(sideLength:Double,name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}
///构造函数来初始化类实例
class NamedShape  {
    var numberOfSides: Int = 0
    var name: String
    /// 重载函数
    ///
    /// - Parameter name: name属性
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visview()//TODO:添加视图
        
        demo2()//FIXME:通知的使用
    }
    func demo2() -> () {
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue: "isTest"), object: nil)
    }
    @objc func test(noti :Notification){
        let str = noti.userInfo!["post"]
        print(String(describing: str!) + "this notifi")
        
    }
    /// 出发通知
    ///
    /// - Parameters:
    ///   - touches: 触摸对象
    ///   - event: 触摸事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
    }
    func visview() {
        typealias AudioSample = UIView   //FIXME 支持类型别名
        let v = AudioSample(frame:CGRect(x: 20, y: 100, width: 200, height: 200))
        v.backgroundColor = UIColor.red
        view .addSubview(v) //TODO:swift4.0添加视图
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        btn.setTitle("我的按钮", for: .normal)
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.backgroundColor = UIColor.yellow
        btn .addTarget(self, action: #selector(click), for: .touchUpInside)
        v .addSubview(btn)
    }
    @objc func click(sender :UIButton) -> () {
        print(sender)
    }
    func practice0() -> () {
        //swift简单练习
        //self.practice()
        //函数和闭包
        let result:String = greet(person: "Bob", day: "Tuesday")
        print(result)
        //使用元组来让一个函数返回多个值
        let statistics = calculateStatistucs(scores: [5,3,100,3,9])
        print(statistics)
        //函数可以带有可变个数的参数，这些参数在函数内部表现为数组的形式
        var re:Int = sumOf()
        re = sumOf(numbers: 42,597,12)
        print(re)
        //嵌套函数
        re = returnFifteen()
        print(re)
        //调用函数--函数可以作为另一个函数的返回值
        let increment = makeIncrementer() //  TODO:待修改
        re = increment(7)
        print(re,increment)             //FIXME:改变
        //函数也可以当做参数传入另一个函数
        let  numbers = [20,19,7,12]
        let isMatch = hasAnyMatches(list: numbers, condition: lessThanTen)
        print(isMatch)
        //函数实际上是一种特殊的闭包,它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数，即使闭包是在一个不同的作用域被执行的
        numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        let mappedNumbers = numbers.map({number in 3*number})
        print(mappedNumbers)
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescription()
        print(shapeDescription)
        let test = Square(sideLength: 5.2, name: "my test square")
        let area = test.area()
        let des = test.simpleDescription()
        print(area,des)
        
        //circle
        let circle = Circle(radius: 5, nameString: "校园", name: "my test circle")
        let c1 = circle.area()
        let c2 = circle.simpleDescription()
        print(c1,c2,circle.nameString)
        /*
         类构造器执行了三步
         1.设置子类声明的属性
         2.调用父类的构造器
         3.改变父类定义的属性值,其他的工作比如调用方法，getter和setter也可以在这个阶段完成
         */
        var triangle = EquatabteralTraiangle(sideLength: 3.1, name: "a triangle")
        print(triangle.perimeter)//getter
        triangle.perimeter = 9.9
        print(triangle.sideLength)
        
        //约定两个类属性相同
        var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
        print(triangleAndSquare.square.sideLength,triangleAndSquare.traiangle.sideLength)
        triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
        print(triangleAndSquare.traiangle.sideLength)
        
        //处理变量的可选值 可以在操作（方法，属性和子脚本）之前加？,如果？之前的东西是nil,?后面的都会被忽略
        //否则后面的东西会被执行
        let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
        let sideLength = optionalSquare? .sideLength
        print(optionalSquare,sideLength)
        
        //
        let ace = Rank.jack
        let aceRawValue = ace.rawValue
        print(ace,aceRawValue)
    }
func greet(person:String,day:String) -> String {
        return "Hello \(person),today is \(day)."
    }
    func hasAnyMatches(list: [Int],condition: (Int) ->Bool) -> Bool {
        for item in list {
            if condition(item){
                return true
            }
        }
        return false
    }
    //条件函数
    func lessThanTen(number:Int) -> Bool {
        return number < 10
    }
    //函数是第一等类型，这意味着函数可以作为另一函数的返回值
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) ->Int{
        return 1 + number;
        }
        return addOne
    }
    func calculateStatistucs(scores: [Int]) -> (min: Int,max: Int,sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score > max{
                max = score
            }else if score < min{
                min = score
            }
            sum += score
        }
        
       return(min,max,sum)
    }
    func returnFifteen() -> Int {
        var y = 10
        func add(){
            y += 5
        }
        add()
        return y
    }
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
func practice(){
        //简单值
        var myVariable = 42
        myVariable = 50
        let myConstant = 42
        print(myVariable,myConstant)
        let implicitInteger = 70
        let implicitDouble = 70.0
        let explicitDouble : Double = 70
        let label = "The width is"
        let width = 94
        let widthLabel = label + String(width)
        print(widthLabel)
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitsSummary = "I have \(apples + oranges) pieces of fruit."
        print(appleSummary,fruitsSummary)
        //使用方括号创建数组和字典，并使用下标或key来访问元素
        var shoppingList = ["catfish","water","tulips","bule paint"]
        shoppingList[1] = "bootle of water"
        print("%@",shoppingList)
        var occupations = [
            "Malcolm":"Captain",
            "Keylee":"Mechanic",
            ]
        occupations["Jayne"] = "Public Relations"
        print(occupations)
        
        //控制流
        let individualScores = [75,43,103,87,12]
        var teamScore = 0
        for score in individualScores {
            if score > 50{
                teamScore += 3
            }else{
                teamScore += 1
            }
        }
        print(teamScore)
        var optionalString:String? = nil
        print(optionalString == nil)
        var optionalName:String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }
        //练习
        let nickName:String? = nil
        let fullName:String = "John"
        let informalGreeting = "Hi\(nickName ?? fullName)"
        print(informalGreeting)
        //switch支持任意类型的数据以及各种操作
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber","watercress":
            print("That would make a good tea sandwich")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy\(x)")
        default:
            print("Everything tastes good in soup.")
        }
        
        let interestingNumbers = [
            "Prime":[2,3,5,7,11,13],
            "Fibonacci":[1,1,2,3,5,8],
            "Square":[1,4,9,16,15]
        ]
        var largest = 0
        var last:String = ""
        for (kind,numbers) in interestingNumbers {
            print(kind,numbers)
            for number in numbers{
                if number > largest{
                    largest = number
                    last = kind
                }else{
                    print(kind)
                }
            }
        }
        print(last,largest)
        ///while 循环
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat {
            m = m * 2
        }while m < 100
        print(m)
        //..<表示范围
        var total = 0
        for i in 0..<4{
            total += i
        }
        print(total)
    }
/*归并排序是创建在归并操作的一种有效排序方法，效率为O(Nlogn),1945年由约翰.冯.诺依曼提出，该算法是采用分治法的一个非常典型的应用
*/
    //归并排序
    func mergeSort(_array:Array<Int>) -> Array<Int> {
       //将数组中的每一个元素放入一个数组中
        var tempArray :Array<Array<Int>> = []
        for item in _array {
            var subArray:Array<Int> = []
            subArray.append(item)
            tempArray.append(subArray)
            
        }
        //对这个数组中的数组进行合并,直到合并完毕为止
        while tempArray.count != 1 {
            var i = 0
            while i < tempArray.count - 1 {
                tempArray[i] = _mergeArray(tempArray[i], tempArray[i + 1])
                tempArray.remove(at: i + 1)
                i = i + 1
            }
        }
        return tempArray.first!
    }
    //将两个有序数组进行合并
    func _mergeArray(_ firstArray: Array<Int>, _ secondArray: Array<Int>) -> Array<Int> {
        var resultArray: Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        
        while firstIndex < firstArray.count && secondIndex < secondArray.count {
            if firstArray[firstIndex] < secondArray[secondIndex] {
                resultArray.append(firstArray[firstIndex])
                firstIndex += 1
            } else {
                resultArray.append(secondArray[secondIndex])
                secondIndex += 1
            }
        }
        
        while firstIndex < firstArray.count {
            resultArray.append(firstArray[firstIndex])
            firstIndex += 1
        }
        
        while secondIndex < secondArray.count {
            resultArray.append(secondArray[secondIndex])
            secondIndex += 1
        }
        
        return resultArray
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

