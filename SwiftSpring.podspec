Pod::Spec.new do |s|

s.name         = "SwiftSpring"
s.version      = "0.0.8"
s.summary      = "An elegant animation written in swift"

s.homepage     = "https://github.com/fanglinwei/SwiftSpring-Package"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = { "calm" => "calm1993@163.com" }

s.platform     = :ios, "10.0"

s.source       = { :git => "https://github.com/fanglinwei/SwiftSpring-Package.git", :tag => s.version }

s.source_files  = "Sources/**/*.swift"

s.requires_arc = true

s.frameworks = "UIKit", "Foundation"

s.swift_version = "5.0"

end
