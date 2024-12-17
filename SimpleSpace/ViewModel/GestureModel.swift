/*
Abstract:
Hand tracking updates.
*/

import ARKit
import SwiftUI

/// A model that contains up-to-date hand coordinate information.
@MainActor
@Observable
class GestureModel: @unchecked Sendable {
    let session = ARKitSession()
    var handTracking = HandTrackingProvider()
    var latestHandTracking: HandsUpdates = .init(left: nil, right: nil)
    
    struct HandsUpdates {
        var left: HandAnchor?
        var right: HandAnchor?
    }
    
    func start() async {
        do {
            if HandTrackingProvider.isSupported {
                print("ARKitSession starting.")
                try await session.run([handTracking])
            }
        } catch {
            print("ARKitSession error:", error)
        }
    }
    
    func publishHandTrackingUpdates() async {
        for await update in handTracking.anchorUpdates {
            switch update.event {
            case .updated:
                let anchor = update.anchor
                
                // Publish updates only if the hand and the relevant joints are tracked.
                guard anchor.isTracked else { continue }
                
                // Update left hand info.
                if anchor.chirality == .left {
                    latestHandTracking.left = anchor
                } else if anchor.chirality == .right { // Update right hand info.
                    latestHandTracking.right = anchor
                }
            default:
                break
            }
        }
    }
  
    func areWristsClose() -> Bool {
        // Get the latest hand anchors, return false if either of them isn't tracked.
        guard let leftHandAnchor = latestHandTracking.left,
              let rightHandAnchor = latestHandTracking.right,
              leftHandAnchor.isTracked, rightHandAnchor.isTracked else {
            return false
        }
        
        // Get the wrist joints and check if they are tracked.
        guard
            let leftHandWrist = leftHandAnchor.handSkeleton?.joint(.wrist),
            let rightHandWrist = rightHandAnchor.handSkeleton?.joint(.wrist),
            leftHandWrist.isTracked && rightHandWrist.isTracked
        else {
            return false
        }
        
        // Get the position of wrist joints in world coordinates.
        let originFromLeftHandWristTransform = matrix_multiply(
            leftHandAnchor.originFromAnchorTransform, leftHandWrist.anchorFromJointTransform
        ).columns.3.xyz
        let originFromRightHandWristTransform = matrix_multiply(
            rightHandAnchor.originFromAnchorTransform, rightHandWrist.anchorFromJointTransform
        ).columns.3.xyz
        
        // Calculate the distance between the wrist joints.
        let wristsDistance = distance(originFromLeftHandWristTransform, originFromRightHandWristTransform)
        
        // Return true if the wrists are closer than a certain threshold, e.g., 10 centimeters.
        return wristsDistance < 0.10
    }
}
