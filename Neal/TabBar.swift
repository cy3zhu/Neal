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
            Text("Insights")
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
            Text("Sharing")
                .tabItem{
                    Image("Friends")
                        .renderingMode(.template)
                        .foregroundColor(Color("GreyText"))
                    Text("Sharing")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().preferredColorScheme(.dark)
    }
}
