//
//  ImageHandleViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/12/3.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

class ImageHandleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultImage = UIImage(named: "");
        let image: UIImage = UIImage(named:"penguin_walk01") ?? defaultImage;
        
        // Do any additional setup after loading the view.
        hanleImage(image:image), size:cgsi , backColor: <#T##UIColor?#>)
    }
    /// 处理图片
    ///
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - size: <#size description#>
    ///   - backColor: <#backColor description#>
    /// - Returns: <#return value description#>
    func hanleImage(image: UIImage, size: CGSize,backColor: UIColor?) -> UIImage? {
        let rect = CGRect(origin: CGPoint(), size: size)
        //上下文
        UIGraphicsBeginImageContextWithOptions(size, true, 0);
          //背景色填充
        backColor?.setFill()
        UIRectFill(rect)
          //实例化路径 截切 后续的绘图都会出现在路径内部 其他全部干掉
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
           //绘制边线
        UIColor.darkGray.setStroke()
           path.lineWidth = 2
           path.stroke()
        //绘图
        image.draw(in: rect)
        //取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回结果
        return result ;
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
