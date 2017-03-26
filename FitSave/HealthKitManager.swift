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
    
    func recentSteps(completion: @escaping (Double, NSError?) -> () )
    {
        // The type of data we are requesting (this is redundant and could probably be an enumeration
        let type = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        
        // Our search predicate which will fetch data from now until a day ago
        // (Note, 1.day comes from an extension
        // You'll want to change that to your own NSDate
        let predicate = HKQuery.predicateForSamples(withStart: NSDate() as Date - 1, end: NSDate() as Date)
        
        // The actual HealthKit Query which will fetch all of the steps and sub them up for us.
        let query = HKSampleQuery(sampleType: type!, predicate: predicate, limit: 0, sortDescriptors: nil) { query, results, error in
            var steps: Double = 0
            
            if (results?.count)! > 0
            {
                for result in results as! [HKQuantitySample]
                {
                    steps += result.quantity.doubleValue(for: HKUnit.count())
                }
            }
            
            completion(steps, error as NSError?)
        }
    }
}
