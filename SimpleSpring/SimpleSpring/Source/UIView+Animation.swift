//
//  UIView+Animation.swift
//  Spring
//
//  Created by calm on 2019/1/25.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

extension SpringWrapper where Base: UIView {
    
    func animate(_ animation: Animation.Preset? = .none) {
        animation.map { config.animation = $0 }
        solver.animate()
    }
    
    func animateNext(_ animation: Animation.Preset? = .none,
                     completion: @escaping () -> ()) {
        animation.map { config.animation = $0 }
        solver.animateNext(completion: completion)
    }
    
    func animateTo(_ animation: Animation.Preset? = .none) {
        animation.map { config.animation = $0 }
        solver.animateTo()
    }
    
    func animateToNext(_ animation: Animation.Preset? = .none,
                       completion: @escaping () -> ()) {
        
        animation.map { config.animation = $0 }
        solver.animateToNext(completion: completion)
    }
    
    func customAwakeFromNib() {
        solver.customLayoutSubviews()
    }
    
    func customLayoutSubviews() {
        solver.customLayoutSubviews()
    }
}

private var taskConfigKey: Void?
private var taskSpringKey: Void?

extension SpringWrapper where Base: UIView {
    
    mutating func set(config: (Config)->() ) {
        config(self.config)
    }
    
    var config : Config {
        guard let config: Config = getAssociatedObject(base, &taskConfigKey) else {
            let value = Config()
            setRetainedAssociatedObject(base, &taskConfigKey, value)
            return value
        }
        return config
    }
    
    private var solver: Solver {
        guard let solver: Solver = getAssociatedObject(base, &taskSpringKey) else {
            let value = Solver(config, build)
            setRetainedAssociatedObject(base, &taskSpringKey, value)
            return value
        }
        return solver
    }
}

