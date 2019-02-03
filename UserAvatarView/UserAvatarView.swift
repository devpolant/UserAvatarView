//
//  UserAvatarView.swift
//  UserAvatarView
//
//  Created by Anton Poltoratskyi on 25.10.2018.
//  Copyright © 2018 Anton Poltoratskyi. All rights reserved.
//

import UIKit

public final class UserAvatarView: UIView {
    
    public var angle: CGFloat = .pi / 4 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var statusRadius: CGFloat = 24 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var statusPadding: CGFloat = 8 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var imageRadius: CGFloat {
        return bounds.height / 2
    }
    
    
    // MARK: - Views
    
    public let imageView = UIImageView()
    
    private let statusView = UIImageView()
    
    private let maskLayer = CAShapeLayer()
    
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
        
        imageView.layer.masksToBounds = true
        addSubview(imageView)
        
        statusView.layer.masksToBounds = true
        addSubview(statusView)
    }
    
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds
        imageView.layer.cornerRadius = bounds.height / 2
        
        let clipCircleCenter = statusPosition(in: bounds)
        let clipCircleSize = statusRadius + statusPadding * 2
        let clipCircleFrame = CGRect(
            x: clipCircleCenter.x - clipCircleSize / 2,
            y: clipCircleCenter.y - clipCircleSize / 2,
            width: clipCircleSize,
            height: clipCircleSize
        )
        updateClipMask(with: clipCircleFrame)
        updateStatusView(with: clipCircleFrame)
    }
    
    private func updateClipMask(with frame: CGRect) {
        let statusCirclePath = UIBezierPath(ovalIn: frame)
        
        let path = UIBezierPath(rect: bounds)
        path.append(statusCirclePath.reversing())
        
        maskLayer.path = path.cgPath
        
        imageView.layer.mask = maskLayer
    }
    
    private func updateStatusView(with frame: CGRect) {
        let size = frame.width - statusPadding * 2
        
        statusView.frame = CGRect(x: frame.minX + statusPadding,
                                  y: frame.minY + statusPadding,
                                  width: size,
                                  height: size)
        
        statusView.layer.cornerRadius = size / 2
    }
    
    private func statusPosition(in bounds: CGRect) -> CGPoint {
        return CGPoint(x: imageRadius * cos(angle) + bounds.width / 2,
                       y: imageRadius * sin(angle) + bounds.height / 2)
    }
}

extension UserAvatarView {
    
    public enum StatusAppearance {
        case color(UIColor)
        case image(UIImage)
    }
    
    public func update(_ statusAppearance: StatusAppearance) {
        switch statusAppearance {
        case let .color(color):
            statusView.backgroundColor = color
            statusView.image = nil
        case let .image(image):
            statusView.backgroundColor = nil
            statusView.image = image
        }
    }
}
