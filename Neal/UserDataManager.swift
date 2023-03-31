//
//  UserDataManager.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-30.
//

import Foundation
import Combine

class UserDataManager: ObservableObject {
    
    @Published var caloriesConsumed: Int = 2222
    @Published var calorieConsumptionGoal: Int = 4000
    @Published var calorieExpenditure: Int = 3333
    @Published var calorieExpenditureGoal: Int = 4500
    @Published var proteinGoal: Int = 100
    @Published var fatGoal: Int = 70
    @Published var carbGoal: Int = 200
//    @Published var isCalorieConsumptionGoalMet: Bool = false
//    @Published var isCalorieExpenditureGoalMet: Bool = false
//    @Published var isProteinGoalMet: Bool = false
//    @Published var isFatGoalMet: Bool = false
//    @Published var isCarbGoalMet: Bool = false

    // -----Persistence between closures:
//    private var cancellables: Set<AnyCancellable> = []
//
//    init() {
//        // Load saved data from disk (if any)
//        loadUserData()
//
//        // Observe changes to the published properties and save them to disk
//        $caloriesConsumed.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $calorieConsumptionGoal.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $calorieExpenditureGoal.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $proteinGoal.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $fatGoal.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $carbGoal.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $isCalorieConsumptionGoalMet.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $isCalorieExpenditureGoalMet.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $isProteinGoalMet.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $isFatGoalMet.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//
//        $isCarbGoalMet.sink { [weak self] newValue in
//            self?.saveUserData()
//        }.store(in: &cancellables)
//    }
//
//    func saveUserData() {
//        // Save the current user data to disk
//        // ...
//    }
//
//    func loadUserData() {
//        // Load saved user data from disk (if any)
//        // ...
//    }
}
