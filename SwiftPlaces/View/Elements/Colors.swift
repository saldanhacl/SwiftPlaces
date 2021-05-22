//
//  Colors.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

extension UIColor {
    
    // MARK: Functions
    
    public class func getRandomPlaceholderColor() -> UIColor {
        let colors = UIColor.getImagePlaceholderColors()
        let placeHolderColor = colors[Int.random(in: 0 ..< colors.count)]
        return placeHolderColor
    }
    
    private static func getImagePlaceholderColors() -> [UIColor] {
        return [duckEggBlue, lightPink, creme]
    }
    
    public class func getPrimaryColor() -> UIColor {
        return topaz
    }
    
    public class func getBackgroundColor() -> UIColor {
        return cultured
    }
    
    // MARK: Colors
    
    @nonobjc public class var duckEggBlue: UIColor {
        return #colorLiteral(red: 0.8156862745, green: 0.9921568627, blue: 0.937254902, alpha: 1)
    }
    
    @nonobjc public class var lightPink: UIColor {
        return #colorLiteral(red: 1, green: 0.8549019608, blue: 0.8823529412, alpha: 1)
    }
    
    @nonobjc public class var creme: UIColor {
        return #colorLiteral(red: 0.9882352941, green: 1, blue: 0.6941176471, alpha: 1)
    }
    
    @nonobjc public class var topaz: UIColor {
        return #colorLiteral(red: 0.07843137255, green: 0.6784313725, blue: 0.7215686275, alpha: 1)
    }
    
    @nonobjc public class var brownishGrey: UIColor {
        return #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    }
    
    @nonobjc public class var warmGrey: UIColor {
        return #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    
    @nonobjc public class var cultured: UIColor {
        return #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
}
