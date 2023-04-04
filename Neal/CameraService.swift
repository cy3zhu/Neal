//
//  CameraService.swift
//  Neal
//
//  Created by ChrisZ on 2023-04-03.
//

import Foundation
import AVFoundation

class CameraService{
    
    var session: AVCaptureSession? //capture session
    var delegate: AVCapturePhotoCaptureDelegate? //used to propagate image into view
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer() //used to preview what the picture is being taken of
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping (Error?)-> ()){
        self.delegate = delegate
        checkPermissions(completion: completion)
    }
    
    //permissions check code
    private func checkPermissions(completion: @escaping (Error?) -> ()){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case.notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in guard granted else { return }
                DispatchQueue.main.async{
                    self?.setupCamera(completion: completion)
                }
                
            }
        case.restricted:
            break
        case .denied:
            break
        case .authorized:
            print("authorized!")
            setupCamera(completion: completion)
        @unknown default:
            break
            
        }
    }
    
    private func setupCamera(completion: @escaping (Error?) -> ()){
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video){ //if allowed permissions
            do {
                let input = try AVCaptureDeviceInput(device: device) //try to get input
                
                //see if we can get input (media)
                if session.canAddInput(input) {
                    print("can add input")
                    session.addInput(input)
                }
                
                //see if we can get output (taken photo)
                if session.canAddOutput(output){
                    print("can add output")
                    session.addOutput(output)
                }
                
                //resize preview and begin preview session
                previewLayer.videoGravity = .resizeAspectFill //videogravity: boundaries -> .resizeaspectfill: layer's bounds
                previewLayer.session = session
                
                //startsession if this is completed
                //session.startRunning()
                // Start session on a background queue
                   DispatchQueue.global(qos: .userInitiated).async {
                       session.startRunning()
                   }
                self.session = session
                
            } catch {
                
                completion(error)
                
            }
        }
    }
    
    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
        DispatchQueue.global(qos: .userInitiated).async {
            print("CapturePhoto")
            self.output.capturePhoto(with: settings, delegate: self.delegate!)
        }
    }
    
    func resetSession() {
        session?.beginConfiguration()
        session?.inputs.forEach { session?.removeInput($0) }
        session?.outputs.forEach { session?.removeOutput($0) }
        session?.commitConfiguration()
        session?.stopRunning()
        setupCamera(completion: { _ in })
        print("success")
    }

}


