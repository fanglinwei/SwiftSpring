//
//  ViewController.swift
//  SimpleSpring
//
//  Created by calm on 2019/1/29.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ballView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.layer.cornerRadius = 10
        ballView.layer.masksToBounds = true
    }

    @IBAction func playAction(_ sender: Any) {
        guard let ballView = self.ballView else {
            return
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.slideLeft)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.pop)
            
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.shake)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.flipX)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.flipY)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.morph)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.squeeze)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.wobble)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.swing)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.flash)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.zoomIn)
        }
        
        delay() {
            ballView.spring
                .duration(1)
                .animate(.fall)
        }
        
        time = 0
    }
}

private var time: TimeInterval = 0
func delay(execute: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: execute)
    
    time += 1
}
