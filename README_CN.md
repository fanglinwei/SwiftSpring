
# Spring - Animation

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/badge/platforms-iOS-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/SwiftSpring.svg)](http://cocoapods.org/pods/SwiftSpring)
![Xcode 10.0+](https://img.shields.io/badge/Xcode-10.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)

## 目录

- [特性](#特性)
- [安装](#安装)
- [使用](#使用)
- [API](#api)
  - [链式](#链式调用)
  - [方法](#方法)
  - [动画类型](#动画类型)
  - [曲线](#曲线)
  - [属性](#属性)
- [参考](#参考)
- [贡献](#贡献)
- [协议](#协议)

## 特性

- [x] 链式语法.
- [x] 无需继承父类.
- [x] 轻量级扩展.
- [x] 基于UIViewAnimation.
- [x] 无代码入侵.


## 安装

**CocoaPods - Podfile**

```ruby
pod 'SwiftSpring'
```

**Swift Package Manager**

您可以使用通过[Swift Package Manager](https://swift.org/package-manager)在`Package.swift`文件中添加正确的描述来安装`SwiftSpring`:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/fanglinwei/SwiftSpring-Package.git", from: "0.0.8")
    ]
)
```

## 使用

首先导入:

```swift
import SwiftSpring
```

下面是一些简单示例. 支持所有设备和模拟器:

## API

### 链式调用

```swift
animationView.spring
.opacity(0.1)
.scale(0.8, 0.8)
.duration(2)
.curve(.easeOutQuad)
.animate()
```

### 方法
```swift
animate() { ... }
```
### 动画类型
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

### 曲线
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

### 属性
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

\* 并非所有属性都能一起使用.

## 参考

> [Spring](https://github.com/MengTo/Spring)

## 贡献

如果你需要实现特定功能或遇到错误，请打开issue。 如果你自己扩展了Spring的功能并希望其他人也使用它，请提交拉取请求。


## 协议

Spring 使用 MIT 协议. 有关更多信息，请参阅 [LICENSE](LICENSE) 文件.
