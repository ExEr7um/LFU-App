//
//  SignInPageViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 26/09/2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class SignInPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var emailTextFieldIndicator: UIView!
    @IBAction func emailTextFieldEditingDidEnd(_ sender: Any) {
        checkEmailTextField()
    }
    @IBAction func emailTextFieldEditingChanged(_ sender: Any) {
        checkEmailTextField()
    }
    
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var passwordTextFieldIndicator: UIView!
    @IBAction func passwordTextFieldEditingDidEnd(_ sender: Any) {
        checkPasswordTextField()
    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: Any) {
        checkPasswordTextField()
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        checkEmailTextField()
        checkPasswordTextField()
        if emailTextField.text!.isEmpty == false && passwordTextField.text!.isEmpty == false {
            performSegue(withIdentifier: "signInToHome", sender: signInButtonPressed)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func checkEmailTextField() {
        if emailTextField.text!.isEmpty {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.emailTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.3392156863, alpha: 1)
            }
            animator.startAnimation()
        } else {
            let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
                self.emailTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9593952298, green: 0.9594177604, blue: 0.959405601, alpha: 1)
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
                self.passwordTextFieldIndicator.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            }
            animator.startAnimation()
        }
    }
    
}
