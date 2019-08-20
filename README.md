
# Spring - Animation

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/badge/platforms-iOS-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/SwiftSpring.svg)](http://cocoapods.org/pods/SwiftSpring)
![Xcode 10.0+](https://img.shields.io/badge/Xcode-10.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)

## [天朝子民](README_CN.md)

## Table of Contents

- [Features](#features)
- [Install](#install)
- [Usage](#usage)
- [API](#api)
  - [Chaining](#chaining)
  - [Functions](#functions)
  - [Animations](#animations)
  - [Curve](#curve)
  - [Properties](#properties)
- [Reference](#reference)
- [Contributing](#contributing)
- [License](#license)

## Features

- [x] Chained grammar.
- [x] No inheritance required.
- [x] Lightweight expansion.
- [x] Based on UIViewAnimation.
- [x] No code intrusion.


## Install

**CocoaPods - Podfile**

```ruby
pod 'SwiftSpring'
```

## Usage

First make sure to import the framework:

```swift
import SwiftSpring
```

Here are some usage examples. All devices are also available as simulators:

## API

### Chaining

```swift
 animationView.spring
  .opacity(0.1)
  .scale(0.8, 0.8)
  .duration(2)
  .curve(.easeOutQuad)
  .animate()
```

### Functions

```swift
animate() { ... }
```

### Animations

```swift
shake
pop
morph
squeeze
wobble
swing
flipX
flipY
fall
squeezeLeft
squeezeRight
squeezeDown
squeezeUp
slideLeft
slideRight
slideDown
slideUp
fadeIn
fadeOut
fadeInLeft
fadeInRight
fadeInDown
fadeInUp
zoomIn
zoomOut
flash
```
### Curve
```swift
spring
linear
easeIn
easeOut
easeInOut
discrete
easeInSine, easeOutSine, easeInOutSine
easeInQuad, easeOutQuad, easeInOutQuad
easeInCubic, easeOutCubic, easeInOutCubic
easeInQuart, easeOutQuart, easeInOutQuart
easeInQuint, easeOutQuint, easeInOutQuint
easeInExpo, easeOutExpo, easeInOutExpo
easeInCirc, easeOutCirc, easeInOutCirc
easeInBack, easeOutBack, easeInOutBack
        
```

### Properties
```swift
force
duration
delay
damping
velocity
repeatCount
scale
x
y
rotate
alpha
```

\* Not all properties work together.

## Reference

> [Spring](https://github.com/MengTo/Spring)

## Contributing

If you have the need for a specific feature that you want implemented or if you experienced a bug, please open an issue.
If you extended the functionality of Spring yourself and want others to use it too, please submit a pull request.


## License

Spring is under MIT license. See the [LICENSE](LICENSE) file for more info.
