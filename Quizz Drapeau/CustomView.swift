//
//  customView.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 21/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 10
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.75
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowColor = UIColor.black.cgColor
    }
}
