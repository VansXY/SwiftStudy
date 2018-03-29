//
//  ThreeDayViewController.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/15.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class ThreeDayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }


    // MARK: - Public Property
    let courses = [
        ["name":"Swift","pic":"swift.png"],
        ["name":"OC","pic":"oc.jpg"],
        ["name":"java","pic":"java.png"],
        ["name":"php","pic":"php.jpeg"]
    ]
    
    var collectionView : UICollectionView!
    var alertVC : UIAlertController!
    
    
    // MARK: - Private Property
    
}


// MARK: - UI
extension ThreeDayViewController {
    fileprivate func setUI() {
        self.view.backgroundColor = UIColor.white
        self.title = "ThreeDayViewController"
        // 设置collectionView的布局
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 100, height: 130)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        // 初始化collectionView
        collectionView = UICollectionView.init(frame: CGRect(x:0, y:10, width:KscreenWidth, height:600), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.orange
        self.view.addSubview(collectionView)
        
        // 注册cell，如果需要还可以注册header和footer
        collectionView.register(XYCollectionViewCell.self, forCellWithReuseIdentifier: "XYCollectionViewCellIdentifier")
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionHeader")
        collectionView.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "collectionFooter")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XYCollectionViewCellIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        alertVC = UIAlertController.init(title: nil, message: "这是第\(indexPath.section)个section，第\(indexPath.row)行", preferredStyle: .alert)
        self.present(alertVC, animated: true, completion: nil)
        perform(#selector(dismissAlertVC), with: self, afterDelay: 3.0)
        
    }
    
    @objc func dismissAlertVC() {
        alertVC.dismiss(animated: true, completion: nil)
    }
    
    // header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: 100, height: 50)
    }
    
    // footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: 100, height: 30)
    }
    
    // 设置headerView和footView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionHeader", for: indexPath)
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionFooter", for: indexPath)
            return view
        }
    }
}




