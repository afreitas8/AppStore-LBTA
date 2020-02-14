//
//  AppRowCell.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 2/2/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat){
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton{
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}


public class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)


    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))

    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        //imageView.backgroundColor = .purple
       // imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = .lightGray
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        let stackView = UIStackView(arrangedSubviews:[imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel]), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
