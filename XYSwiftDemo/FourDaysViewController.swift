//
//  FourDaysViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/29.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit
import EventKit

class FourDaysViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        addCalendarsEvent()
        useSqliteData()
        
    }

    // MARK: - Public Property
    var button = UIButton()
    
    var userNameTextField : UITextField!
    var passwordTextField : UITextField!
    var saveButton : UIButton!
    
    let eventStore = EKEventStore()
    
    var db:SQLiteDB!
    
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension FourDaysViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "FourDaysViewController"
        
        button = UIButton(type:.custom)
        button.frame = CGRect(x:100, y:150, width:175, height:30)
        button.setTitle("点我分享", for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(UIColor.brown, for: .normal)
        button.addTarget(self, action: #selector(toshare(_ :)), for: .touchUpInside)
        self.view.addSubview(button)
        
        let nameLabel = UILabel(frame:CGRect(x: 55, y: 300, width: 100, height:30))
        nameLabel.text = "姓名："
        nameLabel.textAlignment = .right
        self.view.addSubview(nameLabel)
        
        let passwordLabel = UILabel(frame:CGRect(x: 55, y: 350, width: 100, height:30))
        passwordLabel.text = "密码："
        passwordLabel.textAlignment = .right
        self.view.addSubview(passwordLabel)
        
        
        self.userNameTextField = UITextField(frame:CGRect(x: 155, y: 300, width: 160, height:30))
        self.userNameTextField.placeholder = "请输入姓名"
        self.userNameTextField.borderStyle = .roundedRect
        self.view.addSubview(self.userNameTextField)
        
        self.passwordTextField = UITextField(frame:CGRect(x: 155, y: 350, width: 160, height:30))
        self.passwordTextField.placeholder = "请输入密码"
        self.passwordTextField.borderStyle = .roundedRect
        self.view.addSubview(self.passwordTextField)
        
        self.saveButton = UIButton(type:.custom)
        self.saveButton.frame = CGRect(x:100, y:450, width:175, height:30)
        self.saveButton.setTitle("保存数据", for: .normal)
        self.saveButton.backgroundColor = UIColor.orange
        self.saveButton.setTitleColor(UIColor.white, for: .normal)
        self.saveButton.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        self.view.addSubview(self.saveButton)
        
        
    }
    
    @objc func toshare(_ button: UIButton) {
//        let items:[Any] = ["Swift", UIImage(named:""), NSURL()]
        //准备分享内容，文本图片链接
        let items:[Any] = ["微信", UIImage(named:"weixin")!,
                           URL(fileURLWithPath:"http://hangge.com")]
        //新建自定义的分享对象数组
        let acts = [WeiXinActivity(),HanggeActivity()]
        //根据分享内容和自定义的分享按钮调用分享视图
        let actView:UIActivityViewController =
            UIActivityViewController(activityItems: items, applicationActivities: acts)
        //要排除的分享按钮，不显示在分享框里
        actView.excludedActivityTypes = [.mail, .copyToPasteboard, .print, .assignToContact, .saveToCameraRoll]
        //显示分享视图
        self.present(actView, animated:true, completion:nil)
    }
    
    // 初始化数据库
    func initDB() {
        // 获取数据库实例
        db = SQLiteDB.shared
        // 打开数据库
        _ = db.openDB()
        // 如果表不存在，则创建表
        let result = db.execute(sql: "create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        print(result)
        //如果有数据则加载
        initUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query(sql: "select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            userNameTextField.text = user["uname"] as? String
            passwordTextField.text = user["mobile"] as? String
        }
    }
    
    @objc func saveData(_ button: UIButton) {
        let userName = self.userNameTextField.text!
        let password = self.passwordTextField.text!
        // 插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(userName)', '\(password)')"
        // 通过封装的方法执行sql
        let result = db.execute(sql: sql)
        print(result)
    }
    
    fileprivate func addCalendarsEvent() {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                
                // 新建一个事件
                let event:EKEvent = EKEvent(eventStore: self.eventStore)
                event.title = "新增一个测试事件"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "这个是备注"
                event.calendar = self.eventStore.defaultCalendarForNewEvents
                
                do {
                    try self.eventStore.save(event, span: .thisEvent)
                } catch {}
                
                // 获取所有的事件（前后90天）
                let startDate = Date().addingTimeInterval(-3600*24*90)
                let endDate = Date().addingTimeInterval(3600*24*90)
                let predicate2 = self.eventStore.predicateForEvents(withStart: startDate,
                                                               end: endDate, calendars: nil)
                
                print("查询范围 开始:\(startDate) 结束:\(endDate)")
                
                if let eV = self.eventStore.events(matching: predicate2) as [EKEvent]! {
                    for i in eV {
                        print("标题  \(i.title)" )
                        print("开始时间: \(i.startDate)" )
                        print("结束时间: \(i.endDate)" )
                    }
                }
            }
        }
    }
    
    fileprivate func useSqliteData() {
        initDB()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 关闭虚拟键盘的几种方式
        // 1.resignFirstResponder()
        // 2.endEditing(true)
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }


}


// MARK: - 添加日历
extension FourDaysViewController {
    
}

// MARK: - Network
extension FourDaysViewController {
    
}


