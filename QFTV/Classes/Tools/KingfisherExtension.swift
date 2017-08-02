//
//  KingfisherExtension.swift
//  QFTV
//
//  Created by SuBo on 2017/8/2.
//  Copyright © 2017年 SuBo. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(_ URLString : String?, _ placeHolderName : String? = nil) {
        guard let URLString = URLString else {
            return
        }
        
        guard let url = URL(string: URLString) else {
            return
        }
        
        guard let placeHolderName = placeHolderName else {
            kf.setImage(with: url)
            return
        }
        
        kf.setImage(with: url, placeholder : UIImage(named: placeHolderName))
    }
}
