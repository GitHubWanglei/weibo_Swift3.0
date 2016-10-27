//
//  WBBaseViewController.swift
//  微博
//
//  Created by lihongfeng on 16/10/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    //自定义 navigationBar
    lazy var navigationBar = UINavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    //添加自定义的 navItem, 设置 title/leftBarButtonItem/rightBarButtonItem 均使用自定义的设置
    lazy var navItem = UINavigationItem()
    //重写 title 的 setter 方法
    override var title: String?{
        didSet {
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.addCustomNavigationBar()
    }
    
    // MARK: 添加自定义 navigationBar
    func addCustomNavigationBar() {
        self.view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
    }

}
