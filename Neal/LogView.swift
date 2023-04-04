//
//  LogView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-01.
//

import SwiftUI
import AVFoundation
import UIKit

//version 4 - cropping image, tag button on bottom

struct LogView: View {

    // The image captured by the camera
    @State private var capturedImage: UIImage? = nil
    
    // Whether or not the custom camera view is presented
    @State private var isCustomCameraViewPresented = false

    var body: some View {
        
        ZStack(){
            // Show the captured image if it exists
            if capturedImage != nil {
                ZStack(){
                    // Show a background color behind the image
                    Color(UIColor.systemBackground)
                }
                //fullscreencover?
                .sheet(isPresented: Binding<Bool>(get: { capturedImage != nil }, set: { _ in capturedImage = nil }), onDismiss: { capturedImage = nil }) {
                    VStack(spacing: 0){
                        ZStack (alignment: .topLeading){
                            // Crop the image by 40 pixels from the bottom and display it in an Image view
//                            if let image = capturedImage {
//                                let croppedImage = image.croppedToBottom(0.1)
//                                Image(uiImage: croppedImage ?? image)
//                                    .resizable()
//                                    .cornerRadius(16)
                                    //.aspectRatio(contentMode: .fit)
//
//                            }
                            Image(uiImage: capturedImage!)
                                .resizable()
                                .cornerRadius(16)
                                .aspectRatio(contentMode: .fit)
                            
                            // Add a button to dismiss the image sheet
                            Button(action: {
                                print("settingImagetoNil")
                                capturedImage = nil
        
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.black)
                                    .background(
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width:20, height:20)
                                    )
                            }.padding(16)
                        }
                        //Spacer()
                        ZStack(){
                            // Add a black rectangle at the bottom of the screen
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: UIScreen.main.bounds.width, height: 50)
                            HStack(){
                                ZStack(){
                                    // Add a gray capsule label on the left side of the black rectangle
                                    Capsule().fill(Color("DarkGrey04")).frame(width: UIScreen.main.bounds.width * 0.78, height: 40)
                                    Text("Tag nutrition facts")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                }//Tag Label
                                Spacer()
                                Button(action: {
                                    print("sendbuttonpressed")
                                    printTimestamp(of: capturedImage!)
                                }) {
                                    ZStack(){
                                        Circle().frame(width: 40, height: 40)
                                        Image(systemName: "chevron.right")
                                            .renderingMode(.template)
                                            .foregroundColor(.black)
                                    }
                                }
                                
                            }.padding(.horizontal, 16)
                        }
                    }
                    // Ignore safe area to fill the entire screen
                    .ignoresSafeArea()
                    
                }//image sheet
            } else {
                // If there's no captured image, show the custom camera view
                Text("no photo")
                CustomCameraView(capturedImage: $capturedImage)
            }
        }
    }
}

func printTimestamp(of image: UIImage) {
    guard let imageData = image.jpegData(compressionQuality: 1.0),
          let source = CGImageSourceCreateWithData(imageData as CFData, nil),
          let metadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil),
          let tags = CGImageMetadataCopyTags(metadata) as? [CGImageMetadataTag] else {
              print("Failed to retrieve metadata or timestamp")
              return
    }
    
    for tag in tags {
        if let tagValue = CGImageMetadataTagCopyValue(tag) as? String,
           let tagNamespace = CGImageMetadataTagCopyNamespace(tag) as String?,
           tagNamespace == "exif",
           tagValue.contains(":") {
            let components = tagValue.components(separatedBy: ":")
            if components.count == 3,
               let hour = Int(components[0]),
               let minute = Int(components[1]),
               let second = Int(components[2]) {
                let timestamp = "\(hour):\(minute):\(second)"
                print("Timestamp: \(timestamp)")
                return
            }
        }
    }
    print("Timestamp not found in metadata")
}


//Cropping function
//extension UIImage {
//
//    /// Crops the bottom of the image by a specified margin
//    ///
//    /// - Parameters:
//    ///   - margin: The margin to crop from the bottom of the image
//    /// - Returns: A new UIImage object that has been cropped
//    func croppedToBottom(_ margin: CGFloat) -> UIImage? {
//        // Check if the UIImage object has a cgImage
//        guard let cgImage = self.cgImage else { return nil }
//
//        // Calculate the rect for the cropped image by subtracting the margin from the height
//        let rect = CGRect(x: 0, y: 0, width: size.width * scale, height: size.height * scale - margin * scale)
//
//        // Crop the cgImage to the calculated rect
//        guard let croppedCGImage = cgImage.cropping(to: rect) else { return nil }
//
//        // Create a new UIImage from the cropped cgImage, using the same scale and orientation as the original image
//        return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
//    }
//}

//Version 3 - Sheet method (works), use overlay for tagging button

//struct LogView: View {
//
//    @State private var capturedImage: UIImage? = nil
//    @State private var isCustomCameraViewPresented = false
//
//    var body: some View {
//
//        ZStack(){
//            //show image if it exists
//            if capturedImage != nil {
//                ZStack(){
//                    //show image if it exists
//                    Color(UIColor.systemBackground)
//                }.sheet(isPresented: Binding<Bool>(get: { capturedImage != nil }, set: { _ in capturedImage = nil }), onDismiss: { capturedImage = nil }) {
//
//                    ZStack (alignment: .topLeading){
//                        Image(uiImage: capturedImage!)
//                            .resizable()
//                            .cornerRadius(16)
//                        //.scaledToFill()
//                        //.ignoresSafeArea()
//                            .aspectRatio(contentMode: .fit)
//                        Button(action: {
//                            print("settingImagetoNil")
//                            capturedImage = nil
//
//                        }) {
//                            Image(systemName: "xmark.circle.fill")
//                                .font(.system(size: 40))
//                                .foregroundColor(Color.black)
//                                .background(
//                                    Rectangle()
//                                        .fill(Color.white)
//                                        .frame(width:20, height:20)
//                                )
//                        }.padding(16)
//                    }
//                    //Tag Button
//                    .ignoresSafeArea()
//                    .overlay(
//                        VStack(){
//                            Spacer()
//                            ZStack(){
//                                Rectangle()
//                                    .fill(Color.black)
//                                    .frame(width: UIScreen.main.bounds.width, height: 50)
//                                HStack(){
//                                    ZStack(){
//                                        Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
//                                        Text("Tag nutrition facts")
//                                            .font(.system(size: 15, weight: .semibold, design: .default))
//                                    }//Tag Label
//                                    Spacer()
//                                    ZStack(){
//                                        Circle().frame(height: 40)
//                                        Image(systemName: "chevron.right")
//                                            .renderingMode(.template)
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                            }
//                        }
//                    )
//                }//imagesheet
//            } else {
//                Text("no photo")
//                CustomCameraView(capturedImage: $capturedImage)
//            }
//        }
//    }
//}

//Version 2 -- Camera by default, error with resetting session

//struct LogView: View {
//
//    @State private var capturedImage: UIImage? = nil
//    @State private var isCustomCameraViewPresented = false
//
//    var body: some View {
//
//        ZStack(){
//            //show image if it exists
//            CustomCameraView(capturedImage: $capturedImage)
//        }.sheet(isPresented: Binding<Bool>(get: { capturedImage != nil }, set: { _ in capturedImage = nil })) {
//            if capturedImage != nil {
//
//                ZStack (alignment: .topLeading){
//                    Image(uiImage: capturedImage!)
//                        .resizable()
//                        .cornerRadius(16)
//                    //.scaledToFill()
//                    //.ignoresSafeArea()
//                        .aspectRatio(contentMode: .fit)
//                    Button(action: {
//                        print("settingImagetoNil")
//                        capturedImage = nil
//
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.system(size: 40))
//                            .foregroundColor(Color.black)
//                            .background(
//                                Rectangle()
//                                    .fill(Color.white)
//                                    .frame(width:20, height:20)
//                            )
//                    }.padding(16)
//                }
//                //Tag Button
//                .ignoresSafeArea()
//                .overlay(
//                    VStack(){
//                        Spacer()
//                        ZStack(){
//                            Rectangle()
//                                .fill(Color.black)
//                                .frame(width: UIScreen.main.bounds.width, height: 50)
//                            HStack(){
//                                ZStack(){
//                                    Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
//                                    Text("Tag nutrition facts")
//                                        .font(.system(size: 15, weight: .semibold, design: .default))
//                                }//Tag Label
//                                Spacer()
//                                ZStack(){
//                                    Circle().frame(height: 40)
//                                    Image(systemName: "chevron.right")
//                                        .renderingMode(.template)
//                                        .foregroundColor(.black)
//                                }
//                            }
//                        }
//                    }
//                )
//            }
//        }//imagesheet
//    }
//
//}

//old -- no sheets

//struct LogView: View {
//
//    @State private var capturedImage: UIImage? = nil
//    @State private var isCustomCameraViewPresented = false
//
//    var body: some View {
//
//        ZStack(){
//            //show image if it exists
//            if capturedImage != nil {
//                ZStack (alignment: .topLeading){
//                    Image(uiImage: capturedImage!)
//                        .resizable()
//                        .cornerRadius(16)
//                    //.scaledToFill()
//                    //.ignoresSafeArea()
//                    .aspectRatio(contentMode: .fit)
//                    Button(action: {
//                        capturedImage = nil
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.system(size: 40))
//                            .foregroundColor(Color.black)
//                            .background(
//                                Rectangle()
//                                    .fill(Color.white)
//                                    .frame(width:20, height:20)
//                            )
//                    }.padding(16)
//                }
//                //Tag Button
//                .ignoresSafeArea()
//                .overlay(
//                    VStack(){
//                        Spacer()
//                        ZStack(){
//                            Rectangle()
//                                .fill(Color.black)
//                                .frame(width: UIScreen.main.bounds.width, height: 50)
//                            HStack(){
//                                ZStack(){
//                                    Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
//                                    Text("Tag nutrition facts")
//                                        .font(.system(size: 15, weight: .semibold, design: .default))
//                                }//Tag Label
//                                Spacer()
//                                ZStack(){
//                                    Circle().frame(height: 40)
//                                    Image(systemName: "chevron.right")
//                                        .renderingMode(.template)
//                                        .foregroundColor(.black)
//                                }
//                            }
//                        }
//                    }
//                )
//            } else {
//                Text("no photo")
//                CustomCameraView(capturedImage: $capturedImage)
//            }
//        }
//    }
//
//}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().preferredColorScheme(.dark)
    }
}


//ScrollView(){
//    Image("MarsBar")
//        .resizable()
//        .frame(width: 390, height: 713)
//    HStack(){
//        ZStack(){
//            Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
//            Text("Tag nutrition facts")
//                .font(.system(size: 15, weight: .semibold, design: .default))
//        }//Tag Label
//        Spacer()
//        ZStack(){
//            Circle().frame(height: 40)
//            Image(systemName: "chevron.right")
//                .renderingMode(.template)
//                .foregroundColor(.black)
//        }
//    }//Tag Button
//
//}


//access camera button
//            VStack(){
//                Spacer()
//                Button(action: {
//                    isCustomCameraViewPresented.toggle()
//                }, label: {
//                    Image(systemName: "camera.fill")
//                        .font(.largeTitle)
//                        .padding()
//                        .background(Color.black)
//                        .foregroundColor(.white)
//                        .clipShape(Circle())
//                })
//                .padding(.bottom)
//                .sheet(isPresented: $isCustomCameraViewPresented, content: {
//                    CustomCameraView(capturedImage: $capturedImage)
//                })
//            }
