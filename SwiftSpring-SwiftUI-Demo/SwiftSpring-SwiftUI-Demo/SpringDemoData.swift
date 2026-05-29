//
//  SpringDemoData.swift
//  SwiftSpring-SwiftUI-Demo
//
//  Created by 方林威 on 2026/5/29.
//

import SwiftSpring

extension Animation.Preset {
    static let demoCases: [Animation.Preset] = [
        .fall,
        .shake,
        .bounce,
        .jump,
        .pop,
        .morph,
        .squeeze,
        .flash,
        .wobble,
        .swing,
        .slideLeft,
        .slideRight,
        .slideDown,
        .slideUp,
        .squeezeLeft,
        .squeezeRight,
        .squeezeDown,
        .squeezeUp,
        .fadeInLeft,
        .fadeInRight,
        .fadeInDown,
        .fadeInUp,
        .fadeIn,
        .fadeOut,
        .fadeOutIn,
        .zoomIn,
        .zoomOut,
        .flipX,
        .flipY
    ]

    var value: String {
        switch self {
        case .none: return "none"
        case .fall: return "fall"
        case .shake: return "shake"
        case .bounce: return "bounce"
        case .jump: return "jump"
        case .pop: return "pop"
        case .morph: return "morph"
        case .squeeze: return "squeeze"
        case .flash: return "flash"
        case .wobble: return "wobble"
        case .swing: return "swing"
        case .slideLeft: return "slideLeft"
        case .slideRight: return "slideRight"
        case .slideDown: return "slideDown"
        case .slideUp: return "slideUp"
        case .squeezeLeft: return "squeezeLeft"
        case .squeezeRight: return "squeezeRight"
        case .squeezeDown: return "squeezeDown"
        case .squeezeUp: return "squeezeUp"
        case .fadeInLeft: return "fadeInLeft"
        case .fadeInRight: return "fadeInRight"
        case .fadeInDown: return "fadeInDown"
        case .fadeInUp: return "fadeInUp"
        case .fadeIn: return "fadeIn"
        case .fadeOut: return "fadeOut"
        case .fadeOutIn: return "fadeOutIn"
        case .zoomIn: return "zoomIn"
        case .zoomOut: return "zoomOut"
        case .flipX: return "flipX"
        case .flipY: return "flipY"
        }
    }
}

extension Animation.Curve {
    static let demoCases: [Animation.Curve] = [
        .linear,
        .discrete,
        .spring(damping: 1),
        .custom(c1x: 0.47, c1y: 0, c2x: 0.745, c2y: 0.715),
        .easeIn,
        .easeOut,
        .easeInOut,
        .easeInSine,
        .easeOutSine,
        .easeInOutSine,
        .easeInQuad,
        .easeOutQuad,
        .easeInOutQuad,
        .easeInCubic,
        .easeOutCubic,
        .easeInOutCubic,
        .easeInQuart,
        .easeOutQuart,
        .easeInOutQuart,
        .easeInQuint,
        .easeOutQuint,
        .easeInOutQuint,
        .easeInExpo,
        .easeOutExpo,
        .easeInOutExpo,
        .easeInCirc,
        .easeOutCirc,
        .easeInOutCirc,
        .easeInBack,
        .easeOutBack,
        .easeInOutBack
    ]

    var value: String {
        switch self {
        case .linear: return "linear"
        case .discrete: return "discrete"
        case .spring: return "spring"
        case .none: return "none"
        case .custom: return "custom"
        case .easeIn: return "easeIn"
        case .easeOut: return "easeOut"
        case .easeInOut: return "easeInOut"
        case .easeInSine: return "easeInSine"
        case .easeOutSine: return "easeOutSine"
        case .easeInOutSine: return "easeInOutSine"
        case .easeInQuad: return "easeInQuad"
        case .easeOutQuad: return "easeOutQuad"
        case .easeInOutQuad: return "easeInOutQuad"
        case .easeInCubic: return "easeInCubic"
        case .easeOutCubic: return "easeOutCubic"
        case .easeInOutCubic: return "easeInOutCubic"
        case .easeInQuart: return "easeInQuart"
        case .easeOutQuart: return "easeOutQuart"
        case .easeInOutQuart: return "easeInOutQuart"
        case .easeInQuint: return "easeInQuint"
        case .easeOutQuint: return "easeOutQuint"
        case .easeInOutQuint: return "easeInOutQuint"
        case .easeInExpo: return "easeInExpo"
        case .easeOutExpo: return "easeOutExpo"
        case .easeInOutExpo: return "easeInOutExpo"
        case .easeInCirc: return "easeInCirc"
        case .easeOutCirc: return "easeOutCirc"
        case .easeInOutCirc: return "easeInOutCirc"
        case .easeInBack: return "easeInBack"
        case .easeOutBack: return "easeOutBack"
        case .easeInOutBack: return "easeInOutBack"
        }
    }
}
