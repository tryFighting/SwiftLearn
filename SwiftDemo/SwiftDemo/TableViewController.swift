//
//  TableViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/9/30.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var mytableview :UITableView!
    var dataSource = ["123","456"]
    internal var nameString: String?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath))
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置该属性让contentview的x起点从navigationbar下面开始即x:64  rawValue初始化
        self.edgesForExtendedLayout  = .init(rawValue: 0)
        mytableview = UITableView(frame: self.view.bounds, style: .plain)
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view .addSubview(mytableview)
        
        print(sum(x: 10, y: 20))
        print(sum1(num1: 60, num2: 70))
        print(sum2(70, 80))
        
        print(defaultSum())
        print(defaultSum(x: 10, y: 10))
        print(defaultSum(x: 20))
        print(defaultSum(y: 10))
        
        ///闭包函数调用无参数无返回值
        let a = {
            print("hello world")
        }
        a()
        /// 函数闭包有参数有返回值
        let  b = {
            (x :Int,y: Int) in
            return print(x + y)
        }
        b(10,20)
        
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            DispatchQueue.main.async {
                print("刷新UI\(Thread.current)")
            }
        }
        loadData { (result) in
            print(result)
        }
        
    }
    func loadData(completion: (_ result: [String])->()) -> () {
        let json = ["ssss","xxxx"]
        completion(json)
        
    }
    /// 函数值默认值调用
    ///通过给参数设置默认值，可以组合调用，不传参，传默认
    func defaultSum(x :Int = 1,y: Int = 2) -> Int {
        return x + y
    }
    /// 函数调用求和
    ///形参使用 _ 可以代替一切
    func sum2(_ x:Int,_ y: Int) -> Int {
        return x + y
    }
    func sum1(num1 x: Int, num2 y: Int) -> Int {
        return x + y
    }
    func sum(x: Int,y: Int) -> Int {
        return x + y
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
