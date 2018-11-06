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
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Созданиие графики при загрузке
        
        scheduleView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scheduleView.layer.shadowOpacity = 0.1
        scheduleView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        scheduleView.layer.shadowRadius = 30
        scheduleView.layer.cornerRadius = 15
        
        updateTodayDate()
        updateSchedule()
        
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
        
        //Определиние дня недели
        let weekDay = todayDateLabel.text
        
        //Получение текущего урока
        var currentLesson = -1
        switch amountOfTime {
        case 570..<615:
            currentLesson = 0
        case 635..<680:
            currentLesson = 1
        case 690..<735:
            currentLesson = 2
        case 745..<790:
            currentLesson = 3
        case 800..<845:
            currentLesson = 4
        case 885..<930:
            currentLesson = 5
        case 940..<985:
            currentLesson = 6
        default:
            currentLesson = 7
        }
        
        //Получение расписания
        ref.child("Расписание").child(weekDay!).child("11Б — Технологический").observe(.value, with: { snapshot in
            let schedule = snapshot.value as! NSArray
            self.currentLessonLabel.text! = schedule[currentLesson] as! String
        })
        
    }
}
