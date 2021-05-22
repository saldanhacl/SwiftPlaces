//
//  ConstraintHelper.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 22/05/21.
//

import UIKit

enum BondType {
    case bondToTop
    case bondToBottom
    case bondToLeading
    case bondToTrailing
    case fillSuperView
    case equalWidth
    case fullWidth
    case fullHeight
    case width(CGFloat)
    case height(CGFloat)
    case sameCenterX
    case sameCenterY
    case sameCenter
    case marginFromLeading(CGFloat)
    case marginFromTrailing(CGFloat)
    case marginFromTop(CGFloat)
    case marginFromBottom(CGFloat)
    case marginFromBottomGreaterThanOrEqual(CGFloat)
    case marginFromLeft(CGFloat)
    case marginFromRight(CGFloat)
    case marginFromAbove(CGFloat)
    case marginFromBelow(CGFloat)
    case marginEqual(CGFloat)
    case verticalMargin(CGFloat)
    case horizontalMargin(CGFloat)
}

extension UIView {
    func removeSubviews() {
        self.subviews.forEach({$0.removeFromSuperview()})
    }
    func setConstraints(_ types: [BondType], toView view: UIView? = nil) {
        types.forEach { self.setBond(type: $0, toView: view) }
    }
    private func setBond(type: BondType, toView: UIView?) {
        guard let toView = toView else {
            self.setBond(type: type)
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .width, .height:
            self.setBond(type: type)
        case .fillSuperView:
            self.topAnchor.constraint(equalTo: toView.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor).isActive = true
        case .fullHeight:
            self.topAnchor.constraint(equalTo: toView.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor).isActive = true
        case .fullWidth:
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor).isActive = true
        case .equalWidth:
            self.widthAnchor.constraint(equalTo: toView.widthAnchor, multiplier: 1.0).isActive = true
        case .sameCenterX:
            self.centerXAnchor.constraint(equalTo: toView.centerXAnchor).isActive = true
        case .sameCenterY:
            self.centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true
        case .sameCenter:
            self.centerXAnchor.constraint(equalTo: toView.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true
        case .bondToTop:
            self.topAnchor.constraint(equalTo: toView.topAnchor).isActive = true
        case .bondToBottom:
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor).isActive = true
        case .marginFromTop(let margin):
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: margin).isActive = true
        case .marginFromBottom(let margin):
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -margin).isActive = true
        case .marginFromBottomGreaterThanOrEqual(let margin):
            let constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: toView.bottomAnchor, constant: margin)
            constraint.priority = .defaultLow
            constraint.isActive = true
        case .marginFromAbove(let margin):
            self.topAnchor.constraint(equalTo: toView.bottomAnchor, constant: margin).isActive = true
        case .marginFromBelow(let margin):
            self.bottomAnchor.constraint(equalTo: toView.topAnchor, constant: -margin).isActive = true
        case .bondToLeading:
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor).isActive = true
        case .bondToTrailing:
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor).isActive = true
        case .marginFromLeading(let margin):
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: margin).isActive = true
        case .marginFromTrailing(let margin):
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -margin).isActive = true
        case .marginFromLeft(let margin):
            self.leadingAnchor.constraint(equalTo: toView.trailingAnchor, constant: margin).isActive = true
        case .marginFromRight(let margin):
            self.trailingAnchor.constraint(equalTo: toView.leadingAnchor, constant: -margin).isActive = true
        case .marginEqual(let margin):
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: margin).isActive = true
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -margin).isActive = true
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: margin).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -margin).isActive = true
        case .verticalMargin(let margin):
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: margin).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -margin).isActive = true
        case .horizontalMargin(let margin):
            self.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: margin).isActive = true
            self.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -margin).isActive = true
        }
    }
    
    private func setBond(type: BondType) {
        self.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .width(let value):
            self.widthAnchor.constraint(equalToConstant: value).isActive = true
        case .height(let value):
            self.heightAnchor.constraint(equalToConstant: value).isActive = true
        default: break
        }
    }
}
