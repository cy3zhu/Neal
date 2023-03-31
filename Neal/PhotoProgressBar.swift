//
//  ProgressBar.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-01.
//

import SwiftUI

struct PhotoProgressBar: View {
    
    var label: String = "Default"
    var theme: String = "OrangeText"
    var progress: CGFloat = 10
    var goal: CGFloat = 100
    //var progressText: String = "9% of 120g"
    
    var barWidth: CGFloat = 67
    var barHeight: CGFloat = 4
    
    var body: some View {
        //Label
        VStack(alignment: .leading){
            Text(label)
                .font(.system(size: 12, weight: .semibold, design: .default))
            //Bar Label
            ZStack(alignment: .leading){
                //background capsule
                Capsule()
                    .fill(Color(theme))
                    .frame(width: barWidth, height: barHeight)
                    .opacity(0.3) //background
                Capsule()
                    .fill(Color(theme))
                    .frame(width: (progress * 0.01) * barWidth, height: barHeight)
            }//Progress Bar
            
            Text("\(Int(progress))% of \(Int(goal))g" )
                .font(.system(size: 11, weight: .regular, design: .default))
            //Progress Label
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        PhotoProgressBar().preferredColorScheme(.dark)
    }
}
