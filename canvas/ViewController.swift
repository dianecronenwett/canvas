//
//  ViewController.swift
//  canvas
//
//  Created by diane cronenwett on 10/21/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var onDrag: UIPanGestureRecognizer!
    @IBOutlet var imageView: UIView!
    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var downArrow: UIImageView!
    var trayPosition: CGPoint!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func onPanTray(sender: AnyObject) {
        var point = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        //trayView.frame.origin.y = point.y
        
        
        
       
        if sender.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
            trayPosition = trayView.frame.origin
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            println("Gesture changed at: \(point)")
            
            var newTrayY = trayPosition.y + translation.y
            if newTrayY < 347 {
                trayView.frame.origin.y = (newTrayY - 347) * 0.1 + 347
            }else {
                trayView.frame.origin.y = newTrayY
            }
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
            
            UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                
                if velocity.y < 0 {
                    self.trayView.frame.origin.y = 347
                    self.downArrow.transform = CGAffineTransformIdentity
                    
                } else {
                    self.downArrow.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.trayView.frame.origin.y = 530
                }
                

                }, completion: nil)
           
            
        
            
        }
    }
    
    
    
    
}

