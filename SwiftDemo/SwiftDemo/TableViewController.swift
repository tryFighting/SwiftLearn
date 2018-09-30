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
        //设置该属性让contentview的x起点从navigationbar下面开始即x:64
        self.edgesForExtendedLayout  = .init(rawValue: 0)
        mytableview = UITableView(frame: self.view.bounds, style: .plain)
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view .addSubview(mytableview)
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
