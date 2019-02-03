//
//  UserAvatarView.swift
//  UserAvatarView
//
//  Created by Anton Poltoratskyi on 25.10.2018.
//  Copyright © 2018 Anton Poltoratskyi. All rights reserved.
//

import UIKit

public final class UserAvatarView: UIView {
    
    public enum StatusAppearance {
        case color(UIColor)
        case image(UIImage)
        case none
    }
    
    public var statusAppearance: StatusAppearance = .none {
        didSet {
            update(statusAppearance)
            setNeedsLayout()
        }
    }
    
    public var statusAngle: CGFloat = .pi / 4 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var statusIconSize: CGFloat = 8 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var statusIconPadding: CGFloat = 2 {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    // MARK: - Views
    
    public let imageView = UIImageView()
    
    private let statusView = UIImageView()
    
    private let maskLayer = CAShapeLayer()
    
    private var isMaskActive: Bool {
        return !statusView.isHidden
    }
    
    private var imageRadius: CGFloat {
        return bounds.height / 2
    }
    
    
    // MARK: - Setup
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        
        imageView.layer.masksToBounds = true
        addSubview(imageView)
        
        statusView.layer.masksToBounds = true
        addSubview(statusView)
        
        update(statusAppearance)
    }
    
    private func update(_ appearance: StatusAppearance) {
        switch appearance {
        case let .color(color):
            statusView.isHidden = false
            statusView.backgroundColor = color
            statusView.image = nil
        case let .image(image):
            statusView.isHidden = false
            statusView.backgroundColor = nil
            statusView.image = image
        case .none:
            statusView.isHidden = true
            statusView.backgroundColor = nil
            statusView.image = nil
        }
    }
    
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds
        imageView.layer.cornerRadius = imageRadius
        
        if isMaskActive {
            let clipCircleCenter = statusPosition(in: bounds)
            let clipCircleSize = statusIconSize + statusIconPadding * 2
            let clipCircleFrame = CGRect(
                x: clipCircleCenter.x - clipCircleSize / 2,
                y: clipCircleCenter.y - clipCircleSize / 2,
                width: clipCircleSize,
                height: clipCircleSize
            )
            updateClipMask(with: clipCircleFrame)
            updateStatusView(with: clipCircleFrame.origin)
        } else {
            imageView.layer.mask = nil
        }
    }
    
    private func updateClipMask(with frame: CGRect) {
        let statusCirclePath = UIBezierPath(ovalIn: frame)
        
        let path = UIBezierPath(rect: bounds)
        path.append(statusCirclePath.reversing())
        
        maskLayer.path = path.cgPath
        
        imageView.layer.mask = maskLayer
    }
    
    private func updateStatusView(with origin: CGPoint) {
        statusView.frame = CGRect(x: origin.x + statusIconPadding,
                                  y: origin.y + statusIconPadding,
                                  width: statusIconSize,
                                  height: statusIconSize)
        
        statusView.layer.cornerRadius = statusIconSize / 2
    }
    
    private func statusPosition(in bounds: CGRect) -> CGPoint {
        return CGPoint(x: imageRadius * cos(statusAngle) + bounds.width / 2,
                       y: imageRadius * sin(statusAngle) + bounds.height / 2)
    }
}
