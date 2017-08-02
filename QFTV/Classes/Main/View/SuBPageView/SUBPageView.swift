//
//  SuBPageView.swift
//  QFTV
//
//  Created by SuBo on 2017/8/2.
//  Copyright © 2017年 SuBo. All rights reserved.
//

import UIKit

class SUBPageView: UIView {

    // MARK: 定义属性
    fileprivate var titles : [String]!
    fileprivate var style : SUBTitleStyle!
    fileprivate var childVcs : [UIViewController]!
    fileprivate weak var parentVc : UIViewController!
    
    fileprivate var titleView : SUBTitleView!
    fileprivate var contentView : SUBContentView!
    
    // MARK: 自定义构造函数
    init(frame: CGRect, titles : [String], style : SUBTitleStyle, childVcs : [UIViewController], parentVc : UIViewController) {
        super.init(frame: frame)
        
        assert(titles.count == childVcs.count, "标题&控制器个数不同,请检测!!!")
        self.style = style
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        parentVc.automaticallyAdjustsScrollViewInsets = false
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK:- 设置界面内容
extension SUBPageView {
    fileprivate func setupUI() {
        let titleH : CGFloat = style.titleHeight
        let titleFrame = CGRect(x: 0, y: 0, width: frame.width, height: titleH)
        titleView = SUBTitleView(frame: titleFrame, titles: titles, style : style)
        titleView.delegate = self
        addSubview(titleView)
        
        let contentFrame = CGRect(x: 0, y: titleH, width: frame.width, height: frame.height - titleH)
        contentView = SUBContentView(frame: contentFrame, childVcs: childVcs, parentViewController: parentVc)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.delegate = self
        addSubview(contentView)
    }
}


// MARK:- 设置SUBContentView的代理
extension SUBPageView : SUBContentViewDelegate {
    func contentView(_ contentView: SUBContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    func contentViewEndScroll(_ contentView: SUBContentView) {
        titleView.contentViewDidEndScroll()
    }
}


// MARK:- 设置SUBTitleView的代理
extension SUBPageView : SUBTitleViewDelegate {
    func titleView(_ titleView: SUBTitleView, selectedIndex index: Int) {
        contentView.setCurrentIndex(index)
    }
}
