//
//  AnimationViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/11.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    var penguinView: UIImageView!
    @objc var frames: NSArray?
    var dieCenter: CGPoint?
    override func viewDidLoad() {
        super.viewDidLoad()
        penguinView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view .addSubview(penguinView)
        let image1 = UIImage(named: "penguin_walk01")!
        let image2 = UIImage(named:"penguin_walk02")!
        let image3 = UIImage(named:"penguin_walk03")!
        let image4 = UIImage(named:"penguin_walk04")!
        let frames: [UIImage] = [image1, image2, image3, image4]
        
        penguinView.animationDuration = 0.15
        penguinView.animationRepeatCount = 2
        penguinView.animationImages = frames
        penguinView.image = image1
        //walk right
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(AnimationViewController.walkRight(_:)))
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        view .addGestureRecognizer(swipeGestureRight)
        // Do any additional setup after loading the view.
    }
    @objc func walkRight(_ send: UIGestureRecognizer) -> ()  {
        print("walk right")
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
