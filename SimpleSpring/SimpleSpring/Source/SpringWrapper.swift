//
//  SpringWrapper.swift
//  Spring
//
//  Created by calm on 2019/1/25.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit

struct SpringWrapper<Base> {
    let base: Base
    
    var build: Base {
        return base
    }
    
    init(_ base: Base) {
        self.base = base
    }
}

protocol AnimationCompatible {}

extension AnimationCompatible {
    
    var spring: SpringWrapper<Self> {
        get { return SpringWrapper(self) }
        set { }
    }
}

extension UIView: AnimationCompatible {}

