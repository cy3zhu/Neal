//
//  InsightsView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-14.
//

import SwiftUI

struct InsightsView: View {
    
    var insightText1: String = "Your best week in terms of how close you were reaching your calorie intake and exercise goals."
    var insightText2: String = "Your average caloric deficit based on your weight change and estimated calorie expenditure over the last month."
    var insightText3: String = "Your projected weight in 30 days if you continue with your current eating and exercising habits."
    var insightText4: String = "The time period when majority of your logs happens. 70% of your logs happens after 4 PM."
    
    var body: some View {
        ScrollView(){
            HStack(){
                VStack(alignment: .leading){
                    Text("March 5-11")
                        .font(.system(size: 13, weight: .bold, design:.default))
                        .foregroundColor(Color("SecondaryText"))
                    Text("Insights")
                        .font(.system(size: 34, weight: .bold, design:.default))
                }
                Spacer()
                    .frame(height: 10)
                    .background(Color.red)
            } //Header
            Spacer()
                .frame(width: 10, height:40)
                .background(Color.orange)
            HStack(){
                VStack(alignment: .leading){
                    Text("Avg Daily Calorie Intake").font(.system(size: 13, weight: .bold, design:.default))
                        .foregroundColor(Color("SecondaryText"))
                    
                        Text("3610 ").font(.system(size: 34, weight: .bold, design:.default)) + Text("cal").font(.system(size: 13, weight: .bold, design:.default)).foregroundColor(Color("SecondaryText"))
                    
                    Text("Oct 2022 - Mar 2023").font(.system(size: 13, weight: .bold, design:.default))
                        .foregroundColor(Color("SecondaryText"))
                }
                Spacer()
            } //Chart Header
            
            ZStack(){
                Rectangle()
                    .frame(width: 358, height: 150)
                Text("Chart Placeholder").foregroundColor(Color.orange)
            }//Chart
            InsightCard(figureHeader: "Feb 19-25", figureBody: "2023",cardHeader: "Best Performing Week", cardBody: insightText1)
            InsightCard(figureHeader: "360", figureBody: "cal per week", cardHeader: "Calorie Deficit", cardBody: insightText2)
            InsightCard(figureHeader: "148.6", figureBody: "lbs", cardHeader: "30-Day Projection", cardBody: insightText3)
            InsightCard(figureHeader: "4 PM~", figureBody: "",cardHeader: "Meal Timings", cardBody: insightText4)
            
            
        }.padding(.horizontal, 16.0) //ScrollView body
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView().preferredColorScheme(.dark)
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
                .frame(width: 358, height: 128)
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
            }.padding(16) //Card Content
        }
        //Insight Card
    }
}
