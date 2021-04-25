//
//  Fonts.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import UIKit

extension UIFont {
    @nonobjc public class func openSansLight(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-Light", size: CGFloat(size)) {
            return font
        }
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    @nonobjc public class func openSans(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-Regular", size: CGFloat(size)) {
            return font
        }
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    @nonobjc public class func openSansSemiBold(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-SemiBold", size: CGFloat(size)) {
            return font
        }
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}
