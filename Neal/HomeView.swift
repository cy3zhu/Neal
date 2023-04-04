//
//  SwiftUIView.swift
//  Neal
//
//

import SwiftUI

struct HomeView: View {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let dateString: String //Initialize date objects
    
    init(){
        dateFormatter.dateFormat = "EEEE, MMMM d"
        dateString = dateFormatter.string(from: date) //Format Date day/Month/#
    }
    
    var body: some View {
        NavigationView(){
            ScrollView(){
                //DATE HEADER
                HStack(){
                    VStack(alignment: .leading){
                        Text(dateString.uppercased())
                            .font(.system(size: 13, weight: .bold, design:.default))
                            .foregroundColor(Color("SecondaryText"))
                        HStack(){
                            Text("Today")
                                .font(.system(size: 34, weight: .bold, design:.default))
                            //                       Image(systemName: "chevron.down")
                            //                          .padding(.top, 4)
                            //                          .font(.system(size: 19)).fontWeight(.semibold).foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Image("Avatar") //PROFILE ICON
                    
                }.frame(width: CONTENTWIDTH)//Header .frame(width: UIScreen.main.bounds.width - 32)
                
                //GOAL CARD
                NavigationLink("Daily Goals",destination: GoalsView()).buttonStyle(GoalButtonStyle())
                    .navigationTitle("Today")
                    .navigationBarHidden(true)

                //PHOTO FEED
                contentLayer
            }.padding(.horizontal, 20.0) //ScrollView body
        }
    }
    
    var contentLayer: some View{
        VStack(){
            PhotoItem()
            PhotoItem(time: "8:00 AM", image: "Food1", calories: 840)
        }
    }
}

struct GoalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        DailyGoalCard(configuration: configuration)
    }
}

struct DailyGoalCard: View {
    
    let configuration: GoalButtonStyle.Configuration
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack(alignment: .top){
            //CARD BACKGROUND
            RoundedRectangle(cornerRadius: 14)
                .fill(Color("CardBackground"))
                .frame(width: CONTENTWIDTH, height: 128)
                //.frame(width: UIScreen.main.bounds.width - 32, height: 128)
            //CARD HEADER
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
                }
                
                //SEPARATOR
                Rectangle().fill(Color("GreyText")).frame(maxWidth: .infinity, maxHeight: 0.5)
                Spacer()
                //PROGRESS BAR CONTENT
                HStack(){
                    CalorieBar(
                        label: "Consume",
                        theme: "OrangeText",
                        progress: userData.caloriesConsumed,
                        goal: userData.calorieConsumptionGoal,
                        rangeText: "± 5%",
                        barWidth: 160,
                        barHeight: 8
                        
                    )
                    Spacer()
                    CalorieBar(
                        label: "Expend",
                        theme: "GreenText",
                        progress: userData.calorieExpenditure,
                        goal: userData.calorieExpenditureGoal,
                        barWidth: 160,
                        barHeight: 8
                    )
                }
                
            } .padding(.horizontal, 12 ) .padding(.vertical, 16) //Goal Card content
            
        }.frame(width: CONTENTWIDTH, height: 128) //Daily Goal Card
    }
}



struct CalorieBar: View {
    
    var label: String = "Default"
    var theme: String = "OrangeText"
    var progress: Int = 10
    var goal: Int = 100
    var rangeText: String = ""
    var remainderText: Bool = false
    var units: String = "cal"

    var barWidth: CGFloat = 160
    var barHeight: CGFloat = 8

    var body: some View {
        //Label
        VStack(alignment: .leading, spacing: 4){
            //Bar Label
            Text(label)
                .font(.system(size: 13, weight: .semibold, design:.default))
            //Progress Bar
            ZStack(alignment: .leading){
                Capsule()
                    .fill(Color(theme))
                    .frame(width: barWidth, height: barHeight)
                    .opacity(0.3) //background
                Capsule()
                    .fill(Color(theme))
                    .frame(
                        width: (CGFloat(progress)/CGFloat(goal) * barWidth > barWidth) ? barWidth : CGFloat(progress)/CGFloat(goal) * barWidth,
                        height: barHeight
                    )
            }
            //Progress Label
            HStack{
                Text("\(String(progress))" + "/" + "\(String(goal)) " + "\(rangeText)" + " \(units)")
                    .font(.system(size: 13, weight: .semibold, design:.default))
                    .foregroundColor(Color(theme))
                Spacer()
                if(remainderText){
                    Text("\(goal - progress) cal left").font(.system(size: 13, weight: .semibold, design:.default))
                        .foregroundColor(Color("SecondaryText"))
                }
            }.frame(width: barWidth)
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
        //CalorieBar().preferredColorScheme(.dark)
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
