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
    @IBOutlet weak var nameTextFieldIndicator: UIView!
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var classTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerButton(_ sender: UIButton) {
        if nameTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.2, dampingRatio: 1) {
                self.nameTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.2392156863, alpha: 1)
            }
            animator.startAnimation()
        }
        if emailTextField.text!.isEmpty {
            
        }
        if classTextField.text!.isEmpty {
            
        }
        if passwordTextField.text!.isEmpty {
            
        }
        if nameTextField.text!.isEmpty == false && emailTextField.text!.isEmpty == false && classTextField.text!.isEmpty == false && passwordTextField.text!.isEmpty == false {
            performSegue(withIdentifier: "signUpToHome", sender: registerButton)
        }
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
