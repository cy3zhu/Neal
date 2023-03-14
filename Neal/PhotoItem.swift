//
//  PhotoItem.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-01.
//

import SwiftUI

struct PhotoItem: View {
    
    var time: String = "9:34 AM"
    var image: String = "McFlurry"
    var calories: CGFloat = 510
//    var progress: CGFloat = 10
//    var goal: CGFloat = 100
//    var barWidth: CGFloat = 67
//    var barHeight: CGFloat = 4
    
    
    var body: some View {
        ZStack(){
            Image(image)
                .resizable()
                .cornerRadius(14)
                .frame(width: 358, height:460)
            VStack(alignment: .leading){
                Text(time)//photo time
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(16)
                Spacer()
                ZStack(alignment: .leading){
                    Rectangle().fill(Color.black).frame(width: 358, height: 80).opacity(0.5)
                    HStack(spacing: 16){
                        ZStack(){
                            RoundedRectangle(cornerRadius: 8).fill(Color("OrangeText")).frame(width: 48, height: 48)

                            VStack(){
                                Text("\(Int(calories))")
                                    .font(.system(size: 17, weight: .bold, design:.default))
                                    .foregroundColor(Color.black)
                                Text("Kcal")
                                    .font(.system(size: 11, weight: .regular, design:.default))
                                    .foregroundColor(Color.black)
                            }
                        }//Calorie Label
                        ProgressBar(label: "Protein 11g", theme: "ProteinColor", progress: 9, goal: 120)
                        ProgressBar(label: "Fat 11g", theme: "FatColor", progress: 9, goal: 96)
                        ProgressBar(label: "Carbs 11g", theme: "CarbColor", progress: 10, goal: 380)
                    }//Nutrition Card Content
                    .padding(16)
                }//Nutrition Card
            }
        }//Photo Card
    }
}

struct PhotoItem_Previews: PreviewProvider {
    static var previews: some View {
        PhotoItem().preferredColorScheme(.dark)
    }
}