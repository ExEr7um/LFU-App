//
//  LoginPageViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 07.08.2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var nameTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var classTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerButton(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        respring()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func respring() {
        self.nameTextField.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.emailTextField.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.classTextField.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.passwordTextField.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.nameLabel.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.emailLabel.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.classLabel.transform = CGAffineTransform(translationX: -1000, y: 0)
        self.passwordLabel.transform = CGAffineTransform(translationX: -1000, y: 0)
        
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 50) {
            self.nameTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.emailTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.classTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.passwordTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.nameLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.emailLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.classLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.passwordLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        animator.startAnimation()
    }

}
