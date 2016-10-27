//
//  WBTabBarController.swift
//  微博
//
//  Created by lihongfeng on 16/10/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBTabBarController: UITabBarController, UITabBarControllerDelegate {

    lazy var composeBtn = UIButton.init()
    var didSelectComposeBtn: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.addChildViewControllers()
        self.addComposeBtn()
    }
    
}

//MARK: 添加子控制器
extension WBTabBarController {
    
    func addComposeBtn() {
        let tabbarItemWith = tabBar.bounds.width / CGFloat(self.childViewControllers.count)
        composeBtn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        composeBtn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        composeBtn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        composeBtn.frame = tabBar.bounds.insetBy(dx: tabbarItemWith * 2, dy: 0)
        tabBar.addSubview(composeBtn)
    }
    
    func addChildViewControllers() {
        let array = [
            ["className": "WBHomeViewController", "title": "首页", "imageName": "tabbar_home"],
            ["className": "WBMessageViewController", "title": "消息", "imageName": "tabbar_message_center"],
            ["className": "UIViewController"],
            ["className": "WBDiscoverViewController", "title": "发现", "imageName": "tabbar_discover"],
            ["className": "WBProfileViewController", "title": "我", "imageName": "tabbar_profile"]
        ]
        for dic in array {
            let vc = self.creatChildVC(dic: dic)
            self.addChildViewController(vc)
        }
    }
    
    func creatChildVC(dic: [String: String]) -> UIViewController {
        guard let className = dic["className"],
            let title = dic["title"],
            let imageName = dic["imageName"],
            let cls = NSClassFromString("微博.\(className)") as? UIViewController.Type
            else {
            return UIViewController.init()
        }
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage.init(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        return WBNavigationController.init(rootViewController: vc)
    }
    
}

//MARK: 拦截 tabBar 中间按钮的点击事件, 转换为点击 composeBtn 的点击事件
extension WBTabBarController {
    //MARK: UITabBarControllerDelegate
    @objc(tabBarController:shouldSelectViewController:) func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isMember(of: UIViewController.self) {
            if self.didSelectComposeBtn != nil {
                self.didSelectComposeBtn!()
            }
            return false
        }
        return true
    }
    
}












