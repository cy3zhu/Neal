//
//  ContentView.swift
//  Neal
//
//  Created by ChrisZ on 2023-02-28.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(){
            HomeView()
                .tabItem{
                    Image("Home")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("Home")
                }
            InsightsView()
                .tabItem{
                    Image("Bar Chart")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("Insights")
                }
            LogView()
                .tabItem{
                    Image("Photo Add")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("Log")
                }
            Text("Recipe")
                .tabItem{
                    Image("Recipe")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("Recipe")
                }
            TestView()
                .tabItem{
                    Image(systemName: "testtube.2")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("DATA")
                }
            
//           Text("Sharing")
//                .tabItem{
//                    Image("Friends")
//                        .renderingMode(.template)
//                        .foregroundColor(Color("GreyText"))
//                    Text("Sharing")
//              }
        }.opacity(50)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().preferredColorScheme(.dark)
    }
}
