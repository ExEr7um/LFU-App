//
//  SettingsPageViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 15/10/2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SettingsPageViewController: UIViewController {

    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var profileInfoMoreButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userClassLabel: UILabel!
    
    @IBAction func signOutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Созданиие графики при загрузке
        
        profileInfoView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        profileInfoView.layer.shadowOpacity = 0.1
        profileInfoView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        profileInfoView.layer.shadowRadius = 30
        profileInfoView.layer.cornerRadius = 15
        
        profileInfoMoreButton.layer.borderWidth = 1
        profileInfoMoreButton.layer.borderColor = #colorLiteral(red: 0.2707273364, green: 0.4276865125, blue: 0.9294869304, alpha: 1)
        
        userNameLabel.text = Auth.auth().currentUser?.displayName
    }
    
}
