//
//  Question.swift
//  iOS Assignment
//
//  Created by macadmin on 2016-07-18.
//  Copyright © 2016 Lambton College. All rights reserved.
//

//import Cocoa
import UIKit

class JenQuestion{
    var questImage: String = ""
    var question: String = ""
    var answer1: String = ""
    var answer2: String = ""
    var answer3: String = ""
    var answer4: String = ""
    var realAnswer: String = ""
    
    init(questImage:String, question: String, answer1: String, answer2: String, answer3: String, answer4: String, realAnswer: String){
        self.questImage = questImage
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.realAnswer = realAnswer
    }
}
