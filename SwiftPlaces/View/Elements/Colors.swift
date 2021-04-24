//
//  Colors.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 24/04/21.
//

import UIKit

extension UIColor {
    
    public class func getProjectColors() -> [UIColor] {
        return [duckEggBlue, lightPink, creme]
    }
    
    @nonobjc public class var duckEggBlue: UIColor {
        return #colorLiteral(red: 0.8156862745, green: 0.9921568627, blue: 0.937254902, alpha: 1)
    }
    
    @nonobjc public class var lightPink: UIColor {
        return #colorLiteral(red: 1, green: 0.8549019608, blue: 0.8823529412, alpha: 1)
    }
    
    @nonobjc public class var creme: UIColor {
        return #colorLiteral(red: 0.9882352941, green: 1, blue: 0.6941176471, alpha: 1)
    }
}

