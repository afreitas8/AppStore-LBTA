//
//  BaseListController.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 1/27/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController{
    
    init(){
           super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
       
    required init?(coder aDecoder: NSCoder){
           fatalError("init(coder:) has not been implemented")
    }
}
