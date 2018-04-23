//
//  Extentions.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 21/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

extension UILabel {
    func update( _ currentQuestion: Int, _ score: Int) {
        let attributed = NSMutableAttributedString(string: "Question actuelle: \(currentQuestion) \n", attributes: [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 17)])
        
        attributed.append(NSMutableAttributedString(string: "score : \(score)/10", attributes: [.foregroundColor: UIColor.darkGray, .font: UIFont.italicSystemFont(ofSize: 17)]))
        
        self.attributedText = attributed
    }
}
