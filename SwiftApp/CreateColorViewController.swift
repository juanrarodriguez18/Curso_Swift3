//
//  CreateColorViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 12/10/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit

class CreateColorViewController: UIViewController, UITextFieldDelegate {
    
    weak var selectedButton: UIButton?
    
    @IBOutlet weak var colorTextField: UITextField!
    
    @IBAction func colorSelected(_ sender: UIButton) {
        
        if selectedButton != nil {
            selectedButton?.layer.borderColor = nil
            selectedButton?.layer.borderWidth = 0.0
        }
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 5.0
        
        selectedButton = sender
        
    }
    @IBAction func save(_ sender: UIBarButtonItem) {
        let name = colorTextField.text
        let color = UIColor(cgColor: selectedButton!.layer.backgroundColor!)
        
        if name!.isEmpty {
            let alert = UIAlertController(title: "Espera!", message: "Colaca un nombre", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}
