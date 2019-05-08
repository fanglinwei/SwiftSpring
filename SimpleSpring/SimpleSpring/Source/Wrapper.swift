//
//  Wrapper.swift
//
//  Created by calm on 2019/1/25.
//  Copyright © 2019 calm. All rights reserved.
//

import Foundation
import UIKit

public struct Wrapper<Base> {
    
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol AnimationCompatible {}

public extension AnimationCompatible {
    
    var spring: Wrapper<Self> {
        return Wrapper(self)
    }
}

extension UIView: AnimationCompatible {}

