//
//  ViewController.swift
//  canvas
//
//  Created by diane cronenwett on 10/21/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deadFace: UIImageView!
    
    @IBAction func deadButton(sender: AnyObject) {
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.deadFace.center.y += 270
            self.deadFace.transform = CGAffineTransformMakeScale(2, 2)
            }) { (finished: Bool) -> Void in
             self.deadFace.transform = CGAffineTransformRotate(self.deadFace.transform, CGFloat(-10 * M_1_PI/180))
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

