//
//  SpotVC.swift
//  Surf Spots
//
//  Created by David Boles on 2/9/17.
//  Copyright © 2017 David Boles. All rights reserved.
//

import UIKit

class SpotVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var spotImageView: UIImageView!
    
    var theImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theImagePicker.delegate = self
    
    }//

    @IBAction func photosTapped(_ sender: Any) {
        
        theImagePicker.sourceType = .photoLibrary
        
        present(theImagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }

    @IBAction func addTapped(_ sender: Any) {
        
    }
    
    
    
}//
