//
//  QuestionsResults.swift
//  QuizMeUp
//
//  Created by Yevheniy Zanichkovskyy on 2021-08-13.
//

import Foundation

struct QuestionsResult:Decodable {
    let results: [Question]
}
