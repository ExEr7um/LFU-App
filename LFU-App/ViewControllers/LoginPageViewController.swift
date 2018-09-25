//
//  LoginPageViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 07.08.2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var nameTextField: TextField!
    @IBOutlet weak var nameTextFieldIndicator: UIView!
    @IBAction func nameTextFieldEditingDidEnd(_ sender: Any) {
        checkNameTextField()
    }
    @IBAction func nameTextFieldEditingChanged(_ sender: Any) {
        checkNameTextField()
    }
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var emailTextFieldIndicator: UIView!
    @IBAction func emailTextFieldEditingDidEnd(_ sender: Any) {
        checkEmailTextField()
    }
    @IBAction func emailTextFieldEditingChanged(_ sender: Any) {
        checkEmailTextField()
    }
    
    @IBOutlet weak var classTextField: TextField!
    @IBOutlet weak var classTextFieldIndicator: UIView!
    @IBAction func classTextFieldEditingDidEnd(_ sender: Any) {
        checkClassTextField()
    }
    @IBAction func classTextFieldEditingChanged(_ sender: Any) {
        checkClassTextField()
    }
    
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var passwordTextFieldIndicator: UIView!
    @IBAction func passwordTextFieldEditingDidEnd(_ sender: Any) {
        checkPasswordTextField()
    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: Any) {
        checkPasswordTextField()
    }
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        checkNameTextField()
        checkEmailTextField()
        checkClassTextField()
        checkPasswordTextField()
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
    
    func checkNameTextField() {
        if nameTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.nameTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.3392156863, alpha: 1)
            }
            animator.startAnimation()
        } else {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.nameTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8352941176, blue: 0.4470588235, alpha: 1)
            }
            animator.startAnimation()
        }
    }
    func checkEmailTextField() {
        if emailTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.emailTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.3392156863, alpha: 1)
            }
            animator.startAnimation()
        } else {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.emailTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8352941176, blue: 0.4470588235, alpha: 1)
            }
            animator.startAnimation()
        }
    }
    func checkClassTextField() {
        if classTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.classTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.3392156863, alpha: 1)
            }
            animator.startAnimation()
        } else {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.classTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8352941176, blue: 0.4470588235, alpha: 1)
            }
            animator.startAnimation()
        }
    }
    func checkPasswordTextField() {
        if passwordTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.passwordTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.3392156863, alpha: 1)
            }
            animator.startAnimation()
        } else if passwordTextField.text!.count >= 8 {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.passwordTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8352941176, blue: 0.4470588235, alpha: 1)
            }
            animator.startAnimation()
        }
    }
}
