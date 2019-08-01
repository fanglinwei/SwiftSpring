//
//  CodeViewController.swift
//  Example
//
//  Created by calm on 2019/7/31.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit
import SwiftSpring

class CodeViewController: UIViewController {

    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var codeText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modalView.transform = CGAffineTransform(translationX: -300, y: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard touches.first?.view == view else { return }
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
        
        modalView
            .spring
            .animateFrom(false)
            .animation(.squeezeRight)
            .animate {
                self.dismiss(animated: false)
        }
    }
    

    func set(config data: Config) {
        
        loadViewIfNeeded()
        
        codeText += "ballView.spring\n"
        codeText += "\t.animation(.\(data.animation))\n"
        codeText += "\t.curve(.\(data.curve))\n"
        
        if data.force != 1 {
            codeText += getString("force", value: data.force)
        }
        if data.duration != 0.7 {
            codeText += getString("duration", value: data.duration)
        }
        if data.delay != 0 {
            codeText += getString("delay", value: data.delay)
        }
        
        if data.rotate != 0 {
            codeText += getString("rotate", value: data.rotate)
        }
        if data.damping != 0.7 {
            codeText += getString("damping", value: data.damping)
        }
        
        if data.velocity != 0.7 {
            codeText += getString("velocity", value: data.velocity)
        }
        
        if data.repeatCount != 1 {
            codeText += getString("repeatCount", value: CGFloat(data.repeatCount))
        }
        
        if data.opacity != 1 {
            codeText += getString("alpha", value: data.opacity)
        }
        
        if data.x != 0 || data.y != 0 {
            let x = String(format: "%.1f", Double(data.x))
            let y = String(format: "%.1f", Double(data.y))
            codeText += "\t.potint(\(x),\(y))\n"
        }
        
        if data.scaleX != 1 || data.scaleY != 1 {
            let x = String(format: "%.1f", Double(data.scaleX))
            let y = String(format: "%.1f", Double(data.scaleY))
            codeText += "\t.scale(\(x),\(y))\n"
        }
        
        if data.animateFrom != false  {
            codeText += "\t.animateFrom(\(data.animateFrom))\n"
        }
        
        codeText += "\t.animate()"
        
        codeTextView.text = codeText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        modalView
            .spring
            .animation(.squeezeRight)
            .animate()
        
        UIApplication.shared.sendAction(#selector(SpringViewController.minimizeView(_:)), to: nil, from: self, for: nil)
    }
}

extension CodeViewController {
    
    private func getString(_ name: String, value: CGFloat) -> String {
        let value = String(format: "%.1f", Double(value))
        return "\t.\(name)(\(value))\n"
    }
    
}
