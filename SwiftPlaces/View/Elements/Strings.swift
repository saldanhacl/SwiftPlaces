//
//  Strings.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato Saldanha on 27/04/21.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
