//
//  ViewController.swift
//  Test2_ProblemSolving
//
//  Created by Softcake on 25/4/2561 BE.
//  Copyright © 2561 AppMan. All rights reserved.
//
import UIKit

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
            let alertController = UIAlertController(title: nil, message: "Device has no camera.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) in
            })

            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.sourceType = .camera
            vc.cameraCaptureMode = .photo
            present(vc, animated: true, completion: nil)
        }
        
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
