//
//  NSObject+Reflection.swift
//  impresa
//
//  Created by João Pereira on 08/09/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import Foundation

extension NSObject {
    static var name: String { return String(describing: self) }
}

