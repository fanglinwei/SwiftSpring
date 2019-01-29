//
//  Config.swift
//  Spring
//
//  Created by calm on 2019/1/25.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

class Config: NSObject {
    
    public var autostart: Bool = false
    public var autohide: Bool = false
    public var animation: Animation.Preset = .none
    public var force: CGFloat = 1
    public var delay: CGFloat = 0
    public var duration: CGFloat = 0.7
    public var damping: CGFloat = 0.7
    public var velocity: CGFloat = 0.7
    public var repeatCount: Float = 1
    public var x: CGFloat = 0
    public var y: CGFloat = 0
    public var scaleX: CGFloat = 1
    public var scaleY: CGFloat = 1
    public var rotate: CGFloat = 0
    public var curve: Animation.Curve = .none
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false
}


