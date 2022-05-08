//
//  StepControllerViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 12/04/22.
//

//import UIKit
//import CoreMotion
//
//class StepControllerViewController: UIViewController {
//    private let activityManager = CMMotionActivityManager()
//    /// Provides to create an instance of the CMPedometer.
//    private let pedometer = CMPedometer()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
//            guard let activity = activity else { return }
//            DispatchQueue.main.async {
//                if activity.stationary {
//                    print("Stationary")
//                } else if activity.walking {
//                    print("Walking")
//                } else if activity.running {
//                    print("Running")
//                } else if activity.automotive {
//                    print("Automotive")
//                }
//            }
//        }
//        if CMPedometer.isStepCountingAvailable() {
//            pedometer.startUpdates(from: Date()) { pedometerData, error in
//                guard let pedometerData = pedometerData, error == nil else { return }
//                
//                DispatchQueue.main.async {
//                    print(pedometerData.numberOfSteps.intValue)
//                }
//            }
//        }
//    }
//    
//}
//  
//
//
