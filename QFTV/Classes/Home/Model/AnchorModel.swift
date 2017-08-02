//
//  AnchorModel.swift
//  QFTV
//
//  Created by SuBo on 2017/8/2.
//  Copyright © 2017年 SuBo. All rights reserved.
//

import UIKit

class AnchorModel: BaseModel {
    var uid : String = ""
    var roomid : Int = 0
    var name : String = ""
    var pic51 : String = ""
    var pic74 : String = ""
    var live : Int = 0 // 是否在直播
    var push : Int = 0 // 直播显示方式
    var focus : Int = 0 // 关注数
    
    var isEvenIndex : Bool = false
}
