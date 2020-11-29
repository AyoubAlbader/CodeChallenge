//
//  UIColor+hexString.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    open class var offWhite: UIColor {
        return UIColor(red: 251, green: 251, blue: 253, alpha: 1)
    }

    open class var white: UIColor {
        return UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    }

    open class var grey: UIColor {
        return UIColor(red: 139, green: 141, blue: 161, alpha: 1)
    }

    open class var lightGrey: UIColor {
        return UIColor(red: 183, green: 181, blue: 193, alpha: 1)
    }
}
