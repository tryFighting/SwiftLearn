//
//  DataStructViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2019/1/15.
//  Copyright © 2019年 zrq. All rights reserved.
//

import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class List {
    var head: ListNode?
    var tail: ListNode?
    ///尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        }else{
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    ///头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        }else{
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}
class DataStructViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///
        view.backgroundColor = UIColor.red
        
    }
    ///尾插法
//    func getLeftList(_ head: ListNode?,_ x: Int) -> ListNode? {
//        let dummy = ListNode(0)
//        
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
