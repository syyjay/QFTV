//
//  BaseModel.swift
//  QFTV
//
//  Created by SuBo on 2017/8/2.
//  Copyright © 2017年 SuBo. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
