//
//  WBHomeViewController.swift
//  微博
//
//  Created by lihongfeng on 16/10/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupUI()
    }
    
    // MARK: Actions
    func pushFriendattentionView() {
        let vc = WBTestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension WBHomeViewController {
    func setupUI() {
        let btn = UIButton.init(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "navigationbar_friendattention"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "navigationbar_friendattention_highlighted"), for: .highlighted)
        btn.addTarget(self, action: #selector(pushFriendattentionView), for: .touchUpInside)
        btn.sizeToFit()
        self.navItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
}
