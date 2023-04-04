//
//  HealthKitView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-31.
//

//import SwiftUI
//import HealthKit
//
//struct HealthKitView: View {
//    @State var calorieCount: Double?
//    let healthStore = HKHealthStore()
//    
//    var body: some View {
//        VStack {
//            if let calorieCount = calorieCount {
//                Text("Calories Burned Today: \(Int(calorieCount))")
//                    .font(.title)
//                    .padding()
//            } else {
//                Text("Calories Burned Today: N/A")
//                    .font(.title)
//                    .padding()
//            }
//        }
//        .onAppear {
//            requestAuthorization()
//            getCalorieData()
//        }
//    }
//    
//    func requestAuthorization() {
//        let typesToRead: Set = [HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!]
//        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
//            if let error = error {
//                print("Error requesting authorization: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func getCalorieData() {
//        let calendar = Calendar.current
//        let now = Date()
//        let startOfDay = calendar.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictEndDate)
//        let query = HKStatisticsQuery(quantityType: .activeEnergyBurned, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
//            guard let result = result, let sum = result.sumQuantity() else {
//                if let error = error {
//                    print("Error retrieving calorie data: \(error.localizedDescription)")
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                self.calorieCount = sum.doubleValue(for: HKUnit.kilocalorie())
//            }
//        }
//        healthStore.execute(query)
//    }
//}
//
//
//struct HealthKitView_Previews: PreviewProvider {
//    static var previews: some View {
//        HealthKitView()
//    }
//}
