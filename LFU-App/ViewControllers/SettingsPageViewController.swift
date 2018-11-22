//
//  SettingsPageViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 15/10/2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SettingsPageViewController: UIViewController {

    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var profileInfoMoreButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userClassLabel: UILabel!
    
    @IBOutlet weak var userNameLabelLoadingPlaceholder: UIView!
    @IBOutlet weak var userClassLabelLoadingPlaceholder: UIView!
    
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
        
        updateUserClass()
        createLoading(userNameLabelLoadingPlaceholder)
        createLoading(userClassLabelLoadingPlaceholder)
        
        userNameLabelLoadingPlaceholder.alpha = 0
        userClassLabelLoadingPlaceholder.alpha = 0
        
    }
    
    func updateUserClass() {
        
        //Подключение к базе данных
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        //Получение класса пользователя
        var userClass:NSString = ""
        ref.child("users").child((Auth.auth().currentUser?.uid)!).child("class").observe(.value, with: { snapshot in
            let userClassInfo = snapshot.value as! NSString
            userClass = userClassInfo
            self.userClassLabel.text = userClass as String
        })
    }
    
    func createLoading(_ loadingView: UIView) {
        
        let loadingGradient = CAGradientLayer()
        loadingGradient.frame = loadingView.frame
        loadingGradient.borderWidth = 0
        loadingGradient.cornerRadius = 5
        
        let lighterColor = UIColor.groupTableViewBackground.cgColor as CGColor
        let darkerColor = UIColor.lightGray.cgColor as CGColor
        
        loadingGradient.colors = [darkerColor, lighterColor, darkerColor]
        loadingGradient.locations = [-2.0, -1.0, 0.0]
        loadingGradient.startPoint = CGPoint(x: 0, y: 0)
        loadingGradient.endPoint = CGPoint(x: 1.0, y: 0)
        
        profileInfoView.layer.addSublayer(loadingGradient)
        
        //Анимация градиента
        let gradientChangeAnimation = CABasicAnimation(keyPath: "locations")
        gradientChangeAnimation.duration = 0.8
        gradientChangeAnimation.toValue = [1.0, 2.0, 3.0]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = true
        gradientChangeAnimation.repeatCount = .infinity
        loadingGradient.add(gradientChangeAnimation, forKey: "locationsChange")
        
        func checkScheduleAvailability() {
            if userClassLabel.text == " " { //Если расписание не загружено
                
                userNameLabel.alpha = 0
                userClassLabel.alpha = 0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //Ожидаем 1 секунду
                    checkScheduleAvailability() //Запускаем функцию повторно
                }
            } else {
                let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) {
                    
                    self.userNameLabel.alpha = 1
                    self.userClassLabel.alpha = 1
                    
                    loadingGradient.opacity = 0
                }
                animator.startAnimation()
            }
        }
        checkScheduleAvailability()
    }
    
}
