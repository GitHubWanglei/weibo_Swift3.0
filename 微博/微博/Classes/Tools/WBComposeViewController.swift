//
//  WBComposeViewController.swift
//  微博
//
//  Created by lihongfeng on 16/10/14.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import UIKit

class WBComposeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.navigationBar.isHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }

}
