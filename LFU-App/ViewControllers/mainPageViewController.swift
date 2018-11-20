//
//  mainPgaeViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 08.08.2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class mainPageViewController: UIViewController {
    
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var todayDateLabel: UILabel!
    
    @IBOutlet weak var currentLessonLabel: UILabel!
    @IBOutlet weak var currentLessonLoadingPlaceholder: UIView!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentTimeLoadingPlaceholder: UIView!
    
    @IBOutlet weak var scheduleSeparator: UIView!
    
    @IBOutlet weak var currentRoomLabel: UILabel!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Созданиие графики при загрузке
        
        scheduleView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scheduleView.layer.shadowOpacity = 0.1
        scheduleView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        scheduleView.layer.shadowRadius = 30
        scheduleView.layer.cornerRadius = 15
        
        //Обновление дня недели и расписания
        updateTodayDate()
        updateSchedule()
        
        createLoading(currentLessonLoadingPlaceholder)
        createLoading(currentTimeLoadingPlaceholder)
        
        currentLessonLoadingPlaceholder.alpha = 0
        currentTimeLoadingPlaceholder.alpha = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func updateTodayDate() {
        //Получение дня недели
        let date = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date)
        
        //Создание массива со днями недели
        let weekDays = ["СУББОТА", "ВОСКРЕСЕНЬЕ", "ПОНЕДЕЛЬНИК", "ВТОРНИК", "СРЕДА", "ЧЕТВЕРГ", "ПЯТНИЦА"]
        
        //Обновление дня недели на главной странице
        todayDateLabel.text = weekDays[weekDay]
    }
    
    func updateSchedule() {
        //Подключение времени
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let amountOfTime = hour*60 + minute
        
        //Подключение к базе данных
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        //Получение класса пользователя
        var userClass:NSString = ""
        ref.child("users").child((Auth.auth().currentUser?.uid)!).child("class").observe(.value, with: { snapshot in
            let userClassInfo = snapshot.value as! NSString
            userClass = userClassInfo
        })
        
        //Определиние дня недели
        let weekDay = todayDateLabel.text
        
        //Получение текущего урока
        var currentLesson = -1
        switch amountOfTime {
        case 570..<615:
            currentLesson = 0
            currentTimeLabel.text = "9:30 — 10:15"
        case 615..<680:
            currentLesson = 1
            currentTimeLabel.text = "10:35 — 11:20"
        case 680..<735:
            currentLesson = 2
            currentTimeLabel.text = "11:30 — 12:15"
        case 735..<790:
            currentLesson = 3
            currentTimeLabel.text = "12:25 — 13:10"
        case 790..<845:
            currentLesson = 4
            currentTimeLabel.text = "13:20 — 14:05"
        case 845..<930:
            currentLesson = 5
            currentTimeLabel.text = "14:45 — 15:30"
        case 930..<985:
            currentLesson = 6
            currentTimeLabel.text = "15:40 — 16:25"
        default:
            currentLesson = 7
            currentTimeLabel.text = ""
        }
        
        //Проверка состояния загрузки
        func checkScheduleLoadingState() {
            if userClass == "" { //Если класс не получен
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //Ожидаем 1 секунду
                    checkScheduleLoadingState() //Запускаем функцию повторно
                    print(userClass)
                }
            } else {
                //Получение расписания
                ref.child("Расписание").child(weekDay!).child(userClass as String).observe(.value, with: { snapshot in
                    let schedule = snapshot.value as! NSArray
                    self.currentLessonLabel.text! = schedule[currentLesson] as! String
                })
                //Получение кабинета
                ref.child("Кабинеты").child(weekDay!).child(userClass as String).observe(.value, with: { snapshot in
                    let rooms = snapshot.value as! NSArray
                    self.currentRoomLabel.text! = rooms[currentLesson] as! String
                })
            }
        }
        checkScheduleLoadingState()
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
        
        scheduleView.layer.addSublayer(loadingGradient)
        
        //Анимация градиента
        let gradientChangeAnimation = CABasicAnimation(keyPath: "locations")
        gradientChangeAnimation.duration = 0.8
        gradientChangeAnimation.toValue = [1.0, 2.0, 3.0]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = true
        gradientChangeAnimation.repeatCount = .infinity
        loadingGradient.add(gradientChangeAnimation, forKey: "locationsChange")
        
        func checkScheduleAvailability() {
            if currentLessonLabel.text == " " { //Если расписание не загружено
                
                currentLessonLabel.alpha = 0
                currentTimeLabel.alpha = 0
                currentRoomLabel.alpha = 0
                scheduleSeparator.alpha = 0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //Ожидаем 1 секунду
                    checkScheduleAvailability() //Запускаем функцию повторно
                }
            } else {
                let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) {
                    
                    self.currentLessonLabel.alpha = 1
                    self.currentTimeLabel.alpha = 1
                    self.currentRoomLabel.alpha = 1
                    self.scheduleSeparator.alpha = 1
                    
                    loadingGradient.opacity = 0
                }
                animator.startAnimation()
            }
        }
        checkScheduleAvailability()
    }
    
}
