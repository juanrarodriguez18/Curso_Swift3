//
//  CamaraViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 10/11/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit
import ImageIO

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
        let picture = info[.originalImage] as! UIImage
        let meta = info[.mediaMetadata] as! NSDictionary
        let exif = meta.object(forKey: kCGImagePropertyExifDictionary) as! Dictionary<String, AnyObject>
        
        let date = exif[kCGImagePropertyExifDateTimeOriginal as String] as! String
        let xPixels = exif[kCGImagePropertyExifPixelXDimension as String] as! Int
        let yPixels = exif[kCGImagePropertyExifPixelYDimension as String] as! Int
        let lens = exif[kCGImagePropertyCIFFLensModel as String] as! String
        
        dateLabel.text = date
        sizeLabel.text = "\(xPixels) x \(yPixels)"
        lensLabel.text = lens
        
        pictureImageView.image = picture
        dismiss(animated: true, completion: nil)
    }
}
