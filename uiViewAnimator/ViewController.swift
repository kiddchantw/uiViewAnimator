//
//  ViewController.swift
//  uiViewAnimator
//
//  Created by kiddchantw on 2017/9/20.
//  Copyright © 2017年 kiddchantw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMove: UIButton!
    @IBOutlet weak var btnPop: UIButton!
    @IBOutlet weak var btnVisible: UIButton!
    
    var moveViewOne:UIView! = {
        let view1 = UIView()
        view1.frame =  CGRect(x:0,y:200,width:50,height:50)
        view1.backgroundColor = UIColor.gray
        return view1
    }()
    
    
    var moveViewTwo:UIView! = {
        let view2 = UIView()
        view2.frame =  CGRect(x:0,y:0,width:300,height:300)
        view2.backgroundColor = UIColor.lightGray
        return view2
    }()
    
    var btnMoveBool:Bool = false
    @IBAction func btnMove(_ sender: Any) {
        self.view.addSubview(moveViewOne)

        if btnMoveBool == false{
        let animator = UIViewPropertyAnimator(duration:2,curve:.linear){
            self.moveViewOne.frame = self.moveViewOne.frame.offsetBy(dx: 200, dy: 0)
        }
        animator.startAnimation()
            btnMoveBool = true
        }else{
            let animator = UIViewPropertyAnimator(duration:1.5,curve:.linear){
                self.moveViewOne.frame = self.moveViewOne.frame.offsetBy(dx: -200, dy: 0)
            }
            animator.startAnimation()
            btnMoveBool = false

        }
    }
    
    @IBAction func btnPop(_ sender: Any) {
        moveViewTwo  = Bundle.main.loadNibNamed("cusotmView", owner: self, options: nil)?.first as? customView
        
        moveViewTwo.center = self.view.center
        self.view.addSubview(moveViewTwo)
        
        if moveViewOne != nil {
            moveViewOne.removeFromSuperview()
        }
    }
    
    var btnVisibleBool:Bool = false
    @IBAction func btnVisible(_ sender: UIButton) {
        
        self.view.addSubview(moveViewOne)
    
        if !btnVisibleBool {
            btnVisibleBool = true
            let animator = UIViewPropertyAnimator(duration:2,curve:.easeOut){
                self.moveViewOne.backgroundColor = UIColor.init(displayP3Red: 255, green: 0, blue: 0, alpha: 0)
            }
            animator.startAnimation()

        }else{
            btnVisibleBool = false
            let animator = UIViewPropertyAnimator(duration:2,curve:.easeOut){
                self.moveViewOne.backgroundColor = UIColor.init(displayP3Red: 255, green: 0, blue: 0, alpha: 1)
            }
            animator.startAnimation()

        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPop.custom()
        btnMove.custom()
        btnVisible.custom()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIButton{
    func custom(){
        layer.cornerRadius = 5
    }
}

