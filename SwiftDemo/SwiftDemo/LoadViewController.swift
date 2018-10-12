//
//  LoadViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/12.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
/*
 KVC构造函数与便利构造函数的异同
 KVC构造函数在调用KVC方法之前，需要优先调用super,保证对象被实例化之后，才能给对象发送消息
 基本数据类型不能是可选类型，不能设置private
 
 便利构造函数允许返回nil
 判断给定的参数是否符合条件，如果不符合条件直接返回nil，不会创建新对象，节省内存开销
 正常的便利构造函数需要访问对象的属性，需要在self.init()之后调用，确保该对象实例化完成
 */
class LoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadbaiduData()
        // Do any additional setup after loading the view.
        ///便利构造函数 正常的构造函数一定会创建对象  便利构造函数，条件不满足直接返回nil,将不再创建对象，节省内存开销
        let p = Person(name: "老万", age: 18)
        print("\(p?.name)\(p?.age)")
        
        /*
         便利构造函数创建控制n避免写冗余的代码
         
         */
       let btn =  UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 30), title: "我爱你中国", backColor: UIColor.red)
        view .addSubview(btn)
        /*
         创建多个控件值时可以使用快捷键 command + control + e
         使用方法：copy 一段复用代码
         注释前面复用代码
         找到控件变量名按下快捷键直接变更变量名
         打开前面的变量就OK
         */
        let btn2 =  UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 30), title: "我爱你中国", backColor: UIColor.red)
        view .addSubview(btn2)
        
        
        
    }
    
    /// URL的构造函数可以返回nil,构造函数就是要实例化对象
    ///OC中闭包所有的参数需要自己写，swift需要自己写 忽略的参数用_代替
    func loadbaiduData() -> () {
        let url = URL(string: "https://www.baidu.com/")
        
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            guard let data = data
                else{
                    print("\(String(describing: error))")
                    return
            }
            let html = String(data: data, encoding: .utf8)
            print(html)
        }.resume()
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
