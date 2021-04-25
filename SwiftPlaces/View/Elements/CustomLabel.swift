//
//  CustomLabel.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)
        self.initialize()
    }

    func initialize() {
        fatalError("Must be overriden")
    }
}
