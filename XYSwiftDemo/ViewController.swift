//
//  ViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2017/12/18.
//  Copyright © 2017年 VansXY. All rights reserved.
//

import UIKit

let KscreenWidth = UIScreen.main.bounds.size.width
let KscreenHeight = UIScreen.main.bounds.size.height

let NavgationHeight = KscreenHeight == 812 ? 88.0 : 64.0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    var sectionArray:[String] = ["第一周", "第二周", "第三周", "第四周"]
    var dataAarray1:[String] = ["布局控件", "搜索框", "collectionView", "分享和Sqlite数据库", "弹框", "动画", "UserDefault本地存储"]
    var dataAarray2:[String] = ["NSURLSession", "发送本地通知", "图片处理类", "Alamofire", "WebViewController", "AudioToolboxViewController", "CoreLocation"]
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButton = UIBarButtonItem.init()
        backBarButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
        
        
        test(name: "Hello Swift!")
        print(test1(name: "Hello Swift!"))
        
      
        let student = Student(newName: "Swift",newNumber: 32)
        print(student.say())
        
        let controlFlow = ControlFlow.init(number: 1, number1: 10)
        print(controlFlow)
        
        var str = "Hello Swift!"
        print(str[3, 7])
        print(str[0])
        
        let value = 20000000.0
        print(value.mm(), value.cm(), value.m(), value.km())
        
        self.setupView()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    private func setupView() {
        
        self.tableView = UITableView(frame: self.view.frame, style:.grouped);
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView?.tableFooterView = UIView()
        // 注册cell
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        self.tableView?.tableHeaderView = self.addHeaderView()
        self.tableView?.setContentOffset(CGPoint.init(x: 0, y: (self.tableView?.contentSize.height)! - (self.tableView?.bounds.size.height)!), animated: true)
        
        let longPressedGesture = UILongPressGestureRecognizer()
        longPressedGesture.addTarget(self, action:#selector(addLongPressedGesture(_:)))
        longPressedGesture.minimumPressDuration = 1.0
        longPressedGesture.delegate = self
        self.tableView?.addGestureRecognizer(longPressedGesture)
    }
    
    func addHeaderView() -> UIView {
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x:0,
                                                y:0,
                                                width:self.view.bounds.size.width,
                                                height:50))
        headerLabel.backgroundColor = UIColor.lightGray
        headerLabel.textColor = UIColor.orange
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "\tHello Swift!"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        return headerLabel
    }
    
    // 返回区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    // 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAarray1.count
    }
    
    // 初始化cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "SwiftCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        //设置cell的显示动画为3D缩放
        //xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 1, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
        if indexPath.section == 0 {
            cell.textLabel?.text = dataAarray1[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = dataAarray2[indexPath.row]
        } else {
            cell.textLabel?.text = dataAarray1[indexPath.row]
        }
        return cell
    }
    
    // 点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 1 {
            let TwoVC = TwoDayViewController()
            self.navigationController?.pushViewController(TwoVC, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let ThreeVC = ThreeDayViewController()
            self.navigationController?.pushViewController(ThreeVC, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 3 {
            let FourVC = FourDaysViewController()
            self.navigationController?.pushViewController(FourVC, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 4 {
            let FiveVC = FiveDaysViewController()
            self.navigationController?.pushViewController(FiveVC, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 5 {
            let SixVC = SixDaysViewController()
            self.navigationController?.pushViewController(SixVC, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 6 {
            let SevenVC = SevenDaysViewController()
            self.navigationController?.pushViewController(SevenVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let URLSessionVC = URLSessionViewController()
            self.navigationController?.pushViewController(URLSessionVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 1 {
            let ScheduleVC = ScheduleNotificationViewController()
            self.navigationController?.pushViewController(ScheduleVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 2 {
            let ImageVC = ImageViewController()
            self.navigationController?.pushViewController(ImageVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 3 {
            let AlamofireVC = AlamofireViewController()
            self.navigationController?.pushViewController(AlamofireVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 4 {
            let webVC = WebViewController()
            self.navigationController?.pushViewController(webVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 5 {
            let AudioToolboxVC = AudioToolboxViewController()
            self.navigationController?.pushViewController(AudioToolboxVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 6 {
            let CoreLocationVC = CoreLocationViewController()
            self.navigationController?.pushViewController(CoreLocationVC, animated: true)
        } else {
            self.navigationController?.pushViewController(SecondViewController(), animated: true)
        }
    }
    
    // 区头title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sectionArray[section]
    }
    // 可以编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 单元格编辑后（删除或插入）的响应方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0  {
                let index = indexPath.row
                dataAarray1.remove(at: index)
                tableView.deselectRow(at: indexPath, animated: true)
            } else if indexPath.section == 1 {
                let index = indexPath.row
                dataAarray2.remove(at: index)
                tableView.deselectRow(at: indexPath, animated: true)
            } else {
                
            }
            
        } else if editingStyle == .insert {
            if indexPath.section == 0 {
                dataAarray1.insert("插入项", at: indexPath.row + 1)
            } else if indexPath.section == 1 {
                dataAarray2.insert("插入项", at: indexPath.row + 1)
            } else {
                
            }
        }
        tableView.reloadData()
        
    }
    
    // header行高
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // foot行高
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    // headerView
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame:CGRect(x:0,
//                                             y:0,
//                                             width:KscreenWidth,
//                                             height:50))
//        headerView.backgroundColor = UIColor.green
//        return headerView
//    }
    
    // footerView
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footView = UIView(frame:CGRect(x:0,
//                                             y:0,
//                                             width:KscreenWidth,
//                                             height:30))
//        footView.backgroundColor = UIColor.red
//        return footView
//    }
    
    
    // 编辑样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing == false {
            return UITableViewCellEditingStyle.delete
        } else {
            
            return indexPath.section > 0 ? UITableViewCellEditingStyle.insert : UITableViewCellEditingStyle.delete
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    ///在编辑状态，可以拖动设置cell位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath != destinationIndexPath {
            ///获取移动行对应的值
            let itemValue:String = dataAarray1[sourceIndexPath.row]
            ///删除移动的值
            dataAarray1.remove(at: sourceIndexPath.row)
            ///如果移动区域大于现有行数，直接在最后添加移动的值
            if destinationIndexPath.row > sourceIndexPath.row {
                dataAarray1.append(itemValue)
            } else { ///如果移动区域大于现有行数，直接在最后添加移动的值
                dataAarray1.insert(itemValue, at: destinationIndexPath.row)
            }
        }
    }
    ///让单元格只能在自己的分区中拖动
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        ///如果目标位置和拖动行不是同一个分区，则拖动行返回自己原来的分区
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            var row = 0
            if sourceIndexPath.section < proposedDestinationIndexPath.section {
                row = tableView.numberOfRows(inSection: sourceIndexPath.section) - 1
            }
            return IndexPath(row: row, section: sourceIndexPath.section)
        }
        return proposedDestinationIndexPath
    }
    
    // 长按手势
    @objc func addLongPressedGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
             print("UIGestureRecognizerStateBegan");
        case .changed:
             print("UIGestureRecognizerStateChanged");
        case .ended:
            print("UIGestureRecognizerStateEnded");
            // 在正常状态和编辑状态之间切换
            if self.tableView!.isEditing == false {
                self.tableView!.setEditing(true, animated:true)
            } else {
                self.tableView!.setEditing(false, animated:true)
            }
        
        default:
            return
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

