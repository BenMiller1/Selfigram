//
//  ProfileViewController.swift
//  Selfigram
//
//  Created by lighthouselabs on 2017-04-10.
//  Copyright © 2017 lighthouselabs. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        usernameLabel.text = "yourName"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var profileImageView: UIImageView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
         print("Camera Button Pressed")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
