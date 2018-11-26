//
//  JLViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/11/23.
//  Copyright © 2018年 jl.cn. All rights reserved.
//

import UIKit
///用数组实现栈
class Stack {
    var stack : [AnyObject]
    
    
    init() {
        stack = [AnyObject]()
    }
    
    
}
class JLViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       ///数组基本应用
        let nums = [1,2,3]
        let num = [Int](repeating: 0, count: 5)
        //print(nums,num)
        
        ///声明一个可以修改的数组
        var mutableNums = [3,1,2]
        mutableNums.append(4)
        mutableNums.sort()
        mutableNums.sort(by:>)
        ///为数组预留空间，防止数组在增加和删除元素时反复申请空间或创建新数组，特别适用于创建和removeAll()时候进行调用，为整段代码提高性能的作用
        mutableNums.reserveCapacity(10)
       
        
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
