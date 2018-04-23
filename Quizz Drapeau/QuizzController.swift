//
//  QuizzController.swift
//  Quizz Drapeau
//
//  Created by christophe milliere on 19/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class QuizzController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var button1: CustomButton!
    @IBOutlet weak var button2: CustomButton!
    @IBOutlet weak var button3: CustomButton!
    @IBOutlet weak var button4: CustomButton!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var imagePopup: UIImageView!
    @IBOutlet weak var labelPopupTitle: UILabel!
    @IBOutlet weak var labelPopupResponse: UILabel!
    @IBOutlet weak var popup: CustomView!
    
    @IBOutlet weak var buttonPopupNext: CustomButton!
    
    var questions = [Question]()
    var questionAsked: Question?
    var currentQuestion = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = question()
        getQuestion()
    }
    
    func question() -> [Question] {
        var meQuestions = [Question]()
        
        let french = Question(flag: #imageLiteral(resourceName: "fr"), rep1: "France", rep2: "Italie", rep3: "Luxembourg", rep4: "Australie", tag: 1)
        let belgium = Question(flag: #imageLiteral(resourceName: "be"), rep1: "Belgique", rep2: "France", rep3: "Allemangne", rep4: "Suède", tag: 1)
        let finland = Question(flag: #imageLiteral(resourceName: "fi") , rep1: "Finlande", rep2: "Grèce", rep3: "Allemangne", rep4: "Italie", tag: 1)
        let grece = Question(flag: #imageLiteral(resourceName: "gr") , rep1: "Finlande", rep2: "Grèce", rep3: "Allemangne", rep4: "USA", tag: 2)
        let japan = Question(flag: #imageLiteral(resourceName: "jp") , rep1: "Finlande", rep2: "Australie", rep3: "Japon", rep4: "Italie", tag: 3)
        let mexique = Question(flag: #imageLiteral(resourceName: "mx") , rep1: "USA", rep2: "Bolivie", rep3: "Méxique", rep4: "Italie", tag: 3)
        
        let holland = Question(flag: #imageLiteral(resourceName: "nl") , rep1: "Pays Bas", rep2: "Bolivie", rep3: "Méxique", rep4: "Italie", tag: 1)
        let portugal = Question(flag: #imageLiteral(resourceName: "pt") , rep1: "Espagne", rep2: "Bolivie", rep3: "Méxique", rep4: "Portugal", tag: 4)
        let tunisia = Question(flag: #imageLiteral(resourceName: "tn") , rep1: "USA", rep2: "Tunisie", rep3: "Maroc", rep4: "Italie", tag: 2)
        let uruguay = Question(flag: #imageLiteral(resourceName: "uy") , rep1: "USA", rep2: "Bolivie", rep3: "Méxique", rep4: "Uruguay", tag: 4)
        
        meQuestions.append(contentsOf: [french, belgium, finland, grece, japan, mexique, holland, portugal, tunisia, uruguay])
        
        return meQuestions
    }
    
    func getQuestion(){
        if currentQuestion < 10 {
            currentQuestion += 1
            labelScore.update(currentQuestion, score)
            questionAsked = questions[currentQuestion - 1]
            if let question = questionAsked {
                imageFlag.image = question.flag
                button1.setTitle(question.response1, for: .normal)
                button2.setTitle(question.response2, for: .normal)
                button3.setTitle(question.response3, for: .normal)
                button4.setTitle(question.response4, for: .normal)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let bestScore = UserDefaults.standard.integer(forKey: "score")
            if score > bestScore {
                UserDefaults.standard.set(score, forKey: "score")
                UserDefaults.standard.synchronize()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showPopup( winner: Bool, pays: String, flag: UIImage) {
        imageFlag.image = flag
        labelPopupTitle.text = "La bonne réponse était: \(pays)"
        if winner {
            labelPopupResponse.text = "Félicitations"
        } else {
            labelPopupResponse.text = "Mauvaise réponse"
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.blur.alpha = 1
            self.popup.alpha = 1
        }) { (success) in
            //
        }
    }
    

    @IBAction func buttonAction(_ sender: Any) {
        if let question = questionAsked, let button = sender as? UIButton {
            if question.tagCorrect == button.tag {
                score += 1
                print("Gagné")
                showPopup(winner: true, pays:button.titleLabel?.text ?? "", flag: question.flag)
            } else {
                var pays: String?
                switch question.tagCorrect {
                case 1: pays = button1.titleLabel?.text
                case 2: pays = button2.titleLabel?.text
                case 3: pays = button3.titleLabel?.text
                case 4: pays = button4.titleLabel?.text
                default: break
                }
                showPopup(winner: false, pays: pays ?? "", flag: question.flag)
            }
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func buttonPopupAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blur.alpha = 0
            self.popup.alpha = 0
        }) { (success) in
            self.getQuestion()
        }
    }
    
}
