//
//  WBNavigationController.swift
//  微博
//
//  Created by lihongfeng on 16/10/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏系统 navigationBar, 使用 WBBaseViewController 的自定义 navigationBar
        self.navigationBar.isHidden = true
    }
    
}

// MARK: 重写 push 方法
extension WBNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            //push 时隐藏 BottomBar
            viewController.hidesBottomBarWhenPushed = true
            //设置返回按钮标题: 如果是栈底控制器 push, 显示栈底控制器的 title, 其它情况下显示"返回"
            if let vc = viewController as? WBTestViewController  {
                var title = "返回"
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popBack))
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func popBack() {
        self.popViewController(animated: true)
    }
    
}
