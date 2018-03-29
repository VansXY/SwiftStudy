//
//  TwoDayViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/12.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class TwoDayViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

//
//    // MARK: - Public Property
//
    var searchBar = UISearchBar()
    var tableView = UITableView()
//
    var dataArray:[String] = ["Label1", "Label2", "Button1", "Button2", "Switch"]
    var searchArray: [String] = []
//
//    // MARK: - Private Property
//
//    // MARK: - Life Cycle
//
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    fileprivate func setUI() {
        self.title = "TwoDayViewController"
        self.view.backgroundColor = UIColor.white
        self.addSubview()
    }

    func addSubview() {
        searchBar.frame = CGRect(x:0, y:NavgationHeight, width:Double(KscreenWidth), height:30)
        searchBar.delegate = self
        self.view.addSubview(searchBar)

        tableView.frame = CGRect(x:0, y:NavgationHeight + 30, width:Double(KscreenWidth), height:Double(KscreenHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchCell")
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count > 0 ? searchArray.count : dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "searchCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        if searchArray.count > 0 {
            cell.textLabel?.text = searchArray[indexPath.row]
        } else {
            cell.textLabel?.text = dataArray[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 没有搜索内容时显示全部组件
        if searchText == "" {
            searchArray = dataArray
        } else { // 匹配用户输入内容的前缀(不区分大小写)
            searchArray = []
            for ctrl in dataArray {
                if ctrl.lowercased().hasPrefix(searchText.lowercased()) {
                    searchArray.append(ctrl)
                }
            }
        }
        // 刷新Table View显示
        tableView.reloadData()
    }

    // 搜索代理UISearchBarDelegate方法，点击虚拟键盘上的Search按钮时触发
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     searchBar.resignFirstResponder()
     }
    
    // 移除页面视图上的所有元素
    func cleanAllViews() {
        for VIEW in self.view.subviews as [UIView] {
            VIEW.removeFromSuperview()
        }
    }

    
    
}




