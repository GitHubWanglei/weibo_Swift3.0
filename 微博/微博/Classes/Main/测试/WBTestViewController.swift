//
//  WBTestViewController.swift
//  微博
//
//  Created by lihongfeng on 16/10/14.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBTestViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.title = "Page \(navigationController?.childViewControllers.count ?? 0)"
        
        self.setupUI()
        
    }

    // MARK: Actions
    func pushNextPage() {
        let vc = WBTestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }

}

extension WBTestViewController {
    func setupUI() {
        self.navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一页", target: self, action: #selector(pushNextPage), isBack: false)
    }
}
