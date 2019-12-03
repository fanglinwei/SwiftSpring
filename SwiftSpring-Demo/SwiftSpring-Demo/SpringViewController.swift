//
//  SpringViewController.swift
//  Example
//
//  Created by calm on 2019/7/31.
//  Copyright © 2019 calm. All rights reserved.
//

import UIKit
import SwiftSpring

class SpringViewController: UIViewController {

    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var animationPicker: UIPickerView!
    
    private let animations = Spring.animations
    private let curves = Spring.curves
    private var isBall = false
    private var ballConfig = Config()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationPicker.delegate = self
        animationPicker.dataSource = self
        
        ballView.layer.cornerRadius = 10
        ballConfig.animation = animations[0]
        ballConfig.curve = curves[0]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let optionsViewController = segue.destination as? OptionsViewController {
            optionsViewController.delegate = self
//            setOptions()
            optionsViewController.set(config: ballConfig)
        }
        else if let codeViewController = segue.destination as? CodeViewController {
//            setOptions()
            codeViewController.set(config: ballConfig)
        }
    }
}

// MARK: - Private
extension SpringViewController {
    
    private func changeBall() {
        isBall = !isBall
        let animation = CABasicAnimation()
        let halfWidth = ballView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        ballView.layer.cornerRadius = cornerRadius
        ballView.layer.add(animation, forKey: "radius")
    
        colorAnimations()
    }
    
    private func colorAnimations() {
        UIView.animate(withDuration: 0.1, animations: {
            self.ballView.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.8588235294, blue: 1, alpha: 1)
        }) { finished in
            UIView.animate(withDuration: 0.5) {
                self.ballView.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.6117647059, blue: 0.9215686275, alpha: 1)
            }
        }
    }
    
    private func animateView() {
        setOptions()
    }
    
    private func setOptions() {
        let config = ballConfig
        
        ballView.spring
            .force(config.force)
            .duration(config.duration)
            .delay(config.delay)
            .damping(config.damping)
            .velocity(config.velocity)
            .scale(config.scaleX, config.scaleY)
            .potint(config.x, config.y)
            .rotate(config.rotate)
            .curve(config.curve)
            .animation(config.animation)
            .animate()
        
        /*
         ballView.spring.set { _config in
         _config.force = config.force
         _config.duration = config.duration
         _config.delay = config.delay
         _config.damping = config.damping
         _config.velocity = config.velocity
         _config.scaleX = config.scaleX
         _config.scaleY = config.scaleY
         _config.x = config.x
         _config.y = config.y
         _config.rotate = config.rotate
         _config.curve = config.curve
         _config.animation = config.animation
         }
         
         ballView.spring.animate()
         */
        
    }
}

// MARK: - Action
extension SpringViewController {
    
    @IBAction func forceSliderChanged(_ sender: UISlider) {
        
        ballConfig.force = CGFloat(sender.value)
        animateView()
        forceLabel.text = String(format: "Force: %.1f", Double(ballConfig.force))
    }
    
    @IBAction func durationSliderChanged(_ sender: UISlider) {
        ballConfig.duration = TimeInterval(sender.value)
        animateView()
        durationLabel.text = String(format: "Duration: %.1f", Double(ballConfig.duration))
    }
    
    @IBAction func delaySliderChanged(_ sender: UISlider) {
        ballConfig.delay = TimeInterval(sender.value)
        animateView()
        delayLabel.text = String(format: "Delay: %.1f", Double(ballConfig.delay))
    }
    
    @IBAction func ballButtonPressed(_ sender: AnyObject) {
        colorAnimations()
        
        animateView()
    }
    
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    
    @objc func minimizeView(_ sender: AnyObject) {
        Animation.normal.spring(with: 0.7) {
            self.view.transform = CGAffineTransform(scaleX: 0.935, y: 0.935)
        }
    }
    
    @objc func maximizeView(_ sender: AnyObject) {
        Animation.normal.spring(with: 0.7) {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

extension SpringViewController: OptionsViewControllerDelegate {
    
    func dampingSliderChanged(_ value: CGFloat) {
        ballConfig.damping = value
        animateView()
    }
    
    func velocitySliderChanged(_ value: CGFloat) {
        ballConfig.velocity = value
        animateView()
    }
    
    func scaleSliderChanged(_ value: CGFloat) {
        ballConfig.scaleX = value
        ballConfig.scaleY = value
        animateView()
    }
    
    func xSliderChanged(_ value: CGFloat) {
        ballConfig.x = value
        animateView()
    }
    
    func ySliderChanged(_ value: CGFloat) {
        ballConfig.y = value
        animateView()
    }
    
    func rotateSliderChanged(_ value: CGFloat) {
        ballConfig.rotate = value
        animateView()
    }
    
    func resetButtonPressed() {
        ballConfig = Config()
        
        forceSlider.setValue(Float(ballConfig.force), animated: true)
        durationSlider.setValue(Float(ballConfig.duration), animated: true)
        delaySlider.setValue(Float(ballConfig.delay), animated: true)
        
        forceLabel.text = String(format: "Force: %.1f", Double(ballConfig.force))
        durationLabel.text = String(format: "Duration: %.1f", Double(ballConfig.duration))
        delayLabel.text = String(format: "Delay: %.1f", Double(ballConfig.delay))
    }
}

extension SpringViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? animations.count : curves.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? animations[row].value : curves[row].value
    }
}

extension SpringViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            ballConfig.animation = animations[row]
            animateView()
        default:
            ballConfig.curve = curves[row]
            animateView()
        }
    }
}
