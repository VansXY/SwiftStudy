//
//  SixDaysViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/2/1.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit



/*
 1. 使用 animate 来实现动画
 
 （1）此方法共有5个参数：
    withDuration：动画从开始到结束的持续时间，单位是秒
    delay：动画开始前等待的时间
    options：动画执行的选项。里面可以设置动画的效果。可以使用 UIViewAnimationOptions 类提供的各种预置效果
    anmations：动画效果的代码块
    completion：动画执行完毕后执行的代码块
 （2）UIView支持动画效果的属性
    frame：此属性包含一个矩形，即边框矩形，此值确定了当前视图在其父视图坐标系中的位置与尺寸
    bounds：也是矩形，边界矩形，它指的是视图在其自己的坐标系中的位置和尺寸，左上角坐标永远是 (0,0)
    center：确定视图的中心点在其父视图坐标系中的位置坐标。即定义当前视图在父视图中的位置
    alpha：视图的透明度。（但视图完全透明时，不能响应触摸消息）
    backgroundColor：背景色
    transform：这是一种 3×3 的变化矩阵。通过这个矩阵我们可以对一个坐标系统进行缩放、平移、旋转以及这两者的任意组操作。
 （3）Transform（变化矩阵）的四个常用的变换方法
    CGAffineTransformMake()：返回变换矩阵
    CGAffineTransformMakeTranslation()：返回平移变换矩阵
    CGAffineTransformMakeScale()：返回缩放变换矩阵
    CGAffineTransformMakeRotation()：返回旋转变换矩阵
 
 
 2. 使用 beginAnimations 和 commitAnimations 方法来实现动画
 
    beginAnimations：此方法开始一个动画块，调用 commitAnimations 结束一个动画块，并且动画块是允许嵌套的。
    commitAnimations：此方法用于结束一个动画块，动画是在一个独立的线程中运行的，动画在生效时，所有应用程序不会中断。
 */

class SixDaysViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        playAnimationRotation()
        initWithImageView()
//        beginAnimations()
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    //游戏方格维度
    var dimension:Int = 4
    //数字格子的宽度
    var width:CGFloat = 50
    //格子与格子的间距
    var padding:CGFloat = 6
    //保存背景图数据
    var backgroundViews:Array<UIView>!
    // 一张图片
    var imageView:UIImageView!
    
}

// MARK: - UI
extension SixDaysViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "SixDaysViewController"
        self.backgroundViews = Array<UIView>()
        
        var x:CGFloat = 50
        var y:CGFloat = 150
        for _ in 0..<dimension {
            y = 150
            for _ in 0..<dimension {
                let backgroundView1 = UIView(frame:CGRect(x:x, y:y, width:width, height:width))
                backgroundView1.backgroundColor = UIColor.darkGray
                self.view.addSubview(backgroundView1)
                //将视图保存起来，以备后用
                backgroundViews.append(backgroundView1)
                y += padding + width
            }
            x += padding + width
        }
    }
    
    func playAnimationRotation() {
        for tile in backgroundViews {
            tile.layer.setAffineTransform(CGAffineTransform(scaleX:0.1, y: 0.1))
            UIView.animate(withDuration: 1.0, delay: 0.01, options: [], animations: {
                tile.layer.setAffineTransform(CGAffineTransform(rotationAngle: 90))
            }, completion: { (true) in
                UIView.animate(withDuration: 1, animations:{
                    ()-> Void in
                    //完成动画时，数字块复原
                    tile.layer.setAffineTransform(CGAffineTransform.identity)
                })
            })
        }
    }
    
    func playAnimationScale() {
        for tile in backgroundViews{
            //先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1,y: 0.1))
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01, options:[], animations: {
                ()-> Void in
                tile.layer.setAffineTransform(CGAffineTransform(scaleX: 1,y: 1))
            },completion:{ (true) in
                UIView.animate(withDuration: 0.08, animations:{
                    ()-> Void in
                    tile.layer.setAffineTransform(CGAffineTransform.identity)
                })
            })
        }
    }
    
    func playAnimationAlphe() {
        for tile in backgroundViews {
            tile.alpha = 0
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01, options:[.curveEaseInOut],
                           animations: {
                 ()-> Void in
            }, completion:{ (true) in
                UIView.animate(withDuration: 3, animations:{
                ()-> Void in
                    tile.alpha = 1
                })
            })
        }
    }
}

extension SixDaysViewController {
    /*
     none：              无过渡动画效果
     flipFromLeft：      从左侧向右侧翻转
     flipFromRight：     从右侧向左侧翻转
     curlUp：            向上卷数翻页
     curlDown：          向下翻页
     */
    func initWithImageView() {
        imageView = UIImageView(frame:CGRect(x:100, y:400, width:175, height:175))
        imageView.backgroundColor = UIColor.orange
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        imageView.addGestureRecognizer(tap)
        self.view.addSubview(imageView)
        
        //添加两个红蓝视图
        let redView = UIView(frame: CGRect(x:100, y:600, width:175, height:175))
        redView.backgroundColor = UIColor.red
        self.view.insertSubview(redView, at: 0)
        
        let blueView = UIView(frame: CGRect(x:100, y:600, width:175, height:175))
        blueView.backgroundColor = UIColor.blue
        self.view.insertSubview(blueView, at: 1)
    }
    
    @objc func handleTapGesture(gesture:UITapGestureRecognizer) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
//        UIView.setAnimationTransition(.curlDown, for: self.view, cache: true)
//        self.view.exchangeSubview(at: 1, withSubviewAt: 0)
        
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromLeft, for: self.view, cache: false)
        
        UIView.commitAnimations()
    }
    
    func beginAnimations() {
        //淡出动画
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        imageView.alpha = 0.5
        UIView.commitAnimations()
        
        //淡入动画
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        imageView.alpha = 1.0
        UIView.commitAnimations()
        
        //移动动画
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        imageView.center = CGPoint(x:187.5, y:500)
        UIView.setAnimationCurve(.easeOut) //设置动画相对速度
        UIView.commitAnimations()
        
        //大小调整动画
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        imageView.frame = CGRect(x:100, y:180, width:50, height:50)
        UIView.commitAnimations()
    }
    
    
    
}

