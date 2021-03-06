//
//  UIColorExtension.swift
//  Dookie
//
//  Created by Mathias Lindholm on 10.03.2017.
//  Copyright © 2017 Mathias Lindholm. All rights reserved.
//

import UIKit

extension UIColor {
    static let dookieBlue = UIColor(hex: 0x1E88E5, a: 1.0)
    static let dookieGreen = UIColor(hex: 0x7CB342, a: 1.0)
    static let dookieGray = UIColor(hex: 0x8F8E94, a: 1.0)
    static let dookieDarkGray = UIColor(hex: 0x6D6D72, a: 1.0)
    static let dookieLightGray = UIColor(hex: 0xA4AAB3, a: 1.0)

    convenience init(hex: Int, a: CGFloat) {
        self.init(r: (hex >> 16) & 0xff, g: (hex >> 8) & 0xff, b: hex & 0xff, a: a)
    }

    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}
