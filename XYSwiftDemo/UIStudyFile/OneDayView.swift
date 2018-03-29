 //
//  OneDayView.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/29.
//Copyright © 2017年 VansXY. All rights reserved.
//

import UIKit

class OneDayView: UIView , UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
    }

    // MARK: - Public Property
    var textfield = UITextField()
    var textview = UITextView()
    var switchView = UISwitch()
    
    
    // MARK: - Private Property
    
}


// MARK: - UI
extension OneDayView {
    fileprivate func setUI() {
        self.addLabel()
        self.addButton()
        self.addTextField()
        self.addTextView()
        self.addSwitch()
    }
    
    /*
     UIView常用的一些属性如下：
     frame：相对父视图的坐标和大小（x,y,w,h）
     bounds：相对自身的坐标和大小，所以bounds的x和y永远为0（0,0,w,h）
     center：相对父视图的中点坐标
     transform：控制视图的放大缩小和旋转
     superview：获取父视图
     subviews：获取所有子视图
     alpha：视图的透明度（0.0-1.0）
     tag：视图的标志（Int类型，默认等于0），设置后，可以通过viewWithTag方法拿到这个视图
     
     UIView的常用方法如下：
     func removeFromSuperview()：将视图从父视图中移除
     func insertSubview(view:UIView, atIndex index:Int)：指定一个位置插入一个视图，index越小，视图越往下
     func exchangeSubviewAtIndex(index1:Int, withSubviewAtIndex index2:Int)：将index1和index2位置的两个视图互换位置
     func addSubview(view:UIView)：添加视图到父视图
     func insertSubview(view:UIView,belowSubview siblingSubview:UIView)：在指定视图的下面插入视图
     func insertSubview(view:UIVIew,aboveSubview siblingSubview:UIView)：在指定视图上面插入视图
     func bringSubviewToFront(view:UIView)：把视图移到最顶层
     func sendSubviewToBack(view:UIView)：把视图移到最底层
     func viewWithTag(tag:Int)->UIView?：根据tag值获取视图
     */
    func addLabel() -> Void {
        let label = UILabel(frame:CGRect(x:10, y:20, width:100, height:30))
        label.text = "Hello Swift!"
        self.addSubview(label)
        // 字体
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        // 字色
        label.textColor = UIColor.white
        label.backgroundColor = .black
        label.textAlignment = .center
        //灰色阴影
        label.shadowColor = UIColor.gray
        //阴影的偏移量
        label.shadowOffset = CGSize(width:2, height:2)
        //隐藏尾部并显示省略号
        label.lineBreakMode = .byTruncatingTail
        //隐藏中间部分并显示省略号
        //        label.lineBreakMode = .byTruncatingMiddle
        //隐藏头部并显示省略号
        //        label.lineBreakMode = .byTruncatingHead
        //截去多余部分也不显示省略号
        //        label.lineBreakMode = .byClipping
        //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        //        label.adjustsFontSizeToFitWidth = true
        //显示两行文字（默认只显示一行，设为0表示没有行数限制）
        //        label.numberOfLines = 2
        //设置文本高亮
        //        label.isHighlighted = true
        //设置文本高亮颜色
        //        label.highlightedTextColor = UIColor.green
        // 设置富文本
        label.attributedText = self.setAttributeStringWithString(string: "welcome to hangge.com")
    }
    
    func addButton() -> Void {
        /*
         UIButtonType.system：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.contactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.detailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.infoDark：为感叹号“!”圆形按钮
         UIButtonType.infoLight：为感叹号“!”圆形按钮
         
         button.setTitle("普通状态", for:.normal) //普通状态下的文字
         button.setTitle("触摸状态", for:.highlighted) //触摸状态下的文字
         button.setTitle("禁用状态", for:.disabled) //禁用状态下的文字
         
         */
        let button = UIButton(type: .custom)
        button.frame = CGRect(x:130, y:20, width:100, height:30)
//        button.backgroundColor = .blue
        self.addSubview(button)
        button.addTarget(self, action:#selector(tapped(_:)), for: .touchUpInside)
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        
    }
    @objc func tapped(_ button: UIButton) {
        print(button.title(for: .normal)!)
    }
    
    func addTextField() -> Void {
        /*
         UITextBorderStyle.none：无边框
         UITextBorderStyle.line：直线边框
         UITextBorderStyle.roundedRect：圆角矩形边框
         UITextBorderStyle.bezel：边线+阴影
         */
        textfield = UITextField(frame : CGRect(x:10, y:60, width:200, height:30))
        textfield.borderStyle = .roundedRect
        self.addSubview(textfield)
        textfield.layer.masksToBounds = true
        textfield.delegate = self
        textfield.layer.cornerRadius = 6    //圆角半径
        textfield.layer.borderWidth = 1  //边框粗细
        textfield.layer.borderColor = UIColor.purple.cgColor   //边框颜色
        textfield.placeholder = "请输入用户名"
        // 文字大小超过文本框长度时自动缩小字号，而不是隐藏显示省略号
        textfield.adjustsFontSizeToFitWidth = true
        textfield.minimumFontSize = 12
        // 水平/垂直对齐方式
        /*
         /** 水平对齐 **/
         textField.textAlignment = .right //水平右对齐
         textField.textAlignment = .center //水平居中对齐
         textField.textAlignment = .left //水平左对齐
         
         /** 垂直对齐 **/
         textField.contentVerticalAlignment = .top  //垂直向上对齐
         textField.contentVerticalAlignment = .center  //垂直居中对齐
         textField.contentVerticalAlignment = .bottom  //垂直向下对齐
         */
        // 背景图片设置
//        textfield.borderStyle = .none //先要去除边框样式
//        textfield.background = UIImage(named:"background1");
        // 清除按钮（输入框内右侧小叉）
        textfield.clearButtonMode = .whileEditing
        textfield.addTarget(self, action: #selector(textChange(_:)), for: .allEditingEvents)
        /*
         Default：系统默认的虚拟键盘
         ASCII Capable：显示英文字母的虚拟键盘
         Numbers and Punctuation：显示数字和标点的虚拟键盘
         URL：显示便于输入url网址的虚拟键盘
         Number Pad：显示便于输入数字的虚拟键盘
         Phone Pad：显示便于拨号呼叫的虚拟键盘
         Name Phone Pad：显示便于聊天拨号的虚拟键盘
         Email Address：显示便于输入Email的虚拟键盘
         Decimal Pad：显示用于输入数字和小数点的虚拟键盘
         Twitter：显示方便些Twitter的虚拟键盘
         Web Search：显示便于在网页上书写的虚拟键盘
         */
        textfield.keyboardType = .default
        
        // textField.becomeFirstResponder()
        // textField.resignFirstResponder()
    }
    @objc func textChange(_ textField: UITextField) {
        print(textfield.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //打印出文本框中的值
        print(textField.text ?? "")
        return true
    }
    
    func addTextView() -> Void {
        textview.frame = CGRect(x:10, y:100, width:200, height:100)
        textview.layer.masksToBounds = true
        textview.isScrollEnabled = true
        textview.isUserInteractionEnabled = true
        textview.layer.borderWidth = 1  //边框粗细
        textview.layer.cornerRadius = 6
        textview.layer.borderColor = UIColor.purple.cgColor //边框颜色
        textview.text = "属性font设置字体 "
        textview.textColor = UIColor.purple
        textview.font = UIFont.systemFont(ofSize: 11)
        textview.textAlignment = .left
        self.addSubview(textview)
        // 是否可编辑
        textview.isEditable = true
        // 内容是否可选
        textview.isSelectable = true
        // 给文字中的电话号码和网址自动加链接
        /*
         textview.dataDetectorTypes = [] 都不加链接
         textview.dataDetectorTypes = UIDataDetectorTypes.phoneNumber 只有电话加链接
         textview.dataDetectorTypes = UIDataDetectorTypes.link 只有网址加链接
         textview.dataDetectorTypes = UIDataDetectorTypes.all 电话和网址都加
         */
        textview.dataDetectorTypes = UIDataDetectorTypes.all //电话和网址都加
         // 自定义选择内容后的菜单
        let mail = UIMenuItem(title: "邮件", action: #selector(onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(onWeiXin))
        let menu = UIMenuController()
        menu.menuItems = [mail,weixin]
        
    }
    
    @objc func onMail() {
        print("mail")
    }
    @objc func onWeiXin() {
        print("weixin")
    }
    
    func addSwitch() -> Void {
        switchView.center = CGPoint(x:300, y:50)
        switchView.isOn = true
        switchView.addTarget(self, action: #selector(switchDIdChange), for: .valueChanged)
        self.addSubview(switchView)
    }
    
    @objc func switchDIdChange () {
        print(switchView.isOn)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }
    
    
    
    
    
    
    func setAttributeStringWithString(string : String) -> NSAttributedString {
        //富文本设置
        let attributeString = NSMutableAttributedString(string:string)
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.green, range: NSMakeRange(3,3))
        return attributeString

    }
}

