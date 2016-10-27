//
//  UIBarButtonItem+Extension.swift
//  微博
//
//  Created by lihongfeng on 16/10/14.
//  Copyright © 2016年 wanglei. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector, isBack: Bool = true) {
        let btn = UIButton.init(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitleColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), for: .highlighted)
        btn.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        if isBack == true {
            btn.setImage(#imageLiteral(resourceName: "hotweibo_back_icon"), for: .normal)
            btn.setImage(#imageLiteral(resourceName: "hotweibo_back_icon_highlighted"), for: .highlighted)
        }
        btn.sizeToFit()
        self.init(customView: btn)
    }
}
