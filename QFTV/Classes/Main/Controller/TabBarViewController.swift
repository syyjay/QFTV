//
//  TabBarViewController.swift
//  QFTV
//
//  Created by SuBo on 2017/7/8.
//  Copyright © 2017年 SuBo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildVcs()
    }
}

extension TabBarViewController{
    
    func setupChildVcs()  {
        let homeVc :NavigationViewController = NavigationViewController(rootViewController: HomeViewController())
        setupChidldVc(childVc: homeVc, imgName: "tab_icon_live", imgHighName: "tab_icon_live_pre")
        
        let profileVc :NavigationViewController = NavigationViewController(rootViewController: ProfileViewController())
        setupChidldVc(childVc: profileVc, imgName: "tab_icon_mine", imgHighName: "tab_icon_mine_pre")
    }
    
    func setupChidldVc(childVc:UIViewController,imgName:String,imgHighName:String)  {
        self.addChildViewController(childVc)
     
        childVc.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
        childVc.tabBarItem.selectedImage=UIImage(named: imgHighName)?.withRenderingMode(.alwaysOriginal)
    }
}
