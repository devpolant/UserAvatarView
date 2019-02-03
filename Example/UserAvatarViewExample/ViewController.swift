//
//  ViewController.swift
//  UserAvatarViewExample
//
//  Created by Anton Poltoratskyi on 03.02.2019.
//  Copyright © 2019 Anton Poltoratskyi. All rights reserved.
//

import UIKit
import UserAvatarView

class ViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var avatarView: UserAvatarView!
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    @IBOutlet weak var radiusLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var angleLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialRadius = 24
        radiusSlider.value = Float(initialRadius)
        avatarView.statusIconSize = CGFloat(initialRadius)
        radiusLabel.text = "Radius: \(initialRadius)"
        
        let initialAngle = 45
        slider.value = Float(initialAngle)
        avatarView.statusAngle = initialAngle.degreesToRadians
        angleLabel.text = "Angle: \(initialAngle)"
        
        avatarView.imageView.backgroundColor = .green
        avatarView.statusAppearance = .color(.red)
    }
    
    
    // MARK: - Actions
    
    @IBAction func actionRadiusSliderValueChanged(_ sender: UISlider) {
        let radius = Int(sender.value)
        avatarView.statusIconSize = CGFloat(radius)
        radiusLabel.text = "Radius: \(radius)"
    }
    
    @IBAction func actionSliderValueChanged(_ sender: UISlider) {
        let angle = Int(sender.value)
        avatarView.statusAngle = CGFloat(angle.degreesToRadians)
        angleLabel.text = "Angle: \(angle)"
    }
}

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
