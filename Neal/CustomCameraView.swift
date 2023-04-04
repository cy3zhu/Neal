//
//  CustomCameraView.swift
//  Neal
//
//  Created by ChrisZ on 2023-04-03.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        ZStack{
            
            CameraView(cameraService: cameraService){ result in
                print("Got a result: \(result)")
                
                switch result {
                case .success(let photo):
                    
                    if let data = photo.fileDataRepresentation(){
                        print(".successly retrived photodata!")
                        capturedImage = UIImage(data: data) //save image to capturedImage variable
                        DispatchQueue.main.async {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(".failure")
                    print(err.localizedDescription)
                } 
            }
            
            VStack{
                Spacer()
                //Capture button
                Button(action:{
                    cameraService.capturePhoto()
                    getTimeStamp()

                }, label: {
                    ZStack {
                        Image(systemName: "circle").font(.system(size: 72)).foregroundColor(.white)
                        Image(systemName: "circle.fill").font(.system(size: 54)).foregroundColor(.white)
                    }
                })
                .padding(.bottom)
            }
        }
        
    }
}


func getTimeStamp(){
    // Get the current timestamp
    let timestamp = Date()
    
    // Record the timestamp or do whatever you want with it
    print("Photo captured at: \(timestamp)")
}
