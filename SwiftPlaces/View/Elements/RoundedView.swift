//
//  CardView.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

class RoundedView: UIView {
    
    // MARK: Initialization
    convenience init(frame: CGRect, cornerRadius: CGFloat) {
        self.init(frame: CGRect.zero)
        changeCornerRadius(cornerRadius)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    // MARK: Custom View
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            changeCornerRadius(cornerRadius)
        }
    }
    
    private func changeCornerRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
    }
}
