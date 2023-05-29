//
//  FootTrackerHelper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-29.
//

import Foundation
import CoreMotion

class FootTrackerHelper {
    private let pedometer: CMPedometer
    
    init() {
        pedometer = CMPedometer()
    }
    
    func startFootWalkingTracking() {
        guard CMPedometer.isStepCountingAvailable() else {
            print("Step counting is not available on this device.")
            return
        }
        
        pedometer.startUpdates(from: Date()) { [weak self] (pedometerData, error) in
            guard let pedometerData = pedometerData, error == nil else {
                print("Foot walking tracking failed with error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let steps = pedometerData.numberOfSteps as? Int {
                self?.footWalkingSensorDidUpdateSteps(steps)
            }
        }
    }
    
    private func footWalkingSensorDidUpdateSteps(_ steps: Int) {
        // Handle the updated step count
        print("Step count: \(steps)")
        
        // You can store or process the step count as required
    }
}
