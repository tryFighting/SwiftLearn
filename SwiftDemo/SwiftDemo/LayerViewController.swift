//
//  LayerViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2019/3/14.
//  Copyright © 2019年 zrq. All rights reserved.
//

import UIKit

class LayerViewController: UIViewController {
    lazy var layerView: UIView = {
        let layerView = UIView.init(frame: CGRect(x: 50.0, y: 50.0, width: 200.0, height: 200.0))
        layerView.backgroundColor = UIColor.red
        return layerView;
    }()
    var blueLayer: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(layerView)
        blueLayer = CALayer.init()
        guard let blueLayer = blueLayer else {
            return
        }
        blueLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var point = touches.first?.location(in: view)
        let layer = layerView.layer.hitTest(point!)
        if layer == blueLayer {
            let alertController = UIAlertController(title: "提示", message: "layer层的提示", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController,animated: true,completion: nil)
        }
        
    }

}
/*
 {
 var point = touches.first?.location(in: view)
 point = layerView.layer.convert(point!, from: view.layer)
 if layerView.layer.contains(point!) {
 point = blueLayer?.convert(point!, from: layerView.layer)
 
 if blueLayer!.contains(point!){
 let alertController = UIAlertController(title: "提示", message: "layer层的提示", preferredStyle: UIAlertControllerStyle.alert)
 let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
 let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
 alertController.addAction(cancelAction)
 alertController.addAction(okAction)
 present(alertController,animated: true,completion: nil)
 }
 }
 
 }
 */
