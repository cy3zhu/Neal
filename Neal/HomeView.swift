//
//  SwiftUIView.swift
//  Neal
//
//

import SwiftUI

struct HomeView: View {
    
//    let date: Date = Date()
//    let df = DateFormatter()

//.frame().background(Color.red)
    
    var body: some View {
        ScrollView(){
            HStack(){
                VStack(alignment: .leading){
                    Text("TUESDAY, MARCH 14")
                        .font(.system(size: 13, weight: .bold, design:.default))
                        .foregroundColor(Color("SecondaryText"))

                    HStack(){
                        Text("Today")
                            .font(.system(size: 34, weight: .bold, design:.default))

                        Image(systemName: "chevron.down")
                            .padding(.top, 4)
                            .font(.system(size: 19))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                } //Date Heading
                
                Spacer()
                Circle().frame(width: 44, height: 44).foregroundColor(.green).padding(.bottom, 4)
                //profile icon
                    
            } //Header
            
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 14) //Card Background
                    .fill(Color("CardBackground"))
                    .frame(width: 358, height: 128)
                VStack(){
                    HStack(){
                        Text("Daily Goals")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(Color("GreyText"))
                        
                    }//Card Header
                    
                    Rectangle().fill(Color("GreyText")).frame(width: 334, height: 0.5) //separator

                    Spacer()
                    HStack(){
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
                        
                        Spacer()
                        VStack(alignment: .leading, spacing: 4){
                            Text("Expend")
                                .font(.system(size: 13, weight: .semibold, design:.default))
                            ZStack(alignment: .leading){
                                //background capsule
                                Capsule()
                                    .fill(Color("GreenText"))
                                    .frame(width: 160, height: 8)
                                    .opacity(0.3)
                                //Fill Capsule
                                Capsule()
                                    .fill(Color("GreenText"))
                                    .frame(width: 130 , height: 8)
                            }//Progress Bar
                            Text("3400/4500 kcal")
                                .font(.system(size: 13, weight: .semibold, design:.default))
                                .foregroundColor(Color("GreenText"))
                        }//Expenditure Content
                    }//Calorie Info Content
                }//Goal Card content
                .padding(.horizontal, 12 ) .padding(.vertical, 16)
            }//Goal Card
            contentLayer
        }//ScrollView
        .padding(.horizontal)
    }
    
    var contentLayer: some View{
        VStack(){
            PhotoItem()
            PhotoItem(time: "8:00 AM", image: "Food1", calories: 840)
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
