//
//  Question.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2021-08-13.
//

import Foundation

struct Question: Decodable {
    
    enum QuestionType:String,Decodable {
        case multiple
    }
    
    enum Difficulty:String,Decodable{
        case easy = "easy",medium = "medium",hard = "hard"
    }
    
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    
}
