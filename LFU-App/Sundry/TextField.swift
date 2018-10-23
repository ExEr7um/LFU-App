//
//  TextField.swift
//  LFU-App
//
//  Created by Василий Кузин on 07.08.2018.
//  Copyright © 2018 ExEr7um. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    //MARK: Выставление padding текстовому полю
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5) //Выбор размера padding
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding) //Текстовый прямоугольник
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding) //Placeholder
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding) //Редактируемый прямоугольник
    }
    
}
