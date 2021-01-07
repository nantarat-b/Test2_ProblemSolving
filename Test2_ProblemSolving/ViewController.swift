//
//  ViewController.swift
//  Test2_ProblemSolving
//
//  Created by Softcake on 25/4/2561 BE.
//  Copyright © 2561 AppMan. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var boxView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPress(cameraButton: UIButton) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.alertDialog(text: "Device has no camera.")
        } else {
            if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
                self.openCamera()
            } else {
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                    DispatchQueue.main.async {
                        if granted {
                            self.openCamera()
                        } else {
                            self.alertDialog(text: "Denied, request permission from settings")
                        }
                    }
               })
            }
        }
    }
    
    private func openCamera() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .camera
        vc.cameraCaptureMode = .photo
        present(vc, animated: true, completion: nil)
    }
    
    private func alertDialog(text: String) {
        let alertController = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
