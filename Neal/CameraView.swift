//
//  FrameView.swift
//  Neal
//
//  Created by ChrisZ on 2023-03-01.
//

import SwiftUI
import AVFoundation
import Photos

struct CameraView: UIViewControllerRepresentable{

    typealias UIViewControllerType = UIViewController
    
    //initialize cameraservice outside of camera view so we can access the captured photo outside
    let cameraService: CameraService
    let didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        cameraService.start(delegate: context.coordinator) { err in
            if let err = err{
                didFinishProcessingPhoto(.failure(err))
                return
            }
        }
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = CGRect(x: 0, y: viewController.view.safeAreaInsets.top, width: viewController.view.bounds.width, height: viewController.view.bounds.height - viewController.view.safeAreaInsets.top - viewController.view.safeAreaInsets.bottom)//viewController.view.bounds
        return viewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishProcessingPhoto: didFinishProcessingPhoto)
    }

    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context){
        
    }
    
    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
        let parent: CameraView
        private var didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
        
        init(_ parent: CameraView, didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto, Error>) -> ()) {
                self.parent = parent
                self.didFinishProcessingPhoto = didFinishProcessingPhoto
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
            
            if let error = error {
                print("Error Capturing photo: \(error.localizedDescription)")
                didFinishProcessingPhoto(.failure(error))
                return
            } else {
                
                print("Photo Captured Successfully")
                
//                //Save photo to photo library
//                guard let imageData = photo.fileDataRepresentation() else {
//                    print("Photo capture succeeded, but no file data.")
//                    return
//                }
//                PHPhotoLibrary.shared().performChanges({
//                    let creationRequest = PHAssetCreationRequest.forAsset()
//                    creationRequest.addResource(with: .photo, data: imageData, options: nil)
//                }) { saved, error in
//                    if let error = error {
//                        print("Error saving photo to photo library: \(error.localizedDescription)")
//                    } else {
//                        print("Photo saved to photo library.")
//                    }
//                }
                
            }
            didFinishProcessingPhoto(.success(photo))
        }
    }
    
}




