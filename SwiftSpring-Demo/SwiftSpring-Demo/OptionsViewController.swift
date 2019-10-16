//
//  OptionsViewController.swift
//  Example
//
//  Created by calm on 2019/7/31.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit
import SwiftSpring

protocol OptionsViewControllerDelegate: NSObjectProtocol {
    
    func dampingSliderChanged(_ value: CGFloat)
    func velocitySliderChanged(_ value: CGFloat)
    func scaleSliderChanged(_ value: CGFloat)
    func xSliderChanged(_ value: CGFloat)
    func ySliderChanged(_ value: CGFloat)
    func rotateSliderChanged(_ value: CGFloat)
    func resetButtonPressed()
}

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var modalView: UIView!
    
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var ySlider: UISlider!
    @IBOutlet weak var rotateSlider: UISlider!
    
    
    weak var delegate: OptionsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        modalView.transform = CGAffineTransform(translationX: 0, y: 300)
        resetButton.layer.cornerRadius = 3
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = #colorLiteral(red: 0.5176470588, green: 0.5490196078, blue: 0.6274509804, alpha: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func set(config data: Config) {
        loadViewIfNeeded()
        
        dampingSlider.setValue(Float(data.damping), animated: true)
        velocitySlider.setValue(Float(data.velocity), animated: true)
        scaleSlider.setValue(Float(data.scaleX), animated: true)
        xSlider.setValue(Float(data.x), animated: true)
        ySlider.setValue(Float(data.y), animated: true)
        rotateSlider.setValue(Float(data.rotate), animated: true)
        
        dampingLabel.text = getString("Damping", value: data.damping)
        velocityLabel.text = getString("Velocity", value: data.velocity)
        scaleLabel.text = getString("Scale", value: data.scaleX)
        xLabel.text = getString("x", value: data.x)
        yLabel.text = getString("y", value: data.y)
        rotateLabel.text = getString("Rotate", value: data.rotate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIApplication.shared.sendAction(#selector(SpringViewController.minimizeView(_:)), to: nil, from: self, for: nil)
        modalView.spring.animation(.squeezeUp).animate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard touches.first?.view == view else { return }
        
        dismiss(animated: true)
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
    }
}

extension OptionsViewController {
    
    @IBAction func dampingSliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.dampingSliderChanged(value)
        dampingLabel.text = getString("Damping", value: value)
    }
    
    @IBAction func velocitySliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.velocitySliderChanged(value)
        velocityLabel.text = getString("Velocity", value: value)
    }
    
    @IBAction func scaleSliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.scaleSliderChanged(value)
        scaleLabel.text = getString("Scale", value: value)
    }
    
    @IBAction func xSliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.xSliderChanged(value)
        xLabel.text = getString("X", value: value)
    }
    
    @IBAction func ySliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.ySliderChanged(value)
        yLabel.text = getString("Y", value: value)
    }
    
    @IBAction func rotateSliderChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        delegate?.rotateSliderChanged(value)
        rotateLabel.text = getString("Rotate", value: value)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        delegate?.resetButtonPressed()
        dismiss(animated: true)
        
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
    }
}

extension OptionsViewController {
    
    private func getString(_ name: String, value: CGFloat) -> String {
        return String(format: "\(name): %.1f", Double(value))
    }
}
