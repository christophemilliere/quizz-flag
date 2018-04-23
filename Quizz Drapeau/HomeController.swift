//
//  HomeController.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 19/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var LabelBestScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Quizz Drapeaux du monde"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bestScore = UserDefaults.standard.integer(forKey: "score")
        let scoreString = "Meilleur score \(bestScore)"
        LabelBestScore.text = scoreString
    }
}
