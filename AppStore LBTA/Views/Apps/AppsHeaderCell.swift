//
//  AppsHeaderCell.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 2/5/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell{
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .green
        
        companyLabel.textColor = .blue
        
        titleLabel.numberOfLines = 2
        
        imageView.backgroundColor = .red
        
        
        
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel,imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
