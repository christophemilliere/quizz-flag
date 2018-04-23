//
//  Question.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 20/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class Question {
    private var _flag: UIImage
    private var _response1: String
    private var _response2: String
    private var _response3: String
    private var _response4: String
    private var _tagCorrect: Int
    
    var flag: UIImage {
        return _flag
    }
    
    var response1: String {
        return _response1
    }
    
    var response2: String {
        return _response2
    }
    
    var response3: String {
        return _response3
    }
    
    var response4: String {
        return _response4
    }
    
    var tagCorrect: Int {
       return _tagCorrect
      
    }
    
    init(flag: UIImage, rep1: String, rep2: String, rep3: String, rep4: String, tag: Int) {
        self._flag = flag
        self._response1 = rep1
        self._response2 = rep2
        self._response3 = rep3
        self._response4 = rep4
        self._tagCorrect = tag
    }
}
