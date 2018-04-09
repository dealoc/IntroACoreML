//
//  ViewController.swift
//  IntroACoreML
//
//  Created by Dea-loC on 09/04/2018.
//  Copyright © 2018 Dea-loC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cameraVue: UIView!
    @IBOutlet weak var photoChoisieImageView: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var rotationBouton: UIButton!
    @IBOutlet weak var libraire: UIButton!
    
    
    var captureSession: AVCaptureSession?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var position = AVCaptureDevice.Position.back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceCamera()
        rotationBouton.layer.cornerRadius = 5
        libraire.layer.cornerRadius = 5
    }

    @IBAction func librairieAction(_ sender: Any) {
    }
    
    @IBAction func rotationAction(_ sender: Any) {
        switch position {
        case .front: position = .back
        case .back: position = .front
        case .unspecified: position = .back

        }
        miseEnPlaceCamera()
    }
    

}

