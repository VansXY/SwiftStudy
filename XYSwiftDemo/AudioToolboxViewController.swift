//
//  AudioToolboxViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/4/13.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import AudioToolbox

/*
 系统声音服务支持如下三种类型：
 （1）声音：立刻播放一个简单的声音文件。如果手机静音，则用户什么也听不见。
 （2）提醒：播放一个声音文件，如果手机设为静音或震动，则通过震动提醒用户。
 （3）震动：震动手机，而不考虑其他设置
 */

class AudioToolboxViewController: UIViewController {

    // MARK: - Life Cycle
    var systemSoundButton: UIButton!
    var systemAlertButton: UIButton!
    var systemVibrationButton:UIButton!
    var isPlaying = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension AudioToolboxViewController {
    fileprivate func setUI() {
        
        self.title = "AudioToolboxVC"
        self.view.backgroundColor = UIColor.white
        
        self.systemSoundButton = UIButton(type: .custom)
        self.systemSoundButton.addTarget(self, action: #selector(sound(_:)), for: .touchUpInside)
        self.systemSoundButton.setTitle("声音播放", for: .normal)
        self.systemSoundButton.backgroundColor = UIColor.gray
        self.view.addSubview(self.systemSoundButton)
        /// 创建约束
        self.systemSoundButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(100)
        }
        
        self.systemAlertButton = UIButton(type: .custom)
        self.systemAlertButton.addTarget(self, action: #selector(systemAlert(_:)), for: .touchUpInside)
        self.systemAlertButton.setTitle("提醒", for: .normal)
        self.systemAlertButton.backgroundColor = UIColor.orange
        self.view.addSubview(self.systemAlertButton)
        /// 创建约束
        self.systemAlertButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(self.systemSoundButton.snp.bottom).offset(50)
        }
        
        self.systemVibrationButton = UIButton(type: .custom)
        self.systemVibrationButton.addTarget(self, action: #selector(vibration(_:)), for: .touchUpInside)
        self.systemVibrationButton.setTitle("震动", for: .normal)
        self.systemVibrationButton.backgroundColor = UIColor.purple
        self.view.addSubview(self.systemVibrationButton)
        /// 创建约束
        self.systemVibrationButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(KscreenWidth - 30)
            make.height.equalTo(50)
            make.top.equalTo(self.systemAlertButton.snp.bottom).offset(50)
        }
        
    }
    
    @objc func sound(_ button: UIButton) {
        var soundID:SystemSoundID = 0
        let  path = Bundle.main.path(forResource: "轻轻", ofType: "m4a")
        let pathUrl = NSURL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(pathUrl, &soundID)
        let observer = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { (soundID, inClientData) in
//            let mySelf = Unmanaged<ViewController>.fromOpaque(inClientData!)
//                .takeUnretainedValue()
//            mySelf.audioServicesPlaySystemSoundCompleted(soundID: soundID)
        }, observer)
        
        AudioServicesPlayAlertSound(soundID)
        isPlaying = true
        
    }
    
    @objc func systemAlert(_ button: UIButton) {
        //建立的SystemSoundID对象
        var soundID:SystemSoundID = 0
        //获取声音地址
        let path = Bundle.main.path(forResource: "轻轻", ofType: "m4a")
        //地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        //提醒（同上面唯一的一个区别）
        AudioServicesPlayAlertSound(soundID)
    }
    
    @objc func vibration(_ button: UIButton) {
        //建立的SystemSoundID对象
        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        //振动
        AudioServicesPlaySystemSound(soundID)
    }
    
    //音频结束时的回调
    func audioServicesPlaySystemSoundCompleted(soundID: SystemSoundID) {
        isPlaying = false
        AudioServicesRemoveSystemSoundCompletion(soundID)
        AudioServicesDisposeSystemSoundID(soundID)
    }
}

// MARK: - Action
extension AudioToolboxViewController {
    
}

// MARK: - Network
extension AudioToolboxViewController {
    
}

// MARK: - Delegate Internal

// MARK: -

// MARK: - Delegate External

// MARK: -

// MARK: - Helper
extension AudioToolboxViewController {
    
}

// MARK: - Other
extension AudioToolboxViewController {
    
}

// MARK: - Public
extension AudioToolboxViewController {
    
}

