//
//  CustomButton.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 20/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        
        tintColor = UIColor.white
        backgroundColor = UIColor.lightGray
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
    }

}
