//
//  Title.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import UIKit

@IBDesignable
class PageTitle: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.white
        self.font = UIFont.openSansLight(size: 32)
    }
}

@IBDesignable
class Title: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.topaz
        self.font = UIFont.openSansSemiBold(size: 16)
    }
}

@IBDesignable
class Body: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.black
        self.font = UIFont.openSansLight(size: 16)
    }
}


@IBDesignable
class Subtitle: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.brownishGrey
        self.font = UIFont.openSans(size: 14)
    }
}


@IBDesignable
class Info: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.black
        self.font = UIFont.openSansLight(size: 14)
    }
}

@IBDesignable
class SecondBody: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.brownishGrey
        self.font = UIFont.openSans(size: 14)
    }
}

@IBDesignable
class Footer: CustomLabel {
    override func initialize() {
        self.tintColor = UIColor.warmGrey
        self.font = UIFont.openSans(size: 12)
    }
}

@IBDesignable
class Number: CustomLabel {
    override func initialize() {
        self.textColor = UIColor.black
        self.font = UIFont.openSans(size: 12)
    }
}

