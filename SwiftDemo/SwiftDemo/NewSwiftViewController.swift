//
//  NewSwiftViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2019/8/6.
//  Copyright © 2019 zrq. All rights reserved.
//

import UIKit

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
        self.learnArr = ["常用的几个高阶函数","高阶函数扩展","优雅的判断多个值中是否包含某一值","Hashable,Equatable和Comparable协议","可变参数函数"]
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
        
    }else if learnIndex == 3{
        
    }else if learnIndex == 4{
        
    }else if learnIndex == 5{
        
    }else if learnIndex == 6{
        
    }else if learnIndex == 7{
        
    }
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
