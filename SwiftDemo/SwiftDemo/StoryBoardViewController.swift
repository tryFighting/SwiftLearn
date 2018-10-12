//
//  StoryBoardViewController.swift
//  SwiftDemo
//
//  Created by zrq on 2018/10/12.
//  Copyright © 2018年 zrq. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices
class StoryBoardViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

   
    @IBOutlet weak var imageV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    /// 发送多媒体资料
    ///
    /// - Parameter sender: 触发动作的控件
    @IBAction func send(_ sender: Any) {
        let im: UIImage = imageV.image!
        let controller = UIActivityViewController(activityItems: [im], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        
    }
    /// 拍照
    ///
    /// - Parameter sender: 拍照
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.showsCameraControls = true
        self.present(imagePicker, animated: true, completion: nil)
        
        
    }
    

    /// 相册
    ///
    /// - Parameter sender: 相册
    @IBAction func album(_ sender: Any) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.present(pickerC, animated: true, completion: nil)
        
    }
    //FIXME代理方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //as向上转型  as?/as!向下转型 as?可返回nil as!不可返回nil
        let imagePickerC = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageV.image = imagePickerC
        self.dismiss(animated: true, completion: nil)
    }
    func image(_ image: UIImage, didFinishSavingWithError error: NSErrorPointer?, contextInfo: UnsafeRawPointer){
        if(error != nil){
            print("ERROR IMAGE \(error.debugDescription)")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
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
