//
//  customView.swift
//  uiViewAnimator
//
//  Created by kiddchantw on 2017/9/20.
//  Copyright © 2017年 kiddchantw. All rights reserved.
//

import UIKit

class customView: UIView {

    
    @IBOutlet weak var btnClose: UIButton!
    
    @IBAction func btnClose(_ sender: UIButton) {
        print("btnClose click")
        self.removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
