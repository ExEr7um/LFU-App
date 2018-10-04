//
//  MainPageTabBarController.swift
//  LFU-App
//
//  Created by Василий Кузин on 04/10/2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class MainPageTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat", size: 10)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat", size: 10)!], for: .selected)
    }

}
