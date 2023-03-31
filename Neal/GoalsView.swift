//
//  GoalsView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-14.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        ScrollView(){
            HStack(){
                Text("Caloric Goals")
                        .font(.system(size: 17, weight: .bold, design:.default))
                Spacer()
                Text("Edit").font(.system(size: 17, weight: .semibold, design:.default))
                    .foregroundColor(.blue)
                //button placeholder
                            
            }.padding(.horizontal,8) //Header
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 14) //Card Background
                    .fill(Color("CardBackground"))
                    .frame(width: 358)
                VStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: 9){
                        Text("Consume")
                            .font(.system(size: 13, weight: .semibold, design:.default))
                        HStack(alignment: .bottom, spacing: 4){
                            Text("3300-3500")
                                .font(.system(size: 20, weight: .bold, design:.default))
                                .foregroundColor(Color("OrangeText"))
                                //.frame().background(Color.red)
                            Text("kcal")
                                .font(.system(size: 13, weight: .semibold, design:.default))
                                .foregroundColor(Color("OrangeText"))
                                //.frame().background(Color.red)
                                .padding(.bottom, 2)
                        }
                    }//Consumption Content
                    VStack(alignment: .leading, spacing: 4){
                        Text("Expend")
                            .font(.system(size: 13, weight: .semibold, design:.default))
                        ZStack(alignment: .leading){
                            //background capsule
                            Capsule()
                                .fill(Color("GreenText"))
                                .frame(width: 334, height: 22)
                                .opacity(0.3)
                            //Fill Capsule
                            Capsule()
                                .fill(Color("GreenText"))
                                .frame(width: 220 , height: 22)
                        }//Progress Bar
                        HStack(){
                            Text("3400/4500 kcal").font(.system(size: 13, weight: .semibold, design:.default))
                                .foregroundColor(Color("GreenText"))
                            Text("1100 cal left").font(.system(size: 13, weight: .semibold, design:.default))
                                .foregroundColor(Color("SecondaryText"))
                        }
                    }//Expenditure Content
                } .padding(.horizontal, 12 ) .padding(.vertical, 16) //Goal Card content
            }//Goal Card
            HStack(){
                Text("Insights")
                        .font(.system(size: 17, weight: .bold, design:.default))
                Spacer()
                //button placeholder
            }.padding(.horizontal,8)
            FoodCard()
                
        }.padding(.horizontal,16)
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
                .frame(width: 358, height: 128)
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
