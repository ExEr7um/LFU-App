//
//  mainPgaeViewController.swift
//  LFU-App
//
//  Created by Василий Кузин on 08.08.2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class mainPageViewController: UIViewController {
    
    @IBOutlet weak var scheduleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scheduleView.layer.shadowOpacity = 0.1
        scheduleView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        scheduleView.layer.shadowRadius = 30
        scheduleView.layer.cornerRadius = 15
    }
    
}
