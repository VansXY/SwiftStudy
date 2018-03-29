//
//  XYCollectionViewCell.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/17.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class XYCollectionViewCell: UICollectionViewCell {
    
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
    static let identifier = "XYCollectionViewCellIdentifier"
    
    // MARK: - Private Property
    
}

// MARK: - UI
extension XYCollectionViewCell {
    fileprivate func setUI() {
        let label = UILabel(frame:CGRect(x:0, y:100, width:100, height:30))
        label.text = ""
        label.backgroundColor = UIColor.red
        self.addSubview(label)
        
        let image = UILabel(frame:CGRect(x:0, y:0, width:100, height:100))
        image.backgroundColor = UIColor.darkGray
        self.addSubview(image)
    }
}

