 //
//  CollectionHeaderView.swift
//  XYSwiftDemo
//
//  Created by HXB-xiaoYang on 2018/1/17.
//Copyright © 2018年 VansXY. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        self.backgroundColor = UIColor.darkText
    }
    
    // MARK: - Public Property
    
    // MARK: - Private Property
    
}

