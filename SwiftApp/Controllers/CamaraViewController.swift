//
//  CamaraViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 10/11/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit

class CamaraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController?
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var lensLabel: UILabel!
    
    @IBAction func takePicture(_ sender: Any) {
        if imagePicker == nil{
            imagePicker = UIImagePickerController()
            imagePicker?.sourceType = UIImagePickerController.SourceType.camera
            imagePicker?.delegate = self
        }
        
        navigationController?.present(imagePicker!, animated: true, completion: nil)
    }
    
//  MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
    }
}
