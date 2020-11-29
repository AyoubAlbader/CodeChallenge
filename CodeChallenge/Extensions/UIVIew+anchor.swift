//
//  UIVIew+anchor.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

extension UIView {
    func anchor (top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                 centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil,
                 paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                 paddingRight: CGFloat, paddingCenterX: CGFloat, paddingCenterY: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {

        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)

        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

    }
}
