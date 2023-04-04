//
//  GoalsView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-14.
//

import SwiftUI

struct GoalsView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ScrollView(){
            //CARD HEADER
            HStack(){
                Text("Caloric Goals")
                        .font(.system(size: 17, weight: .bold, design:.default))
                Spacer()
                Text("Edit").font(.system(size: 17, weight: .semibold, design:.default))
                    .foregroundColor(.blue)
                    //button placeholder
            }.frame(width: CONTENTWIDTH)
            
            //GOAL CARD
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 14) //Card Background
                    .fill(Color("CardBackground"))
                    .frame(width: CONTENTWIDTH)
                
                VStack(alignment: .leading){
                    CalorieBar(
                        label: "Consume",
                        theme: "OrangeText",
                        progress: userData.caloriesConsumed,
                        goal: userData.calorieConsumptionGoal,
                        rangeText: "± 5%",
                        remainderText: true,
                        barWidth: 334,
                        barHeight: 22
                    ).padding(.bottom, 12)
                    
                    CalorieBar(
                        label: "Expend",
                        theme: "GreenText",
                        progress: userData.calorieExpenditure,
                        goal: userData.calorieExpenditureGoal,
                        remainderText: true,
                        barWidth: 334,
                        barHeight: 22
                    )
                }.padding(.horizontal, 12 ) .padding(.vertical, 16)
            }.padding(.bottom, 10)//Goal Card
            
            //CARD HEADER
            HStack(){
                Text("Macronutrient goals")
                        .font(.system(size: 17, weight: .bold, design:.default))
                Spacer()
                Text("Edit").font(.system(size: 17, weight: .semibold, design:.default))
                    .foregroundColor(.blue)
                    //button placeholder
            }.frame(width: CONTENTWIDTH)
            
            //MACRONUTRIENT CARD
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 14) //Card Background
                    .fill(Color("CardBackground"))
                    .frame(width: CONTENTWIDTH)
                
                HStack(){
                    CalorieBar(
                        label: "Carbs",
                        theme: "CarbColor",
                        progress: userData.carbConsumed,
                        goal: userData.carbGoal,
                        units: "g",
                        barWidth: 100,
                        barHeight: 22
                    )
                    CalorieBar(
                        label: "Protein",
                        theme: "ProteinColor",
                        progress: userData.proteinConsumed,
                        goal: userData.proteinGoal,
                        units: "g",
                        barWidth: 100,
                        barHeight: 22
                    )
                    CalorieBar(
                        label: "Fat",
                        theme: "FatColor",
                        progress: userData.fatConsumed,
                        goal: userData.fatGoal,
                        units: "g",
                        barWidth: 100,
                        barHeight: 22
                    )
                }.padding(.horizontal, 12 ) .padding(.vertical, 16)
            }.padding(.bottom, 10)
            
            //CARD HEADER
            HStack(){
                Text("Micronutrient limits")
                        .font(.system(size: 17, weight: .bold, design:.default))
                Spacer()
                Text("Edit").font(.system(size: 17, weight: .semibold, design:.default))
                    .foregroundColor(.blue)
                    //button placeholder
            }.frame(width: CONTENTWIDTH)
            
            //MICRONUTRIENT CARD
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 14) //Card Background
                    .fill(Color("CardBackground"))
                    .frame(width: CONTENTWIDTH)
                
                HStack(){
                    CalorieBar(
                        label: "Sugar",
                        theme: "MicroColor",
                        progress: userData.sugarConsumed,
                        goal: userData.sugarGoal,
                        units: "mg",
                        barWidth: 100,
                        barHeight: 22
                    )
                    CalorieBar(
                        label: "Sodium",
                        theme: "MicroColor",
                        progress: userData.sodiumConsumed,
                        goal: userData.sodiumGoal,
                        units: "mg",
                        barWidth: 100,
                        barHeight: 22
                    )
                    CalorieBar(
                        label: "Cholesterol",
                        theme: "MicroColor",
                        progress: userData.cholesterolConsumed,
                        goal: userData.cholesterolGoal,
                        units: "mg",
                        barWidth: 100,
                        barHeight: 22
                    )
                }.padding(.horizontal, 12 ) .padding(.vertical, 16)
                
            }.padding(.bottom, 10)
                
        }
        .padding(16)
        .navigationBarTitle("Daily Goals", displayMode: .inline)
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView().preferredColorScheme(.dark)
    }
}

struct FoodCard: View{
    
    var figureHeader: String = "Figure Header"
    var figureBody: String = ""
    var cardHeader: String = "Card Header"
    var cardBody: String = "Card Body"
    
    var body: some View{
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 14) //Card Background
                .fill(Color("CardBackground"))
                .frame(width: CONTENTWIDTH, height: 128)
            VStack(){
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
        } //CardBackground
    }
}
