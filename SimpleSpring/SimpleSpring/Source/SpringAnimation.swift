//
//  SpringAnimation.swift
//  Spring
//
//  Created by calm on 2019/1/25.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

enum SpringAnimation {
    case normal
    case curveEaseIn
    case curveEaseOut
    case curveEaseInOut
    case curveLinear
    case delay(TimeInterval)
}

extension SpringAnimation {
    
    public func spring(with duration: TimeInterval,
                       animations: @escaping () -> Void) {
        spring(with: duration, animations: animations, completion: nil)
    }
    
    public func spring(with duration: TimeInterval,
                       animations: @escaping () -> Void,
                       completion: ((Bool) -> Void)?) {
        
        switch self {
        case .normal:
            UIView.animate(withDuration: duration,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.7,
                           options: options,
                           animations: animations,
                           completion: completion)
            
        case .delay(let time):
            UIView.animate(withDuration: duration,
                           delay: time,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.7,
                           options: options,
                           animations: animations,
                           completion: completion)
            
        case .curveEaseIn,
             .curveEaseOut,
             .curveEaseInOut,
             .curveLinear:
            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: options,
                           animations: animations,
                           completion: completion)
        }
    }
}

private extension SpringAnimation {
    var options: UIView.AnimationOptions {
        switch self {
        case .normal,
             .delay:                  return []
        case .curveEaseIn:            return .curveEaseIn
        case .curveEaseOut:           return .curveEaseOut
        case .curveEaseInOut:         return .curveEaseInOut
        case .curveLinear:            return .curveLinear
        }
    }
}

