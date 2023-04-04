//
//  TestView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-30.
//

import SwiftUI
import Foundation

struct TestView: View {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let dateString: String //Initialize date objects
    
    init(){
        dateFormatter.dateFormat = "EEEE, MMMM d"
        dateString = dateFormatter.string(from: date) //Format Date day/Month/#
    }
    
    
    var body: some View {
        NavigationView{
            TestView1()
        }
    }
}

struct TestImageView: View {

    var body: some View {
        
        Text("ye")
    }
}

struct TestView1: View {
    
    @EnvironmentObject var userDataManager: UserData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Calories Consumed: \(userDataManager.caloriesConsumed)")
            Text("Calorie Consumption Goal: \(userDataManager.calorieConsumptionGoal)")
            Text("Calorie Expenditure: \(userDataManager.calorieExpenditure)")
            Text("Calorie Expenditure Goal: \(userDataManager.calorieExpenditureGoal)")
            Text("Protein Goal: \(userDataManager.proteinGoal)")
            Text("Fat Goal: \(userDataManager.fatGoal)")
            Text("Carb Goal: \(userDataManager.carbGoal)")
            Button("Add 100 calories") {
                userDataManager.caloriesConsumed += 100
            }.buttonStyle(MyButtonStyle())
            NavigationLink("Insights", destination: TestView2())
        }.buttonStyle(MyButtonStyle())
    }
}

struct TestView2: View {
    //@ObservedObject var userDataManager: UserData
    @EnvironmentObject var userDataManager: UserData

    var body: some View {
        VStack {
            Text("ObservedValues")
            Text("Calories Consumed: \(userDataManager.caloriesConsumed)")
            Text("Calorie Consumption Goal: \(userDataManager.calorieConsumptionGoal)")
            Text("Calorie Expenditure: \(userDataManager.calorieExpenditure)")
            Text("Calorie Expenditure Goal: \(userDataManager.calorieExpenditureGoal)")
            Text("Protein Goal: \(userDataManager.proteinGoal)")
            Text("Fat Goal: \(userDataManager.fatGoal)")
            Text("Carb Goal: \(userDataManager.carbGoal)")
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
    }
}

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            // This is the view that stays the same
            Text("Header View")
                .font(.largeTitle)
                .padding()

            // This is the TabView that switches between two views
            TabView(selection: $selectedTab) {
                // View 1
                Text("View 1")
                    .font(.title)
                    .tabItem {
                        Label("View 1", systemImage: "1.square.fill")
                    }
                    .tag(0)

                // View 2
                Text("View 2")
                    .font(.title)
                    .tabItem {
                        Label("View 2", systemImage: "2.square.fill")
                    }
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity)
            .background(Color.red)

            // This is the view that stays the same
            Text("Footer View")
                .font(.largeTitle)
                .padding()

            Spacer()
        }
        .background(Color.gray)
        .ignoresSafeArea()
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        //TestView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.dark)
    }
}

//OLD CAMERAVIEW

//struct CameraView: UIViewControllerRepresentable {
//
//    @Binding var image: UIImage?
//    @Environment(\.presentationMode) var presentationMode
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        imagePicker.sourceType = .camera
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {} //unused
//
//    //
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        let parent: CameraView
//
//        init(parent: CameraView) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.image = uiImage
//            }
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
//
//struct AppCamera: View {
//    @State var image: UIImage?
//    @State var showCamera: Bool = false
//
//    var body: some View {
//        VStack {
//            if let image = image {
//                ZStack(alignment: .topLeading){
//                    Image(uiImage: image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                    Button(action: {
//                        self.showCamera = true
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.system(size: 40))
//                            .foregroundColor(Color.black)
//                    }.padding(16)
//                }
//            } else {
//                Rectangle().fill(Color.black).frame(width: 390, height: 500)
//                    .onAppear{
//                        self.showCamera = true
//                    }
//            }
//            //Bottombutton
//            HStack(){
//                ZStack(){
//                    Capsule().fill(Color("DarkGrey04")).frame(width: 342, height: 40)
//                    Text("Tag nutrition facts")
//                        .font(.system(size: 15, weight: .semibold, design: .default))
//                }//Tag Label
//                Spacer()
//                ZStack(){
//                    Circle().frame(height: 40)
//                    Image(systemName: "chevron.right")
//                        .renderingMode(.template)
//                        .foregroundColor(.black)
//                }
//            }//Tag Button
//
//        }//VStack
//        //Display CameraView as a sheet based on showCamera
//        .sheet(isPresented: $showCamera) {
//            CameraView(image: self.$image)
//        }
//    }
//}
