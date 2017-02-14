//
//  DefaultsExtension.swift
//  Dookie
//
//  Created by Mathias Lindholm on 14.02.2017.
//  Copyright © 2017 Mathias Lindholm. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let uid = DefaultsKey<String>("uid")
    static let name = DefaultsKey<String>("name")
    static let secret = DefaultsKey<String>("secret")
}
