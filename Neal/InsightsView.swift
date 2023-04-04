//
//  InsightsView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-14.
//

import SwiftUI

struct InsightsView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView(){
            HStack(){
                VStack(alignment: .leading){
                    WeekRangeView()
                    Text("Insights")
                        .font(.system(size: 34, weight: .bold, design:.default))
                }
                Spacer()
                    .frame(height: 10)
            } //Header
            Spacer()
                .frame(width: 10, height:40)
                ZStack(){
                    Rectangle()
                        .frame(width: CONTENTWIDTH, height: 150)
                    Text("Chart Placeholder").foregroundColor(Color.orange)
                }
                HighlightView()
            
        }.padding(.horizontal, 16.0) //ScrollView body
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView().preferredColorScheme(.dark)
    }
}

struct WeekRangeView: View {
    
    let today = Date() // Get the current date
    let calendar = Calendar.current // Get the current calendar
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        let endOfWeek = calendar.date(byAdding: .day, value: 6, to: startOfWeek)!

        Text("\(dateFormatter.string(from: startOfWeek)) - \(dateFormatter.string(from: endOfWeek))".uppercased())
            .font(.system(size: 13, weight: .bold, design:.default))
            .foregroundColor(Color("SecondaryText"))
    }
}


//let healthStore = HKHealthStore()
//
//guard let caloriesBurnedQuantityType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
//    fatalError("Calories burned type not available in HealthKit")
//}
//
//let today = Date()
//let startDate = Calendar.current.startOfDay(for: today)
//let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)
//
//let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
//
//let query = HKStatisticsQuery(quantityType: caloriesBurnedQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
//    guard let result = result, let sum = result.sumQuantity() else {
//        print("Error fetching calories burned: \(error?.localizedDescription ?? "Unknown error")")
//        return
//    }
//    let caloriesBurned = sum.doubleValue(for: HKUnit.kilocalorie())
//    print("Calories burned today: \(caloriesBurned)")
//}
//
//healthStore.execute(query)



struct HighlightView: View {
    
    var insightText1: String = "Your best week in terms of how close you were reaching your calorie intake and exercise goals."
    var insightText2: String = "Your average caloric deficit based on your weight change and estimated calorie expenditure over the last month."
    var insightText3: String = "Your projected weight in 30 days if you continue with your current eating and exercising habits."
    var insightText4: String = "The time period when majority of your logs happens. 70% of your logs happens after 4 PM."
    
    var body: some View {
        ScrollView(){
            InsightCard(figureHeader: "Feb 19-25", figureBody: "2023",cardHeader: "Best Performing Week", cardBody: insightText1)
            InsightCard(figureHeader: "360", figureBody: "cal per week", cardHeader: "Calorie Deficit", cardBody: insightText2)
            InsightCard(figureHeader: "148.6", figureBody: "lbs", cardHeader: "30-Day Projection", cardBody: insightText3)
            InsightCard(figureHeader: "4 PM~", figureBody: "",cardHeader: "Meal Timings", cardBody: insightText4)
        }.padding(.horizontal, 16.0) //ScrollView body
    }
}


struct InsightCard: View{
    
    var figureHeader: String = "Figure Header"
    var figureBody: String = ""
    var cardHeader: String = "Card Header"
    var cardBody: String = "Card Body"
    
    var body: some View{
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 14) //Card Background
                .fill(Color("CardBackground"))
                .frame(width: CONTENTWIDTH, height: 128)
            HStack(alignment: .top, spacing: 16){
                ZStack(){
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color("DarkGrey"))
                        .frame(width:96, height:83)
                    VStack(){
                        Text("\(figureHeader)").font(.system(size: 13, weight: .bold, design:.default))
                        if figureBody != "" {
                            Text("\(figureBody)").font(.system(size: 13, weight: .semibold, design:.default))
                                .foregroundColor(Color("SecondaryText"))
                        }
                    }
                }//Card Figure
                VStack(alignment: .leading){
                    Text("\(cardHeader)").font(.system(size: 13, weight: .bold, design:.default))
                    Text("\(cardBody)").font(.system(size: 13, weight: .semibold, design:.default))
                            .foregroundColor(Color("SecondaryText"))
                }//Card Text
            }.frame(width: CONTENTWIDTH - 32).padding(16) //Card Content
        }
        //Insight Card
    }
}


//NONQUANT FRONTEND (CHART PLACEHOLDER)
//HStack(){
//    VStack(alignment: .leading){
//        Text("Avg Daily Calorie Intake").font(.system(size: 13, weight: .bold, design:.default))
//            .foregroundColor(Color("SecondaryText"))
//
//            Text("3610 ").font(.system(size: 34, weight: .bold, design:.default)) + Text("cal").font(.system(size: 13, weight: .bold, design:.default)).foregroundColor(Color("SecondaryText"))
//
//        Text("Oct 2022 - Mar 2023").font(.system(size: 13, weight: .bold, design:.default))
//            .foregroundColor(Color("SecondaryText"))
//    }
//    Spacer()
//} //Chart Header
//
//ZStack(){
//    Rectangle()
//        .frame(width: CONTENTWIDTH, height: 150)
//    Text("Chart Placeholder").foregroundColor(Color.orange)
//}//Chart

