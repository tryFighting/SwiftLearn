//
//  Protocal.swift
//  SwiftDemo
//
//  Created by zrq on 2018/11/1.
//  Copyright © 2018年 zrq. All rights reserved.
//

import Foundation
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
/*
 协议定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法，属性以及其他需要的东西
 */
/// 协议的一般形式

protocol SomeProtocol {
    //这里是协议定义内容
    var a: Int{ get set}//读写属性
    var b: Int{ get }//只读属性
    ///遵循协议的类型实现指定的构造器
    init(someParameter: Int)
}
protocol FullyNamed {
    var fullName: String{ get }
    
}

struct Perso: FullyNamed {
    var fullName: String
}
class StarShip: FullyNamed {
    
    var prefix: String?
    var name: String
    init(name: String,prefix: String?=nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix!+" ":" ")+name
    }
    
    
}
protocol Togglable {
    mutating func toggle()
}
class SomeClas:  SomeProtocol{
    var a: Int

    var b: Int


    //遵循协议，需要加上required,继承父类需要加上override
    required init(someParameter: Int) {
        //这里是构造器的实现部分
          self.a = someParameter
          self.b = someParameter
    }


}
/// 协议作为类型
/*
 协议可以像其他类型一样使用
 作为函数，方法或构造器中的参数类型或返回值类型
 作为常量，变量或属性的类型
 作为数组，字典或其他容易中的元素类型
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int,generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random()*Double(sides))+1
    }
}
///委托代理模式
/*
 委托是一种设计模式，它允许类或结构体将一些需要他们负责的功能委托给其他类型的实例
 委托模式可以用来响应特定的动作，或者接收外部数据提供的数据，而无需关心外部数据源的类型
 */
protocol DiceGame {
    var dice: Dice {get}
    func play()
}
/// 两个基于骰子游戏的协议
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame,didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
