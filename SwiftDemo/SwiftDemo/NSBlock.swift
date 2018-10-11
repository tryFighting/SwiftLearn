//
//  NSBlock.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/9.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

/// 弄清楚重载与重写的含义
/*
 重载（overload）:方法名相同，参数个数不同
 重写 (override): 含有override关键字 需要在初始化属性后调用父类的方法
 */
class NSBlock: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        ///block与队列的使用
        demo1()
        //alertviewcontroller的使用方法
       demo2()
        super.viewDidLoad()
}
    func demo2() -> () {
        let arr = ["alert Alert","show Action Sheet","Alert with form"]
        for (index,value) in arr.enumerated() {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 100, y: (index + 1) * 50, width: 200, height: 30)
            btn.backgroundColor = UIColor.red
            btn.setTitle(value, for: .normal)
            btn.tag = index
            view .addSubview(btn)
            btn .addTarget(self, action: #selector(btnAct), for: .touchUpInside)
            
        }
    }
    @objc func btnAct(_ sender :UIButton){
        if sender.tag == 0 {
            let alertController = UIAlertController(title: "my title", message: "This is an alert", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
                print("you have pressed the Cancel button")
            }
            alertController.addAction(cancelAction)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                print("you have pressed OK BUTTON")
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
                //弹出控制器做的处理
            }
            
            
            
        }else if sender.tag == 1{
            //sheet
            let alertController = UIAlertController(title: "my title", message: "This is an alert", preferredStyle: UIAlertControllerStyle.actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
                print("you have pressed the Cancel button")
            }
            alertController.addAction(cancelAction)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                print("you have pressed OK BUTTON")
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
                //弹出控制器做的处理
            }
            
        }else if sender.tag == 2{
            //alert表单
            let alertController = UIAlertController(title: "My Title", message: "This is an alert", preferredStyle:UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                print("you have pressed the Cancel button");
            }
            alertController.addAction(cancelAction)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                let userName = alertController.textFields![0].text
                let password = alertController.textFields![0].text
                self.doSomething(userName, password: password)
            }
            alertController.addAction(OKAction)
            alertController.addTextField { (textField :UITextField!) in
                textField.placeholder = "User Name"
                textField.isSecureTextEntry = false
            }
            alertController.addTextField { (textField :UITextField!) in
                textField.placeholder = "password"
                textField.isSecureTextEntry = true
            }
            self.present(alertController, animated: true) {
                //your code 
            }
        }
    }
    @objc func doSomething(_ userName: String?, password: String?) {
        print("username: \(userName ?? "")  password: \(password ?? "")")
    }
    /// block与队列的使用
    func demo1() -> () {
        let queue = OperationQueue()
        let operation1 :BlockOperation = BlockOperation(block: {
            ///得到web地址
            self.getWebs()
            let operation2 :BlockOperation = BlockOperation(block: {
                ///加载web页面
                self.loadWebs()
            })
            queue.addOperation(operation2)
        })
        queue.addOperation(operation1)
    }
    func loadWebs(){
        var urls = [URL(string:"http://www.google.es")!,
                    URL(string: "http://www.apple.com")!,
                    URL(string: "http://carlosbutron.es")!,
                    URL(string: "http://www.bing.com")!,
                    URL(string: "http://www.yahoo.com")!]
        //        urls.addObjects(from: googlewebs as [AnyObject])
        for url in urls{
            /// NSData(contentsOfURL:iterator as! NSURL)
            print("Downloaded \(url)")
        }
    }
var googlewebs = [URL]()

func getWebs() -> () {
    let languages = ["com","ad","ae","com.af",
                     "com.ag","com.ai","am","co.ao",
                     "com.ar","as","at"]
    var languageWebs = [URL]()
    for language in languages {
        let webString = "http://www.google.\(language)"
        languageWebs.append(URL(fileURLWithPath: webString))
    }
    print(languageWebs)
    googlewebs = languageWebs
}
}
