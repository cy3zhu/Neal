//
//  SwiftUIView.swift
//  Neal
//
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var userData = UserDataManager()
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let dateString: String //Initialize date objects
    
    init(){
        dateFormatter.dateFormat = "EEEE, MMMM d"
        dateString = dateFormatter.string(from: date) //Format Date day/Month/#
    }
    
    var body: some View {
        ScrollView(){
            VStack(){
                HStack(){
                    VStack(alignment: .leading){
                        Text(dateString.uppercased())
                            .font(.system(size: 13, weight: .bold, design:.default))
                            .foregroundColor(Color("SecondaryText"))
                        
                        HStack(){
                            Text("Today")
                                .font(.system(size: 34, weight: .bold, design:.default))
//                            Image(systemName: "chevron.down").padding(.top, 4).font(.system(size: 19)).fontWeight(.semibold).foregroundColor(.white)
                        }
                    } //DATE HEADING
                    
                    Spacer()
                    Image("Avatar") //PROFILE ICON
                    
                }.frame(width: 358)//Header
                //.frame(width: UIScreen.main.bounds.width - 32).background(Color.red)
                
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 14) //Card Background
                        .fill(Color("CardBackground"))
                        .frame(width: 358, height: 128)
                        //.frame(width: UIScreen.main.bounds.width - 32, height: 128)
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
                        
                        Rectangle().fill(Color("GreyText")).frame(maxWidth: .infinity, maxHeight: 0.5) //separator
                        
                        Spacer()
                        HStack(){
                            VStack(alignment: .leading, spacing: 9){
                                Text("Consume")
                                    .font(.system(size: 13, weight: .semibold, design:.default))
                                ZStack(alignment: .leading){
                                    //background capsule
                                    Capsule()
                                        .fill(Color("OrangeText"))
                                        .frame(width: 160, height: 8)
                                        .opacity(0.3)
                                    //Fill Capsule
                                    Capsule()
                                        .fill(Color("OrangeText"))
                                        .frame(width: 130 , height: 8)
                                }//Progress Bar
                                Text("3400/4000 kcal")
                                    .font(.system(size: 13, weight: .semibold, design:.default))
                                    .foregroundColor(Color("OrangeText"))
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
                    } .padding(.horizontal, 12 ) .padding(.vertical, 16) //Goal Card content
                }.frame(width: 358) //Goal Card
                
                contentLayer
            }//VStack
        }.padding(.horizontal, 20.0) //ScrollView body
    }
    
    var contentLayer: some View{
        VStack(){
            PhotoItem()
            PhotoItem(time: "8:00 AM", image: "Food1", calories: 840)
        }
    }
    
}

struct CalorieBar: View {

    var body: some View {
        Text("caloriebar")
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        //HomeView().preferredColorScheme(.dark)
        CalorieBar()
    }
}


//------Archived Code
//Quant Mode Consumption display:
    //VStack(alignment: .leading, spacing: 9){
    //    Text("Consume")
    //        .font(.system(size: 13, weight: .semibold, design:.default))
    //    Text("3300-3500 ").font(.system(size: 20, weight: .bold, design:.default)).foregroundColor(Color("OrangeText")) + Text("kcal").font(.system(size: 13, weight: .semibold, design:.default))
    //        .foregroundColor(Color("OrangeText"))
    //}//Consumption Content
