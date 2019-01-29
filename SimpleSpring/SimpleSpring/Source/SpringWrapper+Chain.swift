//
//  SpringWrapper+Chain.swift
//  Spring
//
//  Created by calm on 2019/1/28.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

// MARK: - 链式属性
extension SpringWrapper where Base: UIView {
    
    @discardableResult
    func autostart(_ autostart: Bool) -> SpringWrapper {
        config.autostart = autostart
        return self
    }
    @discardableResult
    func autohide(_ autohide: Bool) -> SpringWrapper {
        config.autohide = autohide
        return self
    }
    @discardableResult
    func force(_ force: CGFloat) -> SpringWrapper {
        config.force = force
        return self
    }
    @discardableResult
    func delay(_ delay: CGFloat) -> SpringWrapper {
        config.delay = delay
        return self
    }
    @discardableResult
    func duration(_ duration: CGFloat) -> SpringWrapper {
        config.duration = duration
        return self
    }
    @discardableResult
    func damping(_ damping: CGFloat) -> SpringWrapper {
        config.damping = damping
        return self
    }
    @discardableResult
    func velocity(_ velocity: CGFloat) -> SpringWrapper {
        config.velocity = velocity
        return self
    }
    @discardableResult
    func repeatCount(_ repeatCount: Float) -> SpringWrapper {
        config.repeatCount = repeatCount
        return self
    }
    @discardableResult
    func potint(_ x: CGFloat, _ y: CGFloat) -> SpringWrapper {
        config.x = x
        config.y = y
        return self
    }
    @discardableResult
    func scale(_ x: CGFloat, _ y: CGFloat) -> SpringWrapper {
        config.scaleX = x
        config.scaleY = y
        return self
    }
    @discardableResult
    func rotate(_ rotate: CGFloat) -> SpringWrapper {
        config.rotate = rotate
        return self
    }
    @discardableResult
    func opacity(_ opacity: CGFloat) -> SpringWrapper {
        config.opacity = opacity
        return self
    }
    @discardableResult
    func animateFrom(_ animateFrom: Bool) -> SpringWrapper {
        config.animateFrom = animateFrom
        return self
    }
    @discardableResult
    func curve(_ curve: Animation.Curve) -> SpringWrapper {
        config.curve = curve
        return self
    }
    @discardableResult
    func animation(_ animation: Animation.Preset) -> SpringWrapper {
        config.animation = animation
        return self
    }
    // UIView
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> SpringWrapper {
        base.transform = transform
        return self
    }
    @discardableResult
    func alpha(_ alpha: CGFloat) -> SpringWrapper {
        base.alpha = alpha
        return self
    }
    @discardableResult
    func custom(_ config: (Config)->(Config)) -> SpringWrapper {
        return self
    }
}
