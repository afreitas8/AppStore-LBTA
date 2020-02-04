//
//  AppsGroupCell.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 1/27/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit



class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel: UILabel = UILabel(text: "App section", font: .boldSystemFont(ofSize: 30))
 
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .lightGray
        
        addSubview(titleLabel)
        titleLabel.anchor(top:topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalController.view)
        //horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
