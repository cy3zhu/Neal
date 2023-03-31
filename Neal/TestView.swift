//
//  TestView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-30.
//

import SwiftUI
import Foundation

struct TestView: View {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let dateString: String //Initialize date objects
    
    init(){
        dateFormatter.dateFormat = "EEEE, MMMM d"
        dateString = dateFormatter.string(from: date) //Format Date day/Month/#
    }
    
    
    var body: some View {
        NavigationView{
            TestView1()
        }
    }
}

struct TestView1: View {
    @StateObject var userDataManager = UserDataManager()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Calories Consumed: \(userDataManager.caloriesConsumed)")
            Text("Calorie Consumption Goal: \(userDataManager.calorieConsumptionGoal)")
            Text("Calorie Expenditure: \(userDataManager.calorieExpenditure)")
            Text("Calorie Expenditure Goal: \(userDataManager.calorieExpenditureGoal)")
            Text("Protein Goal: \(userDataManager.proteinGoal)")
            Text("Fat Goal: \(userDataManager.fatGoal)")
            Text("Carb Goal: \(userDataManager.carbGoal)")
            Button("Add 100 calories") {
                userDataManager.caloriesConsumed += 100
            }.buttonStyle(MyButtonStyle())
            NavigationLink("Insights", destination: TestView2(userDataManager: userDataManager))
        }.buttonStyle(MyButtonStyle())
    }
}

struct TestView2: View {
    @ObservedObject var userDataManager: UserDataManager

    var body: some View {
        VStack {
            Text("ObservedValues")
            Text("Calories Consumed: \(userDataManager.caloriesConsumed)")
            Text("Calorie Consumption Goal: \(userDataManager.calorieConsumptionGoal)")
            Text("Calorie Expenditure: \(userDataManager.calorieExpenditure)")
            Text("Calorie Expenditure Goal: \(userDataManager.calorieExpenditureGoal)")
            Text("Protein Goal: \(userDataManager.proteinGoal)")
            Text("Fat Goal: \(userDataManager.fatGoal)")
            Text("Carb Goal: \(userDataManager.carbGoal)")
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().preferredColorScheme(.dark)
    }
}
