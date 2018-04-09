//
//  CameraExtension.swift
//  IntroACoreML
//
//  Created by Dea-loC on 09/04/2018.
//  Copyright © 2018 Dea-loC. All rights reserved.
//

import UIKit
import AVFoundation

extension ViewController {
    
    func miseEnPlaceCamera() {
        captureVideoPreviewLayer?.removeFromSuperlayer()
        captureSession = AVCaptureSession()
        if captureSession != nil {
            if let appareil = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: position) {
                do {
                    let input = try AVCaptureDeviceInput(device: appareil)
                    if captureSession!.canAddInput(input) {
                        captureSession?.addInput(input)
                        capturePhotoOutput = AVCapturePhotoOutput()
                        if capturePhotoOutput != nil {
                            if captureSession!.canAddOutput(capturePhotoOutput!) {
                                captureSession?.addOutput(capturePhotoOutput!)
                                captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                                captureVideoPreviewLayer?.videoGravity = .resizeAspect
                                captureVideoPreviewLayer?.connection?.videoOrientation = .portrait
                                if captureVideoPreviewLayer != nil {
                                    captureVideoPreviewLayer?.frame = cameraVue.bounds
                                    cameraVue.layer.addSublayer(captureVideoPreviewLayer!)
                                    captureSession!.startRunning()
                                }
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
