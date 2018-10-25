//
//  LoadingScreenViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 25/10/2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoadingScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        } else {
            self.performSegue(withIdentifier: "toSignInPage", sender: self)
        }
    }

}
