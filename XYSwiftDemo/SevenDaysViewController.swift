//
//  SevenDaysViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/2/1.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class SevenDaysViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        saveUIKitData()
        addNavigationItem()
        print("uuid:\(get_uuid())")
    }

    // MARK: - Public Property
    
    // MARK: - Private Property
    let userDefault = UserDefaults.standard
    var button:UIButton!
    var activityIndicator:UIActivityIndicatorView!
//    var timer:Timer
    
}

// MARK: - UI
extension SevenDaysViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "SevenDaysViewController"
        button = UIButton(type:.custom)
        button.frame = CGRect(x:100, y:450, width:1_7_5, height:30)
        button.setTitle("展示菊花", for: .normal)
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(showActivityView(_ :)), for: .touchUpInside)
        self.view.addSubview(button)
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:
            UIActivityIndicatorViewStyle.gray)
        activityIndicator.center=self.view.center
        self.view.addSubview(activityIndicator)
    }
    
    fileprivate func addNavigationItem () {
//        let navigationItem = UINavigationItem()
        let rightBtn = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add, target: self, action:#selector(onAdd))
        self.navigationItem.setRightBarButton(rightBtn, animated: true)
    }
    
    @objc func onAdd() {
        print("123123")
    }
    
    @objc func showActivityView(_ button: UIButton) {
        button.isSelected = !button.isSelected
        if button.isSelected {
            //进度条开始转动
            activityIndicator.startAnimating()
        } else {
            //进度条停止转动
            activityIndicator.stopAnimating()
        }
    }
    
    // 创建定时器任务
    func addTimer() {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(doTimer), userInfo: nil, repeats: true);
        
    }
    
    @objc func doTimer() {
        print("123123")
    }
}

// MARK: - UserDefaults
extension SevenDaysViewController {
    func get_uuid() -> String {
        let uuid = UserDefaults.standard.string(forKey: "uuid")
        if uuid != nil { // 如果已经存在
            return uuid!
        } else {
            //不存在则生成一个新的并保存
            let uuid_ref = CFUUIDCreate(nil)
            let uuid_string_ref = CFUUIDCreateString(nil , uuid_ref)
            let uuid = uuid_string_ref! as String
            UserDefaults.standard.set(uuid, forKey: "uuid")
            return uuid
        }
    }
    
    func saveNormalData() {
        //Any
        userDefault.set("hangge.com", forKey: "Object")
        let objectValue:Any? = userDefault.object(forKey: "Object")!
        
        //Int类型
        userDefault.set(12345, forKey: "Int")
        let intValue = userDefault.integer(forKey: "Int")
        
        //Float类型
        userDefault.set(3.2, forKey: "Float")
        let floatValue = userDefault.float(forKey: "Float")
        
        //Double类型
        userDefault.set(5.2240, forKey: "Double")
        let doubleValue = userDefault.double(forKey: "Double")
        
        //Bool类型
        userDefault.set(true, forKey: "Bool")
        let boolValue = userDefault.bool(forKey: "Bool")
        
        //URL类型
        userDefault.set(URL(string:"http://hangge.com")!, forKey: "URL")
        let urlValue = userDefault.url(forKey: "URL")
        
        //String类型
        userDefault.set("hangge.com", forKey: "String")
        let stringValue = userDefault.string(forKey: "String")
        
        //NSNumber类型
        var number = NSNumber(value:22)
        userDefault.set(number, forKey: "NSNumber")
        number = userDefault.object(forKey: "NSNumber") as! NSNumber
        
        //Array类型
        var array:Array = ["123","456"]
        userDefault.set(array, forKey: "Array")
        array = userDefault.array(forKey: "Array") as! [String]
        
        //Dictionary类型
        var dictionary = ["1":"hangge.com"]
        userDefault.set(dictionary, forKey: "Dictionary")
        dictionary = userDefault.dictionary(forKey: "Dictionary") as! [String : String]
        
        print(objectValue, intValue, floatValue, doubleValue, boolValue, urlValue, stringValue)
    }
    
    /*
     系统对象的存储与读取
     
     UILabel:
     需要通过 archivedData 方法转换成 Data 为载体，才可以存储
     
     UIImage:
     如果我们过直接把 image1 存储起来，再取出转换回 UIImage 就变成了 nil。必须先转成 image2 再存储
    */
    func saveUIKitData() {
        let label = UILabel()
        label.text = ""
        let labelData = NSKeyedArchiver.archivedData(withRootObject: label)
        // 存数据
        userDefault.set(labelData, forKey: "labelData")
        
        // 取数据
        let objData = userDefault.data(forKey: "labelData")
        
        // 还原对象
        let myLabel = NSKeyedUnarchiver.unarchiveObject(with: objData!) as? UILabel
        print(myLabel!)

// MARK: - image
        
        //UIImage对象存储
        //将对象转换成Data流
        let image1 = UIImage(named: "1.jpeg")!
        let image2 = UIImage(cgImage: image1.cgImage!, scale: image1.scale,
                             orientation: image1.imageOrientation)
        let imageData = NSKeyedArchiver.archivedData(withRootObject: image2)
        //存储Data对象
        userDefault.set(imageData, forKey: "imageData")
        
        //UIImage对象读取
        //获取Data
        let objData_image = userDefault.data(forKey: "imageData")
        //还原对象
        let myImage = NSKeyedUnarchiver.unarchiveObject(with: objData_image!) as? UIImage
        print(myImage!)
    }

    /*
     自定义对象的存储和读取
     
     如果想要存储自己定义的类，首先需要对该类实现 NSCoding 协议来进行归档和反归档（序列化和反序列化）。即该类内添加 func encode(with coder: NSCoder) 方法和 init(coder decoder: NSCoder) 方法，将属性进行转换。
     */
    func saveClassData() {
        //自定义对象存储
        let model = UserInfo(name: "航歌", phone: "3525")
        //实例对象转换成Data
        let modelData = NSKeyedArchiver.archivedData(withRootObject: model)
        //存储Data对象
        userDefault.set(modelData, forKey: "myModel")
        //自定义对象读取
        let myModelData = userDefault.data(forKey: "myModel")
        let myModel = NSKeyedUnarchiver.unarchiveObject(with: myModelData!) as! UserInfo
        print(myModel)
    }
}




class UserInfo: NSObject, NSCoding {
    
    var name:String
    var phone:String
    
    //构造方法
    required init(name:String="", phone:String="") {
        self.name = name
        self.phone = phone
    }
    
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "Phone") as? String ?? ""
    }
    
    //编码成object
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey:"Name")
        coder.encode(phone, forKey:"Phone")
    }
    
}



