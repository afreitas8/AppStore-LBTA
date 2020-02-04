//
//  Extensions.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 2/2/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit


extension UILabel{
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
