//
//  NSBlock.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/9.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

class NSBlock: UIViewController {
    /// block与队列的使用
    override func viewDidLoad() {
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
        
        
        super.viewDidLoad()
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
