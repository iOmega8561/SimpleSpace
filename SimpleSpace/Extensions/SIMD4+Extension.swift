//
//  SIMD4+Extension.swift
//  SimpleSpace
//
//  Created by Matt Novoselov on 16/12/24.
//

import SwiftUI

extension SIMD4 {
    var xyz: SIMD3<Scalar> {
        self[SIMD3(0, 1, 2)]
    }
}

