//
//  Question.swift
//  QuizzlerTwo
//
//  Created by AR7K on 3/25/21.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
