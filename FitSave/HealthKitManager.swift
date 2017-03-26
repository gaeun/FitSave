//
//  HealthKitManager.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

class HealthKitManager {
    let healthStore = HKHealthStore()
    
    func authorizeHealthKit() -> Bool {
        var isEnabled = true
        
        if HKHealthStore.isHealthDataAvailable() {
            let stepsCount = NSSet(object: HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) ?? 0)
            healthStore.requestAuthorization(toShare: nil, read: stepsCount as? Set<HKObjectType>) {
                (success, error) -> Void in
                isEnabled = success
            }
        } else {
            isEnabled = false
        }
        return isEnabled
    }
    
   }
