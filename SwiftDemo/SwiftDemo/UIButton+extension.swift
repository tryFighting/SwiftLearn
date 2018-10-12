//
//  UIButton+extension.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/12.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
extension UIButton{
    convenience init(frame: CGRect,title: String,backColor: UIColor) {
        self.init()
        self.frame = frame
        self.setTitle(title, for: .normal)
        self.backgroundColor = backColor
    }
}
