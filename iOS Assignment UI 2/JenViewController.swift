//
//  ViewController.swift
//  iOS Assignment UI 2
//
//  Created by Jenhao on 2016-07-28.
//  Copyright © 2016 Jenhao. All rights reserved.
//

import UIKit

class JenViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var QuestionNO: UILabel!
    @IBOutlet weak var command: UILabel!
    @IBOutlet weak var again: UIButton!
    @IBOutlet weak var newQuestion: UIButton!
    @IBOutlet weak var quesImage: UIImageView!
    
    
    var oldArray = [JenQuestion]()
    var newArray = [JenQuestion]()
    var index: Int = 0
    var scoure:Int = 0
    
    func oldQuestion(){
        oldArray.removeAll()
        oldArray.append(JenQuestion(questImage:"Q01",question: "Q01.\nHow does zombie named in the Waling Dead TV series?", answer1: "Walker", answer2: "Ghost", answer3: "Villain", answer4: "Evil", realAnswer: "Walker"))
        oldArray.append(JenQuestion(questImage:"Q02",question: "Q02.\nWhere were Rick Grimes see the walkers at the first time?", answer1: "A Park", answer2: "A Police station", answer3: "A Hospital", answer4: "A School", realAnswer: "A Hospital"))
        oldArray.append(JenQuestion(questImage:"Q03",question: "Q03.\nWho saved Rick after he escaped from hospital?", answer1: "Shane", answer2: "Morgan", answer3: "Lori", answer4: "Andrea", realAnswer: "Morgan"))
        oldArray.append(JenQuestion(questImage:"Q04",question: "Q04.\nWho didn't show out when Rick's group arrived the jail?", answer1: "Shane", answer2: "Carl", answer3: "Lori", answer4: "Glenn", realAnswer:"Shane"))
        oldArray.append(JenQuestion(questImage:"Q05",question: "Q05.\nWhat is  Michonne's weapon?", answer1: "A Stick", answer2: "A Gun", answer3: "A Bow", answer4: "A Samurai sword", realAnswer: "A Samurai sword"))
        oldArray.append(JenQuestion(questImage:"Q06",question: "Q06.\nThe Governor wants take Michonne's life, since what she did?", answer1: "She cuts his daughter", answer2: "She ran away", answer3: "She shot him", answer4: "She lied to him", realAnswer: "She cuts his daughter"))
        oldArray.append(JenQuestion(questImage:"Q07",question: "Q07.\nWhat did Carl lose at Section 6?", answer1: "One leg", answer2: "One arm", answer3: "One eye", answer4: "One ear", realAnswer: "One eye"))
        oldArray.append(JenQuestion(questImage:"Q08",question: "Q08.\nWho are the people living in The Terminus ?", answer1: "Farmers", answer2: "Cannibals", answer3: "Politicians", answer4: "Army", realAnswer: "Cannibals"))
        oldArray.append(JenQuestion(questImage:"Q09",question: "Q09.\nWhy was the Rick's group leave the jail?", answer1: "The Governor attacked", answer2: "A disease exploded", answer3: "No food any more", answer4: "Not enough space", realAnswer:"The Governor attacked"))
        oldArray.append(JenQuestion(questImage:"Q10",question: "Q10.\nWhat is Eugene claimed? It make Abraham protected Eugene go to Washington.", answer1: "He is a King", answer2: "He is very rich", answer3: "He can cure virus", answer4: "He is a rock star", realAnswer: "He can cure virus"))
    }
    
    func showQuestion() {
        
        let answer1 = answerButton1.setTitle(_:for:)
        let answer2 = answerButton2.setTitle(_:for:)
        let answer3 = answerButton3.setTitle(_:for:)
        let answer4 = answerButton4.setTitle(_:for:)
        again.isHidden = true
        
        if index < 5 {
            
        let obj: JenQuestion = newArray[index]
        questionLabel.text = obj.question
        QuestionNO.text = "Question NO:\(index+1)/5"
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false
        QuestionNO.isHidden = false
        answer1(obj.answer1, UIControlState())
        answer2(obj.answer2, UIControlState())
        answer3(obj.answer3, UIControlState())
        answer4(obj.answer4, UIControlState())
        command.isHidden = true
        quesImage.image = UIImage(imageLiteralResourceName: obj.questImage)
            
            
        index = index + 1
            
        }else{
            
            
            questionLabel.text = "Your scoure : \(scoure)"
            QuestionNO.isHidden = true
            
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
            command.isHidden = false
            
            
            if scoure == 100 {
                command.text = "You Won!\n Good job!"
                quesImage.image = UIImage(imageLiteralResourceName: "post6")
            }else if scoure == 80 {
                command.text = "Excellent work!\n but not perfect."
                 quesImage.image = UIImage(imageLiteralResourceName: "post2")
            }else if scoure == 60 {
                command.text = "Good job,\n try harder next time"
                 quesImage.image = UIImage(imageLiteralResourceName: "post3")
            }else {
                command.text = "Run!\nPlease try again!"
                quesImage.image = UIImage(imageLiteralResourceName: "post5")
                again.isHidden = false
                again.setTitle("Try again", for: UIControlState())
            }
         
            
        }
        
       
        
    }

    @IBAction func differetntQuestions(_ sender: UIBarButtonItem) {
        oldQuestion()
        newArray.removeAll()
        for _ in 1...5{
            randomtake()
        }
        index = 0
        scoure = 0
        showQuestion()
    }

    
    @IBAction func answerPressed(_ sender: UIButton) {
        let answer: String = sender.title(for: UIControlState())!
        
        if answer == newArray[index-1].realAnswer {
            scoure = scoure + 20
            correct()
        }else{
            incorrect()
        }
        showQuestion()
        
        

        
    }
    
    @IBAction func tryAgain() {
        
        index = 0
        scoure = 0
        showQuestion()
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        oldQuestion()
        for _ in 1...5{
            randomtake()
        }
        
        showQuestion()

    }
    
    func randomtake (){
        
        let take = Int(arc4random())%oldArray.count
        newArray.append(oldArray[take])
        oldArray.remove(at: take)
    }
    
    func correct() {
        let alert = UIAlertController(title:nil,
                                      message: "You're right",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style:.destructive , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
        
    }
    
    func incorrect() {
        let alert = UIAlertController(title: nil,
                                      message: "Wrong Answer, It should be:\n[\(newArray[index-1].realAnswer)]",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Oops..", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
     
    }


}

