//
//  ProfileViewController.swift
//  Selfigram
//
//  Created by lighthouselabs on 2017-04-10.
//  Copyright © 2017 lighthouselabs. All rights reserved.
//

import Parse
import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    

    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        // 1: Create an ImagePickerController
        let pickerController = UIImagePickerController()
        
        // 2: Self in this line refers to this View Controller
        //    Setting the Delegate Property means you want to receive a message
        //    from pickerController when a specific event is triggered.
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            // 3. We check if we are running on a Simulator
            //    If so, we pick a photo from the simulator’s Photo Library
            // We need to do this because the simulator does not have a camera
            pickerController.sourceType = .photoLibrary
        } else {
            // 4. We check if we are running on an iPhone or iPad (ie: not a simulator)
            //    If so, we open up the pickerController's Camera (Front Camera, for selfies!)
            pickerController.sourceType = .camera
            pickerController.cameraDevice = .front
            pickerController.cameraCaptureMode = .photo
        }
        
        // Preset the pickerController on screen
        self.present(pickerController, animated: true, completion: nil)
    }
   
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            
            if let imageData = UIImageJPEGRepresentation(image, 0.9),
                let imageFile = PFFile(data: imageData),
                let user = PFUser.current(){
                
                
            user["avatarImage"] = imageFile
            user.saveInBackground(block: { (success, error) -> Void in
                if success {
                    let image = UIImage(data: imageData)
                    self.profileImageView.image = image
                    }
                })
                
            }
            
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "Selfigram-logo"))
        usernameLabel.text = "Ben"
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = PFUser.current() {
            usernameLabel.text = user.username
            
            if let imageFile = user["avatarImage"] as? PFFile {
                
                imageFile.getDataInBackground(block: { (data, error) -> Void in
                    if let imageData = data {
                        self.profileImageView.image = UIImage(data: imageData)
                    }
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        

}
