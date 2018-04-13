//
//  ImageViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/2.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import Photos

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Life Cycle
    var button: UIButton!
    var photoButton: UIButton!
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        transferALAssetToNSData()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension ImageViewController {
    fileprivate func setUI() {
        self.title = "ImageViewController"
        self.view.backgroundColor = UIColor.white
        
        
        self.button = UIButton(type: .custom)
        self.button.addTarget(self, action: #selector(takePhoto(_:)), for: .touchUpInside)
        self.button.setTitle("拍照", for: .normal)
        self.button.backgroundColor = UIColor.orange
        self.view.addSubview(self.button)
        /// 创建约束
        self.button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(100)
        }
        
        self.photoButton = UIButton(type: .custom)
        self.photoButton.addTarget(self, action: #selector(photoLibrary(_:)), for: .touchUpInside)
        self.photoButton.setTitle("打开相册", for: .normal)
        self.photoButton.backgroundColor = UIColor.orange
        self.view.addSubview(self.photoButton)
        /// 创建约束
        self.photoButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(200)
        }
        
        self.imageView = UIImageView.init()
        self.imageView.backgroundColor = UIColor.lightGray
        self.imageView.contentMode = .scaleAspectFit
        self.view.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.width.height.equalTo(100)
            make.bottom.equalTo(-15)
        }
    }
    
    ///点击照相
    @objc func takePhoto(_ button : UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            ///创建图片控制器
            let picker = UIImagePickerController()
            ///设置代理
            picker.delegate = self;
            ///设置来源
            picker.sourceType = .camera
            ///允许编辑
            picker.allowsEditing = true
            ///默认打开前置摄像头
            if UIImagePickerController.isCameraDeviceAvailable(.front) {
                picker.cameraDevice = .front
            }
            ///设置闪光灯
            picker.cameraFlashMode = .on
            ///打开相机
            self.present(picker, animated: true) {
            }
            
        } else {
            UIAlertController.showAlert(message: "找不到相机", afterTime: 2, in: self)
        }
    }
    
    ///点击打开照片
    @objc func photoLibrary(_ button: UIButton) {
        _ = authorizePhotoLibray()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true) {
                
            }
            
        } else {
            UIAlertController.showAlert(message: "读取相册错误", afterTime: 2, in: self)
        }
    }
    
    ///选择图片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image: UIImage!
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    /// 判断相册的权限
    func authorizePhotoLibray() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            return true
        case .notDetermined:
            print("未授权")
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async(execute: {
                    _ = self.authorizePhotoLibray()
                })
            }
        default:
            DispatchQueue.main.async {
                UIAlertController.showConfirm(message: "点击“设置”，允许访问您的照片", in: self, confirm: { (alert) in
                    let url = URL(string: UIApplicationOpenSettingsURLString)
                    if let url = url, UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10, *) {
                            UIApplication.shared.open(url, options: [:],
                                                      completionHandler: {
                                                        (success) in
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                })
                
            }
            return false
        }
        return false
    }
    
    /// 判断麦克风的权限
    func authorizeAudio() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        switch status {
        case .authorized:
            return true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) { (status) in
                DispatchQueue.main.async {
                    _ = self.authorizeAudio()
                }
            }
        default:
            DispatchQueue.main.async {
                UIAlertController.showConfirm(message: "点击“设置”，允许访问您的麦克风", in: self, confirm: { (alert) in
                    let url = URL(string: UIApplicationOpenSettingsURLString)
                    if let url = url, UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10, *) {
                            UIApplication.shared.open(url, options: [:],
                                                      completionHandler: {
                                                        (success) in
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                })
                
            }
            return false
        }
        return false
    }
}

// MARK: - Action
extension ImageViewController {
    fileprivate func transferALAssetToNSData() {
        
        
    }
}

// MARK: - Network
extension ImageViewController {
    
}

// MARK: - Delegate Internal

// MARK: -

// MARK: - Delegate External

// MARK: -

// MARK: - Helper
extension ImageViewController {
    
}

// MARK: - Other
extension ImageViewController {
    
}

// MARK: - Public
extension ImageViewController {
    
}

