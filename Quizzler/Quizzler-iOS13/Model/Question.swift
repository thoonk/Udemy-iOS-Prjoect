//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 김태훈 on 2020/11/24.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
