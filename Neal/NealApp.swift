//
//  NealApp.swift
//  Neal
//
//  Created by ChrisZ on 2023-02-28.
//

import SwiftUI

@main
struct NealApp: App {
    
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            
            //LogView()
            TabBar()
                .environmentObject(userData)
        }
    }
}
