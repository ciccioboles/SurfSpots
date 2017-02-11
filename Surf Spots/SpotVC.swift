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
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var theImagePicker = UIImagePickerController()
    var spot : Spot? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theImagePicker.delegate = self
        
        if spot != nil {
                spotImageView.image = UIImage(data: spot?.image as! Data)
            titleTextField.text = spot?.spot
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
    
    }//

    @IBAction func photosTapped(_ sender: Any) {
        
        theImagePicker.sourceType = .photoLibrary
        
        present(theImagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let theImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        spotImageView.image = theImage
        
        theImagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        theImagePicker.sourceType = .camera
        
        present(theImagePicker, animated: true, completion: nil)
        
    }

    @IBAction func addTapped(_ sender: Any) {
        
        
        if spot != nil {
            spot!.spot = titleTextField.text
            spot!.image = UIImagePNGRepresentation(spotImageView.image!) as NSData?
        } else {
            let theContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let theSpot = Spot(context: theContext)
            theSpot.spot = titleTextField.text
            theSpot.image = UIImagePNGRepresentation(spotImageView.image!) as NSData?
        }
        
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let theContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        theContext.delete(spot!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//
