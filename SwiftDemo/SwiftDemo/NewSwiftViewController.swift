//
//  NewSwiftViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2019/8/6.
//  Copyright © 2019 zrq. All rights reserved.
//

import UIKit
enum ExceptionError: Error {
    case httpCode(Int)
}
class NewSwiftViewController: UIViewController {
    lazy var learnArr: Array<String> = {
        var arr = Array<String>()
        return arr
    }()
    lazy var swiftLearnTableView: UITableView = {
       let tab = UITableView(frame: CGRect(x: 0, y: 64, width: kScreentW, height: kScreentH), style: .plain)
        tab.delegate = self
        tab.dataSource = self
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift学习"
        self.view.addSubview(self.swiftLearnTableView)
        self.learnArr = ["常用的几个高阶函数","高阶函数扩展","优雅的判断多个值中是否包含某一值","Hashable,Equatable和Comparable协议","可变参数函数","where关键字","switch中判断枚举类型，尽量避免使用default","iOS9之后全局动态修改StatusBar样式","使用面向协议实现app的主题功能","Swift中多继承的实现"]
        self.swiftLearnTableView.reloadData()
    }
}
extension NewSwiftViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.learnArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.learnArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeMoveupWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.select(learnIndex: indexPath.row, body: self.learnArr[indexPath.row])
    }
}
extension NewSwiftViewController{
   fileprivate func select(learnIndex: Int,body: String){
    if learnIndex == 0 {
        ///高阶函数
        /// 1.排序函数
        let intArr = [12,34,24,45,23,4,89]
        var sortArr = intArr.sorted(by: >)
        sortArr.sort { (a, b) -> Bool in
            return a < b
        }
        print(sortArr)
        ///2.元素处理
        let map = intArr.map({$0 * $0})
        print(map)
        ///3.compactmap和map类似，可以过滤掉nil,还可以对可选类型进行解包
        let optionalArr = [nil,4,12,7,Optional(3),9]
        let compactArr = optionalArr.compactMap({$0})
        print(compactArr)
        ///4.filter将符合条件的元素重新组合成一个数组
        let evenArr = intArr.filter({$0 % 2 == 0})
        print(evenArr)
        ///5.reduce将数组中的元素合并成一个
        let stringArr = ["1","2","3","4","5"]
        let allStr = stringArr.reduce("", {$0+$1})
        print(allStr)
        ///6.高阶函数可以进行链式调用
        let chainArr = [4,3,5,8,6,2,4,7]
        let resultArr = chainArr.filter({$0 % 2 == 0}).map({$0 * $0}).reduce((0), {$0+$1})
        print(resultArr)
    }else if learnIndex == 1{
        ///高阶函数扩展--map函数实现原理详见extension
        ///数组用到的其他的一些高阶函数详见pet类
        var pets = [
            Pet(type: "dog", age: 5),
            Pet(type: "cat", age: 3),
            Pet(type: "sheep", age: 1),
            Pet(type: "pig", age: 3),
            Pet(type: "cat", age: 31),
        ]
        ///遍历所有元素
        pets.forEach { (p) in
            print(p.type)
        }
        ///找出是否包含满足条件的元素
        let cc = pets.contains(where: {$0.type == "cat"})
        print(cc)
        ///找出第一次出现满足条件元素的位置
        let firstIndex = pets.firstIndex(where: {$0.age == 3})
        let lastIndex = pets.lastIndex(where: {$0.age == 3})
        print(firstIndex,lastIndex)
        ///年龄从小道大
        let sortArr = pets.sorted(by: {$0.age < $1.age})
        sortArr.forEach { (p) in
            print(p.age)
        }
        //获取age大于3的元素
        let arr1 = pets.prefix(while: {$0.age > 3})
        print(arr1.count)
        ///获取age大于3的取反元素
        let arr2 = pets.drop(while: {$0.age > 3})
        print(arr2.count)
        ///字符串转为数组
        let line = "i love you china eve ry much"
        let wordArr = line.split(whereSeparator: {$0 == " "})
        print(wordArr)
    }else if learnIndex == 2{
        ///优雅的判断多个值是否含有一个值
        let string = "one"
        if string == "one" || string == "two" || string == "three"{
            print("含有某一个")
        }
        if ["one","two"].contains(where: {$0 == "one"}){
            print("one")
        }
        ///自己手动实现一个any
        if string == any(of: "one","two","three"){
            print("one")
        }
    }else if learnIndex == 3{
        ///Hashable,Equatable,Compareable协议
        let a1 = Animal(type: "Cat", age: 4)
        let a2 = Animal(type: "Dog", age: 1)
        let a3 = Animal(type: "Cat", age: 3)
        let a4 = Animal(type: "Cat", age: 10)
        ///从小到大排列
        let sortedAnimals = [a1,a2,a3,a4].sorted(by: <)
        sortedAnimals.forEach { (animal) in
            print(animal.type)
        }
        
        print(a1==a2)
        print(a1.hashValue)
    }else if learnIndex == 4{
        ///可变参数函数
        print([2,3,4,5,6].reduce((0), {$0+$1}))
        sumTotal(values: 1,2)
        ///也可以为UIView添加extension实现添加多个子控件
    }else if learnIndex == 5{
        ///where关键字的用法
        let arr = [1,2,3,4]
        for num in arr where num % 2 == 0{
            print(num)///打印偶数
        }
        do{
           try throwError()
        }catch ExceptionError.httpCode(let httpCode) where httpCode >= 500{
            print("server error")
        }catch{
            print("other error")
        }
        print([1,2,3,4].sum)
        ///为某些高阶函数的限定条件
        let names = ["John","IJ","Jack"]
        let firstName = names.first { (name) -> Bool in
            return name.first == "K"
        }
        print(firstName ?? "KONG")
        let contains = names.contains { (name) -> Bool in
            return name == "IJ"
        }
        print(contains)//TRUE
    }else if learnIndex == 6{
        ///switch中判断枚举类型，尽量避免使用default,后期添加新的枚举类型，忘记在switch处理，就会报错，这样可以提高代码的健壮性
    }else if learnIndex == 7{
        ///动态修改StatusBar样式
        //刷新window下的子控件
        UIApplication.shared.windows.forEach {
            $0.reload()
        }
    }else if learnIndex == 8{
        ///使用面向协议实现app的主题功能，修改所有UILabel文字的颜色
    }else if learnIndex == 9{
        ///Swift不支持多继承，可以通过协议实现多继承
    }else if learnIndex == 10{
        ///华丽的TableView刷新动效
    }else if learnIndex == 11{
        
    }else if learnIndex == 12{
        
    }else if learnIndex == 13{
        
    }else if learnIndex == 14{
        
    }else if learnIndex == 15{
        
    }
    
  }
    func sumTotal(values: Int...) ->Int{
        var result = 0
        values.forEach { (a) in
            result += a
        }
        return result
    }
}
// MARK: - map函数的实现原理,map的实现无非就是创建一个空数组，通过for循环遍历每个元素通过传入函数处理后添加到空数组中，只不过swift的实现更加高效一点
extension Sequence{
    //可以将一些公共功能注释为@inlineable,给编译器提供优化跨模块边界的泛型代码的选项
    @inlinable
    public func customMap<T>(_ transform: (Element) throws ->T) rethrows -> [T]{
        let initialCapacity = underestimatedCount
        var result = ContiguousArray<T>()
        ///因为知道元素的个数，所以一次性为数组申请完内存，避免重复申请
        result.reserveCapacity(initialCapacity)
        ///获取所有元素
        var iteractor = self.makeIterator()
        ///将元素通过参数处理后添加到数组中
        for _ in 0..<initialCapacity {
            result.append(try transform(iteractor.next()!))
        }
        ///如果还有剩下的元素，添加进去
        while let element = iteractor.next() {
            result.append(try transform(element))
        }
        return Array(result)
    }
}
///关于数组中用到的高阶函数
class Pet {
    let type: String
    let age: Int
    init(type: String,age: Int) {
        self.type = type
        self.age = age
    }
}
// MARK: - 自己手动实现一个any，需要遵守实现Equatable协议
extension NewSwiftViewController{
   private func any<T: Equatable>(of values: T...) -> EquatableValueSequence<T>{
        return EquatableValueSequence(values: values)
    }
    struct EquatableValueSequence<T: Equatable> {
        fileprivate let values:[T]
        static func == (lhs: EquatableValueSequence<T>,rhs: T) -> Bool{
            return lhs.values.contains(rhs)
        }
        static func == (lhs: T,rhs: EquatableValueSequence<T>) -> Bool{
            return rhs == lhs
        }
    }
}

///实现Hashable协议的方法后我们可以根据hashValue方法来获取该对象的哈希值，字典中的value的存储就是根据key的hashvalue,所以所有字典中的key都要实现Hashable协议
///实现Equatable协议就可以用等好进行比较了
///Comparable协议 基于Equatable基础上的Comparable类型，实现相关的方法进行比较
class Animal: Hashable,Equatable,Comparable{
    static func < (lhs: Animal, rhs: Animal) -> Bool {
        if lhs.age < rhs.age {
            return true
        }else{
            return false
        }
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        if lhs.type == rhs.type && lhs.age == rhs.age {
            return true
        }else{
            return false
        }
    }
    
    let type: String
    let age: Int
    init(type: String,age: Int) {
        self.type = type
        self.age = age
    }
    var hashValue: Int{
        return self.type.hashValue ^ self.age.hashValue
    }
}
///where用法
extension NewSwiftViewController{
    func throwError() throws{
        throw ExceptionError.httpCode(500)
    }
    ///限定泛型需要遵守的协议
    func genericFunctionA<S>(str: S) where S: ExpressibleByStringLiteral{
        print(str)
    }
    func genericFunctionB<S:ExpressibleByStringLiteral>(str: S){
        print(str)
    }
}
// MARK: - 为指定的类添加对应的协议扩展
extension Sequence where Element: Numeric{
    var sum: Element{
        var result: Element = 0
        for item in self {
            result += item
        }
        return result
    }
}
// MARK: - 刷新window下子控件
extension UIWindow{
    func reload(){
        subviews.forEach { (view) in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}





///使用工厂设计模式
typealias Animation = (UITableViewCell,IndexPath,UITableView) -> Void
enum AnimationFactory {
    ///淡入效果
    static func makeFade(duration: TimeInterval,delayFactor: Double) ->Animation{
        return {cell,indexpath,_ in
            cell.alpha = 0
            UIView.animate(withDuration: duration, delay: delayFactor * Double(indexpath.row), animations: {
                cell.alpha = 1
            })
        }
    }
    ///弹簧效果
    static func makeMoveupWithBounce(rowHeight: CGFloat,duration: TimeInterval,delayFactor: Double) -> Animation{
        return {
            cell,indexpath,tableview in
             cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexpath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    ///侧入
    static func makeSlideIn(duration: TimeInterval,delayFactor: Double) -> Animation{
        return {
            cell,indexpath,tableview in
            cell.transform = CGAffineTransform(translationX: tableview.bounds.width, y: 0)
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexpath.row),
                options: [.curveEaseOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    ///弹簧淡入
    static func makeMoveupWithFade(rowHeight: CGFloat,duration: TimeInterval,delayFactor: Double) -> Animation{
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
}
final class Animator{
    private var hasAnimatedAllCells = false
    private let animation: Animation
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    func animate(cell: UITableViewCell,at indexPath: IndexPath, in tableView: UITableView) -> Void {
        guard !hasAnimatedAllCells else {
            return
        }
        animation(cell,indexPath,tableView)
        ///确保每个cell动画只执行一次
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}
extension UITableView{
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndex = indexPathsForVisibleRows?.last else { return false }
        return lastIndex  == indexPath
    }
}
