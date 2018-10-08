//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by zrq on 2018/6/14.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("Hello,World!")
        array()
        set()
        dictionary()
        closures() //TODO:闭包操作
        return true
    }
    /// 闭包操作
    func backWard(_ s1:String,_ s2: String) -> Bool {
        return s1 > s2
    }
    func some(closures: () -> Void)  {
        
    }
    func closures() -> () {
       //闭包表达式
        //单表达式闭包隐式返回
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        let reversedNames = names.sorted { (s1, s2) -> Bool in
            s1 > s2
        }
        print(reversedNames)
        
        
//        let  reverseNames = names.sorted(by: backWard)
//        print(reverseNames)
    }
    /// 集合类型操作 Array,Sets,Dictionarues
    func array() -> () {
        var array = ["a","b","c"]
        let add = ["1","2"]
        array.append("d")
        array.reverse()
        array.removeFirst()
        array += add
        print(array)
        //数组的遍历
        for item in array {
           print(item)
        }
        for (index,value) in array.enumerated() {
            print("Item\(String(index + 1)):\(value)")
        }
    }
    func set() -> () {
        var  letters = Set<Character>()
        letters.insert("a")
        print(letters)
        letters = []
        print(letters)
        var favoriteGenres: Set<String> = ["Rock","Classical","Hi hop"]
        favoriteGenres.insert("Jazz")
        print(favoriteGenres)
        favoriteGenres.removeFirst()
        print(favoriteGenres)
        //遍历集合
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        //集合基本操作
        let oddDigit :Set = [1,3,5,7,9]
        let evenDigit :Set = [0,2,4,6,8]
        let signle :Set = [2,3,5,7]
       let b = oddDigit.union(evenDigit).sorted()
        print(oddDigit)
      let c =  oddDigit.intersection(evenDigit).sorted()
       let a = oddDigit.subtracting(signle).sorted()
        print("\(a),\(b),\(c)")
        //集合成员关系操作
        let houseAnimals :Set = ["🐶","🐱"]
        let farm :Set = ["🐂","🐔","🐑","🐶","🐱"]
        let city :Set = ["🐦", "🐭"]
       let e = houseAnimals.isSubset(of: farm)
        let f = farm.isSuperset(of: houseAnimals)
        let g = farm.isDisjoint(with: city)
        print("\(e),\(f),\(g)")
    }
    func dictionary() -> () {
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        if airports.isEmpty{
            
        }else{
            
        }
        airports["LHR"] = "London"
        for (code,Name) in airports {
            print("\(code):\(Name)")
        }
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

