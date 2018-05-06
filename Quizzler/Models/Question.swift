//
//  Question.swift
//  Quizzler
//
//  Created by Tran Thanh Bang on 5/6/18.
//  Copyright © 2018 Tran Thanh Bang. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer:Bool){
        questionText = text
        answer = correctAnswer
    }
}


