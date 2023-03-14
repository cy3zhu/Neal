//
//  LogView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-01.
//

import SwiftUI
import AVFoundation

struct LogView: View {
    var body: some View {
        ScrollView(){
            Image("MarsBar")
                .resizable()
                .frame(width: 390, height: 713)
            HStack(){
                ZStack(){
                    Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
                    Text("Tag nutrition facts")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                }//Tag Label
                Spacer()
                ZStack(){
                    Circle().frame(height: 40)
                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
            }//Tag Button
            
        }
        
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().preferredColorScheme(.dark)
    }
}
