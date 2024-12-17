/*
Abstract:
Extensions and utilities.
*/

import SwiftUI

extension SIMD4 {
    var xyz: SIMD3<Scalar> {
        self[SIMD3(0, 1, 2)]
    }
}

